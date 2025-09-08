import { flow } from 'common/fp';
import { filter, sortBy } from 'common/collections';
import { useBackend, useSharedState } from '../../backend';
import {
  Button,
  Flex,
  Icon,
  Input,
  Section,
  Stack,
  Table,
  Tabs,
  Collapsible,
} from '../../components';
import { formatMoney } from '../../format';

export const CargoCatalog = (props, context) => {
  const { act, data } = useBackend(context);

  const { self_paid, app_cost } = data;

  const supplies = Object.values(data.supplies);

  const [activeSupplyName, setActiveSupplyName] = useSharedState(
    context,
    'supply',
    supplies[0]?.name
  );

  const [searchText, setSearchText] = useSharedState(
    context,
    'search_text',
    ''
  );

  const [cart, setCart] = useSharedState(context, 'cart', []);

  const MAX_CART_ITEMS = 20;

  const cartTotal = cart.reduce(
    (cartTotal, entry) =>
      cartTotal + (entry.discountedcost ? entry.discountedcost : entry.cost),
    0
  );

  const activeSupply =
    activeSupplyName === 'search_results'
      ? { packs: searchForSupplies(supplies, searchText) }
      : supplies.find((supply) => supply.name === activeSupplyName);

  const removeFromCart = (indexToRemove) => {
    setCart(cart.filter((_, index) => index !== indexToRemove));
  };

  return (
    <>
      <Section title="Order">
        <Table.Row>
          <Table.Cell>
            <Button
              icon="times"
              color="transparent"
              content="Clear"
              onClick={() => setCart([])}
            />
            <Button
              color="green"
              content="Purchase"
              disabled={cart.length === 0 || cart.length > MAX_CART_ITEMS}
              onClick={() => {
                act('purchase', {
                  cart: cart,
                  total: cartTotal,
                });
                setCart([]);
              }}
            />
          </Table.Cell>
          <Table.Cell textAlign="right" collapsing>
            {cart.length === 0 && 'Order is empty'}
          </Table.Cell>
        </Table.Row>
        {cart.length !== 0 ? (
          <Collapsible title="Order Contents">
            <Table>
              {cart.map((pack, index) => {
                return (
                  <Table.Row key={index} className="candystripe">
                    <Table.Cell collapsing>
                      <Button
                        icon="times"
                        color="transparent"
                        tooltip="Remove from order"
                        onClick={() => removeFromCart(index)}
                      />
                    </Table.Cell>
                    <Table.Cell>
                      {(pack.discountedcost ? pack.discountedcost : pack.cost) +
                        ' cr'}
                    </Table.Cell>
                    <Table.Cell collapsing color="label" textAlign="right">
                      {pack.name}
                    </Table.Cell>
                  </Table.Row>
                );
              })}
            </Table>
          </Collapsible>
        ) : (
          ''
        )}
        {cartTotal > 0 && (
          <Table.Row>
            <Table.Cell colSpan={2} bold>
              Total: {formatMoney(cartTotal)} cr
            </Table.Cell>
            <Table.Cell
              textAlign="right"
              collapsing
              color={cart.length >= MAX_CART_ITEMS ? 'red' : ''}
            >
              {cart.length >= 1 &&
                'Contains: ' + cart.length + `/${MAX_CART_ITEMS} items`}{' '}
            </Table.Cell>
          </Table.Row>
        )}
      </Section>
      <Section title="Catalog">
        <Flex>
          <Flex.Item ml={-1} mr={1.5}>
            <Tabs vertical>
              <Tabs.Tab
                key="search_results"
                selected={activeSupplyName === 'search_results'}
              >
                <Stack align="baseline">
                  <Stack.Item>
                    <Icon name="search" />
                  </Stack.Item>
                  <Stack.Item grow>
                    <Input
                      fluid
                      placeholder="Search..."
                      value={searchText}
                      onInput={(e, value) => {
                        if (value === searchText) {
                          return;
                        }
                        if (value.length) {
                          setActiveSupplyName('search_results');
                        } else if (activeSupplyName === 'search_results') {
                          setActiveSupplyName(supplies[0]?.name);
                        }
                        setSearchText(value);
                      }}
                      onChange={(e, value) => {
                        const onInput = e.target?.props?.onInput;
                        if (onInput) {
                          onInput(e, value);
                        }
                      }}
                    />
                  </Stack.Item>
                </Stack>
              </Tabs.Tab>
              {supplies.map((supply) => (
                <Tabs.Tab
                  key={supply.name}
                  selected={supply.name === activeSupplyName}
                  onClick={() => {
                    setActiveSupplyName(supply.name);
                    setSearchText('');
                  }}
                >
                  {supply.name} ({supply.packs.length})
                </Tabs.Tab>
              ))}
            </Tabs>
          </Flex.Item>
          <Flex.Item grow={1} basis={0}>
            <Table>
              {activeSupply?.packs.map((pack) => {
                const tags = [];
                if (pack.access) {
                  tags.push('Restricted');
                }
                return (
                  <Table.Row key={pack.name} className="candystripe">
                    <Table.Cell>{pack.name}</Table.Cell>
                    <Table.Cell collapsing color="label" textAlign="right">
                      {tags.join(', ')}
                    </Table.Cell>
                    <Table.Cell collapsing textAlign="right">
                      <Button
                        fluid
                        tooltip={pack.desc}
                        tooltipPosition="left"
                        disabled={cart.length >= MAX_CART_ITEMS}
                        onClick={() => setCart(cart.concat(pack))}
                      >
                        {formatMoney(
                          (self_paid && !pack.goody) || app_cost
                            ? Math.round(pack.cost * 1.1)
                            : pack.cost
                        )}
                        {' cr'}
                      </Button>
                    </Table.Cell>
                  </Table.Row>
                );
              })}
            </Table>
          </Flex.Item>
        </Flex>
      </Section>
    </>
  );
};

/**
 * Take entire supplies tree
 * and return a flat supply pack list that matches search,
 * sorted by name and only the first page.
 * @param {any[]} supplies Supplies list.
 * @param {string} search The search term
 * @returns {any[]} The flat list of supply packs.
 */
const searchForSupplies = (supplies, search) => {
  search = search.toLowerCase();

  return flow([
    (categories) => categories.flatMap((category) => category.packs),
    filter(
      (pack) =>
        pack.name?.toLowerCase().includes(search.toLowerCase()) ||
        pack.desc?.toLowerCase().includes(search.toLowerCase())
    ),
    sortBy((pack) => pack.name),
    (packs) => packs.slice(0, 25),
  ])(supplies);
};

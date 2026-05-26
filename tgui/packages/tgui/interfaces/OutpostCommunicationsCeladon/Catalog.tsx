import { flow } from '../../../common/fp';
import { filter, sortBy } from '../../../common/collections';
import { useBackend, useSharedState } from '../../backend';
import {
  Button,
  Dropdown,
  Flex,
  Icon,
  Input,
  Section,
  Stack,
  Table,
  Tabs,
  Collapsible,
} from '../../components';
import type { DropdownEntry } from '../../components/Dropdown';
import { formatMoney } from '../../format';

type SupplyPack = {
  ref: string;
  name: string;
  desc?: string;
  cost: number;
  discountedcost?: number;
  faction_locked: boolean;
  faction?: string;
};

type SupplyCategory = {
  name: string;
  packs: SupplyPack[];
};

const FACTION_FILTER_ALL = 'All packs';
const FACTION_FILTER_LOCKED = 'Faction locked';
const SEARCH_PAGE_SIZE = 25;

type CartEntry = {
  ref: string;
};

type CatalogData = {
  faction?: string;
  supplies: Record<string, SupplyCategory>;
};

export const CargoCatalog = (_: unknown, context: any) => {
  const { act, data } = useBackend<CatalogData>(context);

  const { faction } = data;

  const [factionFilter, setFactionFilter] = useSharedState<string>(
    context,
    'filterFactionLocked',
    FACTION_FILTER_ALL
  );

  const factionNames = getUniqueFactions(data.supplies);
  const factionFilterOptions: DropdownEntry[] = factionNames.map((faction) => ({
    value: faction,
    displayText: faction,
  }));

  const passFactionFilter = getPassFactionFilter(factionFilter);
  const supplies = getFilteredSupplies(data.supplies, passFactionFilter);

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
  const [searchPage, setSearchPage] = useSharedState(
    context,
    'search_page',
    0
  );

  const [cart, setCart] = useSharedState<CartEntry[]>(context, 'cart', []);

  const MAX_CART_ITEMS = 20;

  const allPacks = supplies.flatMap((supply) => supply.packs);
  const cartPacks = cart
    .map((item) => allPacks.find((pack) => pack.ref === item.ref))
    .filter((pack): pack is SupplyPack => Boolean(pack));

  const cartTotal = cartPacks.reduce(
    (sum, pack) => sum + (pack.discountedcost ?? pack.cost),
    0
  );

  const searchResults = searchForSupplies(supplies, searchText);
  const searchPageCount = Math.max(
    1,
    Math.ceil(searchResults.length / SEARCH_PAGE_SIZE)
  );
  const currentSearchPage = Math.min(searchPage, searchPageCount - 1);
  const pagedSearchResults = searchResults.slice(
    currentSearchPage * SEARCH_PAGE_SIZE,
    (currentSearchPage + 1) * SEARCH_PAGE_SIZE
  );

  const activeSupply =
    activeSupplyName === 'search_results'
      ? { packs: pagedSearchResults }
      : supplies.find((supply: SupplyCategory) => supply.name === activeSupplyName);

  const visiblePacks = activeSupply?.packs.filter((pack: SupplyPack) =>
    passFactionFilter(pack)
  );

  const removeFromCart = (indexToRemove: number) => {
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
                  cart: cart.map((entry) => ({
                    ref: entry.ref,
                  })),
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
              {cartPacks.map((pack, index) => {
                return (
                  <Table.Row key={`${pack.ref}-${index}`} className="candystripe">
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
      <Section
        title="Catalog"
          buttons={
            faction !== "Independent" && (
              <Stack align="center">
                <Stack.Item>Faction filter:</Stack.Item>
                <Stack.Item>
                  <Dropdown
                    minWidth="200px"
                    selected={factionFilter}
                    options={factionFilterOptions}
                    onSelected={(value) => {
                      const nextFilter = String(value);
                      const nextSupplies = getFilteredSupplies(
                        data.supplies,
                        getPassFactionFilter(nextFilter)
                      ).filter((supply) => supply.packs.length > 0);
                      if (
                        activeSupplyName !== 'search_results' &&
                        !nextSupplies.some(
                          (supply) => supply.name === activeSupplyName
                        )
                      ) {
                        setActiveSupplyName(nextSupplies[0]?.name);
                      }
                      setFactionFilter(nextFilter);
                    }}
                  />
                </Stack.Item>
              </Stack>
            )
          }
      >
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
                      onInput={(_, value: string) => {
                        if (value === searchText) {
                          return;
                        }
                        if (value.length) {
                          setActiveSupplyName('search_results');
                          setSearchPage(0);
                        } else if (activeSupplyName === 'search_results') {
                          setActiveSupplyName(supplies[0]?.name);
                        }
                        setSearchText(value);
                      }}
                    />
                  </Stack.Item>
                </Stack>
              </Tabs.Tab>
              {supplies
                .filter((supply) => supply.packs.length > 0)
                .map((supply) => (
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
            {activeSupplyName === 'search_results' && (
              <Stack mb={1}>
                <Stack.Item grow>
                  Results: {searchResults.length}
                </Stack.Item>
                <Stack.Item>
                  <Button
                    icon="chevron-left"
                    disabled={currentSearchPage <= 0}
                    onClick={() => setSearchPage(currentSearchPage - 1)}
                  />
                </Stack.Item>
                <Stack.Item>
                  Page {currentSearchPage + 1}/{searchPageCount}
                </Stack.Item>
                <Stack.Item>
                  <Button
                    icon="chevron-right"
                    disabled={currentSearchPage >= searchPageCount - 1}
                    onClick={() => setSearchPage(currentSearchPage + 1)}
                  />
                </Stack.Item>
              </Stack>
            )}
            <Table>
              {visiblePacks?.map((pack: SupplyPack) => {
                return (
                  <Table.Row key={pack.name} className="candystripe" margin-bottom="0.2em">
                    <Table.Cell>{pack.name}</Table.Cell>
                    <Table.Cell collapsing textAlign="right">
                      <Button
                        fluid
                        tooltip={pack.desc}
                        tooltipPosition="left"
                        disabled={cart.length >= MAX_CART_ITEMS}
                        onClick={() =>
                          setCart(
                            cart.concat({
                              ref: pack.ref,
                            })
                          )
                        }
                      >
                        {formatMoney(pack.cost)}{' cr'}
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
 * sorted by name.
 * @param {any[]} supplies Supplies list.
 * @param {string} search The search term
 * @returns {any[]} The flat list of supply packs.
 */
const searchForSupplies = (
  supplies: SupplyCategory[],
  search: string
): SupplyPack[] => {
  search = search.toLowerCase();

  return flow([
    (categories: SupplyCategory[]) =>
      categories.flatMap((category) => category.packs),
    filter(
      (pack: SupplyPack) =>
        pack.name.toLowerCase().includes(search) ||
        (pack.desc?.toLowerCase().includes(search) ?? false)
    ),
    sortBy((pack: SupplyPack) => pack.name),
  ])(supplies);
};

const getUniqueFactions = (
  supplies: Record<string, SupplyCategory>
): string[] => {
  const factions = Object.values(supplies).flatMap((category) =>
    category.packs
      .filter((pack) => pack.faction_locked)
      .map((pack) => pack.faction)
      .filter(Boolean)
  );
  const uniqueFactions = Array.from(new Set(factions as string[])).sort((a, b) =>
    a.localeCompare(b)
  );
  if (uniqueFactions.length <= 1) {
    return [FACTION_FILTER_ALL, FACTION_FILTER_LOCKED];
  }
  return [FACTION_FILTER_ALL, FACTION_FILTER_LOCKED, ...uniqueFactions];
};

const getPassFactionFilter =
  (factionFilter: string) =>
  (pack: SupplyPack): boolean => {
    if (factionFilter === FACTION_FILTER_LOCKED) {
      return pack.faction_locked;
    }
    if (factionFilter === FACTION_FILTER_ALL) {
      return true;
    }
    return pack.faction === factionFilter && pack.faction_locked;
  };

const getFilteredSupplies = (
  supplies: Record<string, SupplyCategory>,
  passFactionFilter: (pack: SupplyPack) => boolean
): SupplyCategory[] =>
  Object.values(supplies).map((supply: SupplyCategory) => ({
    ...supply,
    packs: sortBy((pack: SupplyPack) => pack.name)(
      supply.packs.filter((pack: SupplyPack) => passFactionFilter(pack))
    ),
  }));

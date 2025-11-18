import { useBackend, useLocalState } from '../backend';
import {
  Box,
  Button,
  Section,
  Input,
  Grid,
  Icon,
  Divider,
} from '../components';
import { Window } from '../layouts';

export const TradeConsole = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    logged_in,
    items,
    categories,
    selected_category,
    selected_item,
    user_points,
    user_credits,
    theme,
  } = data;

  return (
    <Window width={900} height={700} resizable theme={theme}>
      <Window.Content scrollable>
        {!logged_in ? (
          <LoginScreen />
        ) : (
          <>
            <Section title="Frontier Trade Network">
              <Grid>
                <Grid.Column size={0.7}>
                  <Box>
                    <Icon name="coins" color="gold" /> Mining Points:{' '}
                    <b>{user_points || 0}</b>
                  </Box>
                </Grid.Column>
                <Grid.Column size={0.7}>
                  <Box>
                    <Icon name="credit-card" color="green" /> Credits:{' '}
                    <b>{user_credits || 0}</b>
                  </Box>
                </Grid.Column>
                <Grid.Column>
                  <Button content="Logout" onClick={() => act('logout')} />
                </Grid.Column>
              </Grid>
            </Section>

            <Grid>
              <Grid.Column size={0.3}>
                <CategoryPanel />
              </Grid.Column>
              <Grid.Column size={0.4}>
                <ItemsPanel />
              </Grid.Column>
              <Grid.Column size={0.3}>
                <ItemDetailsPanel />
              </Grid.Column>
            </Grid>
          </>
        )}
      </Window.Content>
    </Window>
  );
};

const LoginScreen = (props, context) => {
  const { act } = useBackend(context);
  const [password, setPassword] = useLocalState(context, 'password', '');

  return (
    <Section title="Access Control" textAlign="center">
      <Box fontSize="1.2em" mb={2}>
        <Icon name="lock" size={2} color="red" />
      </Box>
      <Box mb={2}>Enter console access code:</Box>
      <Input
        placeholder="Access Code"
        value={'*'.repeat(password.length)}
        onInput={(e, value) => {
          if (value.length > password.length) {
            setPassword(password + value.slice(password.length));
          } else {
            setPassword(value);
          }
        }}
        mb={2}
      />
      <Button
        content="Access System"
        icon="unlock"
        onClick={() => act('login', { password: password })}
      />
    </Section>
  );
};

const CategoryPanel = (props, context) => {
  const { act, data } = useBackend(context);
  const { categories, selected_category } = data;

  return (
    <Section title="Categories" height="500px">
      {categories.map((category) => (
        <Button
          key={category}
          content={category}
          fluid
          selected={selected_category === category}
          onClick={() => act('select_category', { category: category })}
          mb={1}
        />
      ))}
    </Section>
  );
};

const ItemsPanel = (props, context) => {
  const { act, data } = useBackend(context);
  const { items, selected_category, selected_item, user_points } = data;

  const filteredItems =
    selected_category && selected_category !== 'All'
      ? items.filter((item) => item.category === selected_category)
      : items;

  return (
    <Section
      title={
        selected_category
          ? `${selected_category} Technologies`
          : 'All Technologies'
      }
      height="500px"
    >
      <Box overflowY="auto" height="450px">
        {filteredItems.map((item) => (
          <Box
            key={item.path}
            className={`technode ${item.unlocked ? 'researched' : 'available'}`}
            style={{
              border:
                selected_item === item.path
                  ? '2px solid #40628a'
                  : '1px solid #4e4e4e',
              padding: '8px',
              margin: '4px 0',
              backgroundColor: item.unlocked ? '#1a4a1a' : '#4a4a1a',
              cursor: 'pointer',
            }}
            onClick={() => act('select_item', { path: item.path })}
          >
            <Grid>
              <Grid.Column size={0.8}>
                <Box
                  fontSize="1.1em"
                  fontWeight="bold"
                  color={item.unlocked ? '#90EE90' : '#FFD700'}
                >
                  {item.name}
                </Box>
                <Box fontSize="0.9em" color="#cccccc" mt={1}>
                  {item.unlocked ? (
                    <span style={{ color: '#90EE90' }}>
                      <Icon name="check" /> Researched

                    </span>
                  ) : (
                    <span
                      style={{
                        color:
                          user_points >= item.unlock_cost
                            ? '#FFD700'
                            : '#FF6B6B',
                      }}
                    >
                      <Icon name="flask" /> {item.unlock_cost} points
                    </span>
                  )}
                </Box>
              </Grid.Column>
              <Grid.Column size={0.2} textAlign="right">
                {item.unlocked ? (
                  !item.unlimited && item.stock === 0 ? (
                    <Icon name="times-circle" size={1.5} color="#FF6B6B" />
                  ) : (
                    <Icon name="shopping-cart" size={1.5} color="#90EE90" />
                  )
                ) : (
                  <Icon name="lock" size={1.2} color="#FF6B6B" />
                )}
              </Grid.Column>
            </Grid>
          </Box>
        ))}
      </Box>
    </Section>
  );
};

const ItemDetailsPanel = (props, context) => {
  const { act, data } = useBackend(context);
  const { items, selected_item, user_points, user_credits } = data;

  const selectedItemData = items.find((item) => item.path === selected_item);

  if (!selectedItemData) {
    return (
      <Section title="Item Details" height="500px">
        <Box textAlign="center" color="#888888" mt={4}>
          <Icon name="info-circle" size={2} />
          <Box mt={2}>Select an item to view details</Box>
        </Box>
      </Section>
    );
  }

  const canUnlock = user_points >= selectedItemData.unlock_cost;
  const canPurchase =
    user_credits >= selectedItemData.price && selectedItemData.unlocked;

  return (
    <Section title="Technology Details" height="500px">
      <Box>
        <Grid>
          <Grid.Column size={0.8}>
            <Box fontSize="1.3em" fontWeight="bold" mb={2}>
              {selectedItemData.name}
            </Box>
          </Grid.Column>
          <Grid.Column size={0.2} textAlign="right">
            <Box
              style={{
                width: '64px',
                height: '64px',
                backgroundColor: '#2a2a2a',
                border: '1px solid #4e4e4e',
                borderRadius: '4px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
              }}
            >
              {selectedItemData.icon_base64 ? (
                <img
                  src={`data:image/png;base64,${selectedItemData.icon_base64}`}
                  style={{
                    width: '64px',
                    height: '64px',
                    imageRendering: 'pixelated',
                  }}
                  alt={selectedItemData.name}
                />
              ) : (
                <Icon name="cube" size={1.5} color="#888888" />
              )}
            </Box>
          </Grid.Column>
        </Grid>

        <Divider />

        <Box mt={2} mb={3}>
          <Box fontSize="0.9em" color="#cccccc">
            {selectedItemData.description}
          </Box>
        </Box>

        <Divider />

        <Box mt={3}>
          <Box fontSize="1.1em" fontWeight="bold" mb={2}>
            Status:
          </Box>
          {selectedItemData.unlocked ? (
            <Box color="#90EE90">
              <Icon name="check-circle" /> Technology Researched
            </Box>
          ) : (
            <Box color="#FFD700">
              <Icon name="lock" /> Requires Research
            </Box>
          )}
        </Box>

        <Box mt={3}>
          <Box fontSize="1.1em" fontWeight="bold" mb={2}>
            Costs:
          </Box>
          <Box>
            <Icon name="flask" /> Research:{' '}
            <b>{selectedItemData.unlock_cost}</b> points
          </Box>
          <Box mt={1}>
            <Icon name="credit-card" /> Purchase:{' '}
            <b>{selectedItemData.price}</b> credits
          </Box>
        </Box>

        {selectedItemData.unlimited ? (
          <Box mt={2} color="#90EE90">
            <Icon name="infinity" /> Unlimited supply
          </Box>
        ) : (
          <Box mt={2}>
            <Icon name="boxes" /> Available: <b>{selectedItemData.stock || 0}</b> units
          </Box>
        )}

        <Divider />

        <Box mt={3}>
          {!selectedItemData.unlocked ? (
            <Button
              content={`Research (${selectedItemData.unlock_cost} pts)`}
              icon="flask"
              fluid
              disabled={!canUnlock}
              color={canUnlock ? 'good' : 'bad'}
              onClick={() => act('unlock', { path: selectedItemData.path })}
            />
          ) : (
            <Button
              content={`Purchase (${selectedItemData.price} cr)`}
              icon="shopping-cart"
              fluid
              disabled={!canPurchase}
              color={canPurchase ? 'good' : 'bad'}
              onClick={() => act('purchase', { path: selectedItemData.path })}
            />
          )}
        </Box>
      </Box>
    </Section>
  );
};

import { useBackend, useLocalState } from '../backend';
import { Box, Button, Section, Table, Input } from '../components';
import { Window } from '../layouts';

export const MiningConsole = (props, context) => {
  const { act, data } = useBackend(context);
  const { logged_in, items, user_points, user_credits } = data;

  return (
    <Window width={500} height={600} resizable>
      <Window.Content scrollable>
        {!logged_in ? (
          <LoginScreen />
        ) : (
          <>
            <Section title="User Info">
              <Box>Mining Points: <b>{user_points || 0}</b></Box>
              <Box>Credits: <b>{user_credits || 0}</b></Box>
              <Button content="Logout" onClick={() => act('logout')} />
            </Section>
            <Section title="Available Equipment">
              <Table>
                {items.map((item) => (
                  <Table.Row key={item.path}>
                    <Table.Cell><b>{item.name}</b></Table.Cell>
                    <Table.Cell>
                      {item.unlocked ? (
                        <Button
                          content={`Buy (${item.price} cr)`}
                          disabled={user_credits < item.price}
                          onClick={() => act('purchase', { path: item.path })}
                        />
                      ) : (
                        <Button
                          content={`Unlock (${item.unlock_cost} pts)`}
                          disabled={user_points < item.unlock_cost}
                          onClick={() => act('unlock', { path: item.path })}
                        />
                      )}
                    </Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
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
    <Section title="Access Control">
      <Box>Enter console password:</Box>
      <Input
        placeholder="Password"
        value={'*'.repeat(password.length)}
        onInput={(e, value) => {
          if (value.length > password.length) {
            setPassword(password + value.slice(password.length));
          } else {
            setPassword(value);
          }
        }}
      />
      <Button
        content="Login"
        onClick={() => act('login', { password: password })}
      />
    </Section>
  );
};

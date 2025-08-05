import { useBackend } from '../../backend';
import { Button, Section, Box, Table, LabeledList } from '../../components';
import { Window } from '../../layouts';

type Data = {
  reputation: number;
  wanted_modules: WantedModule[];
  available_modules: AvailableModule[];
};

type WantedModule = {
  name: string;
  desc: string;
  price: number;
};

type AvailableModule = {
  name: string;
  desc: string;
  price: number;
  type: string;
};

export const BlackMarketConsole = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const {
    reputation,
    wanted_modules = [],
    available_modules = [],
  } = data;

  return (
    <Window width={600} height={500}>
      <Window.Content scrollable>
        <Section title="Black Market Terminal">
          <LabeledList>
            <LabeledList.Item label="Reputation">
              <Box color={reputation > 50 ? 'good' : reputation > 0 ? 'average' : 'bad'}>
                {reputation}
              </Box>
            </LabeledList.Item>
          </LabeledList>
        </Section>

        <Section title="Wanted Modules - High Prices">
          <Box color="good" mb={1}>
            We're currently looking for these modules and will pay premium prices:
          </Box>
          <Table>
            <Table.Row header>
              <Table.Cell>Module</Table.Cell>
              <Table.Cell>Price</Table.Cell>
            </Table.Row>
            {wanted_modules.map((module) => (
              <Table.Row key={module.name}>
                <Table.Cell>
                  <Box color="good">{module.name}</Box>
                  <Box fontSize="0.8em" color="gray">
                    {module.desc}
                  </Box>
                </Table.Cell>
                <Table.Cell>
                  <Box color="good">{module.price} credits</Box>
                </Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>

        <Section title="Available for Purchase">
          <Box color="average" mb={1}>
            Modules available for purchase. No questions asked.
          </Box>
          <Table>
            <Table.Row header>
              <Table.Cell>Module</Table.Cell>
              <Table.Cell>Price</Table.Cell>
              <Table.Cell>Action</Table.Cell>
            </Table.Row>
            {available_modules.map((module) => (
              <Table.Row key={module.name}>
                <Table.Cell>
                  <Box color="average">{module.name}</Box>
                  <Box fontSize="0.8em" color="gray">
                    {module.desc}
                  </Box>
                </Table.Cell>
                <Table.Cell>{module.price} credits</Table.Cell>
                <Table.Cell>
                  <Button
                    content="Buy"
                    onClick={() =>
                      act('buy_module', { module_type: module.type })
                    }
                  />
                </Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>

        <Section title="Instructions">
          <Box color="gray">
            • Use module chips on this terminal to sell them
            <br />
            • Higher reputation = better prices
            <br />
            • Payment: holochips and paper money accepted
            <br />
            • Sales paid out in holochips only
          </Box>
        </Section>
      </Window.Content>
    </Window>
  );
};
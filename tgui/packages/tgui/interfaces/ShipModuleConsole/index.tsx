import { useBackend } from '../../backend';
import { Button, Section, Tabs, Box, Table } from '../../components';
import { Window } from '../../layouts';

type Data = {
  current_tab: number;
  docked_ship: string;
  available_modules: ModuleInfo[];
  ship_modules: ModuleInfo[];
};

type ModuleInfo = {
  name: string;
  desc: string;
  value: number;
  category: string;
  broken: boolean;
  installation_cost: number;
  removal_cost: number;
  repair_cost: number;
  type?: string;
};

export const ShipModuleConsole = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const {
    current_tab,
    docked_ship,
    available_modules = [],
    ship_modules = [],
  } = data;

  return (
    <Window width={600} height={500}>
      <Window.Content scrollable>
        <Section title={`Ship Module Console - ${docked_ship}`}>
          <Tabs>
            <Tabs.Tab
              selected={current_tab === 1}
              onClick={() => act('change_tab', { tab: 1 })}
            >
              Purchase
            </Tabs.Tab>
            <Tabs.Tab
              selected={current_tab === 2}
              onClick={() => act('change_tab', { tab: 2 })}
            >
              Sell
            </Tabs.Tab>
            <Tabs.Tab
              selected={current_tab === 3}
              onClick={() => act('change_tab', { tab: 3 })}
            >
              Repair
            </Tabs.Tab>
          </Tabs>
        </Section>

        {current_tab === 1 && (
          <Section title="Available Modules">
            <Table>
              <Table.Row header>
                <Table.Cell>Name</Table.Cell>
                <Table.Cell>Category</Table.Cell>
                <Table.Cell>Cost</Table.Cell>
                <Table.Cell>Action</Table.Cell>
              </Table.Row>
              {available_modules.map((module) => (
                <Table.Row key={module.name}>
                  <Table.Cell>
                    <Box
                      color={
                        module.value > 0
                          ? 'good'
                          : module.value < 0
                          ? 'bad'
                          : 'average'
                      }
                    >
                      {module.name}
                    </Box>
                    <Box fontSize="0.8em" color="gray">
                      {module.desc}
                    </Box>
                  </Table.Cell>
                  <Table.Cell>{module.category}</Table.Cell>
                  <Table.Cell>{module.installation_cost} credits</Table.Cell>
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
        )}

        {current_tab === 2 && (
          <Section title="Installed Modules">
            <Table>
              <Table.Row header>
                <Table.Cell>Name</Table.Cell>
                <Table.Cell>Category</Table.Cell>
                <Table.Cell>Status</Table.Cell>
                <Table.Cell>Action</Table.Cell>
              </Table.Row>
              {ship_modules.map((module) => (
                <Table.Row key={module.name}>
                  <Table.Cell>
                    <Box
                      color={
                        module.broken
                          ? 'bad'
                          : module.value > 0
                          ? 'good'
                          : module.value < 0
                          ? 'bad'
                          : 'average'
                      }
                    >
                      {module.name}
                    </Box>
                  </Table.Cell>
                  <Table.Cell>{module.category}</Table.Cell>
                  <Table.Cell>
                    {module.broken ? 'Broken' : 'Operational'}
                  </Table.Cell>
                  <Table.Cell>
                    <Button
                      content="Sell"
                      onClick={() => act('sell_module', { module: module.name })}
                    />
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        )}

        {current_tab === 3 && (
          <Section title="Module Repair">
            <Table>
              <Table.Row header>
                <Table.Cell>Name</Table.Cell>
                <Table.Cell>Category</Table.Cell>
                <Table.Cell>Repair Cost</Table.Cell>
                <Table.Cell>Action</Table.Cell>
              </Table.Row>
              {ship_modules
                .filter((module) => module.broken || module.value < 0)
                .map((module) => (
                  <Table.Row key={module.name}>
                    <Table.Cell>
                      <Box color={module.broken ? 'bad' : 'average'}>
                        {module.name}
                      </Box>
                    </Table.Cell>
                    <Table.Cell>{module.category}</Table.Cell>
                    <Table.Cell>{module.repair_cost} credits</Table.Cell>
                    <Table.Cell>
                      <Button
                        content="Repair"
                        onClick={() =>
                          act('repair_module', { module: module.name })
                        }
                      />
                    </Table.Cell>
                  </Table.Row>
                ))}
            </Table>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
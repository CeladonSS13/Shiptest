import { useBackend } from '../../backend';
import { Button, Section, Box, Table, LabeledList, ProgressBar } from '../../components';
import { Window } from '../../layouts';

type Data = {
  ship_name: string;
  modules: ModuleInfo[];
};

type ModuleInfo = {
  name: string;
  desc: string;
  value: number;
  category: string;
  broken: boolean;
  enabled: boolean;
  power_usage: number;
  disabled: boolean;
};

export const ShipModuleControl = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const { ship_name, modules = [] } = data;

  const totalPowerUsage = modules
    .filter((module) => !module.disabled && !module.broken)
    .reduce((sum, module) => sum + module.power_usage, 0);

  const getModuleStatus = (module: ModuleInfo) => {
    if (module.broken) return { text: 'BROKEN', color: 'bad' };
    if (module.disabled) return { text: 'DISABLED', color: 'average' };
    return { text: 'OPERATIONAL', color: 'good' };
  };

  return (
    <Window width={700} height={500}>
      <Window.Content scrollable>
        <Section title={`Ship Module Control - ${ship_name}`}>
          <LabeledList>
            <LabeledList.Item label="Total Power Usage">
              <Box color={totalPowerUsage > 1000 ? 'bad' : 'good'}>
                {totalPowerUsage}W
              </Box>
            </LabeledList.Item>
            <LabeledList.Item label="Active Modules">
              {modules.filter((m) => !m.disabled && !m.broken).length} / {modules.length}
            </LabeledList.Item>
          </LabeledList>
        </Section>

        <Section title="Installed Modules">
          <Table>
            <Table.Row header>
              <Table.Cell>Module</Table.Cell>
              <Table.Cell>Category</Table.Cell>
              <Table.Cell>Power</Table.Cell>
              <Table.Cell>Status</Table.Cell>
              <Table.Cell>Control</Table.Cell>
            </Table.Row>
            {modules.map((module) => {
              const status = getModuleStatus(module);
              return (
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
                  <Table.Cell>
                    {module.power_usage > 0 ? (
                      <Box color={module.disabled || module.broken ? 'gray' : 'good'}>
                        {module.power_usage}W
                      </Box>
                    ) : (
                      <Box color="gray">Passive</Box>
                    )}
                  </Table.Cell>
                  <Table.Cell>
                    <Box color={status.color}>{status.text}</Box>
                  </Table.Cell>
                  <Table.Cell>
                    <Button
                      content={module.disabled ? 'Enable' : 'Disable'}
                      disabled={module.broken}
                      color={module.disabled ? 'good' : 'bad'}
                      onClick={() =>
                        act('toggle_module', { module: module.name })
                      }
                    />
                    {' '}
                    <Button
                      content="Extract"
                      color="bad"
                      disabled={module.value < 0}
                      onClick={() =>
                        act('extract_module', { module: module.name })
                      }
                    />
                  </Table.Cell>
                </Table.Row>
              );
            })}
          </Table>
        </Section>

        {modules.filter((m) => m.broken).length > 0 && (
          <Section title="Damaged Modules" color="bad">
            <Box color="bad" mb={1}>
              The following modules require repair:
            </Box>
            {modules
              .filter((m) => m.broken)
              .map((module) => (
                <Box key={module.name} color="bad">
                  • {module.name}
                </Box>
              ))}
          </Section>
        )}

        <Section title="Instructions">
          <Box color="gray">
            • Use module chips on this console to install new modules
            <br />
            • Extract button removes module and creates a chip
            <br />
            • Disabled modules don't consume power or provide benefits
            <br />
            • Broken modules cannot be enabled until repaired
          </Box>
        </Section>
      </Window.Content>
    </Window>
  );
};
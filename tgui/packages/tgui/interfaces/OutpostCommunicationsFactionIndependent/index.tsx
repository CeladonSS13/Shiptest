import { useBackend, useSharedState } from '../../backend';
import { Section, Tabs, Button, LabeledList, Stack } from '../../components';
import { Window } from '../../layouts';

import { CargoCatalog } from '../OutpostCommunicationsCeladon/Catalog';
import { Data } from '../OutpostCommunicationsCeladon/types';

export const OutpostCommunicationsFactionIndependent = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const { outpostDocked, onShip, points } = data;
  const [tab, setTab] = useSharedState(context, 'outpostTab', '');
  return (
    <Window theme="independent" width={600} height={700} resizable>
      <Window.Content scrollable>
        <Section
          title={Math.round(points) + ' credits'}
          buttons={
            <Stack textAlign="center">
              <Stack.Item>
                <Tabs>
                  <Tabs.Tab
                    selected={tab === 'cargo'}
                    onClick={() => setTab('cargo')}
                  >
                    Cargo
                  </Tabs.Tab>
                </Tabs>
              </Stack.Item>
              <Stack.Item>
                <Button.Input
                  content="Withdraw Cash"
                  currentValue={100}
                  defaultValue={100}
                  onCommit={(e, value) =>
                    act('withdrawCash', {
                      value: value,
                    })
                  }
                />
              </Stack.Item>
            </Stack>
          }
        />
        {tab === 'cargo' && <CargoExpressContent />}
      </Window.Content>
    </Window>
  );
};

const CargoExpressContent = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const { message } = data;
  return (
    <>
      <Section title="Cargo Express">
        <LabeledList>
          <LabeledList.Item label="Notice">{message}</LabeledList.Item>
        </LabeledList>
      </Section>
      <CargoCatalog />
    </>
  );
};

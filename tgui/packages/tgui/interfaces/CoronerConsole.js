import { useBackend } from '../backend';
import { Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';

export const CoronerConsole = (props, context) => {
  const { act, data } = useBackend(context);
  const { credits } = data;

  return (
    <Window width={400} height={200}>
      <Window.Content>
        <Section title="Coroner Management Console">
          <LabeledList>
            <LabeledList.Item label="Available Credits">
              {credits || 0}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        
        <Section title="Financial Operations">
          <Button
            content="Withdraw 500 Credits"
            onClick={() => act('withdraw', { amount: '500' })}
            disabled={!credits || credits < 500}
          />
          <Button
            content="Withdraw 1000 Credits"
            onClick={() => act('withdraw', { amount: '1000' })}
            disabled={!credits || credits < 1000}
          />
          <Button
            content="Withdraw All Credits"
            onClick={() => act('withdraw', { amount: 'all' })}
            disabled={!credits || credits === 0}
          />
        </Section>
      </Window.Content>
    </Window>
  );
};
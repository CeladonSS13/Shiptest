import { useBackend } from '../backend';
import { Section, Button } from '../components';
import { Window } from '../layouts';

interface ChatSetting {
  key: string;
  desc: string;
  enabled: boolean;
  type: string;
}

interface Data {
  ghost?: ChatSetting[];
  chat?: ChatSetting[];
}

const sortByDesc = (items: ChatSetting[]) => {
  return items.sort((a, b) => {
    const descA = a.desc.toLowerCase();
    const descB = b.desc.toLowerCase();
    return descA.localeCompare(descB);
  });
};

type ChatSettingsPanelProps = {};
export function ChatSettingsPanel(props: ChatSettingsPanelProps, context) {
  const { act, data } = useBackend<Data>(context);
  const ghost = sortByDesc(data.ghost || []);
  const chat = sortByDesc(data.chat || []);
  return (
    <Window title="Настройка чата" width={250} height={400}>
      <Window.Content scrollable>
        <Section title="Основное">
          {ghost.map((a) => (
            <Button
              fluid
              key={a.key}
              icon={a.enabled ? 'times' : 'check'}
              content={a.desc}
              color={a.enabled ? 'bad' : 'good'}
              onClick={() => act(a.type, { key: a.key })}
            />
          ))}
        </Section>
        <Section title="Глобальное">
          {chat.map((a) => (
            <Button
              fluid
              key={a.key}
              icon={a.enabled ? 'times' : 'check'}
              content={a.desc}
              color={a.enabled ? 'bad' : 'good'}
              onClick={() => act(a.type, { key: a.key })}
            />
          ))}
        </Section>
      </Window.Content>
    </Window>
  );
}

import { useBackend } from '../backend';
import { Button, Section } from '../components';
import { Window } from '../layouts';

interface SoundSetting {
  adminhelp: boolean;
  midi: boolean;
  ambience: boolean;
  lobby: boolean;
  instruments: boolean;
  ship_ambience: boolean;
  prayers: boolean;
  announcements: boolean;
  endofround: boolean;
  jukebox: boolean;
}

type SoundPanelSettingsProps = {};
export function SoundPanelSettings(props: SoundPanelSettingsProps, context) {
  const { act, data } = useBackend<SoundSetting>(context);
  const {
    adminhelp,
    midi,
    ambience,
    lobby,
    instruments,
    ship_ambience,
    prayers,
    announcements,
    endofround,
    jukebox,
  } = data;
  return (
    <Window width={250} height={400} title="Настройки звука">
      <Window.Content>
        <Section title="Основное">
          {[
            { k: 'midi', v: midi,  t: 'Админские мидис' },
            { k: 'lobby', v: lobby, t: 'Музыка в лобби' },
            { k: 'instruments', v: instruments, t: 'Музыкальные инструменты' },
            { k: 'endofround', v: endofround, t: 'Звук конца раунда' },
            { k: 'jukebox', v: jukebox, t: 'Музыкальный автомат' },
            { k: 'announcements', v: announcements, t: 'Оповещения (Announcements)' },
            { k: 'ambience', v: ambience, t: 'Окружение (Ambience)' },
            { k: 'ship_ambience', v: ship_ambience, t: 'Шум корабля (Ambience)' },
          ].map(({ k, v, t }) => (
            <Button
              key={k}
              icon={v ? 'volume-up' : 'volume-mute'}
              color={v ? 'green' : 'transparent'}
              content={t}
              fluid
              onClick={() => act(k)}
            />
          ))}
        </Section>
        <Section title="Административное">
          {[
            { k: 'adminhelp', v: adminhelp, t: 'Ахелпы' },
            { k: 'prayers', v: prayers, t: 'Молитвы' },
          ].map(({ k, v, t }) => (
            <Button
              key={k}
              icon={v ? 'volume-up' : 'volume-mute'}
              color={v ? 'green' : 'transparent'}
              content={t}
              fluid
              onClick={() => act(k)}
            />
          ))}
        </Section>
      </Window.Content>
    </Window>
  );
}

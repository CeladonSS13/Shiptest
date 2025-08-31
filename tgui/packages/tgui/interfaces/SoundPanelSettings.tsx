import { useBackend } from '../backend';
import { Button, Section } from '../components';
import { Window } from '../layouts';

interface SoundSetting {
  adminhelp: boolean;
  midi: boolean;
  ambience: boolean;
  copyrighted: boolean;
  lobby: boolean;
  instruments: boolean;
  ship_ambience: boolean;
  prayers: boolean;
  announcements: boolean;
  endofround: boolean;
  jukebox: boolean;
}

export const SoundPanelSettings = (props, context) => {
  const { act, data } = useBackend<SoundSetting>(context);
  const {
    adminhelp,
    midi,
    ambience,
    copyrighted,
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
          <Button
            icon={midi ? 'volume-up' : 'volume-mute'}
            color={midi ? 'green' : 'transparent'}
            content="Админские мидис"
            fluid
            onClick={() => act('midi')}
          />
          <Button
            icon={lobby ? 'volume-up' : 'volume-mute'}
            color={lobby ? 'green' : 'transparent'}
            content="Музыка в лобби"
            fluid
            onClick={() => act('lobby')}
          />
          <Button
            icon={instruments ? 'volume-up' : 'volume-mute'}
            color={instruments ? 'green' : 'transparent'}
            content="Музыкальные инструменты"
            fluid
            onClick={() => act('instruments')}
          />
          <Button
            icon={endofround ? 'volume-up' : 'volume-mute'}
            color={endofround ? 'green' : 'transparent'}
            content="Звук конца раунда"
            fluid
            onClick={() => act('endofround')}
          />
          <Button
            icon={jukebox ? 'volume-up' : 'volume-mute'}
            color={jukebox ? 'green' : 'transparent'}
            content="Музыкальный автомат"
            fluid
            onClick={() => act('jukebox')}
          />
          <Button
            icon={copyrighted ? 'volume-up' : 'volume-mute'}
            color={copyrighted ? 'green' : 'transparent'}
            content="Копирайтовые треки"
            fluid
            onClick={() => act('copyrighted')}
          />
          <Button
            icon={announcements ? 'volume-up' : 'volume-mute'}
            color={announcements ? 'green' : 'transparent'}
            content="Оповещения (Announcements)"
            fluid
            onClick={() => act('announcements')}
          />
          <Button
            icon={ambience ? 'volume-up' : 'volume-mute'}
            color={ambience ? 'green' : 'transparent'}
            content="Окружение (Ambience)"
            fluid
            onClick={() => act('ambience')}
          />
          <Button
            icon={ship_ambience ? 'volume-up' : 'volume-mute'}
            color={ship_ambience ? 'green' : 'transparent'}
            content="Шум корабля (Ambience)"
            fluid
            onClick={() => act('ship_ambience')}
          />
        </Section>
        <Section title="Административное">
          <Button
            icon={adminhelp ? 'volume-up' : 'volume-mute'}
            color={adminhelp ? 'green' : 'transparent'}
            content="Ахелпы"
            fluid
            onClick={() => act('adminhelp')}
          />
          <Button
            icon={prayers ? 'volume-up' : 'volume-mute'}
            color={prayers ? 'green' : 'transparent'}
            content="Молитвы"
            fluid
            onClick={() => act('prayers')}
          />
        </Section>
      </Window.Content>
    </Window>
  );
};

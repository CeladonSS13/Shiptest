import { useBackend } from '../backend';
import { Box, Button, LabeledList, NumberInput, Section } from '../components';
import { InterfaceLockNoticeBox } from './common/InterfaceLockNoticeBox';
import { Window } from '../layouts';

const DISEASE_THEASHOLD_LIST = [
  'Positive',
  'Harmless',
  'Minor',
  'Medium',
  'Harmful',
  'Dangerous',
  'BIOHAZARD',
];

const TARGET_SPECIES_LIST = [
  {
    name: 'Human',
    value: 'human',
  },
  {
    name: 'Sarathi',
    value: 'lizard',
  },
  {
    name: 'Flyperson',
    value: 'fly',
  },
  {
    name: 'Plasmaman',
    value: 'plasma',
  },
  {
    name: 'Mothperson',
    value: 'moth',
  },
  {
    name: 'Jellyperson',
    value: 'jelly',
  },
  {
    name: 'Podperson',
    value: 'pod',
  },
  {
    name: 'Golem',
    value: 'golem',
  },
  {
    name: 'Zombie',
    value: 'zombie',
  },
  {
    name: 'Rachnid',
    value: 'rachnid',
  },
  {
    name: 'IPC',
    value: 'ipc',
  },
  {
    name: 'Elzuose',
    value: 'ethereal', // ИИшке тут что-то не нравиться
  },
  {
    name: 'Kepori',
    value: 'kepori',
  },
  // [CELADON-ADD] - TAJARA
  {
    name: 'Tajara',
    value: 'tajara',
  },
  {
    name: 'Riol', // Добавлено ИИ
    value: 'riol',
  },
  {
    name: 'Lanius', // Добавлено ИИ
    value: 'lanius',
  },
];

const SCAN_OPTIONS = [
  { name: 'Wanted', value: 'Wanted' },
  { name: 'Weapons', value: 'Guns' },
  { name: 'Mindshield', value: 'Mindshield' },
  { name: 'Disease', value: 'Disease' },
  { name: 'Species', value: 'Species' },
  { name: 'Nanites', value: 'Nanites' },
];

export const ScannerGate = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window width={400} height={300} resizable>
      <Window.Content scrollable>
        <InterfaceLockNoticeBox
          onLockedStatusChange={() => act('toggle_lock')}
        />
        {!data.locked && <ScannerGateControl />}
      </Window.Content>
    </Window>
  );
};

const ScannerGateControl = (props, context) => {
  const { act, data } = useBackend(context);
  const { scan_modes = [], target_species = [] } = data;
  return (
    <Section title="Scanning parameters">
      <Box mb={1}>
        Выберите требуемые условия срабатывания. Цвет сканера показывает, какое
        условие сработало.
        Розыск или отсутствие охранных записей - красный.
        Наличие оружия - желтый.
        Отсутствие импланта Защита разума - синий.
        Наличие заболевания - белый.
        Совпадение по расе - оранжевый.
        Совпадение по нанитам - фиолетовый.
        Если несколько совпадений, отобразится первый по списку.
      </Box>
      <Box mb={2}>
        {SCAN_OPTIONS.map((option) => (
          <Button.Checkbox
            key={option.value}
            checked={scan_modes.includes(option.value)}
            content={option.name}
            onClick={() => act('toggle_scan_mode', { scan_mode: option.value })}
          />
        ))}
      </Box>
      {scan_modes.includes('Disease') && (
        <Section title="Disease threshold" level={2}>
          {DISEASE_THEASHOLD_LIST.map((threshold) => (
            <Button.Checkbox
              key={threshold}
              checked={threshold === data.disease_threshold}
              content={threshold}
              onClick={() =>
                act('set_disease_threshold', {
                  new_threshold: threshold,
                })
              }
            />
          ))}
        </Section>
      )}
      {scan_modes.includes('Species') && (
        <Section title="Target species" level={2}>
          <Box mb={1}>
            Select one or more species. All zombie types, including dormant
            zombies, are detected.
          </Box>
          {TARGET_SPECIES_LIST.map((species) => (
            <Button.Checkbox
              key={species.value}
              checked={target_species.includes(species.value)}
              content={species.name}
              onClick={() =>
                act('set_target_species', {
                  new_species: species.value,
                })
              }
            />
          ))}
        </Section>
      )}
      {scan_modes.includes('Nanites') && (
        <Section title="Nanite cloud" level={2}>
          <LabeledList>
            <LabeledList.Item label="Cloud ID">
              <NumberInput
                value={data.nanite_cloud}
                width="65px"
                minValue={1}
                maxValue={100}
                stepPixelSize={2}
                onChange={(e, value) =>
                  act('set_nanite_cloud', {
                    new_cloud: value,
                  })
                }
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      )}
      <ScannerGateMode />
    </Section>
  );
};

const ScannerGateMode = (props, context) => {
  const { act, data } = useBackend(context);
  const { reverse } = data;
  return (
    <LabeledList>
      <LabeledList.Item label="Reverse scan result">
        <Button
          content={reverse ? 'Inverted' : 'Default'}
          icon={reverse ? 'random' : 'long-arrow-alt-right'}
          onClick={() => act('toggle_reverse')}
          color={reverse ? 'bad' : 'good'}
        />
      </LabeledList.Item>
    </LabeledList>
  );
};

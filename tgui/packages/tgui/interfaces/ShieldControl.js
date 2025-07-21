// [CELADON] - CELADON_SHIP_SHIELD - Пиздец, как это комментить?
import { useBackend } from '../backend';
import { Box, Button, LabeledList, ProgressBar, Section } from '../components';
import { Window } from '../layouts';

export const ShieldControl = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    has_shield_system,
    active,
    recharging,
    shield_power,
    max_shield_power,
    shield_percentage,
    power_usage,
    has_generator,
    generator_active,
    stored_power,
    max_power,
    power_percentage,
  } = data;

  return (
    <Window width={400} height={300}>
      <Window.Content>
        {!has_shield_system ? (
          <Section title="Ошибка">
            <Box color="bad">Система щитов не обнаружена.</Box>
          </Section>
        ) : (
          <>
            <Section title="Статус щитов">
              <LabeledList>
                <LabeledList.Item label="Состояние">
                  {active ? (
                    <Box color="good">Активны</Box>
                  ) : recharging ? (
                    <Box color="average">Перезарядка</Box>
                  ) : (
                    <Box color="bad">Отключены</Box>
                  )}
                </LabeledList.Item>
                <LabeledList.Item label="Мощность щитов">
                  <ProgressBar
                    value={shield_power}
                    minValue={0}
                    maxValue={max_shield_power}
                    color={
                      shield_percentage > 50
                        ? 'good'
                        : shield_percentage > 25
                        ? 'average'
                        : 'bad'
                    }
                  >
                    {shield_power} / {max_shield_power} ({shield_percentage}%)
                  </ProgressBar>
                </LabeledList.Item>
                <LabeledList.Item label="Потребление энергии">
                  {power_usage} единиц/сек
                </LabeledList.Item>
              </LabeledList>
              <Button
                icon={active ? 'power-off' : 'power-off'}
                content={active ? 'Отключить' : 'Включить'}
                color={active ? 'bad' : 'good'}
                disabled={recharging}
                onClick={() => act('toggle_shields')}
                mt={2}
                fluid
              />
            </Section>
            {has_generator && (
              <Section title="Генератор щитов">
                <LabeledList>
                  <LabeledList.Item label="Состояние">
                    {generator_active ? (
                      <Box color="good">Активен</Box>
                    ) : (
                      <Box color="bad">Отключен</Box>
                    )}
                  </LabeledList.Item>
                  <LabeledList.Item label="Накопленная энергия">
                    <ProgressBar
                      value={stored_power}
                      minValue={0}
                      maxValue={max_power}
                      color={
                        power_percentage > 50
                          ? 'good'
                          : power_percentage > 25
                          ? 'average'
                          : 'bad'
                      }
                    >
                      {stored_power} / {max_power} ({power_percentage}%)
                    </ProgressBar>
                  </LabeledList.Item>
                </LabeledList>
                <Button
                  icon="search"
                  content="Найти генератор"
                  onClick={() => act('find_generator')}
                  mt={2}
                  fluid
                />
              </Section>
            )}
          </>
        )}
      </Window.Content>
    </Window>
  );
};

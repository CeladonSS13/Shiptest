// [CELADON] - CELADON_SHIP_SHIELD - Пиздец, как это комментить?
import { useBackend } from '../backend';
import { Box, Button, LabeledList, ProgressBar, Section } from '../components';
import { Window } from '../layouts';

export const ShieldGenerator = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    active,
    stored_power,
    max_power,
    charge_rate,
    shield_active,
    shield_power,
    max_shield_power,
    shield_percentage,
    recharging,
  } = data;

  return (
    <Window width={400} height={300}>
      <Window.Content>
        <Section title="Генератор щитов">
          <LabeledList>
            <LabeledList.Item label="Состояние">
              {active ? (
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
                  stored_power > max_power * 0.5
                    ? 'good'
                    : stored_power > max_power * 0.25
                    ? 'average'
                    : 'bad'
                }
              >
                {stored_power} / {max_power} (
                {Math.round((stored_power / max_power) * 100)}%)
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Скорость зарядки">
              {charge_rate} единиц/сек
            </LabeledList.Item>
          </LabeledList>
          <Button
            icon={active ? 'power-off' : 'power-off'}
            content={active ? 'Отключить' : 'Включить'}
            color={active ? 'bad' : 'good'}
            onClick={() => act('toggle')}
            mt={2}
            fluid
          />
        </Section>
        <Section title="Статус щитов">
          <LabeledList>
            <LabeledList.Item label="Состояние">
              {shield_active ? (
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
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};

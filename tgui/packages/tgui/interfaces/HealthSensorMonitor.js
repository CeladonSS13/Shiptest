import { useBackend } from '../backend';
import { Box, Button, ColorBox, LabeledList, Section, Table } from '../components';
import { COLORS } from '../constants';
import { Window } from '../layouts';

const STATUS_COLOR = {
  alive: 'good',
  crit: 'average',
  dead: 'bad',
  dnr: 'grey',
  nosignal: 'average',
};

const STATUS_LABEL = {
  alive: 'Alive',
  crit: 'Critical',
  dead: 'Dead',
  dnr: 'DNR',
  nosignal: 'No Signal',
};

const HEALTH_COLOR_BY_LEVEL = [
  '#17d568',
  '#2ecc71',
  '#e67e22',
  '#ed5100',
  '#e74c3c',
  '#ed2814',
];

const healthToColor = (oxy, tox, burn, brute) => {
  const healthSum = (oxy || 0) + (tox || 0) + (burn || 0) + (brute || 0);
  const level = Math.min(Math.max(Math.ceil(healthSum / 25), 0), 5);
  return HEALTH_COLOR_BY_LEVEL[level];
};

const HealthStat = (props) => {
  const { type, value } = props;
  return (
    <Box inline width={2} color={COLORS.damageType[type]} textAlign="center">
      {value}
    </Box>
  );
};

export const HealthSensorMonitor = (props, context) => {
  const { act, data } = useBackend(context);
  const sensors = data.sensors || [];
  return (
    <Window title="Vital Sensor Monitor" width={720} height={480} resizable>
      <Window.Content scrollable>
        <Section
          title="Alerts"
          buttons={
            <>
              <Button
                icon="volume-up"
                content={data.audio_alerts ? 'Speaker On' : 'Speaker Off'}
                selected={data.audio_alerts}
                onClick={() => act('toggle_audio')}
              />
              <Button
                icon="lightbulb"
                content={
                  data.visual_alerts ? 'Warning Light On' : 'Warning Light Off'
                }
                selected={data.visual_alerts}
                onClick={() => act('toggle_visual')}
              />
            </>
          }
        >
          Bind a sensor by clicking it (or its case) against this monitor, or by
          using the monitor on an implanted host.
        </Section>
        <Section title="Bound Sensors">
          {sensors.length === 0 ? (
            <Box color="label">No sensors bound.</Box>
          ) : (
            <Table>
              <Table.Row>
                <Table.Cell bold>Sensor</Table.Cell>
                <Table.Cell bold collapsing>
                  Status
                </Table.Cell>
                <Table.Cell bold collapsing textAlign="center">
                  Vitals
                </Table.Cell>
                <Table.Cell bold>Sector</Table.Cell>
                <Table.Cell bold collapsing>
                  Coords
                </Table.Cell>
                <Table.Cell bold collapsing />
              </Table.Row>
              {sensors.map((sensor) => (
                <Table.Row key={sensor.ref}>
                  <Table.Cell>
                    {sensor.name}
                    {!sensor.implanted && (
                      <Box inline color="average">
                        {' '}
                        (not implanted)
                      </Box>
                    )}
                  </Table.Cell>
                  <Table.Cell collapsing>
                    <Box color={STATUS_COLOR[sensor.status] || 'label'}>
                      {STATUS_LABEL[sensor.status] || sensor.status}
                    </Box>
                  </Table.Cell>
                  <Table.Cell collapsing textAlign="center">
                    {sensor.show_vitals && sensor.oxydam !== null ? (
                      <Box inline>
                        <ColorBox
                          color={healthToColor(
                            sensor.oxydam,
                            sensor.toxdam,
                            sensor.burndam,
                            sensor.brutedam
                          )}
                        />{' '}
                        <HealthStat type="oxy" value={sensor.oxydam} />
                        {'/'}
                        <HealthStat type="toxin" value={sensor.toxdam} />
                        {'/'}
                        <HealthStat type="burn" value={sensor.burndam} />
                        {'/'}
                        <HealthStat type="brute" value={sensor.brutedam} />
                      </Box>
                    ) : sensor.status === 'alive' || sensor.status === 'crit' ? (
                      'Living'
                    ) : sensor.status === 'dnr' ? (
                      'DNR'
                    ) : sensor.status === 'dead' ? (
                      'Dead'
                    ) : (
                      'N/A'
                    )}
                  </Table.Cell>
                  <Table.Cell>{sensor.location || '—'}</Table.Cell>
                  <Table.Cell collapsing nowrap>
                    {sensor.coords || '—'}
                  </Table.Cell>
                  <Table.Cell collapsing nowrap>
                    <Button
                      icon="pencil-alt"
                      tooltip="Rename"
                      onClick={() => act('rename', { ref: sensor.ref })}
                    />
                    <Button
                      icon="eye"
                      content="Watch"
                      selected={sensor.watched}
                      onClick={() => act('toggle_watch', { ref: sensor.ref })}
                    />
                    <Button
                      icon="unlink"
                      color="bad"
                      tooltip="Unpair"
                      onClick={() => act('unpair', { ref: sensor.ref })}
                    />
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          )}
        </Section>
        <LabeledList>
          <LabeledList.Item label="Watch mode">
            Watched sensors trigger the speaker and warning light if the host
            is in crit or dead.
          </LabeledList.Item>
          <LabeledList.Item label="Sector">
            MK2 only. Hidden while the host is alive (Locked). After death,
            wait 5 minutes, then the star system, place, and the body's
            X/Y appear.
          </LabeledList.Item>
        </LabeledList>
      </Window.Content>
    </Window>
  );
};

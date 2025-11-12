import { useBackend } from '../backend';
import { Box, Button, Section, ColorBox, Stack, ProgressBar, Divider } from '../components';
import { Window } from '../layouts';

export const WallPainter = (props, context) => {
  const { act, data } = useBackend(context);
  const { paint_color, paint_uses, max_uses } = data;

  const presetColors = [
    { color: '#FF0000', name: 'Red' },
    { color: '#00FF00', name: 'Green' },
    { color: '#0000FF', name: 'Blue' },
    { color: '#FFFF00', name: 'Yellow' },
    { color: '#FF00FF', name: 'Magenta' },
    { color: '#00FFFF', name: 'Cyan' },
    { color: '#FFFFFF', name: 'White' },
    { color: '#FFA500', name: 'Orange' },
    { color: '#FFC0CB', name: 'Pink' },
    { color: '#90EE90', name: 'Light Green' },
    { color: '#87CEEB', name: 'Sky Blue' },
    { color: '#DDA0DD', name: 'Plum' },
    { color: '#8B4513', name: 'Brown' },
    { color: '#808080', name: 'Gray' },
    { color: '#000000', name: 'Black' },
    { color: '#800080', name: 'Purple' },
  ];

  const usagePercent = (paint_uses / max_uses) * 100;
  const getUsageColor = () => {
    if (usagePercent > 60) return 'good';
    if (usagePercent > 30) return 'average';
    return 'bad';
  };

  return (
    <Window width={520} height={420} theme="ntos">
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Section title="🎨 Paint Status" textAlign="center">
              <Stack vertical>
                <Stack.Item>
                  <Box fontSize="1.1em" bold>
                    Paint Remaining: {paint_uses}/{max_uses}
                  </Box>
                </Stack.Item>
                <Stack.Item>
                  <ProgressBar
                    value={paint_uses}
                    minValue={0}
                    maxValue={max_uses}
                    color={getUsageColor()}
                    ranges={{
                      good: [max_uses * 0.6, max_uses],
                      average: [max_uses * 0.3, max_uses * 0.6],
                      bad: [0, max_uses * 0.3],
                    }}
                  />
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>

          <Stack.Item>
            <Section title="🎯 Current Selection">
              <Stack align="center">
                <Stack.Item>
                  <Box mb={1} fontSize="1.1em" bold>
                    Selected Color:
                  </Box>
                  <ColorBox 
                    color={paint_color} 
                    width="120px" 
                    height="40px" 
                    style={{
                      border: '3px solid #4a4a4a',
                      borderRadius: '8px',
                      boxShadow: '0 2px 4px rgba(0,0,0,0.3)'
                    }}
                  />
                  <Box mt={1} textAlign="center" color="label">
                    {paint_color.toUpperCase()}
                  </Box>
                </Stack.Item>
                <Stack.Item ml={3}>
                  <Button
                    icon="palette"
                    content="Custom Color"
                    color="purple"
                    onClick={() => act('pick_color')}
                    tooltip="Choose any custom color"
                  />
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>

          <Stack.Item grow>
            <Section title="🌈 Color Presets">
              <Box mb={1} color="label">
                Click any color to select it:
              </Box>
              <Stack wrap justify="space-around">
                {presetColors.map((colorData) => (
                  <Stack.Item key={colorData.color} mb={1}>
                    <Button
                      width="32px"
                      height="32px"
                      backgroundColor={colorData.color}
                      selected={paint_color === colorData.color}
                      onClick={() => act('set_color', { color: colorData.color })}
                      tooltip={colorData.name}
                      style={{
                        border: paint_color === colorData.color 
                          ? '3px solid #ffffff' 
                          : '2px solid #4a4a4a',
                        borderRadius: '6px',
                        boxShadow: paint_color === colorData.color 
                          ? '0 0 8px rgba(255,255,255,0.6)' 
                          : '0 1px 3px rgba(0,0,0,0.3)',
                        transition: 'all 0.2s ease'
                      }}
                    />
                  </Stack.Item>
                ))}
              </Stack>
            </Section>
          </Stack.Item>

          <Stack.Item>
            <Divider />
            <Box textAlign="center" color="label" fontSize="0.9em" mt={1}>
              💡 Tip: Use on walls to paint them. Paint regenerates over time.
            </Box>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

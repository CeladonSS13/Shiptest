import { useBackend } from '../backend';
import { Box, Button, Section, ColorBox, Stack } from '../components';
import { Window } from '../layouts';

export const WallPainter = (props, context) => {
  const { act, data } = useBackend(context);
  const { paint_color, paint_uses, max_uses } = data;

  const presetColors = [
    '#FF0000',
    '#00FF00',
    '#0000FF',
    '#FFFF00',
    '#FF00FF',
    '#00FFFF',
    '#FFFFFF',
    '#FFA500',
    '#FFC0CB',
    '#90EE90',
    '#87CEEB',
    '#DDA0DD',
  ];

  return (
    <Window width={450} height={380}>
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <Section title="Paint Status">
              <Box>
                Uses remaining: {paint_uses}/{max_uses}
              </Box>
            </Section>
          </Stack.Item>

          <Stack.Item>
            <Section title="Color Selection">
              <Stack>
                <Stack.Item width="60%">
                  <Box mb={1}>Current Color:</Box>
                  <ColorBox color={paint_color} width="100px" height="30px" />
                  <Box mt={1}>
                    <Button
                      content="Custom Color"
                      onClick={() => act('pick_color')}
                    />
                  </Box>
                </Stack.Item>

                <Stack.Item width="40%">
                  <Box mb={1}>Presets:</Box>
                  <Stack wrap>
                    {presetColors.map((color) => (
                      <Stack.Item key={color} mb={0.5} mr={0.5}>
                        <Button
                          width="25px"
                          height="25px"
                          backgroundColor={color}
                          selected={paint_color === color}
                          onClick={() => act('set_color', { color: color })}
                        />
                      </Stack.Item>
                    ))}
                  </Stack>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

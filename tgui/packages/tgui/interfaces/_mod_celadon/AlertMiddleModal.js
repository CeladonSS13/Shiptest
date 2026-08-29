/**
* Используется в mod_celadon\_tgui\code\tgui.dm
 */

import { clamp01 } from 'common/math';
import { useBackend } from '../../backend';
import { Box, Button, Flex } from '../../components';
import { Window } from '../../layouts';

export const AlertMiddleModal = (props, context) => {
  const { act, data } = useBackend(context);
  const { title, message, buttons, timeout } = data;

  return (
    <Window title={title} width={400} height={200} resizable>
      {timeout !== undefined && <Loader value={timeout} />}
      <Window.Content>
        <Flex direction="column" height="100%">
          <Flex.Item grow={1}>
            <Flex
              direction="column"
              className="AlertModal__Message"
              height="100%"
            >
              <Flex.Item>
                <Box m={1}>
                  {message.split('\n').map((line, index) => (
                    <div key={index}>
                      {line || '\u00A0'}
                    </div>
                  ))}
                </Box>
              </Flex.Item>
            </Flex>
          </Flex.Item>
          <Flex.Item my={2}>
            <Flex className="AlertModal__Buttons">
              {buttons.map((button) => (
                <Flex.Item key={button} mx={1}>
                  <Button
                    px={3}
                    onClick={() => act('choose', { choice: button })}
                  >
                    {button}
                  </Button>
                </Flex.Item>
              ))}
            </Flex>
          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
};

export const Loader = (props) => {
  const { value } = props;
  return (
    <div className="AlertModal__Loader">
      <Box
        className="AlertModal__LoaderProgress"
        style={{
          width: clamp01(value) * 100 + '%',
        }}
      />
    </div>
  );
};

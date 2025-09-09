import { useBackend, useLocalState } from '../backend';
import { Window } from '../layouts';
import {
  Button,
  TextArea,
  Stack,
  Section,
  Box,
  Flex,
  Icon,
  Divider,
} from '../components';

export const Application = (props, context) => {
  const { act, data } = useBackend(context);
  const [message, setMessage] = useLocalState(context, 'message', '');
  const [showCkey, setShowCkey] = useLocalState(context, 'showCkey', false);
  const [isSubmitting, setIsSubmitting] = useLocalState(
    context,
    'isSubmitting',
    false
  );
  const [isCancelling, setIsCancelling] = useLocalState(
    context,
    'isCancelling',
    false
  );

  const { ship_name, player_name, job_name } = data;

  const isJobSpecific = !!job_name;
  const applicationTitle = isJobSpecific
    ? `Заявка на должность ${job_name}`
    : `Заявка на вступление в экипаж`;

  const calcRows = (text) => {
    if (!text) return 6;
    const lines = String(text).split('\n');
    let approx = 0;
    for (const line of lines) {
      approx += Math.max(1, Math.ceil(line.length / 70));
    }
    return Math.min(18, Math.max(6, approx));
  };
  const [textRows, setTextRows] = useLocalState(context, 'textRows', 6);

  const handleCancel = () => {
    if (isCancelling || isSubmitting) return;
    setIsCancelling(true);

    try {
      act('cancel');
    } catch (error) {
      console.error('Cancel error:', error);
    } finally {
      setTimeout(() => setIsCancelling(false), 2000);
    }
  };

  const handleSubmit = () => {
    if (isSubmitting || isCancelling) return;
    setIsSubmitting(true);

    try {
      let finalText = message.trim() || 'Заявка без сообщения';

      if (isJobSpecific && job_name) {
        finalText = `${job_name}: ${finalText}`;
      }

      act('submit', {
        text: finalText,
        ckey: showCkey,
      });
    } catch (error) {
      console.error('Submit error:', error);
    } finally {
      setTimeout(() => setIsSubmitting(false), 2000);
    }
  };

  return (
    <Window
      title={`${ship_name} • ${applicationTitle} [INTERCEPTOR v3-FINAL]`}
      width={650}
      height={700}
      resizable
      theme="ntos"
    >
      <Window.Content scrollable>
        <Stack fill vertical gap={1}>
          <Stack.Item>
            <Section>
              <Flex align="center" justify="center">
                <Flex.Item shrink>
                  <Icon name="file-alt" size={2.5} color="blue" mr={2} />
                </Flex.Item>
                <Flex.Item grow style={{ textAlign: 'center' }}>
                  <Box
                    fontSize="20px"
                    bold
                    color="white"
                    mb={1}
                    style={{ lineHeight: '1.2', wordBreak: 'break-word' }}
                  >
                    {applicationTitle}
                  </Box>
                  <Box
                    fontSize="14px"
                    color="label"
                    style={{ lineHeight: '1.3', opacity: 0.8 }}
                  >
                    {isJobSpecific
                      ? `Корабль: ${ship_name} • Игрок: ${player_name}`
                      : `Подача заявки на корабль ${ship_name} как ${player_name}`}
                  </Box>
                </Flex.Item>
              </Flex>
            </Section>
          </Stack.Item>

          <Stack.Item>
            <Section>
              <Box
                style={{
                  background:
                    'linear-gradient(135deg, rgba(52, 152, 219, 0.08) 0%, rgba(52, 152, 219, 0.12) 100%)',
                  border: '1px solid rgba(52, 152, 219, 0.25)',
                  borderRadius: '10px',
                  padding: '16px',
                  boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)',
                }}
              >
                <Box mb={3}>
                  <Icon name="info-circle" color="blue" size={1.2} mr={1} />
                  <Box
                    inline
                    bold
                    color="blue"
                    fontSize="16px"
                    style={{ transform: 'translateY(1px)' }}
                  >
                    Информация о заявке
                  </Box>
                </Box>

                <Box
                  mb={2}
                  style={{
                    lineHeight: '1.5',
                    fontSize: '14px',
                  }}
                >
                  • Данный корабль требует <b>одобрения заявки</b> владельцем
                  для вступления
                </Box>
                <Box
                  mb={2}
                  style={{
                    lineHeight: '1.5',
                    fontSize: '14px',
                  }}
                >
                  • Это <b>OOC утилита</b> для координации между игроками
                </Box>
                {isJobSpecific ? (
                  <Box
                    mb={2}
                    style={{
                      lineHeight: '1.5',
                      fontSize: '14px',
                    }}
                  >
                    • Вы подаёте заявку на{' '}
                    <b>конкретную должность: {job_name}</b>
                  </Box>
                ) : (
                  <Box
                    mb={2}
                    style={{
                      lineHeight: '1.5',
                      fontSize: '14px',
                    }}
                  >
                    • Заявка на <b>общее вступление</b> в экипаж корабля
                  </Box>
                )}
                <Box
                  style={{
                    lineHeight: '1.5',
                    fontSize: '14px',
                  }}
                >
                  • У вас есть <b>одна заявка на корабль</b>, разные персонажи
                  используют ту же заявку
                </Box>
              </Box>
            </Section>
          </Stack.Item>

          <Stack.Item>
            <Section
              title={
                <Flex align="center">
                  <Icon name="edit" color="blue" mr={1} />
                  <Box>Текст заявки</Box>
                </Flex>
              }
            >
              <Box mb={2}>
                <TextArea
                  value={message}
                  fluid
                  height={textRows}
                  maxLength={1024}
                  placeholder={
                    isJobSpecific
                      ? `Расскажите, почему вы хотите занять должность ${job_name} и что можете предложить экипажу...`
                      : 'Расскажите о себе, своём опыте и почему хотите присоединиться к экипажу...'
                  }
                  onChange={(e, input) => {
                    setMessage(input);
                    setTextRows(calcRows(input));
                  }}
                  style={{
                    fontSize: '14px',
                    lineHeight: '1.5',
                    background: 'rgba(0, 0, 0, 0.3)',
                    border: '1px solid rgba(255, 255, 255, 0.1)',
                    borderRadius: '8px',
                    padding: '12px',
                    fontFamily: 'monospace',
                    resize: 'none',
                  }}
                />
                <Box
                  textAlign="right"
                  fontSize="12px"
                  color="label"
                  mt={1}
                  style={{
                    opacity: 0.7,
                    fontStyle: 'italic',
                  }}
                >
                  {message.length}/1024 символов
                </Box>
              </Box>
            </Section>
          </Stack.Item>

          <Stack.Item>
            <Section
              title={
                <Flex align="center">
                  <Icon name="home" color="orange" mr={1} />
                  <Box>Настройки приватности</Box>
                </Flex>
              }
            >
              <Box
                style={{
                  background:
                    'linear-gradient(135deg, rgba(255, 165, 0, 0.08) 0%, rgba(255, 165, 0, 0.12) 100%)',
                  border: '1px solid rgba(255, 165, 0, 0.25)',
                  borderRadius: '10px',
                  padding: '16px',
                  boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)',
                }}
              >
                <Flex align="center" gap={3}>
                  <Flex.Item grow>
                    <Box>
                      <Box
                        bold
                        mb={1}
                        fontSize="15px"
                        style={{ color: '#ffa500' }}
                      >
                        Показать ckey владельцу корабля
                      </Box>
                      <Box
                        fontSize="13px"
                        color="label"
                        style={{
                          lineHeight: '1.4',
                          opacity: 0.8,
                        }}
                      >
                        Заявки сортируются по ckey, но ваш ckey будет показан
                        владельцу только при включении этой опции
                      </Box>
                    </Box>
                  </Flex.Item>
                  <Flex.Item>
                    <Button.Checkbox
                      content=""
                      checked={showCkey}
                      onClick={() => setShowCkey(!showCkey)}
                      style={{
                        transform: 'scale(1.3)',
                        marginTop: '4px',
                      }}
                    />
                  </Flex.Item>
                </Flex>
              </Box>
            </Section>
          </Stack.Item>

          <Divider style={{ margin: '16px 0' }} />

          <Stack.Item>
            <Box
              style={{
                background: 'rgba(0, 0, 0, 0.2)',
                border: '1px solid rgba(255, 255, 255, 0.1)',
                borderRadius: '10px',
                padding: '10px',
              }}
            >
              <Flex gap={2}>
                <Flex.Item grow>
                  <Button
                    content={isCancelling ? 'Отменяется...' : 'Отменить'}
                    color="bad"
                    icon="times"
                    fluid
                    disabled={isCancelling || isSubmitting}
                    onClick={handleCancel}
                    style={{
                      height: '24px',
                      fontSize: '13px',
                      borderRadius: '6px',
                      padding: '0 10px',
                    }}
                  />
                </Flex.Item>
                <Flex.Item grow>
                  <Button
                    content={
                      isSubmitting ? 'Отправляется...' : 'Отправить заявку'
                    }
                    color="good"
                    icon="envelope"
                    fluid
                    disabled={isSubmitting || isCancelling}
                    onClick={handleSubmit}
                    style={{
                      height: '24px',
                      fontSize: '13px',
                      borderRadius: '6px',
                      padding: '0 10px',
                    }}
                  />
                </Flex.Item>
              </Flex>
            </Box>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

import { useBackend, useLocalState } from '../backend';
import {
  Button,
  Section,
  Tabs,
  LabeledList,
  Collapsible,
  Flex,
  Box,
} from '../components';
import { Window } from '../layouts';
import { createSearch, decodeHtmlEntities } from 'common/string';
import { FactionButtons, getFactionColor } from './FactionButtons';
import { ShipBrowser } from './ShipBrowser';

const truncateText = (text, maxLength) => {
  if (!text) return '';
  if (text.length <= maxLength) return text;
  return text.substring(0, maxLength) + '...';
};

const findShipByRef = (ship_list, ship_ref) => {
  for (let i = 0; i < ship_list.length; i++) {
    if (ship_list[i].ref === ship_ref) return ship_list[i];
  }
  return null;
};

export const ShipSelect = (props, context) => {
  const { act, data } = useBackend(context);

  const [isJoining, setIsJoining] = useLocalState(context, 'isJoining', false);

  const ships = data.ships || [];
  const templates = data.templates || [];
  const epoch = data.epoch || 0;
  const loading = data.loading || false;

  const [currentTab, setCurrentTab] = useLocalState(context, 'tab', 1);

  const [selectedShipRef, setSelectedShipRef] = useLocalState(
    context,
    'selectedShipRef',
    null
  );

  const selectedShip = findShipByRef(ships, selectedShipRef);

  // Если выбранный корабль больше не существует, сбрасываем выбор
  if (currentTab === 2 && !selectedShip) {
    setCurrentTab(1);
    setSelectedShipRef(null);
  }

  const applyStates = {
    open: 'Open',
    apply: 'Apply',
    closed: 'Locked',
  };
  const [shownTabs, setShownTabs] = useLocalState(context, 'tabs', [
    { name: 'Ship Select', tab: 1 },
    { name: 'Ship Purchase', tab: 3 },
  ]);
  const searchFor = (searchText) =>
    createSearch(searchText, (thing) => thing.name);

  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');

  return (
    <Window
      key={`shipselect:${currentTab}:${epoch}`}
      title="Ship Select [INTERCEPTOR v3-FINAL]"
      width={860}
      height={640}
      resizable
    >
      <Window.Content scrollable>
        <Tabs style={{ display: 'flex', width: '100%' }}>
          {shownTabs.map((tabbing, index) => (
            <Tabs.Tab
              key={`${index}-${tabbing.name}`}
              selected={currentTab === tabbing.tab}
              onClick={() => {
                if (!loading) {
                  setCurrentTab(tabbing.tab);
                }
              }}
              disabled={loading}
              style={{ flex: 1, textAlign: 'center' }}
            >
              {tabbing.name}
            </Tabs.Tab>
          ))}
        </Tabs>
        {currentTab === 1 && (
          <Section
            title="Active Ship Selection"
            buttons={
              <Button
                icon="question"
                tooltip={
                  'Для дополнительной информации наведите на интересующий вас элемент, например мемо капитана. Используйте манифест для просмотра текущих членов экипажа и их ролей.'
                }
              />
            }
          >
            <Flex direction="column" gap={1}>
              {ships.map((ship) => {
                const shipName = decodeHtmlEntities(ship.name);
                const shipFaction = ship.faction;
                const crewCount = ship.manifest
                  ? Object.keys(ship.manifest).length
                  : 0;

                return (
                  <Box
                    key={shipName}
                    style={{
                      background: '#2a2a2a',
                      border: '1px solid #444',
                      borderRadius: '8px',
                      padding: '12px',
                      marginBottom: '8px',
                    }}
                  >
                    {/* Шапка: Название + бейджи + мемо + кнопка */}
                    <Box
                      style={{
                        borderTop: '1px solid #444',
                        borderBottom: '1px solid #444',
                        padding: '8px 0',
                        marginBottom: '8px',
                      }}
                    >
                      <Flex align="center" justify="space-between" wrap>
                        {/* Левая часть: название + бейджи */}
                        <Flex.Item>
                          <Flex align="center" gap={1}>
                            <Box
                              mr={1}
                              bold
                              title={shipName}
                              style={{
                                fontSize: '16px',
                                color: '#fff',
                                cursor: 'default',
                              }}
                            >
                              {truncateText(shipName, 25)}
                            </Box>
                            <Box
                              className="chip"
                              title="Класс корабля"
                              style={{
                                display: 'inline-flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                height: 22,
                                lineHeight: '22px',
                                padding: '0 8px',
                                minWidth: 110,
                                borderRadius: 6,
                                fontSize: 12,
                                background: 'rgba(255,255,255,0.06)',
                                border: '1px solid rgba(255,255,255,0.12)',
                                marginRight: '4px',
                                color: '#fff',
                                textAlign: 'center',
                                whiteSpace: 'nowrap',
                              }}
                            >
                              {ship.class}
                            </Box>
                            <Box
                              className="chip chip--faction"
                              title="Фракция"
                              style={{
                                display: 'inline-flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                height: 22,
                                lineHeight: '22px',
                                padding: '0 8px',
                                minWidth: 110,
                                borderRadius: 6,
                                fontSize: 12,
                                background: getFactionColor(shipFaction).bg,
                                border: '1px solid rgba(255,255,255,0.12)',
                                marginRight: '4px',
                                color: getFactionColor(shipFaction).text,
                                textAlign: 'center',
                                whiteSpace: 'nowrap',
                              }}
                            >
                              {shipFaction}
                            </Box>
                            <Box
                              className="chip"
                              title="Экипаж"
                              style={{
                                display: 'inline-flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                height: 22,
                                lineHeight: '22px',
                                padding: '0 8px',
                                minWidth: 110,
                                borderRadius: 6,
                                fontSize: 12,
                                background: 'rgba(255,255,255,0.06)',
                                border: '1px solid rgba(255,255,255,0.12)',
                                marginRight: '4px',
                                color: '#fff',
                                textAlign: 'center',
                                whiteSpace: 'nowrap',
                              }}
                            >
                              👥:{'\u00A0'}
                              <span style={{ color: '#2ECC71' }}>
                                {crewCount}
                              </span>
                            </Box>
                          </Flex>
                        </Flex.Item>

                        {/* Правая часть: Мемо + кнопка */}
                        <Flex.Item>
                          <Flex align="center" justify="flex-end">
                            <Flex.Item mr={1}>
                              <div
                                title={
                                  ship.memo
                                    ? decodeHtmlEntities(ship.memo)
                                    : 'Мемо пусто'
                                }
                                style={{
                                  display: 'inline-flex',
                                  alignItems: 'center',
                                  justifyContent: 'center',
                                  height: 22,
                                  lineHeight: '22px',
                                  padding: '0 8px',
                                  minWidth: 110,
                                  borderRadius: 6,
                                  background: 'rgba(255,255,255,0.06)',
                                  border: '1px solid rgba(255,255,255,0.12)',
                                  fontSize: 12,
                                  color: '#ccc',
                                  textAlign: 'center',
                                  whiteSpace: 'nowrap',
                                  cursor: 'help',
                                }}
                              >
                                Мемо Капитана
                              </div>
                            </Flex.Item>

                            <Flex.Item>
                              <Button
                                content={
                                  ship.joinMode === applyStates.apply
                                    ? 'Подать заявку'
                                    : 'Вступить в команду'
                                }
                                color={
                                  ship.joinMode === applyStates.apply
                                    ? 'average'
                                    : 'good'
                                }
                                fluid={false}
                                onClick={() => {
                                  setSelectedShipRef(ship.ref);
                                  setCurrentTab(2);
                                  const newTab = {
                                    name: 'Job Select',
                                    tab: 2,
                                  };
                                  if (
                                    !shownTabs.some(
                                      (tab) =>
                                        tab.name === newTab.name &&
                                        tab.tab === newTab.tab
                                    )
                                  ) {
                                    setShownTabs((tabs) => {
                                      const t = [...tabs];
                                      t.splice(1, 0, newTab);
                                      return t;
                                    });
                                  }
                                }}
                              />
                            </Flex.Item>
                          </Flex>
                        </Flex.Item>
                      </Flex>
                    </Box>
                  </Box>
                );
              })}
            </Flex>
          </Section>
        )}
        {currentTab === 3 && !data.selectedFaction && (
          <Section
            title="Ship Purchase"
            buttons={
              <Button
                icon="question"
                tooltip={
                  <>
                    Цветные линии показывают отношения между фракциями:
                    <br />
                    <br />
                    <div style={{ color: '#38A169' }}>Зелёный — Союз</div>
                    <div style={{ color: '#60A5FA' }}>
                      Синий — Положительные
                    </div>
                    <div style={{ color: '#9CA3AF' }}>Серый — Нейтральные</div>
                    <div style={{ color: '#F59E0B' }}>
                      Оранжевый — Отрицательные
                    </div>
                    <div style={{ color: '#EF4444' }}>Красный — Война</div>
                  </>
                }
              />
            }
          >
            <FactionButtons />
          </Section>
        )}
        {currentTab === 3 && data.selectedFaction && (
          <Section
            title={`Ship Purchase - ${data.selectedFaction}`}
            buttons={
              <Button content="Back" onClick={() => act('back_factions')} />
            }
          >
            <ShipBrowser />
          </Section>
        )}
        {currentTab === 2 && selectedShip && (
          <>
            <Section
              title={`Ship Details - ${decodeHtmlEntities(
                selectedShip?.name || 'Unknown Ship'
              )}`}
            >
              <LabeledList>
                <LabeledList.Item label="Ship Class">
                  {selectedShip?.class || 'Unknown Class'}
                </LabeledList.Item>
                <LabeledList.Item label="Ship Faction">
                  {selectedShip?.faction || 'Unknown Faction'}
                </LabeledList.Item>
                <LabeledList.Item label="Ship Join Status">
                  {selectedShip?.joinMode || 'Unknown'}
                </LabeledList.Item>
                <LabeledList.Item label="Ship Memo">
                  {decodeHtmlEntities(selectedShip?.memo) || 'No Memo'}
                </LabeledList.Item>
              </LabeledList>
            </Section>
            <Collapsible title={'Ship Info'}>
              <LabeledList>
                <LabeledList.Item label="Ship Description">
                  {selectedShip?.desc || 'No Description'}
                </LabeledList.Item>
                <LabeledList.Item label="Ship Tags">
                  {(selectedShip?.tags && selectedShip.tags.join(', ')) ||
                    'No Tags Set'}
                </LabeledList.Item>
              </LabeledList>
            </Collapsible>
            <Section
              title="Job Selection"
              buttons={
                <>
                  <Button
                    icon="question"
                    tooltip={
                      'Выберите должность на корабле. Если корабль требует заявку - сначала подайте заявку на конкретную профессию. После одобрения вы сможете присоединиться к экипажу на эту роль.'
                    }
                  />
                  <Button
                    content="Back"
                    disabled={loading}
                    onClick={() => {
                      if (!loading) {
                        setCurrentTab(1);
                      }
                    }}
                  />
                </>
              }
            >
              <Flex direction="column" gap={1}>
                {selectedShip?.jobs?.map((job) => {
                  const jobApplicationStatus =
                    data.jobApplicationStatuses?.[selectedShip?.ref]?.[
                      job.ref
                    ] || 'none';
                  const isApproved = jobApplicationStatus === 'approved';
                  const isPending = jobApplicationStatus === 'pending';
                  const isDenied = jobApplicationStatus === 'denied';

                  let buttonContent = 'Apply';
                  let buttonColor = 'average';
                  let isDisabled = false;
                  let showCancelButton = false;

                  if (selectedShip?.joinMode === 'Open') {
                    buttonContent = 'Select';
                    buttonColor = 'good';
                  } else if (isApproved) {
                    buttonContent = 'Select';
                    buttonColor = 'good';
                  } else if (isPending) {
                    buttonContent = 'Pending...';
                    buttonColor = 'average';
                    isDisabled = true;
                    showCancelButton = true;
                  } else if (isDenied) {
                    buttonContent = 'Apply Again';
                    buttonColor = 'bad';
                  }

                  const hasPlaytime =
                    data.autoMeet || data.playMin >= job.minTime;
                  const notOfficerBanned = !data.officerBanned || !job.officer;
                  const canInteract =
                    hasPlaytime && notOfficerBanned && !isJoining;

                  return (
                    <Box
                      key={job.name}
                      style={{
                        background: '#2a2a2a',
                        border: '1px solid #444',
                        borderRadius: '8px',
                        padding: '12px',
                        marginBottom: '8px',
                      }}
                    >
                      <Box
                        style={{
                          borderTop: '1px solid #444',
                          borderBottom: '1px solid #444',
                          padding: '8px 0',
                          marginBottom: '8px',
                        }}
                      >
                        <Flex align="center" justify="space-between" wrap>
                          {/* Левая часть: название + бейджи */}
                          <Flex.Item>
                            <Flex align="center" gap={1}>
                              <Box
                                mr={1}
                                bold
                                title={job.name}
                                style={{
                                  fontSize: '16px',
                                  color: job.officer ? '#FFD700' : '#fff',
                                  cursor: 'default',
                                }}
                              >
                                {job.name}
                              </Box>

                              {/* Бейдж офицера */}
                              {job.officer && (
                                <Box
                                  className="chip"
                                  title="Офицерская должность"
                                  style={{
                                    display: 'inline-flex',
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    height: 22,
                                    lineHeight: '22px',
                                    padding: '0 8px',
                                    minWidth: 70,
                                    borderRadius: 6,
                                    fontSize: 12,
                                    background: 'rgba(255,215,0,0.15)',
                                    border: '1px solid rgba(255,215,0,0.3)',
                                    marginRight: '4px',
                                    color: '#FFD700',
                                    textAlign: 'center',
                                    whiteSpace: 'nowrap',
                                  }}
                                >
                                  ⭐ Officer
                                </Box>
                              )}

                              {/* Бейдж слотов */}
                              <Box
                                className="chip"
                                title="Доступные слоты"
                                style={{
                                  display: 'inline-flex',
                                  alignItems: 'center',
                                  justifyContent: 'center',
                                  height: 22,
                                  lineHeight: '22px',
                                  padding: '0 8px',
                                  minWidth: 60,
                                  borderRadius: 6,
                                  fontSize: 12,
                                  background: 'rgba(255,255,255,0.06)',
                                  border: '1px solid rgba(255,255,255,0.12)',
                                  marginRight: '4px',
                                  color: '#fff',
                                  textAlign: 'center',
                                  whiteSpace: 'nowrap',
                                }}
                              >
                                📋 {job.slots}
                              </Box>

                              {/* Бейдж времени */}
                              <Box
                                className="chip"
                                title="Минимальное время игры"
                                style={{
                                  display: 'inline-flex',
                                  alignItems: 'center',
                                  justifyContent: 'center',
                                  height: 22,
                                  lineHeight: '22px',
                                  padding: '0 8px',
                                  minWidth: 80,
                                  borderRadius: 6,
                                  fontSize: 12,
                                  background: hasPlaytime
                                    ? 'rgba(46,204,113,0.15)'
                                    : 'rgba(231,76,60,0.15)',
                                  border: hasPlaytime
                                    ? '1px solid rgba(46,204,113,0.3)'
                                    : '1px solid rgba(231,76,60,0.3)',
                                  marginRight: '4px',
                                  color: hasPlaytime ? '#2ECC71' : '#E74C3C',
                                  textAlign: 'center',
                                  whiteSpace: 'nowrap',
                                }}
                              >
                                ⏱️{' '}
                                {formatShipTime(
                                  job.minTime,
                                  data.playMin,
                                  data.autoMeet
                                )}
                              </Box>

                              {/* Бейдж статуса заявки */}
                              {selectedShip?.joinMode === 'apply' && (
                                <Box
                                  className="chip"
                                  title="Статус заявки"
                                  style={{
                                    display: 'inline-flex',
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    height: 22,
                                    lineHeight: '22px',
                                    padding: '0 8px',
                                    minWidth: 80,
                                    borderRadius: 6,
                                    fontSize: 12,
                                    background: isPending
                                      ? 'rgba(241,196,15,0.15)'
                                      : isApproved
                                      ? 'rgba(46,204,113,0.15)'
                                      : isDenied
                                      ? 'rgba(231,76,60,0.15)'
                                      : 'rgba(255,255,255,0.06)',
                                    border: isPending
                                      ? '1px solid rgba(241,196,15,0.3)'
                                      : isApproved
                                      ? '1px solid rgba(46,204,113,0.3)'
                                      : isDenied
                                      ? '1px solid rgba(231,76,60,0.3)'
                                      : '1px solid rgba(255,255,255,0.12)',
                                    marginRight: '4px',
                                    color: isPending
                                      ? '#F1C40F'
                                      : isApproved
                                      ? '#2ECC71'
                                      : isDenied
                                      ? '#E74C3C'
                                      : '#fff',
                                    textAlign: 'center',
                                    whiteSpace: 'nowrap',
                                  }}
                                >
                                  {isPending && '⏳ Pending'}
                                  {isApproved && '✅ Approved'}
                                  {isDenied && '❌ Denied'}
                                  {!isPending &&
                                    !isApproved &&
                                    !isDenied &&
                                    '📝 Not Applied'}
                                </Box>
                              )}
                            </Flex>

                            {/* Причина отказа */}
                            {isDenied &&
                              (() => {
                                const denialReason =
                                  data.jobApplicationStatuses?.[
                                    selectedShip?.ref
                                  ]?.[job.ref + '_denial_reason'];
                                return denialReason ? (
                                  <Box
                                    style={{
                                      marginTop: '8px',
                                      padding: '8px',
                                      background: 'rgba(231,76,60,0.1)',
                                      border: '1px solid rgba(231,76,60,0.3)',
                                      borderRadius: '4px',
                                      fontSize: '12px',
                                      color: '#E74C3C',
                                    }}
                                  >
                                    <strong>Причина отказа:</strong>{' '}
                                    {denialReason}
                                  </Box>
                                ) : null;
                              })()}
                          </Flex.Item>

                          {/* Правая часть: кнопки */}
                          <Flex.Item>
                            <Flex gap={1}>
                              {/* Основная кнопка */}
                              <Flex.Item>
                                <Button
                                  content={buttonContent}
                                  color={buttonColor}
                                  fluid={false}
                                  disabled={!canInteract || isDisabled}
                                  tooltip={
                                    !hasPlaytime
                                      ? 'У вас недостаточно времени игры для этой должности'
                                      : !notOfficerBanned
                                      ? 'Вы забанены от офицерских ролей'
                                      : isDisabled
                                      ? 'Заявка на рассмотрении'
                                      : selectedShip?.joinMode === 'Apply' &&
                                        !isApproved
                                      ? 'Подать заявку на эту должность'
                                      : 'Присоединиться к экипажу на эту должность'
                                  }
                                  onClick={() => {
                                    if (
                                      !canInteract ||
                                      isDisabled ||
                                      isJoining
                                    ) {
                                      return;
                                    }
                                    setIsJoining(true);

                                    const nonce = `join:${selectedShip?.ref}:${
                                      job.ref
                                    }:${Date.now().toString(36)}`;

                                    // Отправляем правильное действие в зависимости от режима корабля и статуса заявки
                                    if (selectedShip?.joinMode === 'Open') {
                                      // Для открытых кораблей - всегда join
                                      act('join', {
                                        ship: selectedShip?.ref,
                                        job: job.ref,
                                        nonce: nonce,
                                      });
                                    } else if (
                                      selectedShip?.joinMode === 'Apply'
                                    ) {
                                      if (isApproved) {
                                        // Заявка одобрена - можно присоединиться
                                        act('join', {
                                          ship: selectedShip?.ref,
                                          job: job.ref,
                                          nonce: nonce,
                                        });
                                      } else if (!isPending && !isDenied) {
                                        // Нет заявки - подаем заявку
                                        act('apply_for_job', {
                                          ship: selectedShip?.ref,
                                          job: job.ref,
                                          nonce: nonce,
                                        });
                                      }
                                      // Если pending или denied - кнопка заблокирована
                                    }

                                    setTimeout(() => setIsJoining(false), 3000);
                                  }}
                                />
                              </Flex.Item>

                              {showCancelButton && (
                                <Flex.Item>
                                  <Button
                                    content="Отменить"
                                    color="bad"
                                    icon="times"
                                    fluid={false}
                                    disabled={isJoining}
                                    tooltip="Отменить заявку на эту должность"
                                    onClick={() => {
                                      if (isJoining) return;
                                      setIsJoining(true);

                                      const nonce = `cancel:${
                                        selectedShip?.ref
                                      }:${job.ref}:${Date.now().toString(36)}`;

                                      act('cancel_job_application', {
                                        ship: selectedShip?.ref,
                                        job: job.ref,
                                        nonce: nonce,
                                      });

                                      setTimeout(
                                        () => setIsJoining(false),
                                        3000
                                      );
                                    }}
                                  />
                                </Flex.Item>
                              )}
                            </Flex>
                          </Flex.Item>
                        </Flex>
                      </Box>
                    </Box>
                  );
                })}
              </Flex>
            </Section>
          </>
        )}
      </Window.Content>
    </Window>
  );
};

const formatShipTime = (minTime, playMin, autoMeet) => {
  return (
    (minTime <= 0 && '-') ||
    minTime + 'm ' + ((!autoMeet && playMin < minTime && '(Unmet)') || '(Met)')
  );
};

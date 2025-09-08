import { Box, Button, Section, Stack } from '../components';
import { useBackend } from '../backend';
import './FactionInfo.scss';
import { FactionInfoErrorBoundary } from './FactionInfoErrorBoundary';

interface OutfitPreview {
  label: string;
  image: string;
}

interface FactionData {
  name: string;
  description: string;
  wiki_url: string;
  outfit_previews: OutfitPreview[];
}

interface FactionInfoProps {
  // eslint-disable-next-line react/no-unused-prop-types
  selectedFaction?: string | null;
  // eslint-disable-next-line react/no-unused-prop-types
  factionInfo?: Record<string, FactionData>;
  // eslint-disable-next-line react/no-unused-prop-types
  factionPreviews?: Record<string, any[]>;
  // eslint-disable-next-line react/no-unused-prop-types
  showOnlyLeft?: boolean;
  // eslint-disable-next-line react/no-unused-prop-types
  showOnlyRight?: boolean;
}

export const FactionInfo = (props: FactionInfoProps, context) => {
  // Защита от undefined props
  const {
    selectedFaction,
    factionInfo = {},
    factionPreviews: localFactionPreviews = {},
    showOnlyLeft,
    showOnlyRight,
  } = props || {};

  // Убираем глобальный слушатель ошибок - он ломает штатную обработку TGUI в IE

  // Включаем превью обратно
  const DISABLE_PREVIEWS = false;

  const CELL = 180; // возвращаем оригинальный размер

  // Получаем act для отправки действий на сервер
  const { act, data: backendData } = useBackend(context);

  // Валидация входящих данных перед рендером
  const validatePreviews = (raw: any[]): any[] => {
    if (!Array.isArray(raw)) return [];
    return raw.filter((p) => p && (p.image || p.asset)).slice(0, 4); // ограничение по количеству
  };

  let data: any = backendData;

  // Если нет выбранной фракции, показываем пустые блоки
  if (!selectedFaction || !factionInfo[selectedFaction]) {
    if (showOnlyLeft) {
      return (
        <FactionInfoErrorBoundary>
          <Section
            className="faction-info-left"
            title="Информация о фракции"
            fill
            style={{ height: '100%' }}
          >
            <Stack vertical fill>
              <Stack.Item>
                <Box
                  className="faction-description"
                  style={{
                    textAlign: 'center',
                    color: 'rgba(255, 255, 255, 0.5)',
                  }}
                >
                  Наведите на фракцию для получения информации
                </Box>
              </Stack.Item>
            </Stack>
          </Section>
        </FactionInfoErrorBoundary>
      );
    }
    if (showOnlyRight) {
      return (
        <FactionInfoErrorBoundary>
          <Section
            className="faction-info-right"
            title="Экипировка"
            fill
            style={{ height: '100%' }}
          >
            <Stack vertical fill>
              <Stack.Item>
                <Box
                  style={{
                    textAlign: 'center',
                    color: 'rgba(255, 255, 255, 0.5)',
                  }}
                >
                  Наведите на фракцию для просмотра экипировки
                </Box>
              </Stack.Item>
            </Stack>
          </Section>
        </FactionInfoErrorBoundary>
      );
    }
    return null;
  }

  // Защита от ошибок при получении данных фракции
  let faction: any = null;
  try {
    faction = factionInfo?.[selectedFaction];
    if (!faction) {
      // Фракция не найдена
      faction = {
        name: 'Unknown Faction',
        description: 'Информация о фракции недоступна',
        wiki_url: null,
        outfit_previews: [],
      };
    }
  } catch (error) {
    // Ошибка данных фракции
    faction = {
      name: 'Error',
      description: 'Ошибка загрузки данных фракции',
      wiki_url: null,
      outfit_previews: [],
    };
  }

  // Защита от ошибок при получении превью с валидацией
  let factionPreviews: any[] = [];
  if (!DISABLE_PREVIEWS) {
    try {
      const raw =
        localFactionPreviews?.[selectedFaction] ||
        (data?.faction_preview?.faction?.toLowerCase() ===
        selectedFaction?.toLowerCase()
          ? data?.faction_preview?.previews
          : null) ||
        faction?.outfit_previews ||
        [];

      factionPreviews = validatePreviews(raw);
    } catch (error) {
      // Ошибка превью фракции
      factionPreviews = [];
    }
  }

  // Показываем только левый блок
  if (showOnlyLeft) {
    return (
      <Section
        className="faction-info-left"
        title={faction.name}
        fill
        style={{ height: '100%' }}
      >
        <Stack vertical fill>
          <Stack.Item>
            <Box className="faction-description">{faction.description}</Box>
          </Stack.Item>
          <Stack.Item>
            <Button
              icon="external-link-alt"
              content="Википедия"
              color="blue"
              onClick={() => {
                try {
                  if (faction?.wiki_url) {
                    // Отправляем действие на сервер для открытия ссылки
                    act('open_wiki', { url: faction.wiki_url });
                  }
                } catch (error) {
                  // Ошибка wiki ссылки
                }
              }}
            />
          </Stack.Item>
        </Stack>
      </Section>
    );
  }

  // Показываем только правый блок
  if (showOnlyRight) {
    return (
      <Section
        className="faction-info-right EquipmentPane"
        title="Экипировка"
        fill
        style={{ height: '100%' }}
      >
        <Stack vertical fill>
          {!factionPreviews?.length ? (
            <Stack.Item>
              <Box
                style={{
                  textAlign: 'center',
                  color: 'rgba(255, 255, 255, 0.5)',
                }}
              >
                Нет превью
              </Box>
            </Stack.Item>
          ) : (
            factionPreviews?.map((outfit, index) => (
              <Stack.Item key={index}>
                <Box className="equip-card">
                  <Box className="outfit-name">{outfit.label}</Box>
                  <Box className="preview-frame">
                    <Box
                      className="sprite-grid"
                      style={{ ['--cell' as any]: `${CELL}px` }}
                    >
                      {outfit?.image ? (
                        <img
                          src={outfit.image}
                          alt={outfit.label || 'Preview'}
                          className="sprite-img"
                          style={{
                            width: `${CELL}px`,
                            height: `${CELL}px`,
                            imageRendering: 'pixelated',
                          }}
                          onError={(e) => {
                            e.currentTarget.style.display = 'none';
                          }}
                        />
                      ) : (
                        <Box
                          style={{
                            width: `${CELL}px`,
                            height: `${CELL}px`,
                            backgroundColor: 'rgba(255, 0, 0, 0.3)',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            color: 'white',
                            fontSize: '12px',
                          }}
                        >
                          No Image
                        </Box>
                      )}
                    </Box>
                  </Box>
                </Box>
              </Stack.Item>
            ))
          )}
        </Stack>
      </Section>
    );
  }

  // Показываем оба блока (если не указаны флаги)
  return (
    <Stack fill>
      {/* Левый блок - Информация о фракции */}
      <Stack.Item grow={1}>
        <Section className="faction-info-left" title={faction.name} fill>
          <Stack vertical fill>
            <Stack.Item>
              <Box className="faction-description">{faction.description}</Box>
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="external-link-alt"
                content="Википедия"
                color="blue"
                onClick={() => {
                  try {
                    if (faction?.wiki_url) {
                      act('open_wiki', { url: faction.wiki_url });
                    }
                  } catch (error) {
                    // Ошибка wiki ссылки
                  }
                }}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>

      {/* Правый блок - Превью экипировки */}
      <Stack.Item grow={1}>
        <Section
          className="faction-info-right EquipmentPane"
          title="Экипировка"
          fill
        >
          <Stack vertical fill>
            {!factionPreviews?.length ? (
              <Stack.Item>
                <Box
                  style={{
                    textAlign: 'center',
                    color: 'rgba(255, 255, 255, 0.5)',
                  }}
                >
                  Нет превью
                </Box>
              </Stack.Item>
            ) : (
              factionPreviews?.map((outfit, index) => (
                <Stack.Item key={index}>
                  <Box className="equip-card">
                    <Box className="outfit-name">{outfit.label}</Box>
                    <Box className="preview-frame">
                      <Box
                        className="sprite-grid"
                        style={{ ['--cell' as any]: `${CELL}px` }}
                      >
                        {outfit?.image ? (
                          <img
                            src={outfit.image}
                            alt={outfit.label || 'Preview'}
                            className="sprite-img"
                            style={{
                              width: `${CELL}px`,
                              height: `${CELL}px`,
                              imageRendering: 'pixelated',
                            }}
                            onError={(e) => {
                              e.currentTarget.style.display = 'none';
                            }}
                          />
                        ) : (
                          <Box
                            style={{
                              width: `${CELL}px`,
                              height: `${CELL}px`,
                              backgroundColor: 'rgba(255, 0, 0, 0.3)',
                              display: 'flex',
                              alignItems: 'center',
                              justifyContent: 'center',
                              color: 'white',
                              fontSize: '12px',
                            }}
                          >
                            No Image
                          </Box>
                        )}
                      </Box>
                    </Box>
                  </Box>
                </Stack.Item>
              ))
            )}
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

export default FactionInfo;

import { useBackend, useLocalState } from '../backend';
import {
  Box,
  Button,
  Flex,
  Section,
  Collapsible,
  LabeledList,
  Icon,
  Input,
} from '../components';
import { Window } from '../layouts';
import { getFactionColor } from './FactionButtons';
import { createSearch } from 'common/string';

export const ShipBrowser = (props, context) => {
  const { act, data } = useBackend(context);
  const [selectedTags, setSelectedTags] = useLocalState(context, 'sb_tags', []);
  const [sortBy, setSortBy] = useLocalState(context, 'sb_sort', 'alphabet');
  const [searchQuery, setSearchQuery] = useLocalState(context, 'sb_search', '');

  const faction = String(data.selectedFaction || '');
  const templates = Array.isArray(data.templates) ? data.templates : [];

  // Фильтруем корабли по выбранной фракции
  let filtered = templates.filter((t) => {
    if (!faction) return true;

    // Получаем фракцию корабля
    const tf = (t && t.faction && (t.faction.name || t.faction)) || '';
    const tfString = String(tf).toLowerCase();
    const factionString = String(faction).toLowerCase();

    // Ищем InteQ корабли
    if (factionString === 'inteq') {
      return (
        tfString.includes('inteq') ||
        tfString.includes('inteq risk management group') ||
        tfString.includes('inteq risk')
      );
    }

    // Ищем Elysium корабли
    if (factionString === 'elysium') {
      return tfString.includes('elysium');
    }

    // Ищем Pirates корабли
    if (factionString === 'pirates') {
      return tfString.includes('pirates') || tfString.includes('pirate');
    }

    // Ищем Other корабли
    if (factionString === 'other') {
      return true; // Показываем все корабли
    }

    // Для остальных фракций - точное совпадение
    return tfString === factionString;
  });

  // Собираем теги из всех кораблей текущей фракции (до применения поиска)
  const allTags = filtered
    ? Array.from(new Set(filtered.flatMap((ship) => ship.tags || [])))
    : [];

  // Фильтруем по поисковому запросу
  if (searchQuery) {
    const searchFilter = createSearch(searchQuery);
    filtered = filtered.filter((ship) => {
      const shipName = String(ship?.name || '').toLowerCase();
      const shipDesc = String(ship?.desc || '').toLowerCase();
      return searchFilter(shipName) || searchFilter(shipDesc);
    });
  }

  // Фильтруем по выбранным тегам
  if (selectedTags.length) {
    filtered = filtered.filter((ship) => {
      return selectedTags.every((tag) => ship.tags && ship.tags.includes(tag));
    });
  }

  // Сортируем корабли
  const sorted = [...filtered];
  if (sortBy === 'alphabet') {
    sorted.sort((a, b) => (a?.name || '').localeCompare(b?.name || ''));
  } else if (sortBy === 'crew') {
    sorted.sort(
      (a, b) => (Number(b?.crewCount) || 0) - (Number(a?.crewCount) || 0)
    );
  }

  const toggleTag = (tag) => {
    setSelectedTags((prev) =>
      prev.includes(tag) ? prev.filter((t) => t !== tag) : [...prev, tag]
    );
  };

  const clearAllTags = () => {
    setSelectedTags([]);
  };

  const clearSearch = () => {
    setSearchQuery('');
  };

  // Функция для определения темы окна по фракции
  const getWindowTheme = (factionName) => {
    switch (factionName) {
      case 'nanotrasen':
        return 'nt';
      case 'syndicate':
        return 'syndicate';
      case 'inteq':
        return 'inteq';
      case 'solfed':
        return 'solfed';
      case 'independent':
        return 'independent';
      case 'elysium':
        return 'elysium';
      case 'pirates':
        return 'pirates';
      default:
        return undefined; // Для other - стандартная тема
    }
  };

  return (
    <Window
      title={String(faction || 'Ships')}
      width={860}
      height={faction === 'syndicate' ? 800 : 640}
      theme={getWindowTheme(faction)}
    >
      <Window.Content scrollable>
        <Section>
          {/* Кнопка возврата к выбору фракций */}
          <Box mb={2}>
            <Button icon="arrow-left" onClick={() => act('back_factions')}>
              Назад к фракциям
            </Button>
          </Box>

          {/* Фильтр по тегам */}
          <Box mb={1} bold>
            Фильтр по тегам: ({allTags.length} доступно)
          </Box>
          {allTags.length === 0 ? (
            <Box color="gray" mb={2}>
              Теги не найдены. Проверьте конфигурацию кораблей.
            </Box>
          ) : (
            <Flex wrap="wrap" mb={2}>
              {allTags.map((tag) => (
                <Flex.Item key={tag} mr={1} mb={1}>
                  <Button
                    onClick={() => toggleTag(tag)}
                    color={selectedTags.includes(tag) ? 'good' : 'default'}
                  >
                    {tag}
                  </Button>
                </Flex.Item>
              ))}
              {selectedTags.length > 0 && (
                <Flex.Item mr={1} mb={1}>
                  <Button onClick={clearAllTags} color="red">
                    Очистить все
                  </Button>
                </Flex.Item>
              )}
            </Flex>
          )}

          {/* Настройки сортировки */}
          <Box mb={1} bold>
            Сортировка:
          </Box>
          <Box mb={2}>
            <Flex align="center">
              <Flex.Item>
                <Button
                  selected={sortBy === 'alphabet'}
                  mr={1}
                  onClick={() => setSortBy('alphabet')}
                >
                  По алфавиту
                </Button>
                <Button
                  selected={sortBy === 'crew'}
                  onClick={() => setSortBy('crew')}
                >
                  По количеству экипажа
                </Button>
              </Flex.Item>
              <Flex.Item grow={1} ml={2} position="relative">
                <Input
                  placeholder="Поиск по названию корабля..."
                  value={searchQuery}
                  onInput={(e, value) => setSearchQuery(value)}
                  style={{ width: '100%' }}
                  type="text"
                />
              </Flex.Item>
            </Flex>
          </Box>

          {/* Список кораблей */}
          {sorted.length === 0 ? (
            <Box color="gray" textAlign="center" p={3}>
              {searchQuery
                ? `Корабли не найдены по запросу "${searchQuery}"`
                : 'Корабли не найдены для выбранной фракции'}
            </Box>
          ) : (
            <Section title={`Доступные к покупке (${sorted.length})`}>
              {sorted.map((t, idx) => (
                <Collapsible
                  key={`${t?.name || 'ship'}-${idx}`}
                  title={t?.name || 'Unknown Ship'}
                  color={
                    (!data.shipSpawnAllowed && 'average') ||
                    (Number(t?.curNum) >= Number(t?.limit) &&
                      Number(t?.limit) > 0 &&
                      'grey') ||
                    'default'
                  }
                  buttons={
                    <Button
                      content="Buy"
                      tooltip={
                        (!data.shipSpawnAllowed &&
                          'Больше кораблей не может быть создано в это время.') ||
                        (Number(t?.curNum) >= Number(t?.limit) &&
                          Number(t?.limit) > 0 &&
                          'Слишком много кораблей этого типа.') ||
                        (data.shipSpawning &&
                          'Корабль в процессе создания. Пожалуйста, подождите.')
                      }
                      disabled={
                        !data.shipSpawnAllowed ||
                        data.shipSpawning ||
                        (Number(t?.curNum) >= Number(t?.limit) &&
                          Number(t?.limit) > 0)
                      }
                      onClick={() => act('buy', { name: t?.name })}
                    />
                  }
                >
                  <LabeledList>
                    <LabeledList.Item label="Описание">
                      {t?.desc || 'Нет описания'}
                    </LabeledList.Item>
                    <LabeledList.Item label="Фракция">
                      <Box
                        style={{
                          background: getFactionColor(t?.faction).bg,
                          color: getFactionColor(t?.faction).text,
                          padding: '2px 8px',
                          borderRadius: '3px',
                          fontSize: '11px',
                          display: 'inline-block',
                          fontWeight: 'bold',
                        }}
                      >
                        {t?.faction || 'Неизвестно'}
                      </Box>
                    </LabeledList.Item>
                    <LabeledList.Item label="Теги">
                      {t?.tags && t.tags.length > 0 ? (
                        <Flex wrap="wrap">
                          {t.tags.map((tag) => (
                            <Flex.Item key={tag} mr={1} mb={1}>
                              <Box
                                style={{
                                  background: '#444',
                                  color: 'white',
                                  padding: '2px 6px',
                                  borderRadius: '3px',
                                  fontSize: '11px',
                                }}
                              >
                                {tag}
                              </Box>
                            </Flex.Item>
                          ))}
                        </Flex>
                      ) : (
                        'Нет тегов'
                      )}
                    </LabeledList.Item>
                    <LabeledList.Item label="Информация об экипаже">
                      <Flex align="center" wrap>
                        <Flex.Item mr={2}>
                          <Icon name="users" mr={1} />
                          <span style={{ color: '#c1c1c1' }}>Экипаж: </span>
                          <span style={{ marginLeft: '4px' }}>
                            {Number(t?.crewCount) || 0}
                          </span>
                        </Flex.Item>
                        <Flex.Item mr={2}>
                          <Icon name="chart-bar" mr={1} />
                          <span style={{ color: '#c1c1c1' }}>Лимит: </span>
                          <span style={{ marginLeft: '4px' }}>
                            {Number(t?.limit) || 'Нет'}
                          </span>
                        </Flex.Item>
                        <Flex.Item>
                          <Icon name="rocket" mr={1} />
                          <span style={{ color: '#c1c1c1' }}>Сейчас: </span>
                          <span style={{ marginLeft: '4px' }}>
                            {Number(t?.curNum) || 0}
                          </span>
                        </Flex.Item>
                      </Flex>
                    </LabeledList.Item>
                    <LabeledList.Item label="Ссылка на карту">
                      <a
                        href={
                          'https://map.celadon.pro/Shiptest/' +
                          (t?.shortName || t?.name)
                        }
                        target="_blank"
                        rel="noreferrer"
                      >
                        [Детальная карта корабля]
                      </a>
                    </LabeledList.Item>
                    <LabeledList.Item>
                      <Collapsible title={'Карта корабля'} key={'Map'}>
                        <img
                          src={
                            'https://map.celadon.pro/Shiptest/Shuttles/' +
                            (t?.shortName || t?.name) +
                            '.png'
                          }
                          alt={
                            '[Данные о карте не были получены. Обратитесь к Хосту (Voiko).]'
                          }
                          style={{
                            width: t?.width || '600px',
                            height: t?.height || 'auto',
                          }}
                        />
                      </Collapsible>
                    </LabeledList.Item>
                  </LabeledList>
                </Collapsible>
              ))}
            </Section>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};

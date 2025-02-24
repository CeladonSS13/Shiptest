import {
  Button,
  Table,
  Section,
  LabeledList,
  Collapsible,
  Input,
} from '../../components';
import { applyStates } from './types';
import { decodeHtmlEntities, createSearch } from '../../../common/string';
import { logger } from '../../logging';

const formatShipTime = (minTime, playMin, autoMeet) => {
  return (
    (minTime <= 0 && '-') ||
    minTime + 'm ' + ((!autoMeet && playMin < minTime && '(Unmet)') || '(Met)')
  );
};

/**
 * Поиск по тэгам в корабле
 * @param searchText - текст который ищем
 * @param tags - список тэгов по которым ищем
 * @returns true или false
 */
export const searchWithTags = (searchText, tags) => {
  const preparedSearchText = searchText.toLowerCase().trim();
  let isFound = createSearch(preparedSearchText, (ship) => ship.name);

  if (tags && tags.length !== 0) {
    const filteredTags = tags.filter((str) => str.toLowerCase().includes(preparedSearchText));
    isFound = filteredTags.length !== 0;
  }

  return isFound;
};

// Вкладка выбора уже активированного корабля
export const ActiveShipTab = (props) => {
  const{ purchaseBanned, shipSpawnAllowed, shipSpawning, ships, shownTabs, setSelectedShip, setCurrentTab, setShownTabs } = props;

  return (
  <Section
    title="Active Ship Selection"
    buttons={
      <>
        <Button
          content="Purchase Ship"
          tooltip={
            /* worth noting that disabled ship spawn doesn't cause the
          button to be disabled, as we want to let people look around */
            (purchaseBanned &&
              'You are banned from purchasing ships.') ||
            (!shipSpawnAllowed &&
              'No more ships may be spawned at this time.') ||
            (shipSpawning &&
              'A ship is currently spawning. Please wait.')
          }
          disabled={purchaseBanned}
          onClick={() => {
            setCurrentTab(3);
          }}
        />
        <Button
          content="?"
          tooltip={"Hover over a ship's name to see its faction."}
        />
      </>
    }
  >
    <Table>
      <Table.Row header>
        <Table.Cell collapsing>Join</Table.Cell>
        <Table.Cell>Ship Name</Table.Cell>
        <Table.Cell>Ship Class</Table.Cell>
      </Table.Row>
      {Object.values(ships).map((ship) => {
        const decodedShipName = decodeHtmlEntities(ship.name);
        return (
          <ActiveShipRow
            key={decodedShipName}
            decodedShipName={decodedShipName}
            ship={ship}
            shownTabs={shownTabs}
            setSelectedShip={setSelectedShip}
            setCurrentTab={setCurrentTab}
            setShownTabs={setShownTabs}
            />
        );
      })}
    </Table>
  </Section>
  );
};


// Строка с активированным кораблем
export const ActiveShipRow = (props) => {
  const { decodedShipName, ship, shownTabs, setSelectedShip, setCurrentTab, setShownTabs } = props;

  return(
  <Table.Row key={decodedShipName}>
      <Table.Cell>
        <Button
          content={
            ship.joinMode === applyStates.apply ? 'Apply' : 'Join'
          }
          color={
            ship.joinMode === applyStates.apply
              ? 'average'
              : 'good'
          }
          onClick={() => {
            setSelectedShip(ship);
            setCurrentTab(2);
            const newTab = {
              name: 'Job Select',
              tab: 2,
            };
            // check if the tab already exists
            const tabExists = shownTabs.some(
              (tab) =>
                tab.name === newTab.name && tab.tab === newTab.tab
            );
            if (tabExists) {
              return;
            }
            setShownTabs((tabs) => {
              logger.log(tabs);
              const newTabs = [...tabs];
              newTabs.splice(1, 0, newTab);
              return newTabs;
            });
          }}
        />
      </Table.Cell>
      <Table.Cell title={ship.faction}>{decodedShipName}</Table.Cell>
    <Table.Cell>{ship.class}</Table.Cell>
  </Table.Row>
  );
};

// Детальная инфа о корабле
export const ShipDetails = (props) => {
  const { playMin, autoMeet, selectedShip, act, setCurrentTab } = props;

  return(
    <>
      <Section
        title={`Ship Details - ${decodeHtmlEntities(selectedShip.name)}`}
      >
        <LabeledList>
          <LabeledList.Item label="Ship Class">
            {selectedShip.class}
          </LabeledList.Item>
          <LabeledList.Item label="Ship Faction">
            {selectedShip.faction}
          </LabeledList.Item>
          <LabeledList.Item label="Ship Join Status">
            {selectedShip.joinMode}
          </LabeledList.Item>
          <LabeledList.Item label="Ship Memo">
            {selectedShip.memo || 'No Memo'}
          </LabeledList.Item>
        </LabeledList>
      </Section>
      <Collapsible title={'Ship Info'}>
        <LabeledList>
          <LabeledList.Item label="Ship Description">
            {selectedShip.desc || 'No Description'}
          </LabeledList.Item>
          <LabeledList.Item label="Ship Tags">
            {(selectedShip.tags && selectedShip.tags.join(', ')) ||
              'No Tags Set'}
          </LabeledList.Item>
        </LabeledList>
      </Collapsible>
      <Section
        title="Job Selection"
        buttons={
          <Button
            content="Back"
            onClick={() => {
              setCurrentTab(1);
            }}
          />
        }
      >
        <Table>
          <Table.Row header>
            <Table.Cell collapsing>Join</Table.Cell>
            <Table.Cell>Job Name</Table.Cell>
            <Table.Cell>Slots</Table.Cell>
            <Table.Cell>Min. Playtime</Table.Cell>
          </Table.Row>
          {selectedShip.jobs.map((job) => (
            <Table.Row key={job.name}>
              <Table.Cell>
                <Button
                  content="Select"
                  tooltip={
                    !autoMeet &&
                    playMin < job.minTime &&
                    'You do not have enough playtime to play this job.'
                  }
                  disabled={!autoMeet && playMin < job.minTime}
                  onClick={() => {
                    act('join', {
                      ship: selectedShip.ref,
                      job: job.ref,
                    });
                  }}
                />
              </Table.Cell>
              <Table.Cell>{job.name}</Table.Cell>
              <Table.Cell>{job.slots}</Table.Cell>
              <Table.Cell>
                {formatShipTime(job.minTime, playMin, autoMeet)}
              </Table.Cell>
            </Table.Row>
          ))}
        </Table>
      </Section>
    </>
  );
};

// Вкладка выбора корабля для покупки
export const ShipPurchaseTab = (props) => {
  const { templates, searchText, shipSpawnAllowed, autoMeet, playMin, shipSpawning, act, setSearchText, setCurrentTab } = props;

  return(
  <Section
      title="Ship Purchase"
      buttons={
        <>
          <Input
            placeholder="Search..."
            autoFocus
            value={searchText}
            onInput={(_, value) => setSearchText(value)}
          />
          <Button
            content="Back"
            onClick={() => {
              setCurrentTab(1);
            }}
          />
        </>
      }
    >
      {templates.filter((template) => searchWithTags(searchText, template.tags)).map((template) => (
        <Collapsible
          title={template.name}
          key={template.name}
          color={
            (!shipSpawnAllowed && 'average') ||
            ((template.curNum >= template.limit ||
              (!autoMeet && playMin < template.minTime)) &&
              'grey') ||
            'default'
          }
          buttons={
            <Button
              content="Buy"
              tooltip={
                (!shipSpawnAllowed &&
                  'No more ships may be spawned at this time.') ||
                (template.curNum >= template.limit &&
                  'There are too many ships of this type.') ||
                (!autoMeet &&
                  playMin < template.minTime &&
                  'You do not have enough playtime to buy this ship.') ||
                (shipSpawning &&
                  'A ship is currently spawning. Please wait.')
              }
              disabled={
                !shipSpawnAllowed ||
                shipSpawning ||
                template.curNum >= template.limit ||
                (!autoMeet && playMin < template.minTime)
              }
              onClick={() => {
                act('buy', {
                  name: template.name,
                });
              }}
            />
          }
        >
          <LabeledList>
            <LabeledList.Item label="Description">
              {template.desc || 'No Description'}
            </LabeledList.Item>
            <LabeledList.Item label="Ship Faction">
              {template.faction}
            </LabeledList.Item>
            <LabeledList.Item label="Ship Tags">
              {(template.tags && template.tags.join(', ')) ||
                'No Tags Set'}
            </LabeledList.Item>
            <LabeledList.Item label="Std. Crew">
              {template.crewCount}
            </LabeledList.Item>
            <LabeledList.Item label="Max #">
              {template.limit}
            </LabeledList.Item>
            <LabeledList.Item label="Min. Playtime">
              {formatShipTime(
                template.minTime,
                playMin,
                autoMeet
              )}
            </LabeledList.Item>
            <LabeledList.Item label="Map Link">
              <a /* Добавляем внешнюю ссылку для детального осмотра корабля */
                href={
                  'https://map.celadon.pro/Shiptest/' +
                  template.faction +
                  '/' +
                  template.shortName
                }
                target="_blank"
                rel="noreferrer"
              >
                [Детальная карта корабля]
              </a>
            </LabeledList.Item>
            <LabeledList.Item>
              <Collapsible title={'Map'} key={'Map'}>
                <img /* Добавляем отображение корабля под спойлером */
                  src={
                    'https://map.celadon.pro/Shiptest/Shuttles/' +
                    template.shortName +
                    '.png'
                  }
                  alt={
                    '[Данные о карте не были получены. Обратитесь к Хосту (Voiko).]'
                  }
                  style={{
                    width: template.width || '600px',
                    height: template.height || 'auto',
                  }}
                />
              </Collapsible>
            </LabeledList.Item>
          </LabeledList>
        </Collapsible>
      ))}
  </Section>
  );
};

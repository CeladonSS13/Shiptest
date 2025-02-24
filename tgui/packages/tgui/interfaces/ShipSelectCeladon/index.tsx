import { useBackend } from '../../backend';
 import {
   Tabs,
} from '../../components';
import { Window } from '../../layouts';
import { Data } from './types';
import { ActiveShipTab, ShipDetails, ShipPurchaseTab } from './ShipSelectTabs';
import { useLocalState } from '../../backend';


export const ShipSelectCeladon = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const { playMin, autoMeet, purchaseBanned, shipSpawnAllowed, shipSpawning } = data;

  const ships = data.ships || {};
  const templates = data.templates || [];

  const [selectedShip, setSelectedShip] = useLocalState(
    context,
    'selectedShip',
    null
  );

  const [currentTab, setCurrentTab] = useLocalState(context, 'tab', 1);

  const [shownTabs, setShownTabs] = useLocalState(context, 'tabs', [
  { name: 'Ship Select', tab: 1 },
  { name: 'Ship Purchase', tab: 3 },
  ]);

  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');

  return (
    <Window title="Ship Select" width={800} height={600} resizable>
      <Window.Content scrollable>
        <Tabs>
          {shownTabs.map((tabbing, index) => (
            <Tabs.Tab
              key={`${index}-${tabbing.name}`}
              selected={currentTab === tabbing.tab}
              onClick={() => setCurrentTab(tabbing.tab)}
            >
              {tabbing.name}
            </Tabs.Tab>
          ))}
        </Tabs>

        {currentTab === 1 && (
          <ActiveShipTab
            purchaseBanned={purchaseBanned}
            shipSpawnAllowed={shipSpawnAllowed}
            shipSpawning={shipSpawning}
            ships={ships}
            shownTabs={shownTabs}
            setCurrentTab={setCurrentTab}
            setSelectedShip={setSelectedShip}
            setShownTabs={setShownTabs}
          />
        )}

        {currentTab === 2 && (
          <ShipDetails
            playMin={playMin}
            autoMeet={autoMeet}
            selectedShip={selectedShip}
            act={act}
            setCurrentTab={setCurrentTab}
          />
        )}

        {currentTab === 3 && (
          <ShipPurchaseTab
            templates={templates}
            searchText={searchText}
            shipSpawnAllowed={shipSpawnAllowed}
            autoMeet={autoMeet}
            playMin={playMin}
            shipSpawning={shipSpawning}
            act={act}
            setSearchText={setSearchText}
            setCurrentTab={setCurrentTab}
          />
        )}
      </Window.Content>
    </Window>
  );
};



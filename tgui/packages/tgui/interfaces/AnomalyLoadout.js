import { useBackend, useLocalState } from '../backend';
import {
  Button,
  Input,
  Section,
  // Tabs,
  // Table,
  LabeledList,
  Collapsible,
  Flex,
} from '../components';
import { Window } from '../layouts';
// import { createSearch, decodeHtmlEntities } from 'common/string';

export const AnomalyLoadout = (props, context) => {
  const { act, data } = useBackend(context);
  const [remainingPoints, setRemainingPoints] = useLocalState(context, 'remainingPoints', data.loadoutpoints);
  const [weaponoptions] = useLocalState(context, "weaponoptions", data.weaponoptions);
  const [weaponcostmult] = useLocalState(context, "weaponcostmult", data.weaponcostmult);
  const [selectedItems] = useLocalState(context, "selectedItems", data.selectedItems);
  const [armoroptions] = useLocalState(context, "armoroptions", data.armoroptions);
  const [armorcostmult] = useLocalState(context, "armorcostmult", data.armorcostmult);
  const [drip] = useLocalState(context, "drip", data.drip);
  const [dripcostmult] = useLocalState(context, "dripcostmult", data.dripcostmult);
  const [hats] = useLocalState(context, "hats", data.hats);
  const [hatcostmult] = useLocalState(context, "hatcostmult", data.hatcostmult);
  const [utility] = useLocalState(context, "utility", data.utility);
  const [utilitycostmult] = useLocalState(context, "utilitycostmult", data.utilitycostmult);
  const [engineering] = useLocalState(context, "engineering", data.engineering);
  const [engineeringcostmult] = useLocalState(context, "engineeringcostmult", data.engineeringcostmult);
  const [medical] = useLocalState(context, "medical", data.medical);
  const [medicalcostmult] = useLocalState(context, "medicalcostmult", data.medicalcostmult);

  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');
  const weaponSlop = Object.entries(weaponoptions).filter(([id, item]) => {
    const name = (item?.name ?? "").toLowerCase();
    const desc = (item?.desc ?? "").toLowerCase();
    return name.includes(searchText) || desc.includes(searchText);
  });
  const armorSlop = Object.entries(armoroptions).filter(([key, item]) => {
    const name = (item?.name ?? "").toLowerCase();
    const desc = (item?.desc ?? "").toLowerCase();
    return name.includes(searchText) || desc.includes(searchText);
  });
  const dripSlop = Object.entries(drip).filter(([key, item]) => {
    const name = (item?.name ?? "").toLowerCase();
    const desc = (item?.desc ?? "").toLowerCase();
    return name.includes(searchText) || desc.includes(searchText);
  });
  const hatsSlop = Object.entries(hats).filter(([key, item]) => {
    const name = (item?.name ?? "").toLowerCase();
    const desc = (item?.desc ?? "").toLowerCase();
    return name.includes(searchText) || desc.includes(searchText);
  });
  const utilitySlop = Object.entries(utility).filter(([key, item]) => {
    const name = (item?.name ?? "").toLowerCase();
    const desc = (item?.desc ?? "").toLowerCase();
    return name.includes(searchText) || desc.includes(searchText);
  });
  const engineeringSlop = Object.entries(engineering).filter(([key, item]) => {
    const name = (item?.name ?? "").toLowerCase();
    const desc = (item?.desc ?? "").toLowerCase();
    return name.includes(searchText) || desc.includes(searchText);
  });
  const medicalSlop = Object.entries(medical).filter(([key, item]) => {
    const name = (item?.name ?? "").toLowerCase();
    const desc = (item?.desc ?? "").toLowerCase();
    return name.includes(searchText) || desc.includes(searchText);
  });




  return(
    <Window title="Anomaly Loadout" width={800} height={600} resizable>
      <Window.Content scrollable>
      <Section title={remainingPoints + " points remaining!"} >
        <Flex>
          <Flex.Item basis="50%">
              Current Loadout
              {Object.entries(selectedItems).map(([key, item]) => (
                <Collapsible title={item.name} key={item.path}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price}
                        </LabeledList.Item>
                        <LabeledList.Item label="Refund">
                          <Button content="Refund" onClick={() => {
                            act('remove', {
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                </Collapsible>
              ))}
          </Flex.Item >
          <Flex.Item basis="50%">
            Buyable Items  <Input placeholder="Search..." autoFocus value={searchText} onInput={(_, value) => setSearchText(value.toLowerCase())} />
              {/*
                JSON.stringify(weaponSlop, null, 2)
              // WEAPONS
              */}
              <Collapsible title="Weapons">
                {weaponSlop.map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path} style={{ margin: '2px', 'margin-left': '10px' }}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price * weaponcostmult}
                        </LabeledList.Item>
                        <LabeledList.Item label="Add">
                          <Button content="Buy" onClick={() => {
                            act('add', {
                              type : "weaponoptions",
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                    </Collapsible>
                  ))
                }
              </Collapsible>
              {
              // ARMOR
              }
              <Collapsible title="Armor">
                {armorSlop.map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path} style={{ margin: '2px', 'margin-left': '10px' }}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price * armorcostmult}
                        </LabeledList.Item>
                        <LabeledList.Item label="Add">
                          <Button content="Buy" onClick={() => {
                            act('add', {
                              type : "armoroptions",
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                    </Collapsible>
                  ))
                }
              </Collapsible>
              {
              // DRIP
              }
              <Collapsible title="Shoes">
                {dripSlop.map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path} style={{ margin: '2px', 'margin-left': '10px' }}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price * dripcostmult}
                        </LabeledList.Item>
                        <LabeledList.Item label="Add">
                          <Button content="Buy" onClick={() => {
                            act('add', {
                              type : "drip",
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                    </Collapsible>
                  ))
                }
              </Collapsible>
              {
              // HATS
              }
              <Collapsible title="hats">
                {hatsSlop.map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path} style={{ margin: '2px', 'margin-left': '10px' }}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price * hatcostmult}
                        </LabeledList.Item>
                        <LabeledList.Item label="Add">
                          <Button content="Buy" onClick={() => {
                            act('add', {
                              type : "hats",
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                    </Collapsible>
                  ))
                }
              </Collapsible>
              {
              // UTILITY
              }
              <Collapsible title="utility">
                {utilitySlop.map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path} style={{ margin: '2px', 'margin-left': '10px' }}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price * utilitycostmult}
                        </LabeledList.Item>
                        <LabeledList.Item label="Add">
                          <Button content="Buy" onClick={() => {
                            act('add', {
                              type : "utility",
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                    </Collapsible>
                  ))
                }
              </Collapsible>
              {
              // ENGINEERING
              }
              <Collapsible title="engineering">
                {engineeringSlop.map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path} style={{ margin: '2px', 'margin-left': '10px' }}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price * engineeringcostmult}
                        </LabeledList.Item>
                        <LabeledList.Item label="Add">
                          <Button content="Buy" onClick={() => {
                            act('add', {
                              type : "engineering",
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                    </Collapsible>
                  ))
                }
              </Collapsible>
              {
              // MEDICAL
              }
              <Collapsible title="medical">
                {medicalSlop.map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path} style={{ margin: '2px', 'margin-left': '10px' }}>
                      <LabeledList>
                        <LabeledList.Item label="Description">
                          {item.desc}
                        </LabeledList.Item>
                        <LabeledList.Item label="Price">
                          {item.price * medicalcostmult}
                        </LabeledList.Item>
                        <LabeledList.Item label="Add">
                          <Button content="Buy" onClick={() => {
                            act('add', {
                              type : "medical",
                              item : key,
                            });
                          }}
                          />
                        </LabeledList.Item>
                      </LabeledList>
                    </Collapsible>
                  ))
                }
              </Collapsible>
          </Flex.Item>
        </Flex>
      </Section>
      <Section>
        <Button.Confirm
         content="Done!" onClick={() => {
                          act('done', {
                          });
                        }}
         />
      </Section>

      </Window.Content>
    </Window>
  );
};

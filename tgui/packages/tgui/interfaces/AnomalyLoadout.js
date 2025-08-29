import { useBackend, useLocalState } from '../backend';
import {
  Button,
  // Input,
  Section,
  // Tabs,
  //Table,
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
            Buyable Items
              {
              // WEAPONS 
              }
              <Collapsible title="Weapons">
                {Object.entries(weaponoptions).map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path}>
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
                {Object.entries(armoroptions).map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path}>
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
                {Object.entries(drip).map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path}>
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
                {Object.entries(hats).map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path}>
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
                {Object.entries(utility).map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path}>
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
                {Object.entries(engineering).map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path}>
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
                {Object.entries(medical).map(([key, item]) => (
                    <Collapsible title={item.name} key={item.path}>
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
        <Button content="Done!" onClick={() => {
                          act('done', {
                          });
                        }}
         />
      </Section>
        
      </Window.Content>
    </Window>
  );
};
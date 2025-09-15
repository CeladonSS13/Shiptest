import { createSearch } from 'common/string';
import { useBackend, useLocalState } from '../backend';
import { Box, Input, Table, Button, Tabs, Flex, Section } from '../components';
import { Window } from '../layouts';
import { Fragment } from 'inferno';

const MAX_SEARCH_RESULTS = 25;

export const AdminVerbs = (_, context) => {
  const { act, data } = useBackend(context);
  const { compactMode, categories = [] } = data;
  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');
  const [selectedCategory, setSelectedCategory] = useLocalState(
    context,
    'category',
    'Admin'
  );
  const testSearch = createSearch(searchText, (item) => {
    return item.name;
  });
  const items =
    (searchText.length > 0 &&
      categories
        .filter((category) => category.name !== 'История')
        .flatMap((category) => category.items || [])
        .filter(testSearch)
        .filter((item, i) => i < MAX_SEARCH_RESULTS)) ||
    categories.find((category) => category.name === selectedCategory)?.items ||
    [];
  return (
    <Window theme="ntos_darkmode" width={500} height={720}>
      <Window.Content scrollable>
        <Section
          title={<Box inline>Admin Panel</Box>}
          buttons={
            <Fragment>
              Поиск
              <Input
                autoFocus
                value={searchText}
                onInput={(e, value) => setSearchText(value)}
                onEnter={(event) => {
                  event.preventDefault();
                  setSearchText('');
                  act('run', {
                    'name': items[0].name,
                    'desc': items[0].desc,
                    'verb': items[0].verb,
                  });
                }}
                mx={1}
              />
              <Button
                icon={compactMode ? 'list' : 'info'}
                content={compactMode ? 'Компактно' : 'Детально'}
                onClick={() => act('compact_toggle')}
              />
            </Fragment>
          }
        >
          <Flex>
            {searchText.length === 0 && (
              <Flex.Item>
                <Tabs vertical mr={1}>
                  {categories.map((category) => (
                    <Tabs.Tab
                      key={category.name}
                      selected={category.name === selectedCategory}
                      onClick={() => setSelectedCategory(category.name)}
                    >
                      {category.name}
                    </Tabs.Tab>
                  ))}
                </Tabs>
              </Flex.Item>
            )}
            <Flex.Item grow={1} basis={0}>
              <VerbList
                compactMode={searchText.length > 0 || compactMode}
                items={items}
              />
            </Flex.Item>
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};

const VerbList = (props, context) => {
  const { items = [], compactMode } = props;
  const { act } = useBackend(context);
  if (compactMode) {
    return (
      <Table>
        {items.map((obj) => (
          <Table.Row key={obj.name} className="candystripe">
            <Button
              fluid
              content={obj.name}
              selected={obj.selected}
              onClick={() =>
                act('run', {
                  'name': obj.name,
                  'desc': obj.desc,
                  'verb': obj.verb,
                })
              }
            />
          </Table.Row>
        ))}
      </Table>
    );
  }
  return items.map((obj) => (
    <Section
      fluid
      key={obj.name}
      mb={obj.desc ? 0 : -1}
      pb={obj.desc ? 0 : -1}
      title={
        <Button
          fluid
          content={obj.name}
          onClick={() =>
            act('run', {
              'name': obj.name,
              'desc': obj.desc,
              'verb': obj.verb,
            })
          }
        />
      }
    >
      {!!obj.desc && <Box>{obj.desc}</Box>}
    </Section>
  ));
};

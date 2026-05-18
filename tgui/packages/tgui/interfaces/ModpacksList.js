import { useBackend, useLocalState } from '../backend';
import { Window } from '../layouts';
import {
  Box,
  Section,
  Input,
  Stack,
  Collapsible,
  LabeledList,
} from '../components';

export const ModpacksList = (props, context) => {
  return (
    <Window width={500} height={550}>
      <Window.Content>
        <Stack fill vertical>
          <ModpacksListContent />
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const ModpacksListContent = (props, context) => {
  const { act, data } = useBackend(context);
  const { modpacks } = data;

  const [searchText, setSearchText] = useLocalState(context, 'searchText', '');

  const searchBar = (
    <Input
      placeholder="Искать модпак..."
      fluid
      onInput={(e, value) => setSearchText(value)}
    />
  );

  return (
    <>
      <Stack.Item>
        <Section fill>{searchBar}</Section>
      </Stack.Item>
      <Stack.Item grow>
        <Section
          fill
          scrollable
          title={
            searchText.length > 0 ? (
              <span>Результаты поиска "{searchText}":</span>
            ) : (
              <span>Все модификации &mdash; {modpacks.length}</span>
            )
          }
        >
          <Stack fill vertical>
            <Stack.Item>
              {modpacks
                .filter(
                  (modpack) =>
                    modpack.name &&
                    (searchText.length > 0
                      ? modpack.name
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        modpack.desc
                          .toLowerCase()
                          .includes(searchText.toLowerCase()) ||
                        modpack.author
                          .toLowerCase()
                          .includes(searchText.toLowerCase())
                      : true)
                )
                .map((modpack) => (
                  <Collapsible
                    color="transparent"
                    key={modpack.name}
                    title={<span class="color-white">{modpack.name}</span>}
                  >
                    <Box pb={2} pt={1} pl={4}>
                      <LabeledList>
                        <LabeledList.Item label="Описание">
                          <Box style={{ 'white-space': 'pre-wrap' }}>
                            {modpack.desc}
                          </Box>
                        </LabeledList.Item>
                        <LabeledList.Item label="Автор">
                          {modpack.author}
                        </LabeledList.Item>
                      </LabeledList>
                    </Box>
                  </Collapsible>
                ))}
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
    </>
  );
};

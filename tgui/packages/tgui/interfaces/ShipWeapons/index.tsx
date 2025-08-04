import { useBackend } from '../../backend';
import { Box, Button, Section, Table, NumberInput, LabeledList } from '../../components';
import { Window } from '../../layouts';

type Data = {
  ship_x: number;
  ship_y: number;
  target_x: number;
  target_y: number;
  targeting_mode: boolean;
  weapons: WeaponData[];
  nearby_targets: TargetData[];
};

type WeaponData = {
  name: string;
  type: string;
  range: number;
  state: number;
  ammo: number;
  max_ammo: number;
  ref: string;
};

type TargetData = {
  name: string;
  x: number;
  y: number;
  distance: number;
  hull_integrity: number;
};

const getStateText = (state: number) => {
  switch (state) {
    case 0: return 'Idle';
    case 1: return 'Charging';
    case 2: return 'Ready';
    case 3: return 'Firing';
    default: return 'Unknown';
  }
};

const getStateColor = (state: number) => {
  switch (state) {
    case 0: return 'grey';
    case 1: return 'yellow';
    case 2: return 'green';
    case 3: return 'red';
    default: return 'grey';
  }
};

export const ShipWeapons = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const {
    ship_x,
    ship_y,
    target_x,
    target_y,
    targeting_mode,
    weapons,
    nearby_targets,
  } = data;

  return (
    <Window width={800} height={600}>
      <Window.Content>
        <Section title="Ship Position">
          <Box>Current Position: ({ship_x}, {ship_y})</Box>
        </Section>
        
        <Section title="Targeting System">
          <LabeledList>
            <LabeledList.Item label="Target Coordinates">
              X: <NumberInput
                value={target_x}
                minValue={1}
                maxValue={30}
                onChange={(e, value) => act('set_target', { x: value, y: target_y })}
              />
              {' '}
              Y: <NumberInput
                value={target_y}
                minValue={1}
                maxValue={30}
                onChange={(e, value) => act('set_target', { x: target_x, y: value })}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Actions">
              <Button
                icon="crosshairs"
                color={targeting_mode ? 'red' : 'grey'}
                onClick={() => act('toggle_targeting')}
              >
                {targeting_mode ? 'Targeting Active' : 'Targeting Inactive'}
              </Button>
              <Button
                icon="bullseye"
                color="red"
                onClick={() => act('fire_all')}
                disabled={!target_x || !target_y}
              >
                Fire All Weapons
              </Button>
              <Button
                icon="refresh"
                onClick={() => act('refresh_targets')}
              >
                Refresh Targets
              </Button>
            </LabeledList.Item>
          </LabeledList>
        </Section>

        <Section title="Nearby Targets" maxHeight="200px" scrollable>
          <Table>
            <Table.Row header>
              <Table.Cell>Name</Table.Cell>
              <Table.Cell>Position</Table.Cell>
              <Table.Cell>Distance</Table.Cell>
              <Table.Cell>Hull</Table.Cell>
              <Table.Cell>Action</Table.Cell>
            </Table.Row>
            {nearby_targets.map((target) => (
              <Table.Row key={target.name}>
                <Table.Cell>{target.name}</Table.Cell>
                <Table.Cell>({target.x}, {target.y})</Table.Cell>
                <Table.Cell>{target.distance.toFixed(1)}</Table.Cell>
                <Table.Cell>
                  <Box color={target.hull_integrity > 75 ? 'green' : target.hull_integrity > 25 ? 'yellow' : 'red'}>
                    {target.hull_integrity}%
                  </Box>
                </Table.Cell>
                <Table.Cell>
                  <Button
                    icon="crosshairs"
                    onClick={() => act('auto_target', { target_name: target.name })}
                  >
                    Target
                  </Button>
                </Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>

        <Section title="Weapon Systems">
          <Table>
            <Table.Row header>
              <Table.Cell>Weapon</Table.Cell>
              <Table.Cell>Type</Table.Cell>
              <Table.Cell>Range</Table.Cell>
              <Table.Cell>Status</Table.Cell>
              <Table.Cell>Ammo</Table.Cell>
              <Table.Cell>Actions</Table.Cell>
            </Table.Row>
            {weapons.map((weapon) => (
              <Table.Row key={weapon.ref}>
                <Table.Cell>{weapon.name}</Table.Cell>
                <Table.Cell>{weapon.type}</Table.Cell>
                <Table.Cell>{weapon.range}</Table.Cell>
                <Table.Cell>
                  <Box color={getStateColor(weapon.state)}>
                    {getStateText(weapon.state)}
                  </Box>
                </Table.Cell>
                <Table.Cell>
                  {weapon.type === 'ballistic' || weapon.type === 'explosive' 
                    ? `${weapon.ammo}/${weapon.max_ammo}` 
                    : 'N/A'}
                </Table.Cell>
                <Table.Cell>
                  <Button
                    icon="bolt"
                    color="yellow"
                    onClick={() => act('charge_weapon', { weapon_ref: weapon.ref })}
                    disabled={weapon.state !== 0}
                  >
                    Charge
                  </Button>
                  <Button
                    icon="fire"
                    color="red"
                    onClick={() => act('fire_weapon', { weapon_ref: weapon.ref })}
                    disabled={weapon.state !== 2 || !target_x || !target_y}
                  >
                    Fire
                  </Button>
                </Table.Cell>
              </Table.Row>
            ))}
          </Table>
        </Section>
      </Window.Content>
    </Window>
  );
};
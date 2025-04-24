import { useBackend } from '../../backend';
import { Section, Table } from '../../components';
import { Window } from '../../layouts';
import { Data } from './types';

import { CashSection, UserSection, VendingRow } from './VendingSections';

export const VendingCeladon = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const {
    user,
    all_items_free,
    miningvendor,
    product_records = [],
    coin_records = [],
    hidden_records = [],
    stock,
    current_amount,
    access,
  } = data;
  let inventory;
  let custom = false;
  if (data.vending_machine_input) {
    inventory = data.vending_machine_input;
    custom = true;
  } else {
    inventory = [...product_records, ...coin_records];
    if (data.extended_inventory) {
      inventory = [...inventory, ...hidden_records];
    }
  }
  // Just in case we still have undefined values in the list
  inventory = inventory.filter((item) => !!item);
  return (
    <Window title="Vending Machine" width={450} height={600} resizable>
      <Window.Content scrollable>
        {!all_items_free && (
          <UserSection user={user} miningvendor={miningvendor} />
        )}
        {((!miningvendor && !all_items_free) &&
          <CashSection current_amount={current_amount} act={act} />
        )}
        <Section title="Products">
          <Table>
            {inventory.map((product) => (
              <VendingRow
                key={product.name}
                custom={custom}
                product={product}
                productStock={stock[product.name]}
                user={user}
                all_items_free={all_items_free}
                miningvendor={miningvendor}
                current_amount={current_amount}
                access={access}
                act={act}
              />
            ))}
          </Table>
        </Section>
      </Window.Content>
    </Window>
  );
};




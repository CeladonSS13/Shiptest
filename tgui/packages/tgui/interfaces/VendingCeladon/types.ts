export type Data = {
  access: boolean;
  all_items_free: boolean;
  miningvendor: boolean;
  user: User;
  product_records: [];
  coin_records: [];
  hidden_records: [];
  stock: [];
  current_amount: number;
  vending_machine_input: boolean;
  extended_inventory: boolean;
};

export type User = {
  cash: number;
  points: number;
  name: string;
  job: string;
};

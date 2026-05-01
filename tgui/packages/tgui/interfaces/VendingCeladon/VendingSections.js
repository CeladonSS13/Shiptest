import { Box, Button, Table, Section, Stack } from '../../components';
import { classes } from 'common/react';


// Строка с товаром
export const VendingRow = (props, context) => {
  const { product, productStock, custom, all_items_free, user, miningvendor, current_amount, access, act } = props;
  const free = all_items_free || product.price === 0;
  const affix = miningvendor ? ' mp' : ' cr';

  return (
    <Table.Row>
      <Table.Cell collapsing>
        {(product.base64 && (
          <img
            src={`data:image/jpeg;base64,${product.img}`}
            style={{
              'vertical-align': 'middle',
              'horizontal-align': 'middle',
            }}
          />
        )) || (
          <span
            className={classes(['vending32x32', product.path])}
            style={{
              'vertical-align': 'middle',
              'horizontal-align': 'middle',
            }}
          />
        )}
      </Table.Cell>
      <Table.Cell bold>{product.name}</Table.Cell>
      <Table.Cell collapsing textAlign="center">
        <Box
          color={
            (custom && 'good') ||
            (product.max_amount < 0 && 'good') ||
            (productStock <= 0 && 'bad') ||
            (productStock <= product.max_amount / 2 && 'average') ||
            'good'
          }
        >
          {(!productStock && '0') ||
            (product.max_amount >= 0 && productStock) ||
            (product.max_amount < 0 && '∞')}{' '}
          in stock
        </Box>
      </Table.Cell>
      <Table.Cell collapsing textAlign="center">
        {(custom && (
          <Button
            fluid
            content={access ? 'FREE' : product.price + affix}
            onClick={() =>
              act('dispense', {
                'item': product.name,
              })
            }
          />
        )) || (
          <Button
            fluid
            disabled={
              productStock === 0 ||
              (!free &&
                (
                  (!user || (!miningvendor && product.price > user.cash) || (miningvendor && product.price > user.points))
                  &&
                  (!current_amount || (!miningvendor && product.price > current_amount))
                )
              )
            }
            content={free ? 'FREE' : product.price + affix}
            onClick={() =>
              act('vend', {
                'ref': product.ref,
              })
            }
          />
        )}
      </Table.Cell>
    </Table.Row>
  );
};

// Раздел с данными пользователя
export const UserSection = (props, context) => {
  const { user, miningvendor } = props;
  return(
    <Section title="User">
      {(user && (
        <Box>
          Welcome, <b>{user.name}</b>, <b>{user.job || 'Unemployed'}</b>!
          <br />
          Your cash card balance is{' '}
          <b>
            {miningvendor ? user.points || 0 : user.cash || 0}{' '}
            {miningvendor ? 'points' : 'credits'}
          </b>
          .
        </Box>
      )) || (
        <Box color="light-grey">
          No registered cash card!
          <br />
          Please contact your local bank!
        </Box>
      )}
    </Section>
  );
};

// Раздел с балансом вендомата
export const CashSection = (props, context) => {
  const { current_amount, act } = props;
  return(
    <Section>
      <Stack>
        <Stack.Item grow>
          Machine balance is{' '}
              {
                <b>
                  {current_amount}{' '}{'credits'}
                </b>
              }
        </Stack.Item>
        <Stack.Item>
          <Button.Input
              disabled={
                (!current_amount)
              }
              content="Withdraw Cash"
              currentValue={current_amount}
              defaultValue={0}
              onCommit={(e, value) =>
                act('withdrawCash', {
                  value: value,
                })
              }
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};


import { Box } from '../components';

// Простая функция-обертка для защиты от ошибок
export const FactionInfoErrorBoundary = ({ children }: { children: any }) => {
  try {
    return children;
  } catch (error) {
    console.error('[FactionInfo ErrorBoundary]', error);
    return (
      <Box
        style={{
          padding: '1rem',
          textAlign: 'center',
          color: 'rgba(255, 255, 255, 0.7)',
          backgroundColor: 'rgba(255, 0, 0, 0.1)',
          border: '1px solid rgba(255, 0, 0, 0.3)',
          borderRadius: '4px',
        }}
      >
        <div>Интерфейс временно недоступен</div>
        <div style={{ fontSize: '0.8rem', marginTop: '0.5rem' }}>
          Попробуйте обновить страницу
        </div>
      </Box>
    );
  }
};

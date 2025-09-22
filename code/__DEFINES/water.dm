// Уровни воды
#define WATER_LEVEL_NONE 0
#define WATER_LEVEL_ANKLES 1
#define WATER_LEVEL_WAIST 2
#define WATER_LEVEL_CHEST 3
#define WATER_LEVEL_NECK 4
#define WATER_LEVEL_SUBMERGED 5

// Объемы воды для каждого уровня (в литрах)
#define WATER_VOLUME_PER_LEVEL 100
#define WATER_MAX_VOLUME 5000

// Скорость распространения воды
#define WATER_SPREAD_RATE 25

// Флаги для воды
#define WATER_FLAG_SPREADING (1<<0)
#define WATER_FLAG_DRAINING (1<<1)

// Флаг для ласт
#define WATER_FINS (1<<10)

// Задержки движения от воды
#define WATER_SLOWDOWN_CHEST 1
#define WATER_SLOWDOWN_NECK 2
#define WATER_SLOWDOWN_SUBMERGED 3

// ID для модификаторов скорости
#define MOVESPEED_ID_WATER "water_slowdown"
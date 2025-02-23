// Цены устанавливаются по формуле P * rand(F1 * P, F2 * P)
// где Р - текущая цена, F1 - нижний порог, F2 - верхний порог
// Все цены устанавливаются в случайном диапазоне от F1 до F2
// Выбрано от -10% до +10% к цене
// Также после тестов возможно прописывать любые формулы и значения
// Также цены указаны не на отдельные категории. В будущем будет по
// категории

// ФРАКЦИОННЫЕ ЦЕНЫ НА ТОВАРЫ SUPPLY PACK
#define PRICES_FACTION_NT_MIN 			0.9
#define PRICES_FACTION_NT_MAX 			1.1

#define PRICES_FACTION_SOLFED_MIN		0.9
#define PRICES_FACTION_SOLFED_MAX		1.1

#define PRICES_FACTION_INTEQ_MIN		0.9
#define PRICES_FACTION_INTEQ_MAX		1.1

#define PRICES_FACTION_INDEPENDENT_MIN	0.9
#define PRICES_FACTION_INDEPENDENT_MAX	1.1

#define PRICES_FACTION_SYNDICATE_MIN	0.9
#define PRICES_FACTION_SYNDICATE_MAX	1.1

// ОБЩАЯ ЦЕНА НА ТОВАРЫ SUPPLY PACK
#define PRICES_GENERAL_MIN				0.9
#define PRICES_GENERAL_MAX				1.1

// ЦЕНА НА ТОВАРЫ ВЕНДОМАТОВ
#define PRICES_VENDING_MIN				0.75
// #define PRICES_VENDING_MAX				1.25
#define PRICES_VENDING_PREMIUM_MIN		0.85
// #define PRICES_VENDING_PREMIUM_MAX		1.25


#define PRICES_VENDING_REFILL			0.75
#define PRICES_VENDING_TAGGER			0.75

// ЦЕНЫ НА ЭКСПОРТ от 0.6 до 1.1 (но рандом не работает, поэтому 0.8)
// Пока общие на все категории
#define PRICES_EXPORT_GENERAL_MIN		0.6
#define PRICES_EXPORT_GENERAL_MAX		1.1

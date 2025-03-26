// Цены устанавливаются по формуле P * rand(F1 * P, F2 * P)
// где Р - текущая цена, F1 - нижний порог, F2 - верхний порог
// Все цены устанавливаются в случайном диапазоне от F1 до F2

// Для общего карго диапазон цены выбирается между -10% до +10% к цене
// Для фракционного карго скидка выбрана от 0% до -25% к цене
// Для экспорта ценник может варироваться от -40% до +10% к цене
// Для Вендор автоматов диапазон цен от -25% до -15%

// Также после тестов возможно прописывать любые формулы и значения
// Также цены указаны не на отдельные категории. В будущем будет по
// категории

// ФРАКЦИОННЫЕ ЦЕНЫ НА ТОВАРЫ SUPPLY PACK
#define PRICES_FACTION_NT_MIN 			0.8
#define PRICES_FACTION_NT_MAX 			1

#define PRICES_FACTION_SOLFED_MIN		0.8
#define PRICES_FACTION_SOLFED_MAX		1

#define PRICES_FACTION_INTEQ_MIN		0.8
#define PRICES_FACTION_INTEQ_MAX		1

#define PRICES_FACTION_SYNDICATE_MIN	0.8
#define PRICES_FACTION_SYNDICATE_MAX	1

#define PRICES_FACTION_INDEPENDENT_MIN	0.9
#define PRICES_FACTION_INDEPENDENT_MAX	1.1

// ОБЩАЯ ЦЕНА НА ТОВАРЫ SUPPLY PACK
#define PRICES_GENERAL_MIN				0.9
#define PRICES_GENERAL_MAX				1.1

// ЦЕНА НА ТОВАРЫ ВЕНДОМАТОВ
#define PRICES_VENDING_MIN				0.75
#define PRICES_VENDING_PREMIUM_MIN		0.85


#define PRICES_VENDING_REFILL			0.9
#define PRICES_VENDING_TAGGER			0.9

// Пока общие на все категории
#define PRICES_EXPORT_GENERAL_MIN		0.6
#define PRICES_EXPORT_GENERAL_MAX		1.1

// Bounty
#define BOUNTY_ASSISTANT_MIN			0.9
#define BOUNTY_ASSISTANT_MAX			1.1

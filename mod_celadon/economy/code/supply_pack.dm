// Типы цен:
// 1. Обычные товары: от 0% до +20% (множитель 1.0 - 1.2)
// 2. Фракционные товары: от -20% до 0% (множитель 0.8 - 1.0)
// После умножения цена округляется вниз на указанное число в формуле `round`

#define PRICES_FACTION_MIN	0.8
#define PRICES_FACTION_MAX	1

// ОБЩАЯ ЦЕНА НА ТОВАРЫ SUPPLY PACK
#define PRICES_GENERAL_MIN	1
#define PRICES_GENERAL_MAX	1.2

// Стабильные цены задаются параметром stable 
// Патроны, патроны должны быть дешевые изначально лмао
// Атачменты тоже странно когда мелкие цены меняются
/datum/supply_pack/faction/New()
	..()
	if(stable_price)
		return cost = cost
	setup_pricing()

/datum/supply_pack/faction/proc/setup_pricing()
	cost = rand(cost * PRICES_FACTION_MIN,
				cost * PRICES_FACTION_MAX)
	cost = round(cost, 25)

/datum/supply_pack/faction/independent/setup_pricing()
	cost = rand(cost * PRICES_GENERAL_MIN,
				cost * PRICES_GENERAL_MAX)
	cost = round(cost, 25)

#undef PRICES_FACTION_MIN
#undef PRICES_FACTION_MAX
#undef PRICES_GENERAL_MIN
#undef PRICES_GENERAL_MAX

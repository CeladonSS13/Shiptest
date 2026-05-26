/datum/supply_pack
	var/stable_price = FALSE

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
/datum/supply_pack/New()
	. = ..()
	if(stable_price)
		return
	setup_pricing()

/datum/supply_pack/proc/setup_pricing()
	var/price_factor_min = PRICES_GENERAL_MIN
	var/price_factor_max = PRICES_GENERAL_MAX
	if(faction_locked)
		price_factor_min = PRICES_FACTION_MIN
		price_factor_max = PRICES_FACTION_MAX
	cost = round(rand(cost * price_factor_min, cost * price_factor_max), 25)

#undef PRICES_FACTION_MIN
#undef PRICES_FACTION_MAX
#undef PRICES_GENERAL_MIN
#undef PRICES_GENERAL_MAX

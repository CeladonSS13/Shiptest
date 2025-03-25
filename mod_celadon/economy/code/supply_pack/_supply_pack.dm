/datum/supply_pack/New(...)
	cost = rand(cost * PRICES_GENERAL_MIN,
				cost * PRICES_GENERAL_MAX)
	return ..()

/datum/supply_pack/gun/morita1/New(...)
	cost = rand(cost * PRICES_GENERAL_MIN,
				cost * PRICES_GENERAL_MAX)
	return ..()

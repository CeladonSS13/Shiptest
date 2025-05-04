/datum/supply_pack/New(...)
	cost = rand(cost * PRICES_GENERAL_MIN,
				cost * PRICES_GENERAL_MAX)
	return ..()

/datum/supply_pack/New()
	cost = rand(cost * PRICES_GENERAL_MIN,
				cost * PRICES_GENERAL_MAX)
	cost = round50(cost)
	return ..()


/datum/supply_pack/proc/round50(cost)
	return round( cost / 50 ) * 50

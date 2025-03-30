/datum/supply_pack/faction/solfed/ammo/New(...)
	cost = rand(cost * PRICES_FACTION_SOLFED_MIN,
				cost * PRICES_FACTION_SOLFED_MAX)
	return ..()

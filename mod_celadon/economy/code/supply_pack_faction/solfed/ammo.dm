/datum/supply_pack/faction/solfed/ammo/ferrolancebox
	cost = 700

/datum/supply_pack/faction/solfed/ammo/ferropellets
	cost = 500

/datum/supply_pack/faction/solfed/ammo/New(...)
	cost = rand(cost * PRICES_FACTION_SOLFED_MIN,
				cost * PRICES_FACTION_SOLFED_MAX)
	return ..()

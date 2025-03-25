/datum/supply_pack/faction/solfed/clothing/hardsuit
	cost = 11000

/datum/supply_pack/faction/solfed/clothing/med_hardsuit
	cost = 4000

/datum/supply_pack/faction/solfed/clothing/New(...)
	cost = rand(cost * PRICES_FACTION_SOLFED_MIN,
				cost * PRICES_FACTION_SOLFED_MAX)
	return ..()

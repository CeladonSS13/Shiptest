/datum/supply_pack/faction/inteq/clothing/hardsuit
	cost = 4000

/datum/supply_pack/faction/inteq/clothing/spacesuit
	cost = 1500

/datum/supply_pack/faction/inteq/clothing/New(...)
	cost = rand(cost * PRICES_FACTION_INTEQ_MIN,
				cost * PRICES_FACTION_INTEQ_MAX)
	return ..()

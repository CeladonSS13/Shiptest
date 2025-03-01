/datum/supply_pack/faction/syndicate/clothing/hardsuit
	cost = 12000

/datum/supply_pack/faction/syndicate/clothing/New(...)
	cost = rand(cost * PRICES_FACTION_SYNDICATE_MIN,
				cost * PRICES_FACTION_SYNDICATE_MAX)
	return ..()

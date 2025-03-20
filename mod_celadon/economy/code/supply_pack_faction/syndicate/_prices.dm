/datum/supply_pack/faction/syndicate/ammo/New(...)
	cost = rand(cost * PRICES_FACTION_SYNDICATE_MIN,
				cost * PRICES_FACTION_SYNDICATE_MAX)
	return ..()

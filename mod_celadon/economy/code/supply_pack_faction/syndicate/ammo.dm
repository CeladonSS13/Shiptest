/datum/supply_pack/faction/syndicate/ammo/smgm45ammo
	cost = 750

/datum/supply_pack/faction/syndicate/ammo/c45_ammo_box
	cost = 500

/datum/supply_pack/faction/syndicate/ammo/New(...)
	cost = rand(cost * PRICES_FACTION_SYNDICATE_MIN, cost * PRICES_FACTION_SYNDICATE_MAX)
	return ..()

/datum/supply_pack/faction/nanotrasen/ammo/commander_ammo_box
	cost = 250

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box
	cost = 500

/datum/supply_pack/faction/nanotrasen/ammo/wt_magazine
	cost = 700

/datum/supply_pack/faction/nanotrasen/ammo/commander_magazine
	cost = 600

/datum/supply_pack/faction/nanotrasen/ammo/New(...)
	cost = rand(cost * PRICES_FACTION_NT_MIN,
				cost * PRICES_FACTION_NT_MAX)
	return ..()

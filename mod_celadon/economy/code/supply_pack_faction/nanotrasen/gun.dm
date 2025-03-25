/datum/supply_pack/faction/nanotrasen/gun/hades
	cost = 6000

/datum/supply_pack/faction/nanotrasen/gun/etar_smg
	cost = 8000

/datum/supply_pack/faction/nanotrasen/gun/iot
	cost = 5000

/datum/supply_pack/faction/nanotrasen/gun/commander
	cost = 700

/datum/supply_pack/faction/nanotrasen/gun/egun
	cost = 1250

/datum/supply_pack/faction/nanotrasen/gun/mini_egun
	cost = 500

/datum/supply_pack/faction/nanotrasen/gun/ion_carbine
	cost = 11000

/datum/supply_pack/faction/nanotrasen/gun/wt550
	cost = 6500


/datum/supply_pack/faction/nanotrasen/gun/New(...)
	cost = rand(cost * PRICES_FACTION_NT_MIN,
				cost * PRICES_FACTION_NT_MAX)
	return ..()

/datum/supply_pack/faction/nanotrasen/clothing/hardsuitswat
	cost = 11500

/datum/supply_pack/faction/nanotrasen/clothing/hardsuitsec
	cost = 3500

/datum/supply_pack/faction/nanotrasen/clothing/armorsec
	cost = 4000

/datum/supply_pack/faction/nanotrasen/clothing/New(...)
	cost = rand(cost * PRICES_FACTION_NT_MIN,
				cost * PRICES_FACTION_NT_MAX)
	return ..()

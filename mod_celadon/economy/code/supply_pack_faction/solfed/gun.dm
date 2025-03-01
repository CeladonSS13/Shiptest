/datum/supply_pack/faction/solfed/gun/gar
	cost = 9000

/datum/supply_pack/faction/solfed/gun/commanders
	cost = 750

/datum/supply_pack/faction/solfed/gun/gauss/prototype
	cost = 6000


/datum/supply_pack/faction/solfed/gun/New(...)
	cost = rand(cost * PRICES_FACTION_SOLFED_MIN,
				cost * PRICES_FACTION_SOLFED_MAX)
	return ..()

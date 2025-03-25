/datum/supply_pack/faction/inteq/gun/skm_carbine
	cost = 5000

/datum/supply_pack/faction/inteq/gun/bulldog
	cost = 8000

/datum/supply_pack/faction/inteq/gun/commanders
	cost = 750

/datum/supply_pack/faction/inteq/gun/ssg04/inteq
	cost = 9000

/datum/supply_pack/faction/inteq/gun/New(...)
	cost = rand(cost * PRICES_FACTION_INTEQ_MIN,
				cost * PRICES_FACTION_INTEQ_MAX)
	return ..()

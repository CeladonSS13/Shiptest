// /datum/supply_pack/faction/syndicate/gun/deagle // У нас нет коробок для этой пушки, поэтому пока что так
// 	name = "Deagle"
// 	desc = "A true hand cannon"
// 	contains = list(/obj/item/storage/pistolcase/deagle)
// 	cost = PRICES_FACTION_SYNDICATE * 2000

/datum/supply_pack/faction/syndicate/gun/ringneck
	cost = 750

/datum/supply_pack/faction/syndicate/gun/bulldog
	cost = 7000

/datum/supply_pack/faction/syndicate/gun/hydra
	cost = 6400

/datum/supply_pack/faction/syndicate/gun/cobra
	cost = 5500

// /datum/supply_pack/faction/syndicate/gun/cobra/New(...)
// 	cost = rand(cost * 0.75, cost * 1.25)
// 	return ..()

/datum/supply_pack/faction/syndicate/gun/New(...)
	cost = rand(cost * PRICES_FACTION_SYNDICATE_MIN,
				cost * PRICES_FACTION_SYNDICATE_MAX)
	return ..()

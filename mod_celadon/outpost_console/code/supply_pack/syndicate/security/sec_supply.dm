/datum/supply_pack/faction/syndicate/sec_supply
	category = "Security - Supplies"
	crate_type = /obj/structure/closet/crate/secure/gear


// MARK: MELEE

/datum/supply_pack/faction/syndicate/sec_supply/sledgehammer
	name = "Sledgehammer Crate"
	desc = "Contains a freshly fabricated Breaching Sledgehammer, capable of wrecking hull and flesh with ease."
	cost = 1500
	crate_name = "sledgehammer crate"

/datum/supply_pack/faction/syndicate/sec_supply/hardliner_flyssa
	name = "Energy Flyssa Crate"
	desc = "Contains a lathed, verified, and readied Energy Flyssa. This is one of the assets you need to be careful to not lose."
	cost = 1500
	contains = list(/obj/item/melee/energy/flyssa)
	crate_name = "energy flyssa crate"

/datum/supply_pack/faction/syndicate/sec_supply/suns_sabre
	name = "SUNS Dueling Sabre Crate"
	desc = "Contains a single dueling sabre, intended for resolving conflicts among students."
	cost = 750
	contains = list(/obj/item/storage/belt/sabre/suns)
	crate_name = "student's sabre crate"


/datum/supply_pack/faction/syndicate/sec_supply/suns_cmo_sabre
	name = "SUNS Cane Sabre Crate"
	desc = "Contains a blade sheathed in a cane. "
	cost = 800
	crate_name = "student's sabre crate"

/datum/supply_pack/faction/syndicate/sec_supply/suns_telescopic_sabre
	name = "SUNS Telescopic Sabre Crate"
	desc = "Contains a finely crafted telescopic sabre, ideal for those with discerning tastes"
	cost = 600
	crate_name = "telescopic sabre crate"

/datum/supply_pack/faction/syndicate/sec_supply/saber
	name = "Double-Bladed Energy Sword"
	desc = "Contains one double-bladed energy sword, for when simply killing someone isn't enough."
	cost = 10000
	contains = list(/obj/item/melee/duelenergy/saber/red)
	crate_name = "dualsaber crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/faction/syndicate/sec_supply/flamethrower
	name = "Flamethrower"
	desc = "Contains one flamethrower. Point the nozzle away from anything important."
	cost = 1250
	contains = list(/obj/item/flamethrower/full)
	crate_name = "flamethrower crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/faction/syndicate/sec_supply/c4duffel
	name = "C-4 Demolitions Charge"
	desc = "Contains a duffel of C-4 demolitions charges, for use in scrapping and demolitions of large-scale structures."
	cost = 1000
	contains = list(/obj/item/storage/backpack/duffelbag/syndie/c4)
	crate_name = "demolitions charge crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/faction/syndicate/sec_supply/radio
	name = "Radio Transceiver Crate"
	desc = "Contains one tactical communications device."
	cost = 300
	contains = list(/obj/item/radio/transceiver/syndicate)
	crate_name = "radio transceiver crate"

// /datum/supply_pack/faction/syndicate/sec_supply/fire - [Криво работают]
// 	name = "Incendiary Weapons"
// 	desc = "Burn, baby burn. Contains three incendiary grenades and three prebuilt flamethrowers."
// 	cost = 5000
// 	contains = list(
// 		/obj/item/flamethrower/full,
// 		/obj/item/flamethrower/full,
// 		/obj/item/flamethrower/full,
// 		/obj/item/grenade/chem_grenade/incendiary,
// 		/obj/item/grenade/chem_grenade/incendiary,
// 		/obj/item/grenade/chem_grenade/incendiary,
// 	)
// 	crate_name = "incendiary weapons crate"
// 	crate_type = /obj/structure/closet/crate/secure/plasma

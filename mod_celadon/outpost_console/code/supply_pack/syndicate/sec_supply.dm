/datum/supply_pack/faction/syndicate/sec_supply
	category = "Security Supplies"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/sec_supply/saber
	name = "Double-Bladed Energy Sword Crate"
	desc = "Contains one double-bladed energy sword, for when simply killing someone isn't enough."
	cost = 3000
	contains = list(/obj/item/melee/duelenergy/saber)
	crate_name = "dualsaber crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/faction/syndicate/sec_supply/flamethrower
	name = "Flamethrower Crate"
	desc = "Contains one flamethrower. Point the nozzle away from anything important."
	cost = 1250
	contains = list(/obj/item/flamethrower/full)
	crate_name = "flamethrower crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/faction/syndicate/sec_supply/c4duffel
	name = "C-4 Demolitions Charge Crate"
	desc = "Contains a duffel of C-4 demolitions charges, for use in scrapping and demolitions of large-scale structures."
	cost = 1000
	contains = list(/obj/item/storage/backpack/duffelbag/syndie/c4)
	crate_name = "demolitions charge crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

// /datum/supply_pack/faction/syndicate/sec_supply/fire - [Криво работают]
// 	name = "Incendiary Weapons Crate"
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

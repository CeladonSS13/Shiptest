/datum/supply_pack/sec_supply
	category = "Security - Supplies"

/datum/supply_pack/sec_supply/maintenance_kit/small
	name = "Firearm Maintenance Small Kit"
	desc = "A minimal firearm maintenance kit with 15 uses, specifically designed for lubricating moving parts."
	contains = list(/obj/item/gun_maint_kit/small)
	cost = 375

/datum/supply_pack/sec_supply/maintenance_kit
	desc = "Contains a large firearm maintenance kit for full servicing, with five uses, useful for cleaning blood, sand, and dirt from guns."
	cost = 500

/datum/supply_pack/sec_supply/flashbangs
	cost = 200

/datum/supply_pack/sec_supply/teargas
	cost = 200

/datum/supply_pack/sec_supply/frag_grenade
	cost = 250

/datum/supply_pack/sec_supply/claymore
	name = "C-10 Claymore"
	desc = "Motion-activated directional mine, perfect for ambushing enemy infantry. Still debatably legal to sell!"
	cost = 750
	contains = list(
		/obj/item/paper/fluff/claymore,
		/obj/item/mine/directional/claymore,
	)
	crate_name = "C-10 Claymore crate"

/datum/supply_pack/sec_supply/machete
	cost = 150

/datum/supply_pack/sec_supply/boarding_kit
	name = "Boarding Teleporter"
	desc = "Contains a new, state-of-the-art boarding teleporter that will instantly transport your brave operative onto an enemy ship for subsequent hijacking. In reality, it's intended for security purposes. Multitool for hacking the control console not included."
	cost = 2400
	contains = list(/obj/item/circuitboard/machine/boarding_pad)
	crate_name = "boarding pad crate"

/datum/supply_pack/sec_supply/halberd
	name = "Energy Halberd"
	cost = 10000

/datum/supply_pack/sec_supply/saber
	name = "Energy Kampfmesser"
	desc = "Nanotrasen eswords are failing to properly deliver solarian freedom? Try this!"
	contains = list(/obj/item/melee/energy/sword/saber/knife/blue)
	cost = 450
	faction = /datum/faction/solgov
	faction_discount = 0
	faction_locked = TRUE

/datum/supply_pack/sec_supply/saber
	name = "Double-Bladed Energy Sword"
	desc = "Contains one double-bladed energy sword, for when simply killing someone isn't enough."
	cost = 10000
	contains = list(/obj/item/melee/duelenergy/saber/red)
	crate_name = "dualsaber crate"
	crate_type = /obj/structure/closet/crate/secure/weapon
	faction = /datum/faction/syndicate
	faction_discount = 0
	faction_locked = TRUE

/datum/supply_pack/sec_supply/saber/inteq
	faction = /datum/faction/inteq
	contains = list(/obj/item/melee/duelenergy/saber/yellow)

/datum/supply_pack/sec_supply/flamethrower
	faction_locked = TRUE

/datum/supply_pack/sec_supply/c4duffel
	faction_locked = TRUE

/datum/supply_pack/sec_supply/crusher
	name = "Proto-Magnetic Crusher"
	desc = "Contains one multipurpose disembarkation and self-defense tool designed by EXOCOM using an incomplete Nanotrasen prototype."
	cost = 1500
	contains = list(/obj/item/kinetic_crusher)
	crate_name = "crusher crate"
	crate_type = /obj/structure/closet/crate/secure/weapon
	faction = /datum/faction/nt
	faction_discount = 0
	faction_locked = TRUE

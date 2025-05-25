/datum/supply_pack/faction/independent/sec_supply
	category = "Security Supplies"
	crate_type = /obj/structure/closet/crate/secure/gear

/*
		Standard supplies
*/

/datum/supply_pack/faction/independent/sec_supply/holster
	name = "Shoulder Holster Crate"
	desc = "Contains a shoulder holster, capable of holding a single pistol or revolver and your ammo."
	cost = 600
	contains = list(/obj/item/clothing/accessory/holster)
	crate_name = "holster crate"

/datum/supply_pack/faction/independent/sec_supply/securitybarriers
	name = "Security Barrier Grenades"
	desc = "Halt the opposition with four Security Barrier grenades."
	contains = list(/obj/item/grenade/barrier,
					/obj/item/grenade/barrier,
					/obj/item/grenade/barrier,
					/obj/item/grenade/barrier)
	cost = 500
	crate_name = "security barriers crate"

/datum/supply_pack/faction/independent/sec_supply/empty_sandbags
	name = "Empty Sandbags"
	desc = "Contains one box of seven empty sandbags for deployable cover in the field. Sand not included."
	contains = list(/obj/item/storage/box/emptysandbags)
	cost = 150
	crate_name = "sandbag crate"

/datum/supply_pack/faction/independent/sec_supply/maintenance_kit_small
	name = "Firearm Maintenance Small Kit"
	desc = "A minimal firearm maintenance kit with 15 uses, specifically designed for lubricating moving parts."
	contains = list(/obj/item/gun_maint_kit/small)
	cost = 375
	crate_name = "maintenance kit crate"

/datum/supply_pack/faction/independent/sec_supply/maintenance_kit
	name = "Firearm Maintenance Kit"
	desc = "Contains a large firearm maintenance kit for full servicing, with five uses, useful for cleaning blood, sand, and dirt from guns."
	contains = list(/obj/item/gun_maint_kit)
	cost = 500
	crate_name = "maintenance kit crate"

/datum/supply_pack/faction/independent/sec_supply/flashbangs
	name = "Flashbangs Crate"
	desc = "Contains seven flashbangs for use in door breaching and riot control."
	cost = 750
	contains = list(/obj/item/storage/box/flashbangs)
	crate_name = "flashbangs crate"

/datum/supply_pack/faction/independent/sec_supply/smokebombs
	name = "Smoke Grenades Crate"
	desc = "Contains seven smoke grenades for screening unit movements and signalling."
	cost = 500
	contains = list(/obj/item/storage/box/smokebombs)
	crate_name = "smoke grenades crate"

/datum/supply_pack/faction/independent/sec_supply/teargas
	name = "Teargas Grenades Crate"
	desc = "Contains seven teargas grenades for use in crowd dispersion and riot control."
	cost = 750
	contains = list(/obj/item/storage/box/teargas)
	crate_name = "teargas grenades crate"

/datum/supply_pack/faction/independent/sec_supply/camera_console
	name = "Camera Console Crate"
	desc = "Contains a camera console circuit board, for a comprehensive surveillance system and peace of mind."
	cost = 500
	contains = list(/obj/item/circuitboard/computer/security)
	crate_name = "camera console crate"

/*
		Pouches
*/

/datum/supply_pack/faction/independent/sec_supply/pouch
	name = "Utility Pouch Crate"
	desc = "Contains a small basic pouch for holding two small items of your choice."
	cost = 150
	contains = list(/obj/item/storage/pouch)
	crate_name = "pouch crate"

/datum/supply_pack/faction/independent/sec_supply/pouch_medical
	name = "Medical Pouch Crate"
	desc = "Contains a small IFAK for issuing to your crew for field triage. Comes pre-stocked with basic medical gear."
	cost = 250
	contains = list(/obj/item/storage/pouch/medical)
	crate_name = "pouch crate"

/datum/supply_pack/faction/independent/sec_supply/pouch_engi
	name = "Engineering Pouch Crate"
	desc = "Contains a small engineering pouch for holding various tools of your choice. Comes pre-stocked with emergency tools."
	cost = 250
	contains = list(/obj/item/storage/pouch/engi)
	crate_name = "pouch crate"

/datum/supply_pack/faction/independent/sec_supply/pouch_ammo
	name = "Ammo Pouch Crate"
	desc = "Contains a small pouch for holding either magazines or loose ammunition on the field. Remember, make them count!"
	cost = 150
	contains = list(/obj/item/storage/pouch/ammo)
	crate_name = "pouch crate"

/datum/supply_pack/faction/independent/sec_supply/pouch_grenade
	name = "Explosives Pouch Crate"
	desc = "Contains a pouch designed to hold frag grenades and C4 for use by demolitions experts across armed services."
	cost = 150
	contains = list(/obj/item/storage/pouch/grenade)
	crate_name = "pouch crate"

/datum/supply_pack/faction/independent/sec_supply/pouch_squad
	name = "Communications & Command Pouch Crate"
	desc = "Contains a medium command pouch for holding various items often used by commanders everywhere."
	cost = 150
	contains = list(/obj/item/storage/pouch/squad)
	crate_name = "pouch crate"

/*
		Misc. weapons / protection
*/

/datum/supply_pack/faction/independent/sec_supply/riotshields
	name = "Riot Shield Crate"
	desc = "Contains a riot shield, effective at holding back hostile fauna, xenofauna, or large crowds."
	cost = 600
	contains = list(/obj/item/shield/riot)
	crate_name = "riot shield crate"

/datum/supply_pack/faction/independent/sec_supply/teleriotshields
	name = "Telescopic Riot Shield Crate"
	desc = "Contains a telescopic riot shield, effective at holding back hostile fauna, xenofauna, or large crowds in tight spaces."
	cost = 750
	contains = list(/obj/item/shield/riot/tele)
	crate_name = "riot shield crate"

/datum/supply_pack/faction/independent/sec_supply/survknives
	name = "Survival Knives Crate"
	desc = "Contains three sharpened survival knives. Each knife guaranteed to fit snugly inside any galactic-standard boot."
	cost = 350
	contains = list(/obj/item/melee/knife/survival,
					/obj/item/melee/knife/survival,
					/obj/item/melee/knife/survival)
	crate_name = "survival knife crate"

/datum/supply_pack/faction/independent/sec_supply/machete
	name = "Stamped Steel Machete Crate"
	desc = "Contains two mass produced machetes. A perfect choice for crews on a budget."
	cost = 500
	contains = list(/obj/item/melee/sword/mass,
					/obj/item/melee/sword/mass)
	crate_name = "machete crate"

/datum/supply_pack/faction/independent/sec_supply/combatknives
	name = "Combat Knives Crate"
	desc = "Contains three high quality combat knives. For the sharper, and meaner, crew."
	cost = 1000
	contains = list(/obj/item/melee/knife/combat,
					/obj/item/melee/knife/combat,
					/obj/item/melee/knife/combat)
	crate_name = "combat knife crate"

/datum/supply_pack/faction/independent/sec_supply/frag_grenade
	name = "Frag Grenade Crate"
	desc = "Contains two fragmentation grenades. Better not let it go off in your hands."
	cost = 500
	contains = list(/obj/item/grenade/frag,
					/obj/item/grenade/frag)
	crate_name = "frag grenade crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

/datum/supply_pack/faction/independent/sec_supply/pepper_spray
	name = "Pepper Spray Crate"
	desc = "Contains four pepper spray cans, for self defense on a budget."
	cost = 250
	contains = list(/obj/item/reagent_containers/spray/pepper,
					/obj/item/reagent_containers/spray/pepper,
					/obj/item/reagent_containers/spray/pepper,
					/obj/item/reagent_containers/spray/pepper)
	crate_name = "pepper spray crate"

/*
		Stamina / PVP weapons (intentionally overpriced due to odd balance position of stamina weapons)
*/

/datum/supply_pack/faction/independent/sec_supply/stingpack
	name = "Stingbang Grenade Pack"
	desc = "Contains five \"stingbang\" grenades, perfect for stopping riots and playing morally unthinkable pranks."
	cost = 750
	contains = list(/obj/item/storage/box/stingbangs)
	crate_name = "stingbang grenade pack crate"

/datum/supply_pack/faction/independent/sec_supply/baton
	name = "Stun Baton Crate"
	desc = "Arm your vessel security with a stun baton. Batteries included."
	cost = 2500
	contains = list(/obj/item/melee/baton/loaded)
	crate_name = "stun baton crate"

/datum/supply_pack/faction/independent/sec_supply/claymore
	name = "C-10 Claymore Crate"
	desc = "Four motion-activated directional mines, perfect for ambushing enemy infantry. Still debatably legal to sell!"
	cost = 3000
	contains = list(/obj/item/paper/fluff/claymore,
					/obj/item/mine/directional/claymore,
					/obj/item/mine/directional/claymore,
					/obj/item/mine/directional/claymore,
					/obj/item/mine/directional/claymore)
	crate_name = "C-10 Claymore crate"

/datum/supply_pack/faction/independent/sec_supply/machete
	desc = "Contains five mass produced machetes. A perfect choice for crews on a budget."
	cost = 650
	contains = list(/obj/item/melee/sword/mass,
					/obj/item/melee/sword/mass,
					/obj/item/melee/sword/mass,
					/obj/item/melee/sword/mass,
					/obj/item/melee/sword/mass)

/datum/supply_pack/faction/independent/sec_supply/boarding_kit
	name = "Boarding Teleporter"
	desc = "Contains a new, state-of-the-art boarding teleporter that will instantly transport your brave operative onto an enemy ship for subsequent hijacking. In reality, it’s intended for security purposes. Multitool for hacking the control console not included."
	cost = 2400
	contains = list(/obj/item/circuitboard/machine/boarding_pad)
	crate_name = "boarding pad crate"

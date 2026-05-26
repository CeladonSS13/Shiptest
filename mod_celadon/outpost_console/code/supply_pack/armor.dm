/datum/supply_pack/armor
	category = "Equipment - Armor"

/datum/supply_pack/armor/basic_armor
	cost = 500

/datum/supply_pack/armor/riot_armor
	cost = 1000

/datum/supply_pack/armor/bullet_armor
	cost = 1250

/datum/supply_pack/armor/marine_armor
	cost = 2000

/datum/supply_pack/armor/heavy_marine_armor
	name = "Heavy Tactical Armor"
	desc = "One set of well-rounded heavy tactical body armor. Plates are attached to the vest and cover the limbs. The set includes a helmet and chestpiece."
	cost = 5000
	contains = list(
		/obj/item/clothing/head/helmet/riot,
		/obj/item/clothing/suit/armor/vest/marine/heavy,
	)
	crate_name = "armor crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/armor/ablative
	name = "Ablative Trenchcoat"
	desc = "Experimental trenchcoat specially crafted to reflect and absorb laser and disabler shots. Don't expect it to do all that much against an axe or a shotgun, however."
	cost = 4000
	contains = list(/obj/item/clothing/suit/hooded/ablative)

// MARK: NT
/datum/supply_pack/armor/nt_armor
	name = "Nanotrasen Security Kit"
	desc = "Some security armor vests and helmets to protect you. Produced by Nanotrasen"
	contains = list(
		/obj/item/clothing/head/helmet/m10/nanotrasen,
		/obj/item/clothing/suit/armor/nanotrasen,
	)
	cost = 500
	faction = /datum/faction/nt
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/armor/solfed_armor
	name = "Solfed Advanced Riot Armor"
	desc = "Some advanced metal plate for armor vests and helmets to protect you."
	contains = list(
		/obj/item/clothing/head/helmet/riot/solfed,
		/obj/item/clothing/suit/armor/riot/solfed,
	)
	cost = 1750
	faction = /datum/faction/solgov
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/armor/clip_riot
	available = FALSE

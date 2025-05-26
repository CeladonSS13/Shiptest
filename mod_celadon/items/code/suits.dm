//********************
// 		Suits
//********************
/obj/item/clothing/suit/armor/vest/tajaran_replica				// Исключение, засунут в лодаут в таком виде, понравился игрокам (пофикшена броня)
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "white tactical armor vest (replika)"
	desc = "Эта одежда была сделана в тёмных подвалах. Она похожа с виду на зимний тактический бронижилет, но это лишь реплика её."
	icon_state = "snowsuit"
	item_state = "snowsuit"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/t_scanner, /obj/item/radio)
	body_parts_covered = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "fire" = 0, "acid" = 0)
	cold_protection = NONE
	min_cold_protection_temperature = NONE
	heat_protection = NONE
	resistance_flags = NONE

/obj/item/clothing/suit/space/hardsuit/tajaran
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	allowed = list(/obj/item/gun,
					/obj/item/ammo_box,
					/obj/item/ammo_casing,
					/obj/item/melee/baton,
					/obj/item/restraints/handcuffs,
					/obj/item/tank/internals,
					/obj/item/melee/knife/combat)

/obj/item/clothing/head/helmet/space/hardsuit/tajaran
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/helmetdpra.dmi'

/obj/item/clothing/suit/space/hardsuit/tajaran/void_nka
	name = "new kingdom mercantile voidsuit"
	desc = "An amalgamation of old civilian voidsuits and diving suits. This bulky space suit is used by the crew of the New Kingdom's mercantile navy."
	icon_state = "nkavoid"
	item_state = "nkavoid"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30)
	strip_delay = 60
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_nka

/obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_nka
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/helmetdpra.dmi'
	name = "new kingdom mercantile voidsuit helmet"
	desc = "An amalgamation of old civilian voidsuits and diving suits. This bulky space suit is used by the crew of the New Kingdom's mercantile navy."
	icon_state = "nkavoid"
	item_state = "nkavoid"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30)
	strip_delay = 60
	actions_types = list()

/obj/item/clothing/suit/space/hardsuit/tajaran/void_dpra
	name = "people's volunteer spacer militia voidsuit"
	desc = "A refitted, sturdy voidsuit created from Hegemony models acquired during the liberation of Gakal'zaal. These armored models are issued to the People's Volunteer Spacer Militia."
	icon_state = "DPRAvoidsuit"
	item_state = "DPRAvoidsuit"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30)
	strip_delay = 60
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_dpra

/obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_dpra
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/helmetdpra.dmi'
	name = "people's volunteer spacer militia voidsuit helmet"
	desc = "A refitted, sturdy voidsuit created from Hegemony models acquired during the liberation of Gakal'zaal. These armored models are issued to the People's Volunteer Spacer Militia."
	icon_state = "DPRAvoidsuit"
	item_state = "DPRAvoidsuit"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30)
	strip_delay = 60
	actions_types = list()

/obj/item/clothing/suit/armor/vest/trauma
	name = "cybersun trauma team armor vest"
	icon_state = "traumavest"
	desc = "A set of stamped plasteel armor plates decorated with a medical cross and colors associated with the medical division of Cybersun."

/obj/item/clothing/suit/toggle/leather_jacket
	icon_state = "gothcoat"
	item_state = "gothcoat"

/obj/item/clothing/suit/toggle/leather_jacket/midriff
	name = "cropped leather jacket"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/cropped_leather_jacket.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/cropped_leather_jacket.dmi'
	desc = "A thick leather jacket that doesn't actually cover the waist. Rebel against what's expected of your jacket!"
	icon_state = "mid"
	item_state = "mid"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/tiny

/obj/item/clothing/suit/yakuza
	name = "tojo clan jacket"
	desc = "The jacket of a mad dog."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "MajimaJacket"
	item_state = "MajimaJacket"
	body_parts_covered = ARMS

/obj/item/clothing/suit/dutch
	name = "dutch's jacket"
	desc = "For those long nights on the beach in Tahiti."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "DutchJacket"
	item_state = "DutchJacket"
	body_parts_covered = ARMS

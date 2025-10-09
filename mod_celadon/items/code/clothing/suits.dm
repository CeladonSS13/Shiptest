//********************
// 		Suits
//********************
/obj/item/clothing/suit/armor/vest/tajaran_replica				// Исключение, засунут в лодаут в таком виде, понравился игрокам (пофикшена броня)
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "white tactical armor vest (replika)"
	desc = "Эта одежда была сделана в тёмных подвалах. Она похожа с виду на зимний тактический бронижилет, но это лишь реплика её."
	icon_state = "snowsuit"
	item_state = "snowsuit"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/t_scanner, /obj/item/radio)
	body_parts_covered = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "fire" = 0, "acid" = 0, "wound" = 0)
	cold_protection = NONE
	min_cold_protection_temperature = NONE
	heat_protection = NONE
	resistance_flags = NONE

/obj/item/clothing/suit/space/hardsuit/tajaran
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	allowed = list(/obj/item/gun,
					/obj/item/ammo_box,
					/obj/item/ammo_casing,
					/obj/item/melee/baton,
					/obj/item/restraints/handcuffs,
					/obj/item/tank/internals,
					/obj/item/melee/knife/combat)

/obj/item/clothing/head/helmet/space/hardsuit/tajaran
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/helmetdpra.dmi'

/obj/item/clothing/suit/space/hardsuit/tajaran/void_nka
	name = "new kingdom mercantile voidsuit"
	desc = "An amalgamation of old civilian voidsuits and diving suits. This bulky space suit is used by the crew of the New Kingdom's mercantile navy."
	icon_state = "nkavoid"
	item_state = "nkavoid"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30, "wound" = 20)
	strip_delay = 60
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_nka

/obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_nka
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/helmetdpra.dmi'
	name = "new kingdom mercantile voidsuit helmet"
	desc = "An amalgamation of old civilian voidsuits and diving suits. This bulky space suit is used by the crew of the New Kingdom's mercantile navy."
	icon_state = "nkavoid"
	item_state = "nkavoid"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30, "wound" = 20)
	strip_delay = 60
	actions_types = list()

/obj/item/clothing/suit/space/hardsuit/tajaran/void_dpra
	name = "people's volunteer spacer militia voidsuit"
	desc = "A refitted, sturdy voidsuit created from Hegemony models acquired during the liberation of Gakal'zaal. These armored models are issued to the People's Volunteer Spacer Militia."
	icon_state = "DPRAvoidsuit"
	item_state = "DPRAvoidsuit"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30, "wound" = 20)
	strip_delay = 60
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_dpra

/obj/item/clothing/head/helmet/space/hardsuit/tajaran/void_dpra
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/helmet.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/helmetdpra.dmi'
	name = "people's volunteer spacer militia voidsuit helmet"
	desc = "A refitted, sturdy voidsuit created from Hegemony models acquired during the liberation of Gakal'zaal. These armored models are issued to the People's Volunteer Spacer Militia."
	icon_state = "DPRAvoidsuit"
	item_state = "DPRAvoidsuit"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 100, "rad" = 40, "fire" = 40, "acid" = 30, "wound" = 20)
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
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/cropped_leather_jacket.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/cropped_leather_jacket.dmi'
	desc = "A thick leather jacket that doesn't actually cover the waist. Rebel against what's expected of your jacket!"
	icon_state = "mid"
	item_state = "mid"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/tiny

/obj/item/clothing/suit/yakuza
	name = "tojo clan jacket"
	desc = "The jacket of a mad dog."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "MajimaJacket"
	item_state = "MajimaJacket"
	body_parts_covered = ARMS

/obj/item/clothing/suit/dutch
	name = "dutch's jacket"
	desc = "For those long nights on the beach in Tahiti."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "DutchJacket"
	item_state = "DutchJacket"
	body_parts_covered = ARMS

/obj/item/clothing/suit/armadyne
	name = "Red Coat"
	desc = "A greatcoat enhanced with a special style for those with a commanding presence."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "armadyne_trench"
	item_state = "armadyne_trench"

/obj/item/clothing/suit/toggle/blackhs
	name = "black replica greatcoat"
	desc = "A replica HoS greatcoat, enhanced with a special style for those with a commanding presence."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "blackhs"
	item_state = "blackhs"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST | ARMS | GROIN
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 50, "rad" = 0, "fire" = 50, "acid" = 50)
	togglename = "buttons"

/obj/item/clothing/suit/chaplainsuit/shrinehand
	name = "shrinehand robe"
	desc = "Won't help you communicate with spirits, but you'll certainly look the part."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/costume.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/under/in_hands/costume_left.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/under/in_hands/costume_right.dmi'
	icon_state = "shrinehand"
	item_state = "shrinehand"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	flags_inv = HIDEJUMPSUIT

// Продолжение тут code/modules/jobs/job_types/chaplain/chaplain_costumes.dm в арке

/obj/item/clothing/suit/blutigen_kimono
	name = "Blutigen kimono"
	desc = "For the eyes bestowed upon this shall seek adventure..."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/costume.dmi'
	icon_state = "blutigen_kimono"
	item_state = "blutigen_kimono"
	body_parts_covered = CHEST | GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/yukata
	name = "black yukata"
	desc = "A comfortable black cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/costume.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/under/in_hands/costume_left.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/under/in_hands/costume_right.dmi'
	icon_state = "yukata1"
	item_state = "yukata1"
	body_parts_covered = CHEST | GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/yukata/green
	name = "green yukata"
	desc = "A comfortable green cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon_state = "yukata2"
	item_state = "yukata2"

/obj/item/clothing/suit/yukata/white
	name = "white yukata"
	desc = "A comfortable white cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon_state = "yukata3"
	item_state = "yukata3"

/obj/item/clothing/suit/kimono
	name = "black kimono"
	desc = "A luxurious black silk kimono with traditional flair, ideal for elegant festive occasions."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/under/overlay/costume.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/under/in_hands/costume_left.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/under/in_hands/costume_right.dmi'
	icon_state = "kimono1"
	item_state = "kimono1"
	body_parts_covered = CHEST | GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/kimono/red
	name = "red kimono"
	desc = "A luxurious red silk kimono with traditional flair, ideal for elegant festive occasions."
	icon_state = "kimono2"
	item_state = "kimono2"

/obj/item/clothing/suit/kimono/purple
	name = "purple kimono"
	desc = "A luxurious purple silk kimono with traditional flair, ideal for elegant festive occasions."
	icon_state = "kimono3"
	item_state = "kimono3"

/obj/item/clothing/suit/jacket/cherno
	name = "silver-buttoned coat"
	desc = "A comfy-looking blue coat. It looks a bit fancy, with shiny silver buttons and a few belts!"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "chernocoat"
	item_state = "chernocoat"
	body_parts_covered = CHEST | GROIN | ARMS
	cold_protection = CHEST | GROIN | ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/suit/jacket/brasspriest
	name = "brasspriest coat"
	desc = "A reddish coat with brass-clad parts embed into said coat. You can hear the faint noise of some cogs turning from time to time inside."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "brasspriest"
	item_state = "brasspriest"
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	cold_protection = CHEST | GROIN | LEGS | ARMS

/obj/item/clothing/suit/razurathcoat
	name = "Golden Nanotrasen Officer Coat"
	desc = "A fancy Nanotrasen officer coat. Now darker, golder, and cooler than ever!"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "razurath_coat"
	item_state = "razurath_coat"

/obj/item/clothing/suit/jacket/bomber
	name = "old hoodie"
	desc = "A somewhat well worn jacket, appears to be way too big considering who owns it."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "bomber"
	item_state = "bomber"

/obj/item/clothing/suit/toggle/labcoat/tenrai
	name = "Tenrai labcoat"
	desc = "A labcoat crafted from a variety of pristine materials, sewn together with a frightening amount of skill. The fabric is aery, smooth as silk, and exceptionally pleasant to the touch. The golden stripes are visible in the dark, working as a beacon to the injured. A small label on the inside of it reads \"Tenrai Kitsunes Supremacy\"."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	base_icon_state = "tenraicoat"
	icon_state = "tenraicoat"
	item_state = "tenraicoat"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/toggle/labcoat/tenrai/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
	. = ..()
	if(!isinhands)
		. += emissive_appearance(icon_file, "[icon_state]-emissive", src, alpha = src.alpha)

/obj/item/clothing/suit/jacket/gorlex_harness
	name = "engine technician harness"
	desc = "A blood-red engineering technician harness. You can't seem to figure out a use to it, but it seems to seal magnetically in some places."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "gorlexharness"
	item_state = "gorlexharness"

// /obj/item/clothing/head/hooded/occult
// 	name = "hood"
// 	desc = "Certainly makes you look more ominous."
// icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
// mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
// 	icon_state = "occulthood"
// 	item_state = "occulthood"
// 	supports_variations = NONE

/obj/item/clothing/suit/occult
	name = "occult collector's coat"
	desc = "A big, heavy coat lined with leather and ivory cloth, adorned with a hood. It looks dusty."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "occultcoat"
	item_state = "occultcoat"
	// hoodtype = /obj/item/clothing/head/hooded/occult
	supports_variations = NONE

/obj/item/clothing/suit/scraparmour
	name = "scrap armour"
	desc = "A shoddily crafted piece of armour. It provides no benefit apart from being clunky."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/suit.dmi'
	icon_state = "scraparmor"
	item_state = "scraparmor"
	body_parts_covered = CHEST

/obj/item/clothing/suit/renuar
	name = "renuar suit"
	desc = "This is renuar suit. Worn."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/costume.dmi'
	icon_state = "renuar"
	item_state = "renuar"
	cold_protection = CHEST | GROIN | LEGS | ARMS

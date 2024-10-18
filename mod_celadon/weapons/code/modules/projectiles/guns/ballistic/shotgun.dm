/obj/item/gun/ballistic/automatic/assault/saiga
	name = "Saiga-410 \"Saiga\""
	desc = "Cамозарядный гладкоствольный карабин, разработанный на Ижевском машиностроительном заводе на базе автомата Калашникова. Предназначен для промысловой и любительской охоты на мелкого и среднего зверя и птицу, может использоваться в качестве спортивно-тренировочного оружия. Калибр 410х76mm."
	icon = 'mod_celadon/_storge_icons/icons/weapons/obj/saiga.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/weapons/hands/saiga_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/weapons/hands/saiga_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/weapons/overlay/saiga_onmob.dmi'
	icon_state = "saiga"
	item_state = "saiga"

	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/saiga
	fire_sound = 'sound/weapons/gun/shotgun/bulldog.ogg'
	show_magazine_on_sprite = TRUE
	show_ammo_capacity_on_magazine_sprite = FALSE
	internal_magazine = FALSE
	casing_ejector = TRUE
	tac_reloads = TRUE
	pickup_sound =  'sound/items/handling/rifle_pickup.ogg'
	manufacturer = MANUFACTURER_SCARBOROUGH

	w_class = WEIGHT_CLASS_BULKY

	gun_firenames = list(FIREMODE_SEMIAUTO = "matter semi-auto", FIREMODE_FULLAUTO = "matter full auto")
	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_FULLAUTO)
	semi_auto = TRUE
	vary_fire_sound = FALSE
	suppressed_sound = 'sound/weapons/gun/smg/shot_suppressed.ogg'

	load_sound = 'sound/weapons/gun/rifle/ar_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/rifle/ar_reload.ogg'
	eject_sound = 'sound/weapons/gun/rifle/ar_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/rifle/ar_unload.ogg'

	rack_sound = 'sound/weapons/gun/rifle/ar_cock.ogg'

	wield_delay = 1 SECONDS
	fire_delay = 0.4 SECONDS // this NEEDS the old delay.
	spread = 4
	spread_unwielded = 16
	recoil = 1
	recoil_unwielded = 4
	wield_slowdown = 0.6
	wield_delay = 0.65 SECONDS

/obj/item/gun/ballistic/automatic/assault/saiga/Initialize()
	. = ..()

/obj/item/gun/ballistic/automatic/assault/saiga/no_mag
	spawnwithmagazine = FALSE

EMPTY_GUN_HELPER(automatic/assault/saiga)

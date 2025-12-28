// MARK: SAIGA
/obj/item/gun/ballistic/automatic/assault/saiga
	name = "Saiga-410 \"Saiga\""
	// Извините, не удержался.
	//desc = "Cамозарядный гладкоствольный карабин, разработанный на Ижевском машиностроительном заводе на базе автомата Калашникова. Предназначен для промысловой и любительской охоты на мелкого и среднего зверя и птицу, может использоваться в качестве спортивно-тренировочного оружия. Калибр 410х76mm."
	desc ="Pretty old shotgun that was designed in years before of space age. Chambered in .410"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/saiga_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/saiga_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/saiga_onmob.dmi'
	icon_state = "saiga"
	item_state = "saiga"

	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK

	default_ammo_type = /obj/item/ammo_box/magazine/saiga
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/saiga, /obj/item/ammo_box/magazine/saiga/medium, /obj/item/ammo_box/magazine/saiga/drum
	)
	fire_sound = 'sound/weapons/gun/shotgun/bulldog.ogg'
	show_magazine_on_sprite = TRUE
	unique_mag_sprites_for_variants = TRUE
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
NO_MAG_GUN_HELPER(automatic/assault/saiga)

//https://github.com/CeladonSS13/Shiptest/pull/1739
/obj/item/gun/ballistic/shotgun/automatic/combat
	name = "combat shotgun"
	desc = "A semi-automatic shotgun with tactical furniture and six-shell capacity underneath."
	icon_state = "cshotgun"
	item_state = "shotgun_combat"
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	fire_delay = 5
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/com
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/com,
	)
	w_class = WEIGHT_CLASS_BULKY
	casing_ejector = TRUE


/obj/item/gun/ballistic/shotgun/automatic/combat/compact
	name = "compact combat shotgun"
	desc = "A compact version of the semi-automatic combat shotgun. For close encounters."
	icon_state = "cshotgunc"
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/com/compact
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/com/compact,
	)
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM


// MARK: Возвращаем старые пушки

// Dual Feed Shotgun
/obj/item/gun/ballistic/shotgun/automatic/negotiator/old
	name = "cycler shotgun"
	desc = "An advanced shotgun with two separate magazine tubes, allowing you to quickly toggle between ammo types."
	// у него нет спрайтов на космонавтике. Пофиксите
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob_old.dmi'

	icon_state = "cycler"
	item_state = "shotgun_combat"
	inhand_x_dimension = 64
	inhand_y_dimension = 64

	w_class = WEIGHT_CLASS_BULKY

	semi_auto = TRUE
	casing_ejector = TRUE

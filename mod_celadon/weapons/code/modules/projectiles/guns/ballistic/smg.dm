// MARK: RETURN OLD GUNS
/obj/item/gun/ballistic/automatic/smg/wt550
	name = "\improper VI WT-550 Automatic Rifle"
	desc = "A classic ballistic PDW developed decades ago and produced by Vigilitas Interstellar to this day. Uses 4.6x30mm rounds." //вернул старое описание
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'
	icon_state = "wt550"
	item_state = "wt550"
	default_ammo_type = /obj/item/ammo_box/magazine/wt550m9
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/wt550m9,
	)
	actions_types = list()
	show_magazine_on_sprite = TRUE
	show_magazine_on_sprite_ammo = TRUE
	empty_indicator = TRUE
	manufacturer = MANUFACTURER_VIGILITAS
	fire_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'

/obj/item/gun/ballistic/automatic/smg/wt550/no_mag
	default_ammo_type = FALSE

/obj/item/gun/ballistic/automatic/smg/vector
	name = "\improper Vector carbine"
	desc = "An outdated police carbine based on an old design originating from earth, Solar Federation. Modified by early Nanotrasen and used as an uncommon security SMG. It's also popular among pirates. Chambered in 9x18mm."
	//desc = "A police carbine based on a pre-Night of Fire SMG design. Most of the complex workings have been removed for reliability. Chambered in 9x18mm."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob_old.dmi'
	icon_state = "vector"
	item_state = "vector"
	default_ammo_type = /obj/item/ammo_box/magazine/m9mm_expedition
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/m9mm_expedition,
	) //you guys remember when the autorifle was chambered in 9mm
	bolt_type = BOLT_TYPE_LOCKING
	show_magazine_on_sprite = TRUE
	weapon_weight = WEAPON_LIGHT
	fire_sound = 'sound/weapons/gun/smg/vector_fire.ogg'
	manufacturer = MANUFACTURER_NANOTRASEN_OLD
NO_MAG_GUN_HELPER(automatic/smg/vector)

// Дефайн отвечающий за создание датума с балистическим оружием без магазина
NO_MAG_GUN_HELPER(automatic/smg/skm_carbine/saber)
NO_MAG_GUN_HELPER(automatic/smg/skm_carbine)

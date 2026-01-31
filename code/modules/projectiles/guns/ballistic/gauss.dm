/obj/item/gun/ballistic/automatic/powered/gauss
	name = "prototype gauss rifle"
	desc = "An experimental Nanotrasen rifle with a high capacity. Useful for putting down crowds. Chambered in ferromagnetic pellets."
	icon = 'icons/obj/guns/manufacturer/nanotrasen_sharplite/48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/gauss_hands_left.dmi'		// [CELADON-EDIT]
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/gauss_hands_right.dmi'	// [/CELADON-EDIT]
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/pgauss.dmi'	// [/CELADON-EDIT]
	icon_state = "gauss"
	item_state = "gauss"	// [/CELADON-EDIT]
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE
	default_ammo_type = /obj/item/ammo_box/magazine/gauss
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/gauss,
	)
	fire_sound = 'sound/weapons/gun/gauss/magrifle.ogg'
	load_sound = 'sound/weapons/gun/gauss/rifle_reload.ogg'
	burst_size = 1
	fire_delay = 0.3 SECONDS
	spread = 0
	show_magazine_on_sprite = TRUE
	empty_indicator = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	charge_sections = 4
	ammo_x_offset = 2
	manufacturer = MANUFACTURER_NANOTRASEN

	spread = 0
	spread_unwielded = 25
	recoil = 0
	recoil_unwielded = 4
	wield_slowdown = HEAVY_RIFLE_SLOWDOWN
	wield_delay = 1 SECONDS
	fire_select_icon_state_prefix = "pellet_"
	wear_rate = 0 // magnetically accelerated, very little if any wear to the gun

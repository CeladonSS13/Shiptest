/obj/item/gun/ballistic/automatic/smg/wt550
	name = "\improper WT-550 Automatic Rifle"
	desc = "An outdated PDW, used centuries ago by Nanotrasen security elements. Compared to the newer version, this one is less compact, yet its fire rate is higher, which is why it continues to be used today. Uses 4.6x30mm rounds."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob_old.dmi'
	icon_state = "wt550"
	item_state = "arg"
	default_ammo_type = /obj/item/ammo_box/magazine/wt550m9
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/wt550m9,
	)
	actions_types = list()
	show_magazine_on_sprite = TRUE
	show_magazine_on_sprite_ammo = TRUE
	empty_indicator = TRUE
	manufacturer = MANUFACTURER_NANOTRASEN_OLD
	fire_sound = 'sound/weapons/gun/smg/smg_heavy.ogg'

/obj/item/gun/ballistic/automatic/smg/wt550/no_mag
	default_ammo_type = FALSE

/obj/item/gun/ballistic/automatic/smg/vector
	name = "\improper Vector carbine"
	desc = "A police carbine based on a pre-Night of Fire SMG design. Most of the complex workings have been removed for reliability. Chambered in 9x18mm."
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

// MARK: AMMO

/obj/item/ammo_box/magazine/wt550m9
	name = "toploaded magazine (4.6x30mm)"
	desc = "A compact, 30-round top-loading magazine for old WT-550 Automatic Rifle and new Resolution personal defense weapon. These rounds do okay damage with average performance against armor."

/obj/item/ammo_box/magazine/wt550m9/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 6)]"

/obj/item/ammo_box/magazine/wt550m9/ap
	name = "toploaded magazine (4.6x30mm AP)"
	desc = "A compact, 30-round top-loading magazine for old WT-550 Automatic Rifle and new Resolution personal defense weapon.  These armor-piercing rounds are great at piercing protective equipment, but lose some stopping power."

/obj/item/ammo_box/magazine/m9mm_expedition
	name = "SMG magazine (9x18mm)"
	desc = "A 30-round magazine for 9x18mm submachine guns. These rounds do okay damage, but struggle against armor."

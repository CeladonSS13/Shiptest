/obj/item/gun/energy/laser/retro
	name ="SL L-104 Laser Gun"
	desc = "An antiquated model of the L-204, no longer used or sold by Sharplite. Nevertheless, the sheer popularity of this model makes it a somewhat common sight to this day."
	icon_state = "retro"
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun,
		/obj/item/stock_parts/cell/gun/upgraded,
		/obj/item/stock_parts/cell/gun/empty,
		/obj/item/stock_parts/cell/gun/upgraded/empty
	)

/obj/item/gun/energy/laser/retro/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/lasercannon/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/laser/captain
	name = "SL X-00 Laser Gun"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/onmob.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "This is the SL X-00, an antique laser gun, out of production for decades and well beyond anyone's capacity to recreate. All craftsmanship is of the highest quality. It is decorated with ashdrake leather and chrome. The gun menaces with spikes of energy. On the item is an image of a space ship. The ship is exploding."
	force = 10
	ammo_x_offset = 3
	ammo_type = list(/obj/item/ammo_casing/energy/laser/antique)
	selfcharge = TRUE
	internal_magazine = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	manufacturer = MANUFACTURER_SHARPLITE_NEW

	spread = 2
	spread_unwielded = 5

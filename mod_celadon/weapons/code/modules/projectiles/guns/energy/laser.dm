// де факто это вот этот объект /obj/item/gun/energy/laser/retro
/obj/item/gun/energy/laser
	name = "SL L-104 laser gun"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	ammo_type = list(/obj/item/ammo_casing/energy/laser)
	w_class = WEIGHT_CLASS_NORMAL
	manufacturer = MANUFACTURER_SHARPLITE

// Добавляем поддержку батарей типа Эохомы и типа Шарплайта
/obj/item/gun/energy/laser/retro
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun,
		/obj/item/stock_parts/cell/gun/upgraded,
		/obj/item/stock_parts/cell/gun/empty,
		/obj/item/stock_parts/cell/gun/upgraded/empty,
		/obj/item/stock_parts/cell/gun/sharplite,
		/obj/item/stock_parts/cell/gun/sharplite/plus,
		/obj/item/stock_parts/cell/gun/sharplite/empty,
		/obj/item/stock_parts/cell/gun/sharplite/plus/empty,
	)

/obj/item/gun/energy/laser/retro/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/lasercannon/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/laser/captain
	name = "SL X-00 Antique Laser Gun"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "This is the SL X-00, an antique laser gun, out of production for decades and well beyond anyone's capacity to recreate. All craftsmanship is of the highest quality. It is decorated with ashdrake leather and chrome. The gun menaces with spikes of energy. On the item is an image of a space ship. The ship is exploding."
	force = 10
	ammo_x_offset = 3
	ammo_type = list(/obj/item/ammo_casing/energy/laser/antique)
	selfcharge = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	manufacturer = MANUFACTURER_SHARPLITE

	spread = 2
	spread_unwielded = 5

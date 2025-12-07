// де факто это вот этот объект /obj/item/gun/energy/laser/retro
/obj/item/gun/energy/laser
	name = "SL L-104 laser gun"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
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

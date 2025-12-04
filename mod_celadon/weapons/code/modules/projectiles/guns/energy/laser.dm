
// де факто это вот этот объект/obj/item/gun/energy/laser/retro
/obj/item/gun/energy/laser
	name = "SL L-104 laser gun"
	desc = "A basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal."
	w_class = WEIGHT_CLASS_NORMAL
	manufacturer = MANUFACTURER_SHARPLITE


/obj/item/gun/energy/laser/retro/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/lasercannon/empty_cell
	spawn_no_ammo = TRUE

/*
// Копия копии копий копии копии копии копии... В общем говно.
/obj/item/gun/energy/laser/l_old/iot
	name = "\improper SL E-255 Ultimate"
	desc = "An advanced semi-automatic dual-mode energy shotgun. This weapon is a big improvement since the last model. It provides excellent fire support for all Nanotrasen's security forces." //убираем упоминание несуществующего компутера, переписываем (с) хомяки
	//desc = "An energy shotgun with an integrated computer system for surveillance and statistics tracking."
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob_old.dmi'

	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/64x_guns_left_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/64x_guns_right_old.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	icon_state = "iotshotgun"
	item_state = "shotgun_combat"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/scatter/ultima)
	w_class = WEIGHT_CLASS_BULKY
	var/obj/item/modular_computer/integratedNTOS
	var/NTOS_type = /obj/item/modular_computer/internal
	manufacturer = MANUFACTURER_SHARPLITE_NEW

/obj/item/gun/energy/laser/l_old/iot/Initialize()
	. = ..()
	if(NTOS_type)
		integratedNTOS = new NTOS_type(src)
		integratedNTOS.physical = src

/obj/item/gun/energy/laser/l_old/iot/attack_self(mob/user)
	. = ..()
	if(!integratedNTOS)
		return
	integratedNTOS.interact(user)

/obj/item/gun/energy/laser/l_old/iot/lethal
	desc = "An energy shotgun with an integrated computer system for surveillance and statistics tracking. This one appears to be modified to fire lethal beams."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/ultima)

*/

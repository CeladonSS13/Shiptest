/obj/item/gun/energy/e_gun/plasmapistol_cryo
	name = "SL PPD-142 'Cryogelida' plasma pistol"
	desc = "A fresh-new experimental plasma pistol manufactured by Nanotrasen-Sharplite, it uses supercooled plasma blasts to subdue users' enemies."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ntsl_lasers.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/weapons/in_hands/guns_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/weapons/in_hands/guns_righthand.dmi'
	icon_state = "plasma_pistol_cryo"
	charge_sections = 4
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/plasmadisable, /obj/item/ammo_casing/energy/laser/plasmalaserweak)
	default_ammo_type = /obj/item/stock_parts/cell/gun

	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

	fire_delay = 5

	gun_firemodes = list(FIREMODE_SEMIAUTO)
	default_firemode = FIREMODE_SEMIAUTO

	wield_delay = 0.2 SECONDS
	wield_slowdown = 0.1
	spread_unwielded = 5

	//Нигредо и Альбедо

/obj/item/gun/energy/e_gun/plasmapistol_fire
	name = "SL PPD-238 'Pyrogelida' plasma pistol"
	desc = "A fresh-new experimental plasma pistol manufactured by Nanotrasen-Sharplite, it uses superheated plasma blasts to furiously burn users' enemies."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ntsl_lasers.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/weapons/in_hands/guns_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/weapons/in_hands/guns_righthand.dmi'
	icon_state = "plasma_pistol_fire"
	charge_sections = 4
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/laser/burn_plasmalaserweak, /obj/item/ammo_casing/energy/laser/burn_plasmalaser)
	default_ammo_type = /obj/item/stock_parts/cell/gun

	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

	fire_delay = 5

	gun_firemodes = list(FIREMODE_SEMIAUTO)
	default_firemode = FIREMODE_SEMIAUTO

	wield_delay = 0.2 SECONDS
	wield_slowdown = LASER_PISTOL_SLOWDOWN
	spread_unwielded = 5

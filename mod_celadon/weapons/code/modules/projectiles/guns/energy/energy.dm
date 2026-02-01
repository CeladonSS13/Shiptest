// Баланс ионок. Снаряд находится в mod_celadon\weapons\code\modules\projectiles\projectile\energy\beams.dm
/obj/item/gun/energy/ionrifle
	w_class = WEIGHT_CLASS_BULKY

// Мьелниз наделал эти изменения.
// https://github.com/CeladonSS13/Shiptest/pull/845
/obj/item/gun/energy/laser/captain
	internal_cell = TRUE

/obj/item/gun/energy/laser/bluetag
	internal_cell = TRUE

/obj/item/gun/energy/laser/redtag
	internal_cell = TRUE

/obj/item/gun/energy/spur
	internal_cell = TRUE


// MARK: RETURN OLD

/obj/item/gun/energy/e_gun/e_old
	icon_state = "energy"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/disabler)
	// таким образом НТ пушки будут принимать и НТшные магазины, и Эохомы
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
	manufacturer = MANUFACTURER_SHARPLITE_NEW

/obj/item/gun/energy/e_gun/e_old/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/e_gun/e_old/mini
	name = "miniature energy gun"
	desc = "A small, pistol-sized energy gun with a built-in flashlight. It has two settings: disable and kill."
	icon_state = "mini"
	item_state = "gun"
	w_class = WEIGHT_CLASS_SMALL
	default_ammo_type = /obj/item/stock_parts/cell/gun/mini
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun/mini,
		/obj/item/stock_parts/cell/gun/sharplite/mini,
	)
	throwforce = 11 //This is funny, trust me.
	ammo_x_offset = 2
	charge_sections = 3
	wield_delay = 0.2 SECONDS
	wield_slowdown = LASER_PISTOL_SLOWDOWN

	spread = 2
	spread_unwielded = 5

/obj/item/gun/energy/e_gun/e_old/mini/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/e_gun/e_old/hades // Перенёс изменения хомячков
	name = "SL AL-655 'Hades' energy rifle"
	desc = "Nanotrasen-Sharplite's premium assault energy rifle. This elite energy weapon is focused on heavy fire support. A powerful, but expensive and rare assault rifle." //новое описание без лора оффов
	// desc = "The standard issue rifle of Nanotrasen's Security Forces. Most have been put in long term storage following the ICW, and usually aren't issued to low ranking security divisions."
	icon_state = "energytac"
	ammo_x_offset = 2
	charge_sections = 5

	ammo_type = list(/obj/item/ammo_casing/energy/laser/assault, /obj/item/ammo_casing/energy/disabler/assault)
	//default_ammo_type = /obj/item/stock_parts/cell/gun/upgraded
	default_ammo_type = /obj/item/stock_parts/cell/gun //nerfs the power cell to a standart one

	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_SEMIAUTO

	fire_delay = 0.2 SECONDS

	wield_delay = 0.7 SECONDS
	wield_slowdown = HEAVY_LASER_RIFLE_SLOWDOWN
	spread_unwielded = 20

/obj/item/gun/energy/e_gun/e_old/old
	name = "prototype energy gun"
	desc = "NT-P:01 Prototype Energy Gun. Early stage development of a unique laser rifle that has a multifaceted energy lens, allowing the gun to alter the form of projectile it fires on command. The project was a dud, and Nanotrasen later acquired Sharplite to suit its laser weapon needs."
	icon_state = "protolaser"
	ammo_x_offset = 2
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/electrode/old)
	manufacturer = MANUFACTURER_NANOTRASEN_OLD

/obj/item/gun/energy/e_gun/e_old/hos
	name = "\improper X-01 MultiPhase Energy Gun"
	desc = "This is an expensive, modern recreation of an antique laser gun. This gun has several unique firemodes, but lacks the ability to recharge over time."
	default_ammo_type = /obj/item/stock_parts/cell/gun/upgraded
	icon_state = "hoslaser"
	force = 10
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hos, /obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/ion/hos, /obj/item/ammo_casing/energy/electrode/hos)
	shaded_charge = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	manufacturer = MANUFACTURER_SHARPLITE_NEW

/obj/item/ammo_casing/energy/laser/hos
	e_cost = 500

/obj/item/gun/energy/e_gun/e_old/hos/brazil
	name = "modified antique laser gun"
	desc = "It's somehow modified to have more firemodes."
	icon_state = "capgun_brazil_hos"
	item_state = "hoslaserkill0"
	manufacturer = MANUFACTURER_SHARPLITE

/obj/item/gun/energy/e_gun/e_old/hos/brazil/true
	desc = "This genuine antique laser gun, modified with an experimental suite of alternative firing modes based on the X-01 MultiPhase Energy Gun, is now truly one of the finest weapons in the frontier."
	icon_state = "capgun_hos"
	item_state = "hoslaserkill0"
	selfcharge = 1
	manufacturer = MANUFACTURER_SHARPLITE

/obj/item/gun/energy/e_gun/e_old/dragnet
	name = "\improper DRAGnet"
	desc = "The \"Dynamic Rapid-Apprehension of the Guilty\" net is a revolution in law enforcement technology."
	icon_state = "dragnet"
	item_state = "dragnet"
	lefthand_file = GUN_LEFTHAND_ICON
	righthand_file = GUN_RIGHTHAND_ICON
	ammo_type = list(/obj/item/ammo_casing/energy/net, /obj/item/ammo_casing/energy/trap)
	ammo_x_offset = 1

/obj/item/gun/energy/e_gun/e_old/dragnet/snare
	name = "Energy Snare Launcher"
	desc = "Fires an energy snare that slows the target down."
	ammo_type = list(/obj/item/ammo_casing/energy/trap)

/obj/item/gun/energy/e_gun/e_old/nuclear
	name = "advanced energy gun"
	desc = "An energy gun with an experimental miniaturized nuclear reactor that automatically charges the internal power cell."
	icon_state = "nucgun"
	item_state = "nucgun"

	lefthand_file = GUN_LEFTHAND_ICON
	righthand_file = GUN_RIGHTHAND_ICON

	charge_delay = 10
	can_charge = FALSE
	internal_magazine = TRUE
	ammo_x_offset = 2
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/disabler)
	selfcharge = 1
	var/reactor_overloaded
	var/fail_tick = 0
	var/fail_chance = 0
	manufacturer = MANUFACTURER_NONE

/obj/item/gun/energy/e_gun/e_old/nuclear/process(seconds_per_tick)
	if(fail_tick > 0)
		fail_tick -= seconds_per_tick * 0.5
	..()

/obj/item/gun/energy/e_gun/e_old/nuclear/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	failcheck()
	update_appearance()
	..()

/obj/item/gun/energy/e_gun/e_old/nuclear/proc/failcheck()
	if(prob(fail_chance) && isliving(loc))
		var/mob/living/M = loc
		switch(fail_tick)
			if(0 to 200)
				fail_tick += (2*(fail_chance))
				M.rad_act(40)
				to_chat(M, span_userdanger("Your [name] feels warmer."))
			if(201 to INFINITY)
				SSobj.processing.Remove(src)
				M.rad_act(80)
				reactor_overloaded = TRUE
				to_chat(M, span_userdanger("Your [name]'s reactor overloads!"))

/obj/item/gun/energy/e_gun/e_old/nuclear/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	fail_chance = min(fail_chance + round(15/severity), 100)

/obj/item/gun/energy/e_gun/e_old/nuclear/update_overlays()
	. = ..()
	if(reactor_overloaded)
		. += "[icon_state]_fail_3"
		return
	switch(fail_tick)
		if(0)
			. += "[icon_state]_fail_0"
		if(1 to 150)
			. += "[icon_state]_fail_1"
		if(151 to INFINITY)
			. += "[icon_state]_fail_2"

/obj/item/gun/energy/e_gun/e_old/adv_stopping
	name = "advanced stopping revolver"
	desc = "An advanced energy revolver with the capacity to shoot both disabler and lethal lasers, as well as futuristic safari nets."
	icon_state = "bsgun"
	item_state = "gun"
	force = 7
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser/hos, /obj/item/ammo_casing/energy/trap)
	ammo_x_offset = 1
	shaded_charge = TRUE
	manufacturer = MANUFACTURER_SHARPLITE_NEW

/obj/item/gun/energy/e_gun/e_old/smg
	name = "\improper E-TAR SMG"
	desc = "A dual-mode energy gun capable of discharging weaker shots at a much faster rate than the standard energy gun."
	icon_state = "esmg"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/smg, /obj/item/ammo_casing/energy/disabler/smg)
	ammo_x_offset = 2
	charge_sections = 3
	weapon_weight = WEAPON_LIGHT

	fire_delay = 0.13 SECONDS
	wield_slowdown = LASER_SMG_SLOWDOWN

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_SEMIAUTO
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE

/obj/item/gun/energy/e_gun/e_old/iot
	name = "\improper E-SG 500 Second Edition"
	desc = "A improved version of the E-SG 255. It now includes two firing modes, disable and kill, while still keeping that sweet integrated computer. Please note that the screen is right next to the switch mode button."
	icon_state = "iotshotgun"
	fire_delay = 0.6 SECONDS
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/laser/ultima, /obj/item/ammo_casing/energy/disabler/scatter/ultima)
	charge_sections = 5
	ammo_x_offset = 2
	automatic_charge_overlays = TRUE

	w_class = WEIGHT_CLASS_BULKY
	var/obj/item/modular_computer/integratedNTOS
	var/NTOS_type = /obj/item/modular_computer/internal

/obj/item/gun/energy/e_gun/e_old/iot/examine(mob/user)
	. = ..()
	. += "You can use integrated computer by pressing the <b>secondary action</b> key. By default, this is <b>Shift + Space</b>"

/obj/item/gun/energy/e_gun/e_old/iot/Initialize()
	. = ..()
	if(NTOS_type)
		integratedNTOS = new NTOS_type(src)
		integratedNTOS.physical = src

/obj/item/gun/energy/e_gun/e_old/iot/secondary_action(user)
	if(!integratedNTOS)
		return
	integratedNTOS.interact(user)
	. = ..()

/obj/item/gun/energy/e_gun/e_old/hades/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/ionrifle/carbine/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/disabler/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/e_gun/advtaser/empty_cell
	spawn_no_ammo = TRUE

// Батарейки (Респрайты / Рефлавор)
/obj/item/stock_parts/cell/gun
	name = "energy power cell"
	desc = "A proprietary power cell primarily used by Sharplite Energy weaponry. Nanotrasen's large market share has forced some weapon developers to include adapters for these cells"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/power.dmi'
	icon_state = "energy-cell"
	base_state = "energy"	// Оверлей - Цвет-заряда батареек
	reskin = TRUE

/obj/item/stock_parts/cell/gun/empty
	start_empty = TRUE

/obj/item/stock_parts/cell/gun/upgraded
	name = "upgraded energy power cell"
	desc = "An high-capacity weapon cell used exclusively by Sharplite Energy weaponry. They are a great improvement over the stock cell, and are frequently sought after by collectors, soldiers, and operators of heavy lasers alike."
	icon_state = "energy_plus-cell"

/obj/item/stock_parts/cell/gun/upgraded/empty
	start_empty = TRUE

/obj/item/stock_parts/cell/gun/sharplite
	name = "plasma power cell"
	desc = "A proprietary power cell primarily used by Sharplite Plasma weaponry. Nanotrasen's large market share has forced some weapon developers to include adapters for these cells"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/power.dmi'
	icon_state = "plasma-cell"
	base_state = "plasma"	// Оверлей - Цвет-заряда батареек
	maxcharge = 15000
	chargerate = 1000
	reskin = TRUE

/obj/item/stock_parts/cell/gun/sharplite/plus
	name = "upgraded plasma power cell"
	desc = "An high-capacity weapon cell used exclusively by Sharplite Plasma weaponry. They are a great improvement over the stock cell, and are frequently sought after by collectors, soldiers, and operators of heavy lasers alike."
	icon_state = "plasma_plus-cell"
	maxcharge = 30000

/obj/item/stock_parts/cell/gun/mini
	icon = 'icons/obj/power.dmi'
	reskin = FALSE

/obj/item/stock_parts/cell/gun/solgov
	icon = 'icons/obj/power.dmi'
	reskin = FALSE

/obj/item/stock_parts/cell/gun/large
	icon = 'icons/obj/power.dmi'
	reskin = FALSE

/obj/item/stock_parts/cell/gun/kalix
	icon = 'icons/obj/power.dmi'
	reskin = FALSE

/obj/item/stock_parts/cell/gun/pgf
	icon = 'icons/obj/power.dmi'
	reskin = FALSE

/obj/item/stock_parts/cell/gun/sharplite/mini
	icon = 'icons/obj/power.dmi'
	reskin = FALSE

// Выше вместимость увеличена была в 1.5 раза, и расход тоже соответственно
/obj/item/ammo_casing/energy/lasergun/sharplite/sniper
	e_cost = 3000 // 5 per regular cell 10 per upgraded cell

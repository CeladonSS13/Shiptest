#define SHARPLITE_ATTACHMENTS list(/obj/item/attachment/laser_sight,/obj/item/attachment/rail_light,/obj/item/attachment/bayonet,/obj/item/attachment/energy_bayonet,/obj/item/attachment/scope,/obj/item/attachment/gun,/obj/item/attachment/foldable_stock/discharger,/obj/item/attachment/foldable_stock/discharger_inteq)
#define SHARPLITE_ATTACH_SLOTS list(ATTACHMENT_SLOT_MUZZLE = 1, ATTACHMENT_SLOT_SCOPE = 1, ATTACHMENT_SLOT_RAIL = 1)

// Баланс ионок. Снаряд находится в mod_celadon\weapons\code\modules\projectiles\projectile\energy\beams.dm
/obj/item/gun/energy/ionrifle
	w_class = WEIGHT_CLASS_BULKY

// Мьелниз наделал эти изменения.
// https://github.com/CeladonSS13/Shiptest/pull/845
/obj/item/gun/energy/laser/bluetag
	internal_magazine = TRUE

/obj/item/gun/energy/laser/redtag
	internal_magazine = TRUE

/obj/item/gun/energy/spur
	internal_magazine = TRUE


// NANOTRASEN-SHARPLITE

/obj/item/gun/energy/e_gun/nanotrasen
	name = "nanotrasen-sharplite gun"
	desc = "A gun that you only use to shoot bad people."
	icon_state = "patriot"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/onmob.dmi'
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun,
		/obj/item/stock_parts/cell/gun/upgraded,
		/obj/item/stock_parts/cell/gun/empty,
		/obj/item/stock_parts/cell/gun/upgraded/empty
	)
	valid_attachments = SHARPLITE_ATTACHMENTS
	w_class = WEIGHT_CLASS_BULKY
	manufacturer = MANUFACTURER_NANOTRASEN_LASER

/obj/item/gun/energy/e_gun/nanotrasen/patriot
	name = "SL X-10 'Patriot' Energy Carbine"
	desc = "A lightweight, comfortable to carry around energy gun. The 'Patriot' serves as Nanotrasen-Sharplites's primary security grade carbine, while also being an extremely modular weapon platform."
	icon_state = "patriot"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/nanotrasen, /obj/item/ammo_casing/energy/disabler/nanotrasen)
	charge_sections = 3
	shaded_charge = TRUE

	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 33,
			"y" = 17,
		)
	)

/obj/item/gun/energy/e_gun/nanotrasen/patriot/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/e_gun/nanotrasen/fuse
	name = "SL L-204 'Fuse' Laser Carbine"
	desc = "A basic energy-based laser carbine and somewhat of a predecessor to the X-10. Famed for its low price and reliability."
	icon_state = "fuse"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/nanotrasen/less)
	charge_sections = 3
	shaded_charge = TRUE

/obj/item/gun/energy/e_gun/nanotrasen/ember
	name = "SL X-26 'Ember' Miniature Energy Pistol"
	desc = "A lightweight, civilian marketed Sharplite pistol, popular among Vigilitas security personnel as a reliable dual-mode sidearm. Technically impressive."
	icon_state = "ember"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/nanotrasen/mini, /obj/item/ammo_casing/energy/disabler/nanotrasen/mini)
	charge_sections = 3
	shaded_charge = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo_type = /obj/item/stock_parts/cell/gun/mini
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun/mini,
		/obj/item/stock_parts/cell/gun/mini/empty,
	)
	throwforce = 11 //This is funny, trust me.
	ammo_x_offset = 2
	charge_sections = 3
	wield_delay = 0.2 SECONDS
	wield_slowdown = LASER_PISTOL_SLOWDOWN

	fire_delay = 0.2 SECONDS

	spread = 2
	spread_unwielded = 5

/obj/item/gun/energy/e_gun/nanotrasen/ember/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/e_gun/nanotrasen/hades
	name = "SL AL-655 'Hades' Energy Assault Rifle"
	desc = "A powerful, overcomplicated energy rifle built on a very expensive frame. While bulky and uncomfortable to manage, the amount of suppresive fire it can provide is matched only by heavy ballistic assault rifles."
	icon_state = "hades"
	ammo_x_offset = 2

	ammo_type = list(/obj/item/ammo_casing/energy/laser/assault/nanotrasen, /obj/item/ammo_casing/energy/disabler/assault/nanotrasen)

	shaded_charge = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_SEMIAUTO

	fire_delay = 0.2 SECONDS

	wield_delay = 0.7 SECONDS
	wield_slowdown = HEAVY_LASER_RIFLE_SLOWDOWN
	spread_unwielded = 20

	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 35,
			"y" = 15,
		)
	)

/obj/item/gun/energy/e_gun/nanotrasen/old
	name = "prototype energy gun"
	desc = "NT-P:01 Prototype Energy Gun. Early stage development of a unique laser rifle that has a multifaceted energy lens, allowing the gun to alter the form of projectile it fires on command. The project was a dud, and nanotrasen later acquired Sharplite to suit its laser weapon needs."
	icon_state = "protolaser"
	ammo_x_offset = 2
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/electrode/old)
	manufacturer = MANUFACTURER_NANOTRASEN_OLD
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/gun/energy/e_gun/nanotrasen/hos
	name = "\improper SL X-01 MultiPhase Energy Gun"
	desc = "An expensive, high-capacity, high-power energy pistol built on the X-00 chasis. Modified to have a wide array of energy settings, including a burst firemode. Favored by Vigilitas Security Directors."
	icon_state = "hoslaser"
	force = 10
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = list(/obj/item/ammo_casing/energy/laser/nanotrasen, /obj/item/ammo_casing/energy/disabler/nanotrasen, /obj/item/ammo_casing/energy/ion/hos, /obj/item/ammo_casing/energy/electrode/nanotrasen)
	shaded_charge = TRUE
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF //я не думаю, что оно должно быть индестрактбл
	manufacturer = MANUFACTURER_NANOTRASEN_LASER

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_BURST)
	default_firemode = FIREMODE_SEMIAUTO

	fire_delay = 0.3 SECONDS
	burst_size = 2
	burst_delay = 0.10 SECONDS

/obj/item/gun/energy/e_gun/nanotrasen/hos/brazil
	name = "modified antique laser gun"
	desc = "It's somehow modified to have more firemodes."
	icon_state = "capgun_brazil_hos"
	item_state = "hoslaserkill0"
	manufacturer = MANUFACTURER_NANOTRASEN_LASER

/obj/item/gun/energy/e_gun/nanotrasen/hos/brazil/true
	desc = "This genuine antique laser gun, modified with an experimental suite of alternative firing modes based on the X-01 MultiPhase Energy Gun, is now truly one of the finest weapons in the frontier."
	icon_state = "capgun_hos"
	item_state = "hoslaserkill0"
	selfcharge = 1
	manufacturer = MANUFACTURER_NANOTRASEN_LASER

/obj/item/gun/energy/e_gun/nanotrasen/dragnet
	name = "\improper DRAGnet"
	desc = "The \"Dynamic Rapid-Apprehension of the Guilty\" net is a revolution in law enforcement technology."
	icon_state = "dragnet"
	item_state = "dragnet"
	lefthand_file = GUN_LEFTHAND_ICON
	righthand_file = GUN_RIGHTHAND_ICON
	ammo_type = list(/obj/item/ammo_casing/energy/net, /obj/item/ammo_casing/energy/trap)
	ammo_x_offset = 1
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/gun/energy/e_gun/nanotrasen/dragnet/snare
	name = "Energy Snare Launcher"
	desc = "Fires an energy snare that slows the target down."
	ammo_type = list(/obj/item/ammo_casing/energy/trap)

/obj/item/gun/energy/e_gun/nanotrasen/maru
	name = "SL X-14 'Maru' Advanced Stopping Revolver"
	desc = "An advanced, heavy energy pistol that has the ability to shoot futurustic safari nets. The revolver look is mostly used for marketing."
	icon_state = "maru"
	item_state = "nt_generic"
	force = 7
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo_type = /obj/item/stock_parts/cell/gun/mini
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun/mini,
		/obj/item/stock_parts/cell/gun/mini/empty,
	)
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/nanotrasen, /obj/item/ammo_casing/energy/laser/nanotrasen, /obj/item/ammo_casing/energy/trap)
	ammo_x_offset = 1
	shaded_charge = TRUE
	manufacturer = MANUFACTURER_NANOTRASEN_LASER

/obj/item/gun/energy/e_gun/nanotrasen/discharger
	name = "\improper SL X-36 'Discharger' Energy SMG"
	desc = "An incredibly compact dual-mode energy SMG, designed for low-power fire support in the field. Although issued in limited numbers within Nanotrasen, it can still sometimes be seen in the hands of wealthy explorers and persistent security officers."
	icon_state = "discharger"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/smg, /obj/item/ammo_casing/energy/disabler/smg)
	ammo_x_offset = 2
	charge_sections = 3
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL

	fire_delay = 0.13 SECONDS
	wield_slowdown = LASER_SMG_SLOWDOWN
	shaded_charge = TRUE

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_SEMIAUTO
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE

	slot_available = list(
		ATTACHMENT_SLOT_RAIL = 1,
		ATTACHMENT_SLOT_STOCK = 1,
	)

	unique_attachments = list(
		/obj/item/attachment/foldable_stock/discharger
	)
	default_attachments = list(/obj/item/attachment/foldable_stock/discharger)

	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 32,
			"y" = 15,
		)
	)

/obj/item/gun/energy/e_gun/nanotrasen/discharger/inteq
	name = "\improper VEC-04 'Vuelo' Energy SMG"
	desc = "An incredibly compact dual-mode energy SMG, designed for low-power fire support in the field. Purchased or seized from Nanotrasen and now utilized by IRMG forces under a new paintjob."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/onmob.dmi'
	icon_state = "discharger_inteq"

	unique_attachments = list(
		/obj/item/attachment/foldable_stock/discharger_inteq
	)
	default_attachments = list(/obj/item/attachment/foldable_stock/discharger_inteq)

/obj/item/gun/energy/e_gun/nanotrasen/chirasu
	name = "\improper SL X-49 'Chirasu' Energy Shotgun"
	desc = "A cumbersome, variable energy weapon with a multifaceted lens allowing it to function similarly to a ballistic shotgun. Frequently used for breaching or providing supressive fire, it is the gold standart for heavier Vigilitas troopers."
	icon_state = "chirasu"
	fire_delay = 0.6 SECONDS
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/laser/shotgun/nanotrasen, /obj/item/ammo_casing/energy/disabler/scatter/shotgun/nanotrasen)
	charge_sections = 3
	ammo_x_offset = 2
	automatic_charge_overlays = TRUE
	randomspread = FALSE
	gun_firemodes = list(FIREMODE_SEMIAUTO)
	default_firemode = FIREMODE_SEMIAUTO
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM

	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 34,
			"y" = 15,
		)
	)

/obj/item/gun/energy/e_gun/nanotrasen/chirasu/inteq
	name = "\improper VEC-07 'Quemar' Energy Shotgun"
	desc = "A cumbersome, variable energy weapon with a multifaceted lens allowing it to function similarly to a ballistic shotgun. Purchased or seized from Nanotrasen and now utilized by IRMG forces under a new paintjob."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/inteq/onmob.dmi'
	icon_state = "chirasu_inteq"

/obj/item/gun/energy/e_gun/nanotrasen/parallax
	name = "SL L-211 'Parallax' Energy Marksman Rifle"
	desc = "An extensive modification on the X-10 frame, featuring stronger armor-piercing bolts and a decent scope. Rarely seen as a primary weapon among Vigilitas personnel due to its price and bulkiness, however it can still provide a good amount of battlefield control in the right hands."
	icon_state = "parallax"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/nanotrasen/dmr)
	ammo_x_offset = 1
	charge_sections = 3
	shaded_charge = TRUE
	manufacturer = MANUFACTURER_NANOTRASEN_LASER

	zoomable = TRUE
	wield_slowdown = RIFLE_SLOWDOWN
	aimed_wield_slowdown = LONG_RIFLE_AIM_SLOWDOWN
	wield_delay = 1 SECONDS
	fire_delay = 0.7 SECONDS

	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE

	spread = 0
	spread_unwielded = 40

	zoom_amt = DMR_ZOOM
	zoom_out_amt = 5

	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 35,
			"y" = 16,
		)
	)

//other stuff
//nucgun

/obj/item/gun/energy/e_gun/nuclear
	name = "advanced energy gun"
	desc = "An energy gun with an experimental miniaturized nuclear reactor that automatically charges the internal power cell."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/48x32.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/guns/manufacturer/nanotrasen_sharplite/onmob.dmi'
	icon_state = "nucgun"
	item_state = "nucgun"

	lefthand_file = GUN_LEFTHAND_ICON
	righthand_file = GUN_RIGHTHAND_ICON

	charge_delay = 10
	can_charge = FALSE
	internal_magazine = TRUE
	ammo_x_offset = 2
	ammo_type = list(/obj/item/ammo_casing/energy/laser/nanotrasen, /obj/item/ammo_casing/energy/disabler/nanotrasen)
	selfcharge = 1
	var/reactor_overloaded
	var/fail_tick = 0
	var/fail_chance = 0
	manufacturer = NONE

/obj/item/gun/energy/e_gun/nuclear/process(seconds_per_tick)
	if(fail_tick > 0)
		fail_tick -= seconds_per_tick * 0.5
	..()
/obj/item/gun/energy/e_gun/nuclear/shoot_live_shot(mob/living/user, pointblank = 0, atom/pbtarget = null, message = 1)
	failcheck()
	update_appearance()
	..()

/obj/item/gun/energy/e_gun/nuclear/proc/failcheck()
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

/obj/item/gun/energy/e_gun/nuclear/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	fail_chance = min(fail_chance + round(15/severity), 100)

/obj/item/gun/energy/e_gun/nuclear/update_overlays()
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

//disabler

/obj/item/gun/energy/disabler
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/nanotrasen)

//empty guns

/obj/item/gun/energy/e_gun/nanotrasen/hades/empty_cell
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
	desc = "A high-capacity weapon cell used exclusively by Sharplite Energy weaponry. They are a great improvement over the stock cell, and are frequently sought after by collectors, soldiers, and operators of heavy lasers alike."
	icon_state = "energy_plus-cell"
	base_state = "energy_plus"

/obj/item/stock_parts/cell/gun/upgraded/empty
	start_empty = TRUE

/obj/item/stock_parts/cell/gun/sharplite
	name = "plasma power cell"
	desc = "A proprietary power cell primarily used by Sharplite Plasma weaponry. Nanotrasen's large market share has forced some weapon developers to include adapters for these cells."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/power.dmi'
	icon_state = "plasma-cell"
	base_state = "plasma"
	maxcharge = 15000
	chargerate = 1000
	reskin = TRUE

/obj/item/stock_parts/cell/gun/sharplite/plus
	name = "upgraded plasma power cell"
	desc = "A high-capacity weapon cell used exclusively by Sharplite Plasma weaponry. They are a great improvement over the stock cell, and are frequently sought after by collectors, soldiers, and operators of heavy lasers alike."
	icon_state = "plasma_plus-cell"
	base_state = "plasma_plus"
	maxcharge = 30000

/obj/item/stock_parts/cell/gun/sharplite/mini
	name = "miniature plasma power cell"
	desc = "A compact weapon cell used exclusively by Sharplite Plasma weaponry. It holds less charge and is intended for usage in energy handguns."
	icon_state = "plasma_mini-cell"
	maxcharge = 30000

/obj/item/stock_parts/cell/gun/mini
	name = "miniature energy power cell"
	desc = "A compact weapon cell primarily used by Sharplite Energy weaponry. Nanotrasen's large market share has forced some weapon developers to include adapters for these cells. It holds less charge and is intended for usage in energy handguns."
	w_class = WEIGHT_CLASS_TINY
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/power.dmi'
	icon_state = "energy_mini-cell"
	reskin = FALSE

/obj/item/stock_parts/cell/gun/solgov
	reskin = FALSE

/obj/item/stock_parts/cell/gun/large
	reskin = FALSE

/obj/item/stock_parts/cell/gun/kalix
	reskin = FALSE

/obj/item/stock_parts/cell/gun/pgf
	reskin = FALSE

/obj/item/stock_parts/cell/gun/sharplite/mini
	name = "miniature plasma power cell"
	desc = "A compact weapon cell used exclusively by Sharplite Plasma weaponry. It holds less charge and is intended for usage in energy handguns."
	reskin = FALSE

// Выше вместимость увеличена была в 1.5 раза, и расход тоже соответственно
/obj/item/ammo_casing/energy/lasergun/sharplite/sniper
	e_cost = 3000 // 5 per regular cell 10 per upgraded cell

#undef SHARPLITE_ATTACHMENTS
#undef SHARPLITE_ATTACH_SLOTS

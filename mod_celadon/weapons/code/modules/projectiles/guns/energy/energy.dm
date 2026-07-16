#define SHARPLITE_ATTACHMENTS list(/obj/item/attachment/laser_sight,/obj/item/attachment/rail_light,/obj/item/attachment/bayonet,/obj/item/attachment/energy_bayonet,/obj/item/attachment/scope,/obj/item/attachment/gun)
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


// MARK: RETURN OLD

/obj/item/gun/energy/e_gun/e_old
	name = "SL X-10 'Patriot' Energy Carbine"
	desc = "A lightweight energy carbine capable of discharging decently powerful laser and disabler bolts. Commonly seen as a security self-defence weapon."
	icon_state = "energy"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/warra, /obj/item/ammo_casing/energy/disabler/warra)
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun,
		/obj/item/stock_parts/cell/gun/upgraded,
		/obj/item/stock_parts/cell/gun/empty,
		/obj/item/stock_parts/cell/gun/upgraded/empty
	)
	valid_attachments = SHARPLITE_ATTACHMENTS
	manufacturer = MANUFACTURER_SHARPLITE_NEW

/obj/item/gun/energy/e_gun/e_old/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/e_gun/e_old/laser
	name = "SL L-204 'Fuse' Laser Carbine"
	desc = "A basic energy-based laser carbine and somewhat of a predecessor to the X-10. Famed for its low price and reliability."
	icon_state = "laser"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/warra/less)
	w_class = WEIGHT_CLASS_BULKY

/obj/item/gun/energy/e_gun/e_old/mini
	name = "SL X-26 'Ember' Miniature Energy Pistol"
	desc = "A lightweight, civilian marketed Sharplite pistol, popular among Vigilitas security personnel as a reliable dual-mode sidearm. Built-in flashlight included."
	icon_state = "mini"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/warra/mini, /obj/item/ammo_casing/energy/disabler/warra/mini)
	w_class = WEIGHT_CLASS_SMALL
	default_ammo_type = /obj/item/stock_parts/cell/gun/mini
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun/mini,
		/obj/item/stock_parts/cell/gun/sharplite/mini,
		/obj/item/stock_parts/cell/gun/mini/empty,
		/obj/item/stock_parts/cell/gun/sharplite/mini/empty,
	)
	throwforce = 11 //This is funny, trust me.
	ammo_x_offset = 2
	charge_sections = 3
	wield_delay = 0.2 SECONDS
	wield_slowdown = LASER_PISTOL_SLOWDOWN

	fire_delay = 0.2 SECONDS

	spread = 2
	spread_unwielded = 5

	unique_attachments = list(
		/obj/item/attachment/rail_light/mini
	)
	default_attachments = list(/obj/item/attachment/rail_light/mini)

/obj/item/gun/energy/e_gun/e_old/mini/empty_cell
	spawn_no_ammo = TRUE

/obj/item/gun/energy/e_gun/e_old/hades // Перенёс изменения хомячков
	name = "SL AL-655 'Hades' Assault Energy Rifle"
	desc = "A powerful energy rifle built on a fairly heavy frame, capable of rapidly producing high-power lethal laser bolts, as well as overcharged disabling projectiles."
	icon_state = "energytac"
	ammo_x_offset = 2
	charge_sections = 5

	ammo_type = list(/obj/item/ammo_casing/energy/laser/assault/warra, /obj/item/ammo_casing/energy/disabler/assault/warra)

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
	desc = "NT-P:01 Prototype Energy Gun. Early stage development of a unique laser rifle that has a multifaceted energy lens, allowing the gun to alter the form of projectile it fires on command. The project was a dud, and Warra later acquired Sharplite to suit its laser weapon needs."
	icon_state = "protolaser"
	ammo_x_offset = 2
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/electrode/old)
	manufacturer = MANUFACTURER_WARRA_OLD

/obj/item/gun/energy/e_gun/e_old/hos
	name = "\improper SL X-01 MultiPhase Energy Gun"
	desc = "An expensive, high-capacity, high-power energy pistol built on the X-00 chasis. Modified to have a wide array of energy settings, including a burst firemode. Favored by Vigilitas Security Directors."
	icon_state = "hoslaser"
	force = 10
	ammo_type = list(/obj/item/ammo_casing/energy/laser/warra, /obj/item/ammo_casing/energy/disabler/warra, /obj/item/ammo_casing/energy/ion/hos, /obj/item/ammo_casing/energy/electrode/warra)
	shaded_charge = TRUE
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF //я не думаю, что оно должно быть индестрактбл
	manufacturer = MANUFACTURER_SHARPLITE_NEW

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_BURST)
	default_firemode = FIREMODE_SEMIAUTO

	fire_delay = 0.3 SECONDS
	burst_size = 2
	burst_delay = 0.10 SECONDS

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
	ammo_type = list(/obj/item/ammo_casing/energy/laser/warra, /obj/item/ammo_casing/energy/disabler/warra)
	selfcharge = 1
	var/reactor_overloaded
	var/fail_tick = 0
	var/fail_chance = 0
	manufacturer = MANUFACTURER_SHARPLITE_NEW

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
	name = "SL X-14 Advanced Stopping Revolver"
	desc = "An advanced energy revolver with the capacity to shoot both disabler and lethal lasers, as well as futuristic safari nets."
	icon_state = "bsgun"
	item_state = "gun"
	force = 7
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/warra, /obj/item/ammo_casing/energy/laser/warra, /obj/item/ammo_casing/energy/trap)
	ammo_x_offset = 1
	shaded_charge = TRUE
	manufacturer = MANUFACTURER_SHARPLITE_NEW

//Base ESMG

/obj/item/gun/energy/e_gun/e_old/smg
	name = "\improper SL X-36 E-TAR SMG"
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

//AP ESMG

/obj/item/gun/energy/e_gun/e_old/smg/sunbeam
	name = "\improper SL X-39 'Sunbeam' Energy SMG"
	desc = "A variable Sharplite energy SMG capable of discharging armor-piercing bolts, at the cost of a bulkier frame. Frequently used by Vigilitas Troopers against heavy armor."
	icon_state = "sunbeam"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/smg/ap, /obj/item/ammo_casing/energy/disabler/smg/ap)

	shaded_charge = TRUE
	fire_delay = 0.1 SECONDS

	w_class = WEIGHT_CLASS_BULKY

	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 30,
			"y" = 15,
		)
	)

/obj/item/gun/energy/e_gun/e_old/smg/sunbeam/inteq
	name = "\improper VEC-04 'Gleam' Energy SMG"
	desc = "A mostly cosmetic IRMG modification of the Sharplite X-39 'Sunbeam'. Rapidly fires weak lethal and disabler bolts."
	icon_state = "sunbeam_inteq"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32guns.dmi'

//Base Eshotgun

/obj/item/gun/energy/e_gun/e_old/iot
	name = "\improper SL E-SG 500 Second Edition"
	desc = "A cumbersome, variable energy weapon with a multifaceted lens allowing it to function similarly to a ballistic shotgun."
	icon_state = "iotshotgun"
	fire_delay = 0.6 SECONDS
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/laser/shotgun/warra, /obj/item/ammo_casing/energy/disabler/scatter/shotgun/warra)
	charge_sections = 5
	ammo_x_offset = 2
	automatic_charge_overlays = TRUE
	randomspread = FALSE
	gun_firemodes = list(FIREMODE_SEMIAUTO)
	default_firemode = FIREMODE_SEMIAUTO
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM

//Burst EShotgun

/obj/item/gun/energy/e_gun/e_old/iot/blaze
	name = "\improper SL AL-370 'Blaze' Energy Shotgun"
	desc = "An experimental improvement over the aging E-SG series, featuring double laser bursts and a heavier frame, it now can apply even more pressure on whatever you decide to kill. The nonlethal disabler mode had to be sacrificed in order to achieve higher power output."
	icon_state = "blaze"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/shotgun/warra/burst)
	charge_sections = 4
	gun_firemodes = list(FIREMODE_BURST)
	default_firemode = FIREMODE_BURST

	burst_size = 2

	slot_available = SHARPLITE_ATTACH_SLOTS
	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 30,
			"y" = 15,
		)
	)

//Heavy energy machine gun... truly cursed

/obj/item/gun/energy/e_gun/e_old/emg
	name = "SL AL-690 'Daybreak' Energy Machine Gun"
	desc = "Dear God. Somehow, the development of Sharplite energy weaponry has led us to this. It will absolutely decimate whatever stands in your way with an endless stream of assault lasers. How this does not violate some galactic convention is beyond you."
	icon_state = "daybreak"
	w_class = WEAPON_VERY_HEAVY
	weapon_weight = WEAPON_VERY_HEAVY
	wield_slowdown = 1.2
	default_ammo_type = /obj/item/stock_parts/cell/gun/large
	ammo_type = list(/obj/item/ammo_casing/energy/laser/assault/warra/emg)
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun/large,
		/obj/item/stock_parts/cell/gun/large/empty,
	)
	gun_firemodes = list(FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_FULLAUTO
	shaded_charge = TRUE

	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE

	fire_delay = 0.15 SECONDS
	wield_delay = 2 SECONDS

	fire_sound_volume = 90
	spread = 12
	spread_unwielded = 35

	slot_offsets = list(
		ATTACHMENT_SLOT_RAIL = list(
			"x" = 36,
			"y" = 14,
		)
	)

//EDMR

/obj/item/gun/energy/e_gun/e_old/dmr
	name = "SL L-211 'Parallax' Energy Marksman Rifle"
	desc = "An extensive modification on the X-10 frame, featuring stronger armor-piercing bolts and a decent scope. The energy efficiency had to be somewhat sacrificed."
	icon_state = "parallax"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/warra/dmr)
	ammo_x_offset = 1
	shaded_charge = TRUE
	manufacturer = MANUFACTURER_SHARPLITE_NEW

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
			"y" = 15,
		)
	)

//Laser cannon - Esniper

/obj/item/gun/energy/e_gun/e_old/sniper
	name = "SL AL-602 'Phoenix' Energy Cannon"
	desc = "An advanced sniper-like laser cannon that does more damage the farther away the target is. You can attach a scope to it! Infact, it comes with one already inbuit."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'
	icon_state = "phoenix"
	item_state = "phoenix"
	shaded_charge = TRUE
	charge_sections = 5
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	default_ammo_type = /obj/item/stock_parts/cell/gun/large
	allowed_ammo_types = list(
		/obj/item/stock_parts/cell/gun/large,
		/obj/item/stock_parts/cell/gun/large/empty,
	)
	force = 10
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE
	ammo_type = list(/obj/item/ammo_casing/energy/laser/accelerator/warra)
	ammo_x_offset = 3
	fire_sound_volume = 90
	zoom_amt = 8
	zoom_out_amt = 5
	wield_slowdown = LASER_SNIPER_SLOWDOWN
	manufacturer = MANUFACTURER_SHARPLITE_NEW

	spread = -5
	spread_unwielded = 40

	wield_delay = 1.3 SECONDS

	slot_available = SHARPLITE_ATTACH_SLOTS

//disabler

/obj/item/gun/energy/disabler
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/warra)

//empty guns

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
	desc = "A proprietary power cell primarily used by Sharplite Energy weaponry. Warra's large market share has forced some weapon developers to include adapters for these cells"
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
	desc = "A proprietary power cell primarily used by Sharplite Plasma weaponry. Warra's large market share has forced some weapon developers to include adapters for these cells."
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
	name = "miniature energy power cell"
	desc = "A compact weapon cell primarily used by Sharplite Energy weaponry. Warra's large market share has forced some weapon developers to include adapters for these cells. It holds less charge and is intended for usage in energy handguns."
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/obj/power.dmi'
	icon_state = "mg-cell"
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
	name = "miniature plasma power cell"
	desc = "A compact weapon cell used exclusively by Sharplite Plasma weaponry. It holds less charge and is intended for usage in energy handguns."
	icon = 'icons/obj/power.dmi'
	reskin = FALSE

// Выше вместимость увеличена была в 1.5 раза, и расход тоже соответственно
/obj/item/ammo_casing/energy/lasergun/sharplite/sniper
	e_cost = 3000 // 5 per regular cell 10 per upgraded cell

#undef SHARPLITE_ATTACHMENTS
#undef SHARPLITE_ATTACH_SLOTS

// #define Clamp(CLVALUE,CLMIN,CLMAX) ( max( (CLMIN), min((CLVALUE), (CLMAX)) ) )

// /obj/item/device/spacepod_equipment/weaponry/proc/fire_weapons()
// 	if(my_atom.next_firetime > world.time)
// 		to_chat(usr, "<span class='warning'>Your weapons are recharging.</span>")
// 		return
// 	var/turf/firstloc
// 	var/turf/secondloc
// 	if(!my_atom.equipment_system || !my_atom.equipment_system.weapon_system)
// 		to_chat(usr, "<span class='warning'>Missing equipment or weapons.</span>")
// 		my_atom.verbs -= text2path("[type]/proc/fire_weapons")
// 		return
// 	my_atom.battery.use(shot_cost)
// 	var/olddir
// 	for(var/i = 0; i < shots_per; i++)
// 		if(olddir != my_atom.dir)
// 			switch(my_atom.dir)
// 				if(NORTH)
// 					firstloc = get_step(my_atom, NORTH)
// 					secondloc = get_step(firstloc,EAST)
// 				if(SOUTH)
// 					firstloc = get_turf(my_atom)
// 					secondloc = get_step(firstloc,EAST)
// 				if(EAST)
// 					firstloc = get_step(my_atom, EAST)
// 					secondloc = get_step(firstloc,NORTH)
// 				if(WEST)
// 					firstloc = get_turf(my_atom)
// 					secondloc = get_step(firstloc,NORTH)
// 		olddir = dir
// 		var/proj_type = text2path(projectile_type)
// 		var/obj/projectile/projone = new proj_type(firstloc)
// 		var/obj/projectile/projtwo = new proj_type(secondloc)
// 		projone.starting = get_turf(my_atom)
// 		projone.firer = usr
// 		projone.def_zone = "chest"
// 		projtwo.starting = get_turf(my_atom)
// 		projtwo.firer = usr
// 		projtwo.def_zone = "chest"
// 		spawn()
// 			playsound(src, fire_sound, 50, 1)
// 			projone.dumbfire(my_atom.dir)
// 			projtwo.dumbfire(my_atom.dir)
// 		sleep(2)
// 	my_atom.next_firetime = world.time + fire_delay

// /datum/spacepod/equipment
// 	var/obj/spacepod/my_atom
// 	var/list/obj/item/device/spacepod_equipment/installed_modules = list() // holds an easy to access list of installed modules

// 	var/obj/item/device/spacepod_equipment/weaponry/weapon_system // weapons system
// 	var/obj/item/device/spacepod_equipment/misc/misc_system // misc system
// 	var/obj/item/device/spacepod_equipment/cargo/cargo_system // cargo system
// 	var/obj/item/device/spacepod_equipment/sec_cargo/sec_cargo_system // secondary cargo system
// 	var/obj/item/device/spacepod_equipment/lock/lock_system // lock system

// /datum/spacepod/equipment/New(var/obj/spacepod/SP)
// 	..()
// 	if(istype(SP))
// 		my_atom = SP

// /obj/item/device/spacepod_equipment
// 	name = "equipment"
// 	var/obj/spacepod/my_atom
// 	var/occupant_mod = 0	// so any module can modify occupancy
// 	var/list/storage_mod = list("slots" = 0, "w_class" = 0)		// so any module can modify storage slots

// /obj/item/device/spacepod_equipment/proc/removed(var/mob/user) // So that you can unload cargo when you remove the module
// 	return

// /*
// ///////////////////////////////////////
// /////////Weapon System///////////////////
// ///////////////////////////////////////
// */

// /obj/item/device/spacepod_equipment/weaponry
// 	name = "pod weapon"
// 	desc = "You shouldn't be seeing this"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/spacepod.dmi'
// 	icon_state = "blank"
// 	var/projectile_type
// 	var/shot_cost = 0
// 	var/shots_per = 1
// 	var/fire_sound
// 	var/fire_delay = 15

// /obj/item/device/spacepod_equipment/weaponry/taser
// 	name = "disabler system"
// 	desc = "A weak taser system for space pods, fires disabler beams."
// 	icon_state = "weapon_taser"
// 	projectile_type = "/obj/projectile/beam/disabler"
// 	shot_cost = 40
// 	fire_sound = "sound/weapons/Taser.ogg"

// /obj/item/device/spacepod_equipment/weaponry/burst_taser
// 	name = "burst taser system"
// 	desc = "A weak taser system for space pods, this one fires 3 at a time."
// 	icon_state = "weapon_burst_taser"
// 	projectile_type = "/obj/projectile/beam/disabler"
// 	shot_cost = 120
// 	shots_per = 3
// 	fire_sound = "sound/weapons/Taser.ogg"
// 	fire_delay = 30

// /obj/item/device/spacepod_equipment/weaponry/laser
// 	name = "laser system"
// 	desc = "A weak laser system for space pods, fires concentrated bursts of energy"
// 	icon_state = "weapon_laser"
// 	projectile_type = "/obj/projectile/beam"
// 	shot_cost = 60
// 	fire_sound = 'sound/weapons/laser.ogg'

// // MINING LASERS
// /obj/item/device/spacepod_equipment/weaponry/mining_laser_basic
// 	name = "weak mining laser system"
// 	desc = "A weak mining laser system for space pods, fires bursts of energy that cut through rock"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/ship.dmi'
// 	icon_state = "pod_taser"
// 	projectile_type = "/obj/projectile/kinetic"
// 	shot_cost = 30
// 	fire_delay = 14
// 	fire_sound = 'sound/weapons/kenetic_accel.ogg'

// /obj/item/device/spacepod_equipment/weaponry/mining_laser
// 	name = "mining laser system"
// 	desc = "A mining laser system for space pods, fires bursts of energy that cut through rock"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/ship.dmi'
// 	icon_state = "pod_m_laser"
// 	projectile_type = "/obj/projectile/kinetic/super"
// 	shot_cost = 25
// 	fire_delay = 10
// 	fire_sound = 'sound/weapons/kenetic_accel.ogg'

// /obj/item/device/spacepod_equipment/weaponry/mining_laser_hyper
// 	name = "enhanced mining laser system"
// 	desc = "An enhanced mining laser system for space pods, fires bursts of energy that cut through rock"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/ship.dmi'
// 	icon_state = "pod_w_laser"
// 	projectile_type = "/obj/projectile/kinetic/hyper"
// 	shot_cost = 20
// 	fire_delay = 8
// 	fire_sound = 'sound/weapons/kenetic_accel.ogg'

// /*
// ///////////////////////////////////////
// /////////Misc. System///////////////////
// ///////////////////////////////////////
// */

// /obj/item/device/spacepod_equipment/misc
// 	name = "pod misc"
// 	desc = "You shouldn't be seeing this"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/ship.dmi'
// 	icon_state = "blank"
// 	var/enabled

// /obj/item/device/spacepod_equipment/misc/tracker
// 	name = "\improper spacepod tracking system"
// 	desc = "A tracking device for spacepods."
// 	icon_state = "pod_locator"
// 	enabled = 0

// /obj/item/device/spacepod_equipment/misc/tracker/attackby(obj/item/I as obj, mob/user as mob, params)
// 	if(istype(I, /obj/item/screwdriver))
// 		if(enabled)
// 			enabled = 0
// 			user.show_message("<span class='notice'>You disable \the [src]'s power.")
// 			return
// 		enabled = 1
// 		user.show_message("<span class='notice'>You enable \the [src]'s power.</span>")
// 	else
// 		..()

// /obj/item/device/spacepod_equipment/misc/tracker/ftl
// 	name = "spacepod ftl drive system"
// 	desc = "A portable FTL drive. It contains all the basic equipment for FTL travel, minus the computer. It communicates with it's mothership to calculate FTL trajectories, restricting the list of destinations to places the ship has a relay to."

// /*
// ///////////////////////////////////////
// /////////Cargo System//////////////////
// ///////////////////////////////////////
// */

// /obj/item/device/spacepod_equipment/cargo
// 	name = "pod cargo"
// 	desc = "You shouldn't be seeing this"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/spacepod.dmi'
// 	icon_state = "cargo_blank"
// 	var/obj/storage = null

// /obj/item/device/spacepod_equipment/cargo/proc/passover(var/obj/item/I)
// 	return

// /obj/item/device/spacepod_equipment/cargo/proc/unload() // called by unload verb
// 	if(storage)
// 		storage.forceMove(get_turf(my_atom))
// 		storage = null

// /obj/item/device/spacepod_equipment/cargo/removed(var/mob/user) // called when system removed
// 	. = ..()
// 	unload()

// // Ore System
// /obj/item/device/spacepod_equipment/cargo/ore
// 	name = "spacepod ore storage system"
// 	desc = "An ore storage system for spacepods. Scoops up any ore you drive over."
// 	icon_state = "cargo_ore"

// /obj/item/device/spacepod_equipment/cargo/ore/passover(var/obj/item/I)
// 	if(storage && istype(I, /obj/item/stack/ore))
// 		I.forceMove(storage)

// // Crate System
// /obj/item/device/spacepod_equipment/cargo/crate
// 	name = "spacepod crate storage system"
// 	desc = "A heavy duty storage system for spacepods. Holds one crate."
// 	icon_state = "cargo_crate"

// /*
// ///////////////////////////////////////
// /////////Secondary Cargo System////////
// ///////////////////////////////////////
// */

// /obj/item/device/spacepod_equipment/sec_cargo
// 	name = "secondary cargo"
// 	desc = "you shouldn't be seeing this"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/spacepod.dmi'
// 	icon_state = "blank"

// // Passenger Seat
// /obj/item/device/spacepod_equipment/sec_cargo/chair
// 	name = "passanger seat"
// 	desc = "A passenger seat for a spacepod"
// 	icon_state = "sec_cargo_chair"
// 	occupant_mod = 1

// // Loot Box
// /obj/item/device/spacepod_equipment/sec_cargo/loot_box
// 	name = "loot box"
// 	desc = "A small compartment to store valuables"
// 	icon_state = "sec_cargo_loot"
// 	storage_mod = list("slots" = 7, "w_class" = 14)

// /*
// ///////////////////////////////////////
// /////////Lock System///////////////////
// ///////////////////////////////////////
// */

// /obj/item/device/spacepod_equipment/lock
// 	name = "pod lock"
// 	desc = "You shouldn't be seeing this"
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/spacepod.dmi'
// 	icon_state = "blank"
// 	var/mode = 0
// 	var/id = null

// // Key and Tumbler System
// /obj/item/device/spacepod_equipment/lock/keyed
// 	name = "spacepod tumbler lock"
// 	desc = "A locking system to stop podjacking. This version uses a standalone key."
// 	icon_state = "lock_tumbler"
// 	var/static/id_source = 0

// /obj/item/device/spacepod_equipment/lock/keyed/New()
// 	..()
// 	if(id == null)
// 		id = ++id_source

// // The key
// /obj/item/device/spacepod_key
// 	name = "spacepod key"
// 	desc = "A key for a spacepod lock."
// 	icon = 'mod_celadon/_storge_icons/icons/64x64/spacepod.dmi'
// 	icon_state = "podkey"
// 	w_class = 1.0
// 	var/id = 0

// // Key - Lock Interactions
// /obj/item/device/spacepod_equipment/lock/keyed/attackby(obj/item/I as obj, mob/user as mob, params)
// 	if(istype(I, /obj/item/device/spacepod_key))
// 		var/obj/item/device/spacepod_key/key = I
// 		if(!key.id)
// 			key.id = id
// 			to_chat(user, "<span class='notice'>You grind the blank key to fit the lock.</span>")
// 		else
// 			to_chat(user, "<span class='warning'>This key is already ground!</span>")
// 	else
// 		..()


// /obj/projectile
// 	name = "projectile"
// 	icon = 'icons/obj/projectiles.dmi'
// 	icon_state = "bullet"
// 	density = FALSE
// 	anchored = TRUE
// 	mouse_opacity = 0
// 	hitsound = 'sound/weapons/pierce.ogg'
// 	var/hitsound_wall = ""
// 	resistance_flags = LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
// 	var/current = null
// 	var/list/permutated = list() // we've passed through these atoms, don't try to hit them again
// 	var/legacy = 0			//legacy projectile system
// 	animate_movement = 0	//Use SLIDE_STEPS in conjunction with legacy
// 	var/is_reflectable = FALSE // Can it be reflected or not?
// 	var/forcedodge = 0 //to pass through everything


// /obj/projectile/proc/dumbfire(var/dir)
// 	current = get_ranged_target_turf(src, dir, world.maxx)
// 	fire()

// /obj/projectile/proc/prehit(atom/target)
// 	return TRUE
/obj/projectile
	var/current = null
	var/atom/firer_source_atom = null

/obj/projectile/proc/dumbfire(dir)
	current = get_ranged_target_turf(src, dir, world.maxx) //world.maxx is the range. Not sure how to handle this better.
	fire()

GLOBAL_VAR_INIT(pacifism_after_gt, FALSE)

/obj/item/spacepod_equipment/weaponry/proc/fire_weapons()
	if((HAS_TRAIT(usr, TRAIT_PACIFISM) || GLOB.pacifism_after_gt) && harmful)
		to_chat(usr, "<span class='warning'>You don't want to harm other living beings!</span>")
		return
	if(my_atom.next_firetime > world.time)
		to_chat(usr, "<span class='warning'>Your weapons are recharging.</span>")
		return
	my_atom.next_firetime = world.time + fire_delay
	var/turf/firstloc
	var/turf/secondloc
	if(!my_atom.equipment_system || !my_atom.equipment_system.weapon_system)
		to_chat(usr, "<span class='warning'>Missing equipment or weapons.</span>")
		my_atom.verbs -= text2path("[type]/proc/fire_weapons")
		return
	if(!my_atom.battery.use(shot_cost))
		to_chat(usr, "<span class='warning'>Insufficient charge to fire the weapons</span>")
		return
	var/olddir
	for(var/i = 0; i < shots_per; i++)
		if(olddir != my_atom.dir)
			switch(my_atom.dir)
				if(NORTH)
					firstloc = get_step(my_atom, NORTH)
					secondloc = get_step(firstloc,EAST)
				if(SOUTH)
					firstloc = get_turf(my_atom)
					secondloc = get_step(firstloc,EAST)
				if(EAST)
					firstloc = get_step(my_atom, EAST)
					secondloc = get_step(firstloc,NORTH)
				if(WEST)
					firstloc = get_turf(my_atom)
					secondloc = get_step(firstloc,NORTH)
		olddir = dir
		var/obj/projectile/projone = new projectile_type(firstloc)
		var/obj/projectile/projtwo = new projectile_type(secondloc)
		projone.starting = get_turf(my_atom)
		projone.firer = usr
		projone.firer_source_atom = src
		projone.def_zone = BODY_ZONE_CHEST
		projtwo.starting = get_turf(my_atom)
		projtwo.firer = usr
		projtwo.firer_source_atom = src
		projtwo.def_zone = BODY_ZONE_CHEST
		spawn()
			playsound(src, fire_sound, 50, 1)
			projone.dumbfire(my_atom.dir)
			projtwo.dumbfire(my_atom.dir)
		sleep(2)

/datum/spacepod/equipment
	var/obj/spacepod/my_atom
	var/list/obj/item/spacepod_equipment/installed_modules = list() // holds an easy to access list of installed modules
	var/obj/item/spacepod_equipment/weaponry/weapon_system // weapons system
	var/obj/item/spacepod_equipment/misc/misc_system // misc system
	var/obj/item/spacepod_equipment/cargo/cargo_system // cargo system
	var/obj/item/spacepod_equipment/cargo/sec_cargo_system // secondary cargo system
	var/obj/item/spacepod_equipment/lock/lock_system // lock system

/datum/spacepod/equipment/New(var/obj/spacepod/SP)
	..()
	if(istype(SP))
		my_atom = SP

/obj/item/spacepod_equipment
	name = "equipment"
	icon = 'mod_celadon/_storge_icons/icons/64x64/spacepod.dmi'
	var/obj/spacepod/my_atom
	var/occupant_mod = 0	// so any module can modify occupancy
	var/list/storage_mod = list("slots" = 0, "w_class" = 0)		// so any module can modify storage slots

/obj/item/spacepod_equipment/proc/removed(var/mob/user) // So that you can unload cargo when you remove the module
	return

/*
///////////////////////////////////////
/////////Weapon System///////////////////
///////////////////////////////////////
*/

/obj/item/spacepod_equipment/weaponry
	name = "pod weapon"
	desc = "You shouldn't be seeing this"
	icon_state = "blank"
	var/obj/projectile/projectile_type
	var/shot_cost = 0
	var/shots_per = 1
	var/fire_sound
	var/fire_delay = 15
	var/harmful = TRUE

/obj/item/spacepod_equipment/weaponry/taser
	name = "disabler system"
	desc = "A weak disabler system for space pods, fires disabler beams."
	icon_state = "weapon_taser"
	projectile_type = /obj/projectile/beam/disabler
	shot_cost = 800
	shots_per = 2
	fire_sound = 'sound/weapons/taser.ogg'
	harmful = FALSE

/obj/item/spacepod_equipment/weaponry/burst_taser
	name = "burst disabler system"
	desc = "A weak disabler system for space pods, this one fires 3 round burst at a time."
	icon_state = "weapon_burst_taser"
	projectile_type = /obj/projectile/beam/disabler
	shot_cost = 1200
	shots_per = 3
	fire_sound = 'sound/weapons/taser.ogg'
	fire_delay = 30
	harmful = FALSE

/obj/item/spacepod_equipment/weaponry/laser
	name = "laser system"
	desc = "A weak laser system for space pods, fires concentrated bursts of energy."
	icon_state = "weapon_laser"
	projectile_type = /obj/projectile/beam
	shot_cost = 1200
	shots_per = 2
	fire_sound = 'sound/weapons/laser.ogg'

/obj/item/spacepod_equipment/weaponry/solaris
	name = "solaris system"
	desc = "A stronger vesion of laser systems for pods. Fires high concetrated bursts of energy"
	icon_state = "weapon_laser"
	projectile_type = /obj/projectile/beam/laser/heavylaser
	shot_cost = 1800
	shots_per = 2
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

// MINING LASERS
/obj/projectile/kinetic/pod
	range = 4

/obj/item/spacepod_equipment/weaponry/mining_laser_basic
	name = "kinetic accelerator system"
	desc = "A kinetic accelerator system for space pods, fires bursts of kinetic force that cut through rock."
	icon = 'mod_celadon/_storge_icons/icons/64x64/ship.dmi'
	icon_state = "pod_taser"
	projectile_type = /obj/projectile/kinetic/pod
	shot_cost = 300
	fire_delay = 14
	fire_sound = 'sound/weapons/kenetic_accel.ogg'

/obj/projectile/kinetic/pod/regular
	damage = 50
	pressure_decrease = 0.5

/obj/item/spacepod_equipment/weaponry/mining_laser
	name = "industrial kinetic accelerator system"
	desc = "A industrial kinetic accelerator system for space pods, fires heavy bursts of kinetic force that cut through rock."
	icon = 'mod_celadon/_storge_icons/icons/64x64/ship.dmi'
	icon_state = "pod_m_laser"
	projectile_type = /obj/projectile/kinetic/pod/regular
	shot_cost = 250
	fire_delay = 10
	fire_sound = 'sound/weapons/kenetic_accel.ogg'

/*
///////////////////////////////////////
/////////Misc. System///////////////////
///////////////////////////////////////
*/

GLOBAL_LIST_EMPTY(pod_trackers)

/obj/item/spacepod_equipment/misc
	name = "pod misc"
	desc = "You shouldn't be seeing this"
	icon = 'mod_celadon/_storge_icons/icons/64x64/ship.dmi'
	icon_state = "blank"

/obj/item/spacepod_equipment/misc/tracker
	name = "\improper spacepod tracking system"
	desc = "A tracking device for spacepods."
	icon_state = "pod_locator"

/obj/item/spacepod_equipment/misc/tracker/Initialize(mapload)
	GLOB.pod_trackers |= src
	return ..()

/obj/item/spacepod_equipment/misc/tracker/Destroy()
	GLOB.pod_trackers -= src
	return ..()

/*
///////////////////////////////////////
/////////Cargo System//////////////////
///////////////////////////////////////
*/

/obj/item/spacepod_equipment/cargo
	name = "pod cargo"
	desc = "You shouldn't be seeing this"
	icon_state = "cargo_blank"
	var/obj/storage = null

/obj/item/spacepod_equipment/cargo/proc/passover(var/obj/item/I)
	return

/obj/item/spacepod_equipment/cargo/proc/unload() // called by unload verb
	if(storage)
		storage.forceMove(get_turf(my_atom))
		storage = null

/obj/item/spacepod_equipment/cargo/removed(var/mob/user) // called when system removed
	. = ..()
	unload()

// Ore System
/obj/item/spacepod_equipment/cargo/ore
	name = "spacepod ore storage system"
	desc = "An ore storage system for spacepods. Scoops up any ore you drive over."
	icon_state = "cargo_ore"

/obj/item/spacepod_equipment/cargo/ore/passover(var/obj/item/I)
	if(storage && istype(I,/obj/item/stack/ore))
		I.forceMove(storage)

// Crate System
/obj/item/spacepod_equipment/cargo/crate
	name = "spacepod crate storage system"
	desc = "A heavy duty storage system for spacepods. Holds one crate."
	icon_state = "cargo_crate"

/*
///////////////////////////////////////
/////////Secondary Cargo System////////
///////////////////////////////////////
*/

/obj/item/spacepod_equipment/sec_cargo
	name = "secondary cargo"
	desc = "you shouldn't be seeing this"
	icon_state = "blank"

// Passenger Seat
/obj/item/spacepod_equipment/sec_cargo/chair
	name = "passenger seat"
	desc = "A passenger seat for a spacepod."
	icon_state = "sec_cargo_chair"
	occupant_mod = 1

// Loot Box
/obj/item/spacepod_equipment/sec_cargo/loot_box
	name = "loot box"
	desc = "A small compartment to store valuables."
	icon_state = "sec_cargo_loot"
	storage_mod = list("slots" = 7, "w_class" = 14)

/*
///////////////////////////////////////
/////////Lock System///////////////////
///////////////////////////////////////
*/

/obj/item/spacepod_equipment/lock
	name = "pod lock"
	desc = "You shouldn't be seeing this"
	icon_state = "blank"
	var/mode = 0
	var/id = null

// Key and Tumbler System
/obj/item/spacepod_equipment/lock/keyed
	name = "spacepod tumbler lock"
	desc = "A locking system to stop podjacking. This version uses a standalone key."
	icon_state = "lock_tumbler"
	var/static/id_source = 0

/obj/item/spacepod_equipment/lock/keyed/New()
	..()
	id = ++id_source

// The key
/obj/item/spacepod_equipment/key
	name = "spacepod key"
	desc = "A key for a spacepod lock."
	icon = 'mod_celadon/_storge_icons/icons/64x64/spacepod.dmi'
	icon_state = "podkey"
	w_class = WEIGHT_CLASS_TINY
	var/id = 0

// Key - Lock Interactions
/obj/item/spacepod_equipment/lock/keyed/attackby(obj/item/I as obj, mob/user as mob, params)
	if(istype(I, /obj/item/spacepod_equipment/key))
		var/obj/item/spacepod_equipment/key/key = I
		if(!key.id)
			key.id = id
			to_chat(user, "<span class='notice'>You grind the blank key to fit the lock.</span>")
		else
			to_chat(user, "<span class='warning'>This key is already ground!</span>")
	else
		return ..()

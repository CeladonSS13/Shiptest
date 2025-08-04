// Ship weapon turret system
/obj/machinery/porta_turret/ship/weapon_system
	name = "ship weapon turret"
	desc = "A specialized turret designed for ship-to-ship combat on the overmap."
	use_power = NO_POWER_USE
	
	/// Weapon range on overmap (1-30 tiles)
	var/weapon_range = 15
	/// Energy consumption per shot
	var/charge_cost = 500
	/// Weapon damage type
	var/weapon_type = "laser"
	/// Current weapon state
	var/weapon_state = 0
	/// Time to charge weapon
	var/charge_time = 30
	/// Burst count for this weapon
	var/weapon_burst_count = 1
	/// Connected weapons console
	var/obj/machinery/computer/ship_weapons/linked_console
	/// Ammo count (for ballistic weapons)
	var/ammo_count = 100
	/// Max ammo capacity
	var/max_ammo = 100

/obj/machinery/porta_turret/ship/weapon_system/Initialize()
	. = ..()
	weapon_state = 0

/obj/machinery/porta_turret/ship/weapon_system/proc/can_fire()
	if(weapon_state != 2)
		return FALSE
	if(weapon_type == "ballistic" && ammo_count <= 0)
		return FALSE
	return TRUE

/obj/machinery/porta_turret/ship/weapon_system/proc/start_charging()
	if(weapon_state != 0)
		return FALSE
	weapon_state = 1
	use_power(charge_cost)
	addtimer(CALLBACK(src, PROC_REF(finish_charging)), charge_time)
	return TRUE

/obj/machinery/porta_turret/ship/weapon_system/proc/finish_charging()
	weapon_state = 2

/obj/machinery/porta_turret/ship/weapon_system/proc/fire_at_target(target_x, target_y)
	if(!can_fire())
		return FALSE
	
	weapon_state = 3
	
	// Calculate distance
	var/obj/docking_port/mobile/port = SSshuttle.get_containing_shuttle(src)
	if(!port?.current_ship)
		return FALSE
	
	var/datum/overmap/ship/current_ship = port.current_ship
	var/distance = sqrt((current_ship.x - target_x)**2 + (current_ship.y - target_y)**2)
	
	if(distance > weapon_range)
		weapon_state = 0
		return FALSE
	
	// Find target at coordinates
	var/datum/overmap/target = locate_target_at_coords(target_x, target_y, current_ship.current_overmap)
	if(target)
		deal_damage_to_target(target)
	
	// Consume ammo for ballistic weapons
	if(weapon_type == "ballistic")
		ammo_count = max(0, ammo_count - weapon_burst_count)
	
	weapon_state = 0
	return TRUE

/obj/machinery/porta_turret/ship/weapon_system/proc/locate_target_at_coords(target_x, target_y, datum/overmap_star_system/system)
	for(var/datum/overmap/ship/target in system.overmap_objects)
		if(target.x == target_x && target.y == target_y)
			return target
	return null

/obj/machinery/porta_turret/ship/weapon_system/proc/deal_damage_to_target(datum/overmap/target)
	if(!target || !istype(target, /datum/overmap/ship/controlled))
		return
	
	var/datum/overmap/ship/controlled/target_ship = target
	if(!target_ship.shuttle_port)
		return
	
	// Create explosion effect on target ship
	var/list/areas = target_ship.shuttle_port.shuttle_areas
	if(!length(areas))
		return
	
	var/turf/target_turf = pick(areas)
	if(!target_turf)
		return
	
	switch(weapon_type)
		if("laser")
			explosion(target_turf, 0, 1, 2, 0)
		if("ballistic")
			explosion(target_turf, 1, 2, 3, 0)
		if("explosive")
			explosion(target_turf, 2, 3, 4, 0)

/obj/machinery/porta_turret/ship/weapon_system/proc/reload_ammo(amount)
	if(weapon_type != "ballistic")
		return FALSE
	ammo_count = min(max_ammo, ammo_count + amount)
	return TRUE

/obj/machinery/porta_turret/ship/weapon_system/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/multitool))
		var/obj/item/multitool/MT = I
		MT.buffer = src
		to_chat(user, span_notice("You store [src] in [MT]'s buffer."))
		return
	return ..()

// Disable automatic targeting by overriding process
/obj/machinery/porta_turret/ship/weapon_system/process()
	// Do nothing - disable automatic turret behavior
	return

// Laser weapon variant
/obj/machinery/porta_turret/ship/weapon_system/laser
	name = "ship laser turret"
	weapon_type = "laser"
	weapon_range = 20
	charge_cost = 300
	charge_time = 20

// Ballistic weapon variant  
/obj/machinery/porta_turret/ship/weapon_system/ballistic
	name = "ship ballistic turret"
	weapon_type = "ballistic"
	weapon_range = 15
	charge_cost = 100
	charge_time = 10
	weapon_burst_count = 3

// Explosive weapon variant
/obj/machinery/porta_turret/ship/weapon_system/explosive
	name = "ship missile launcher"
	weapon_type = "explosive"
	weapon_range = 25
	charge_cost = 800
	charge_time = 60
	ammo_count = 10
	max_ammo = 10
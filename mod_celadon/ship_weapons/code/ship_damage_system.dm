// Ship damage system for weapon impacts

// Extend overmap ships with damage system
/datum/overmap/ship/controlled
	/// Ship hull integrity - SHIPS_GUN_SYSTEM
	var/hull_integrity = 100
	/// Maximum hull integrity - SHIPS_GUN_SYSTEM  
	var/max_hull_integrity = 100
	/// Is ship destroyed - SHIPS_GUN_SYSTEM
	var/destroyed = FALSE

/datum/overmap/ship/controlled/proc/take_weapon_damage(damage_amount, damage_type)
	if(destroyed)
		return FALSE
	
	hull_integrity = max(0, hull_integrity - damage_amount)
	
	// Announce damage to ship
	if(shuttle_port?.virtual_z())
		var/damage_msg = ""
		switch(damage_type)
			if("laser")
				damage_msg = "Hull breach detected! Laser impact registered."
			if("ballistic")
				damage_msg = "Hull breach detected! Ballistic impact registered."
			if("explosive")
				damage_msg = "Critical hull breach! Explosive impact registered."
		
		priority_announce(damage_msg, "Ship Damage Control", sender_override = "[name] Damage Control", zlevel = shuttle_port.virtual_z())
	
	// Check if ship is critically damaged
	if(hull_integrity <= 0)
		hull_integrity = 1
		if(damage_type == "admin_destruction")
			destroy_ship()
			return TRUE
		else
			if(shuttle_port?.virtual_z())
				priority_announce("CRITICAL HULL BREACH! All systems failing!", "Emergency Alert", sender_override = "[name] Emergency System", zlevel = shuttle_port.virtual_z())
	
	// Damage ship systems based on hull integrity
	damage_ship_systems()
	return TRUE

/datum/overmap/ship/controlled/proc/damage_ship_systems()
	var/damage_percent = (max_hull_integrity - hull_integrity) / max_hull_integrity
	
	// Damage engines at 50% hull
	if(damage_percent >= 0.5)
		for(var/obj/machinery/power/shuttle/engine/engine in shuttle_port.get_engines())
			if(prob(20))
				engine.obj_integrity = max(1, engine.obj_integrity * 0.9)
	
	// Damage random equipment at 75% hull damage
	if(damage_percent >= 0.75)
		var/list/machines = list()
		for(var/area/ship_area in shuttle_port.shuttle_areas)
			for(var/obj/machinery/machine in ship_area)
				machines += machine
		
		if(length(machines))
			var/obj/machinery/target = pick(machines)
			target.obj_integrity = max(1, target.obj_integrity * 0.8)
			if(prob(30))
				target.set_machine_stat(target.machine_stat | BROKEN)

/datum/overmap/ship/controlled/proc/destroy_ship()
	if(destroyed)
		return
	
	destroyed = TRUE
	
	if(shuttle_port?.virtual_z())
		priority_announce("CRITICAL SYSTEM FAILURE! ABANDON SHIP!", "Emergency Alert", sender_override = "[name] Emergency System", zlevel = shuttle_port.virtual_z())
	
	// Create massive explosion on ship
	for(var/area/ship_area in shuttle_port.shuttle_areas)
		var/turf/explosion_center = pick(ship_area.contents)
		if(explosion_center)
			explosion(explosion_center, 3, 5, 7, 2)
	
	// Remove ship after delay
	addtimer(CALLBACK(src, PROC_REF(final_destruction)), 30 SECONDS)

/datum/overmap/ship/controlled/proc/final_destruction()
	message_admins("[name] has been destroyed by weapon fire.")
	qdel(src)

// Update weapon damage dealing
/obj/machinery/porta_turret/ship/weapon_system/deal_damage_to_target(datum/overmap/target)
	if(!istype(target, /datum/overmap/ship/controlled))
		return ..()
	
	var/datum/overmap/ship/controlled/target_ship = target
	var/damage_amount = 0
	
	switch(weapon_type)
		if("laser")
			damage_amount = 15
		if("ballistic")
			damage_amount = 20
		if("explosive")
			damage_amount = 35
	
	target_ship.take_weapon_damage(damage_amount, weapon_type)
	
	// Still create explosion for visual effect
	if(target_ship.shuttle_port)
		var/list/areas = target_ship.shuttle_port.shuttle_areas
		if(length(areas))
			var/area/target_area = pick(areas)
			var/list/turfs = target_area.contents
			if(length(turfs))
				var/turf/target_turf = pick(turfs)
				if(target_turf)
					switch(weapon_type)
						if("laser")
							explosion(target_turf, 0, 1, 2, 0)
						if("ballistic")
							explosion(target_turf, 1, 2, 3, 0)
						if("explosive")
							explosion(target_turf, 2, 3, 4, 0)
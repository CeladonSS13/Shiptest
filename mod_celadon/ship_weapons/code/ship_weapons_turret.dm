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
	
	// New accuracy system
	/// Base accuracy percentage (0-100)
	var/base_accuracy = BASE_ACCURACY
	/// Accuracy falloff per tile of distance
	var/accuracy_falloff = ACCURACY_FALLOFF_PER_TILE
	/// Minimum accuracy percentage
	var/min_accuracy = MIN_ACCURACY
	
	// Enhanced weapon characteristics
	/// Weapon class (light/medium/heavy)
	var/weapon_class = WEAPON_CLASS_LIGHT
	/// Ship damage type dealt
	var/ship_damage_type = SHIP_DAMAGE_ENERGY
	/// Base damage value
	var/base_damage = 50
	/// Cooldown time after firing
	var/cooldown_time = 10
	/// Tracking speed (affects accuracy vs moving targets)
	var/tracking_speed = 1.0
	/// Armor penetration value
	var/armor_penetration = 0

/obj/machinery/porta_turret/ship/weapon_system/Initialize()
	. = ..()
	weapon_state = 0

/obj/machinery/porta_turret/ship/weapon_system/proc/can_fire()
	if(weapon_state != WEAPON_STATE_READY)
		return FALSE
	if(weapon_type == "ballistic" && ammo_count <= 0)
		return FALSE
	if(weapon_type == "explosive" && ammo_count <= 0)
		return FALSE
	return TRUE

/obj/machinery/porta_turret/ship/weapon_system/proc/start_charging()
	if(weapon_state != WEAPON_STATE_IDLE)
		return FALSE
	weapon_state = WEAPON_STATE_CHARGING
	use_power(charge_cost)
	addtimer(CALLBACK(src, PROC_REF(finish_charging)), charge_time)
	return TRUE

/obj/machinery/porta_turret/ship/weapon_system/proc/finish_charging()
	weapon_state = WEAPON_STATE_READY

/obj/machinery/porta_turret/ship/weapon_system/proc/finish_cooldown()
	weapon_state = WEAPON_STATE_IDLE

/obj/machinery/porta_turret/ship/weapon_system/proc/calculate_accuracy(distance)
	var/accuracy = base_accuracy - (distance * accuracy_falloff)
	return max(min_accuracy, accuracy)

/obj/machinery/porta_turret/ship/weapon_system/proc/create_miss_effect(target_x, target_y, datum/overmap_star_system/system)
	// Create visual miss effect near target coordinates
	var/miss_x = target_x + rand(-2, 2)
	var/miss_y = target_y + rand(-2, 2)
	
	// Clamp to valid overmap coordinates
	miss_x = clamp(miss_x, 1, 30)
	miss_y = clamp(miss_y, 1, 30)
	
	// Create small explosion effect at miss location
	var/turf/miss_turf = OVERMAP_TOKEN_TURF(miss_x, miss_y, system)
	if(miss_turf)
		explosion(miss_turf, 0, 0, 1, 0) // Small flash only



/obj/machinery/porta_turret/ship/weapon_system/proc/fire_at_target(target_x, target_y)
	if(!can_fire())
		return FALSE

	weapon_state = WEAPON_STATE_FIRING

	// Calculate distance
	var/obj/docking_port/mobile/port = SSshuttle.get_containing_shuttle(src)
	if(!port?.current_ship)
		return FALSE

	var/datum/overmap/ship/current_ship = port.current_ship
	var/distance = sqrt((current_ship.x - target_x)**2 + (current_ship.y - target_y)**2)

	if(distance > weapon_range)
		weapon_state = WEAPON_STATE_IDLE
		return FALSE

	// Calculate accuracy based on distance
	var/accuracy = calculate_accuracy(distance)
	var/hit_success = prob(accuracy)
	
	// Find target at coordinates
	var/datum/overmap/target = locate_target_at_coords(target_x, target_y, current_ship.current_overmap)
	
	// Play weapon sound
	play_weapon_sound()
	
	// Fire burst if applicable
	for(var/i = 1 to weapon_burst_count)
		if(i > 1)
			sleep(2) // Small delay between burst shots
			
		if(hit_success && target)
			deal_damage_to_target(target, distance)
		else
			// Miss - create visual effect near target
			create_miss_effect(target_x, target_y, current_ship.current_overmap)

	// Consume ammo for ballistic weapons
	if(weapon_type == "ballistic")
		ammo_count = max(0, ammo_count - weapon_burst_count)

	// Start cooldown
	weapon_state = WEAPON_STATE_COOLDOWN
	addtimer(CALLBACK(src, PROC_REF(finish_cooldown)), cooldown_time)
	return TRUE

/obj/machinery/porta_turret/ship/weapon_system/proc/locate_target_at_coords(target_x, target_y, datum/overmap_star_system/system)
	for(var/datum/overmap/target in system.overmap_objects)
		if(!istype(target, /datum/overmap/ship))
			continue
		if(target.x == target_x && target.y == target_y)
			return target
	return null

/obj/machinery/porta_turret/ship/weapon_system/proc/deal_damage_to_target(datum/overmap/target, distance)
	if(!target || !istype(target, /datum/overmap/ship/controlled))
		return

	var/datum/overmap/ship/controlled/target_ship = target
	if(!target_ship.shuttle_port)
		return

	// Calculate damage based on distance and weapon characteristics
	var/final_damage = base_damage
	if(distance > weapon_range * 0.5) // Damage falloff at long range
		final_damage *= 0.7

	// Create explosion effect on target ship
	var/list/areas = target_ship.shuttle_port.shuttle_areas
	if(!length(areas))
		return

	var/turf/target_turf = pick(areas)
	if(!target_turf)
		return

	// Enhanced damage system based on weapon type and class
	var/explosion_heavy = 0
	var/explosion_light = 1
	var/explosion_flash = 2
	
	switch(weapon_class)
		if(WEAPON_CLASS_LIGHT)
			explosion_heavy = 0
			explosion_light = 1
			explosion_flash = 2
		if(WEAPON_CLASS_MEDIUM)
			explosion_heavy = 1
			explosion_light = 2
			explosion_flash = 3
		if(WEAPON_CLASS_HEAVY)
			explosion_heavy = 2
			explosion_light = 3
			explosion_flash = 4

	switch(weapon_type)
		if("laser")
			explosion(target_turf, explosion_heavy, explosion_light, explosion_flash, 0)
		if("ballistic")
			explosion(target_turf, explosion_heavy + 1, explosion_light + 1, explosion_flash, 0)
		if("explosive")
			explosion(target_turf, explosion_heavy + 2, explosion_light + 2, explosion_flash + 1, 0)
		if("beam")
			// Beam weapons cause sustained damage
			for(var/i = 1 to 3)
				explosion(target_turf, 0, explosion_light, explosion_flash, 0)
				sleep(5)
		if("plasma")
			// Plasma weapons cause fire damage
			explosion(target_turf, explosion_heavy, explosion_light, explosion_flash, 0)
			// Add fire effect
			for(var/turf/T in range(2, target_turf))
				if(prob(30))
					new /obj/effect/hotspot(T)

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

// Light Laser Turret
/obj/machinery/porta_turret/ship/weapon_system/laser
	name = "light laser turret"
	icon = 'icons/obj/turrets.dmi'
	icon_state = "standard_stun"
	weapon_type = "laser"
	weapon_class = WEAPON_CLASS_LIGHT
	ship_damage_type = SHIP_DAMAGE_ENERGY
	weapon_range = 20
	charge_cost = 300
	charge_time = 20
	base_damage = 40
	cooldown_time = 8
	base_accuracy = 90
	accuracy_falloff = 1.5
	tracking_speed = 1.2

// Medium Laser Turret
/obj/machinery/porta_turret/ship/weapon_system/laser/medium
	name = "medium laser turret"
	weapon_class = WEAPON_CLASS_MEDIUM
	weapon_range = 22
	charge_cost = 500
	charge_time = 30
	base_damage = 70
	cooldown_time = 12
	base_accuracy = 85
	accuracy_falloff = 2

// Heavy Laser Turret
/obj/machinery/porta_turret/ship/weapon_system/laser/heavy
	name = "heavy laser turret"
	weapon_class = WEAPON_CLASS_HEAVY
	weapon_range = 25
	charge_cost = 800
	charge_time = 45
	base_damage = 120
	cooldown_time = 20
	base_accuracy = 80
	accuracy_falloff = 2.5
	tracking_speed = 0.8

// Light Ballistic Turret
/obj/machinery/porta_turret/ship/weapon_system/ballistic
	name = "light ballistic turret"
	weapon_type = "ballistic"
	weapon_class = WEAPON_CLASS_LIGHT
	ship_damage_type = SHIP_DAMAGE_KINETIC
	weapon_range = 15
	charge_cost = 100
	charge_time = 10
	weapon_burst_count = 3
	base_damage = 35
	cooldown_time = 6
	base_accuracy = 85
	accuracy_falloff = 2.5
	armor_penetration = 10

// Medium Ballistic Turret
/obj/machinery/porta_turret/ship/weapon_system/ballistic/medium
	name = "medium ballistic turret"
	weapon_class = WEAPON_CLASS_MEDIUM
	weapon_range = 18
	charge_cost = 200
	charge_time = 15
	weapon_burst_count = 5
	base_damage = 50
	cooldown_time = 10
	base_accuracy = 80
	armor_penetration = 15

// Heavy Ballistic Turret
/obj/machinery/porta_turret/ship/weapon_system/ballistic/heavy
	name = "heavy ballistic turret"
	weapon_class = WEAPON_CLASS_HEAVY
	weapon_range = 20
	charge_cost = 400
	charge_time = 25
	weapon_burst_count = 8
	base_damage = 80
	cooldown_time = 18
	base_accuracy = 75
	armor_penetration = 25
	tracking_speed = 0.7

// Missile Launcher
/obj/machinery/porta_turret/ship/weapon_system/explosive
	name = "missile launcher"
	weapon_type = "explosive"
	weapon_class = WEAPON_CLASS_MEDIUM
	ship_damage_type = SHIP_DAMAGE_EXPLOSIVE
	weapon_range = 25
	charge_cost = 800
	charge_time = 60
	ammo_count = 10
	max_ammo = 10
	base_damage = 150
	cooldown_time = 30
	base_accuracy = 70
	accuracy_falloff = 1
	tracking_speed = 0.6

// Heavy Missile Launcher
/obj/machinery/porta_turret/ship/weapon_system/explosive/heavy
	name = "heavy missile launcher"
	weapon_class = WEAPON_CLASS_HEAVY
	weapon_range = 28
	charge_cost = 1200
	charge_time = 90
	ammo_count = 6
	max_ammo = 6
	base_damage = 250
	cooldown_time = 45
	base_accuracy = 65
	tracking_speed = 0.5

// Beam Weapon (new type)
/obj/machinery/porta_turret/ship/weapon_system/beam
	name = "beam weapon turret"
	weapon_type = "beam"
	weapon_class = WEAPON_CLASS_HEAVY
	ship_damage_type = SHIP_DAMAGE_ENERGY
	weapon_range = 30
	charge_cost = 1500
	charge_time = 120
	base_damage = 200
	cooldown_time = 60
	base_accuracy = 95
	accuracy_falloff = 0.5
	tracking_speed = 1.5
	armor_penetration = 50

// Plasma Cannon (new type)
/obj/machinery/porta_turret/ship/weapon_system/plasma
	name = "plasma cannon"
	weapon_type = "plasma"
	weapon_class = WEAPON_CLASS_HEAVY
	ship_damage_type = SHIP_DAMAGE_ENERGY
	weapon_range = 22
	charge_cost = 1000
	charge_time = 75
	base_damage = 180
	cooldown_time = 40
	base_accuracy = 75
	accuracy_falloff = 3
	tracking_speed = 0.9

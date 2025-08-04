// Visual effects for ship weapons system

// Weapon firing effect
/obj/effect/temp_visual/weapon_fire
	icon = 'icons/effects/beam.dmi'
	icon_state = "laser_beam"
	duration = 5
	layer = ABOVE_ALL_MOB_LAYER

/obj/effect/temp_visual/weapon_fire/ballistic
	icon_state = "muzzle_flash"

/obj/effect/temp_visual/weapon_fire/explosive
	icon_state = "rocket_trail"
	duration = 10

// Charging effect
/obj/effect/temp_visual/weapon_charging
	icon = 'icons/effects/effects.dmi'
	icon_state = "electricity"
	duration = 30
	layer = ABOVE_ALL_MOB_LAYER

// Add visual effects to weapon firing
/obj/machinery/porta_turret/ship/weapon_system/fire_at_target(target_x, target_y)
	. = ..()
	if(.)
		create_firing_effect()

/obj/machinery/porta_turret/ship/weapon_system/proc/create_firing_effect()
	var/obj/effect/temp_visual/weapon_fire/effect
	switch(weapon_type)
		if("laser")
			effect = new /obj/effect/temp_visual/weapon_fire(get_turf(src))
		if("ballistic")
			effect = new /obj/effect/temp_visual/weapon_fire/ballistic(get_turf(src))
		if("explosive")
			effect = new /obj/effect/temp_visual/weapon_fire/explosive(get_turf(src))
	
	if(effect)
		effect.pixel_x = rand(-8, 8)
		effect.pixel_y = rand(-8, 8)

// Add charging effect
/obj/machinery/porta_turret/ship/weapon_system/start_charging()
	. = ..()
	if(.)
		new /obj/effect/temp_visual/weapon_charging(get_turf(src))

// Impact effects on target ships
/obj/machinery/porta_turret/ship/weapon_system/deal_damage_to_target(datum/overmap/target)
	..()
	
	// Create impact effect on target
	if(istype(target, /datum/overmap/ship/controlled))
		var/datum/overmap/ship/controlled/target_ship = target
		if(target_ship.shuttle_port)
			var/list/areas = target_ship.shuttle_port.shuttle_areas
			if(length(areas))
				var/turf/impact_turf = pick(areas)
				create_impact_effect(impact_turf)

/obj/machinery/porta_turret/ship/weapon_system/proc/create_impact_effect(turf/impact_turf)
	var/obj/effect/temp_visual/explosion/effect
	switch(weapon_type)
		if("laser")
			effect = new /obj/effect/temp_visual/explosion/fast(impact_turf)
		if("ballistic")
			effect = new /obj/effect/temp_visual/explosion(impact_turf)
		if("explosive")
			effect = new /obj/effect/temp_visual/explosion(impact_turf)
	
	if(effect)
		effect.color = "#ff4444"
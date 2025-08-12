// Sound system for ship weapons

/obj/machinery/porta_turret/ship/weapon_system/proc/play_weapon_sound()
	switch(weapon_type)
		if("laser")
			playsound(src, 'sound/weapons/laser.ogg', 50, TRUE)
		if("ballistic")
			playsound(src, 'sound/weapons/gun/smg/shot.ogg', 50, TRUE)
		if("explosive")
			playsound(src, 'sound/weapons/gun/general/rocket_launch.ogg', 50, TRUE)
		if("beam")
			playsound(src, 'sound/weapons/emitter.ogg', 55, TRUE)
		if("plasma")
			playsound(src, 'sound/weapons/pulse.ogg', 65, TRUE)

/obj/machinery/porta_turret/ship/weapon_system/proc/play_charging_sound()
	playsound(src, 'sound/weapons/taser2.ogg', 30, TRUE)

// Override fire_at_target to include sound effects
/obj/machinery/porta_turret/ship/weapon_system/fire_at_target(target_x, target_y)
	. = ..()
	if(.)
		play_weapon_sound()

// Override start_charging to include sound effects  
/obj/machinery/porta_turret/ship/weapon_system/start_charging()
	. = ..()
	if(.)
		play_charging_sound()
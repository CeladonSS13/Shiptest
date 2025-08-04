// Ammo loading system for ship weapons
/obj/machinery/ammo_loader
	name = "ammunition loader"
	desc = "A device that automatically reloads ship weapons with ammunition."
	icon = 'icons/obj/machines/autolathe.dmi'
	icon_state = "autolathe"
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 50
	active_power_usage = 500
	
	/// Connected weapon turret
	var/obj/machinery/porta_turret/ship/weapon_system/connected_weapon
	/// Ammo type this loader provides
	var/ammo_type = "ballistic"
	/// Reload rate (ammo per cycle)
	var/reload_rate = 10
	/// Time between reload cycles
	var/reload_time = 30
	/// Is currently reloading
	var/reloading = FALSE

/obj/machinery/ammo_loader/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/machinery/ammo_loader/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/machinery/ammo_loader/process()
	if(!connected_weapon || reloading)
		return
	
	if(connected_weapon.weapon_type != ammo_type)
		return
	
	if(connected_weapon.ammo_count >= connected_weapon.max_ammo)
		return
	
	start_reload()

/obj/machinery/ammo_loader/proc/start_reload()
	if(reloading)
		return FALSE
	
	reloading = TRUE
	use_power(active_power_usage)
	icon_state = "autolathe_n"
	
	addtimer(CALLBACK(src, PROC_REF(finish_reload)), reload_time)
	return TRUE

/obj/machinery/ammo_loader/proc/finish_reload()
	if(!connected_weapon)
		reloading = FALSE
		icon_state = "autolathe"
		return
	
	connected_weapon.reload_ammo(reload_rate)
	reloading = FALSE
	icon_state = "autolathe"
	use_power(idle_power_usage)

/obj/machinery/ammo_loader/proc/connect_to_weapon(obj/machinery/porta_turret/ship/weapon_system/weapon)
	if(!istype(weapon))
		return FALSE
	connected_weapon = weapon
	return TRUE

/obj/machinery/ammo_loader/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/multitool))
		var/obj/item/multitool/MT = I
		if(MT.buffer && istype(MT.buffer, /obj/machinery/porta_turret/ship/weapon_system))
			var/obj/machinery/porta_turret/ship/weapon_system/weapon = MT.buffer
			if(get_dist(src, weapon) <= 3 && weapon.weapon_type == ammo_type)
				connect_to_weapon(weapon)
				to_chat(user, span_notice("Connected [weapon.name] to [src]."))
				MT.buffer = src
			else
				to_chat(user, span_warning("Weapon is too far or incompatible type."))
		else
			MT.buffer = src
			to_chat(user, span_notice("Stored [src] in multitool buffer."))
		return
	return ..()

// Ballistic ammo loader
/obj/machinery/ammo_loader/ballistic
	name = "ballistic ammunition loader"
	ammo_type = "ballistic"
	reload_rate = 15

// Explosive ammo loader  
/obj/machinery/ammo_loader/explosive
	name = "missile loader"
	ammo_type = "explosive"
	reload_rate = 2
	reload_time = 60


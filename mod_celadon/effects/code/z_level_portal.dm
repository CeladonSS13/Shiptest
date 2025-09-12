/obj/machinery/z_level_teleporter
	name = "dimensional gateway"
	desc = "A powerful gateway that can transport between dimensional levels."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "portal"
	anchored = TRUE
	density = TRUE
	var/target_z
	var/target_x
	var/target_y
	var/last_teleport = 0

/obj/machinery/z_level_teleporter/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	teleport_user(user)

/obj/machinery/z_level_teleporter/Bumped(atom/movable/bumper)
	teleport_user(bumper)

/obj/machinery/z_level_teleporter/proc/teleport_user(atom/movable/M)
	if(!target_z || !target_x || !target_y)
		return
	if(world.time < last_teleport + 10)
		return
	var/turf/target = locate(target_x, target_y, target_z)
	if(!target)
		return
	last_teleport = world.time
	var/datum/effect_system/spark_spread/sparks = new
	sparks.set_up(5, 1, get_turf(M))
	sparks.start()
	M.forceMove(target)
	sparks = new
	sparks.set_up(5, 1, target)
	sparks.start()

/obj/machinery/z_level_teleporter/centcomm_to_outpost
	name = "outpost gateway"
	desc = "A gateway leading to the frontier outpost."
	// Установить координаты в мапе

/obj/machinery/z_level_teleporter/outpost_to_centcomm
	name = "centcomm gateway"
	desc = "A gateway leading back to central command."
	// Установить координаты в мапе
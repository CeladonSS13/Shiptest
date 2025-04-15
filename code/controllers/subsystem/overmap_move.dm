TIMER_SUBSYSTEM_DEF(overmap_movement)
	name = "Overmap Movement"
	priority = FIRE_PRIORITY_OVERMAP_MOVEMENT

// [CELADON-ADD] - CELADON_OVERMAP_COLLISION - Это вагабонд насрал

/proc/get_relative_motion(var/A, var/B)
	var/mins = -1
	if(A > 0 && B > 0)
		return B-A
	if(A < 0 && B > 0)
		return B*mins + A
	if(A > 0 && B < 0)
		return A*mins + B
	if(A < 0 && B < 0)
		return -(B*mins - A*mins)
	if(A == 0 && B != 0)
		return B
	if(A != 0 && B == 0)
		return -A
	else
		return 0

/datum/overmap/ship/controlled
	var/last_proximity_alert = 0
	var/last_collision_alert = 0

/proc/calculate_cpa(datum/overmap/ship/controlled/A, datum/overmap/ship/controlled/B, info = FALSE)
	var/cpa = -1
	var/tcpa = -1

	var/bearing = get_angle_raw(A.token.x, A.token.y, A.token.pixel_w, A.token.pixel_z, B.token.x, B.token.y, B.token.pixel_w, B.token.pixel_z)
	var/relative_motion_angle = get_angle_raw(B.speed_x * 60 SECONDS, B.speed_y * 60 SECONDS, 0, 0, -A.speed_x * 60 SECONDS, -A.speed_y * 60 SECONDS, 0, 0)
	if(max(closer_angle_difference(SIMPLIFY_DEGREES(bearing+180), relative_motion_angle), -closer_angle_difference(SIMPLIFY_DEGREES(bearing+180), relative_motion_angle)) >= 90)
		return list("cpa" = "--", "tcpa" = "--", "brg" = round(SIMPLIFY_DEGREES(bearing-A.bow_heading)))
	var/hypotenosis = get_pixel_distance(A.token, B.token)
	var/alpha = max(SIMPLIFY_DEGREES(relative_motion_angle-SIMPLIFY_DEGREES(bearing+180)), -SIMPLIFY_DEGREES(relative_motion_angle-SIMPLIFY_DEGREES(bearing+180)))
	cpa = sin(alpha)*hypotenosis		//Smoothing the distance for sure
	cpa = max(cpa, -cpa)

	var/relative_motion_x = get_relative_motion(A.speed_x, B.speed_x)
	var/relative_motion_y = get_relative_motion(A.speed_y, B.speed_y)

	var/distance_in_x = (A.token.x*32+A.token.pixel_w)-(B.token.x*32+B.token.pixel_w)
	var/distance_in_y = (A.token.y*32+A.token.pixel_z)-(B.token.y*32+B.token.pixel_z)

	var/tcpa_by_x = -1
	var/tcpa_by_y = -1
	if(relative_motion_x != 0)
		tcpa_by_x = (distance_in_x/32)/relative_motion_x
	if(relative_motion_y != 0)
		tcpa_by_y = (distance_in_y/32)/relative_motion_y

	if(tcpa_by_x != -1 && tcpa_by_y != -1)
		tcpa = (max(tcpa_by_x, -tcpa_by_x)+max(tcpa_by_y, -tcpa_by_y))/2
	else
		tcpa = max(tcpa_by_x, tcpa_by_y)

	if(!info)
		if(cpa != -1 && tcpa != -1)
			if(tcpa/SSovermap_stuff.wait <= 5 && cpa <= 8)
				var/arpdequeue_pointer = 0
				if(world.time - A.last_proximity_alert >= 20)
					A.last_proximity_alert = world.time
					while (arpdequeue_pointer++ < A.helms.len)
						var/obj/machinery/computer/helm/a = A.helms[arpdequeue_pointer]
						a.say("Proximity alarm! Possible collision situation.")
						playsound(a, 'sound/machines/engine_alert1.ogg', 50, FALSE)
			if(get_pixel_distance(A.token, B.token) <= 4 && cpa != -1 && (A.get_speed() != 0 || B.get_speed() != 0))
				var/arpdequeue_pointer = 0
				if(world.time - A.last_collision_alert >= 20)
					A.last_collision_alert = world.time
					while (arpdequeue_pointer++ < A.helms.len)
						var/obj/machinery/computer/helm/a = A.helms[arpdequeue_pointer]
						a.say("Collision impact with vessel \"[B.name]\".")
						playsound(a, 'sound/machines/engine_alert2.ogg', 50, FALSE)
				var/opposite_x = sin(SIMPLIFY_DEGREES(bearing+180))*(B.shuttle_port.turf_count/A.shuttle_port.turf_count)*max(0.002, abs(B.speed_x))
				var/opposite_y = cos(SIMPLIFY_DEGREES(bearing+180))*(B.shuttle_port.turf_count/A.shuttle_port.turf_count)*max(0.002, abs(B.speed_y))
				var/alt_opposite_x = sin(SIMPLIFY_DEGREES(bearing))*(B.shuttle_port.turf_count/A.shuttle_port.turf_count)*max(0.002, abs(B.speed_x))
				var/alt_opposite_y = cos(SIMPLIFY_DEGREES(bearing))*(B.shuttle_port.turf_count/A.shuttle_port.turf_count)*max(0.002, abs(B.speed_y))
				if(!(A.datum_flags & DF_ISPROCESSING))
					A.adjust_speed(-A.speed_x/2 + opposite_x, -A.speed_y/2 + opposite_y)
				else
					A.vector_to_add = list("x" = -A.speed_x/2 + opposite_x, "y" = -A.speed_y/2 + opposite_y)
				if(!(B.datum_flags & DF_ISPROCESSING))
					B.adjust_speed(-B.speed_x/2 + alt_opposite_x, -B.speed_y/2 + alt_opposite_y)
				else
					B.vector_to_add = list("x" = -B.speed_x/2 + alt_opposite_x, "y" = -B.speed_y/2 + alt_opposite_y)
				spawn_meteors_alt(round(60 SECONDS * MAGNITUDE(relative_motion_x, relative_motion_y))+1, list(/obj/effect/meteor/invisible), A.shuttle_port.get_virtual_level(), angle2dir_cardinal(SIMPLIFY_DEGREES((bearing-A.bow_heading+90))))
				spawn_meteors_alt(round(60 SECONDS * MAGNITUDE(relative_motion_x, relative_motion_y))+1, list(/obj/effect/meteor/invisible), B.shuttle_port.get_virtual_level(), angle2dir_cardinal(SIMPLIFY_DEGREES((bearing-A.bow_heading+270))))

	return list("cpa" = round(cpa), "tcpa" = round(tcpa/10), "brg" = round(SIMPLIFY_DEGREES(bearing-A.bow_heading)))

// [/CELADON-ADD]

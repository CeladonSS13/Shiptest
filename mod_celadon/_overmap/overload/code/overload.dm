//[CELADON-ADD] - перегрузка
/datum/overmap/ship/controlled
	var/last_overload_alarm = 0
	var/last_overload_throw = 0

/datum/overmap/ship/controlled/adjust_speed(n_x, n_y)
	. = ..()
	var/overload = ((abs(n_x) + abs(n_y))/acceleration_speed)
	if(round(overload*world.icon_size) > 0)
		if(world.time-last_overload_alarm > 20)
			last_overload_alarm = world.time
			for(var/obj/i in helms)
				if(i)
					playsound(i, 'sound/effects/alert.ogg', 25, FALSE)
	for(var/mob/living/M in GLOB.player_list)
		if(M.client)
			var/obj/check = pick(helms)
			if(M.virtual_z() == check.virtual_z())
				var/speeding_angle = get_angle_raw(0, 0, 0, 0, round(((n_x)/acceleration_speed)*world.icon_size*10), round(((n_y)/acceleration_speed)*world.icon_size*10), 0, 0)
				var/ang = SIMPLIFY_DEGREES(speeding_angle-bow_heading+270)
				var/overload_st = 10*world.icon_size*overload
				M.client.pixel_x = round(overload_st*sin(ang))
				M.client.pixel_y = round(overload_st*cos(ang))
				animate(M.client, pixel_x = 0, pixel_y = 0, 10, 1)
				if(iscarbon(M))
					var/mob/living/carbon/C = M
					var/bezbab = 30
					if(!C.resting)
						bezbab = bezbab+30
					if(!C.buckled)
						bezbab = bezbab+30
					if(prob(bezbab))
						C.adjust_disgust(round(overload*world.icon_size))
					if(round(overload*world.icon_size) > 0)
						if(world.time-last_overload_throw > 20 && !M.anchored && !M.buckled)
							last_overload_throw = world.time
							C.throw_at(get_ranged_target_turf(C, angle2dir(ang), range = round(overload_st)), range = round(overload_st/2), speed = round(overload_st/2), thrower = C)

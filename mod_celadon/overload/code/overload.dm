//[CELADON-ADD] - перегрузка
#define OVERLOAD_FACTOR 32

/datum/overmap/ship/controlled
	var/last_overload_alarm = 0
	var/last_overload_throw = 0

/datum/overmap/ship/controlled/adjust_speed(n_x, n_y)
	. = ..()
	var/overload = ((abs(n_x) + abs(n_y))/acceleration_speed)
	if(overload == 0)
		return
	if(world.time-last_overload_alarm > 20)
		last_overload_alarm = world.time
		for(var/obj/i in helms)
			if(i)
				playsound(i, 'sound/effects/alert.ogg', 25, FALSE)
	for(var/mob/living/M in GLOB.player_list)
		if(!M.client)
			return
		var/obj/check = pick(helms)
		if(M.virtual_z() == check.virtual_z())
			var/speeding_angle = get_angle_raw(0, 0, 0, 0, round(((n_x)/acceleration_speed)*OVERLOAD_FACTOR*10), round(((n_y)/acceleration_speed)*OVERLOAD_FACTOR*10), 0, 0)
			var/ang = SIMPLIFY_DEGREES(speeding_angle-bow_heading+270)
			var/overload_st = 10*OVERLOAD_FACTOR*overload
			M.client.pixel_x = round(overload_st*sin(ang))
			M.client.pixel_y = round(overload_st*cos(ang))
			animate(M.client, pixel_x = 0, pixel_y = 0, 10, 1)
			if(!iscarbon(M))
				return
			var/mob/living/carbon/C = M
			var/bezbab = 30
			if(!C.resting)
				bezbab = bezbab+30
			if(!C.buckled)
				bezbab = bezbab+30
			var/obj/item/clothing/shoes/magboots/boots = C.get_item_by_slot(ITEM_SLOT_FEET)
			if(boots.magpulse)
				return
			if(istype(C.buckled, /obj/structure/chair/comfy/shuttle))
				return
			if(prob(bezbab))
				C.adjust_disgust(round(overload*OVERLOAD_FACTOR))
			if(round(overload*OVERLOAD_FACTOR) > 0)
				if(world.time-last_overload_throw > 20 && !M.anchored && !M.buckled)
					last_overload_throw = world.time
					C.throw_at(get_ranged_target_turf(C, angle2dir(ang), range = round(overload_st)), range = round(overload_st/2), speed = round(overload_st/2), thrower = C)

#undef OVERLOAD_FACTOR

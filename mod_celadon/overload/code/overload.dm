#define OVERLOAD_FACTOR 32
#define OVERLOAD_CHANCE 30
#define OVERLOAD_COOLDOWN 20
#define OVERLOAD_THROW_RANGE_MAX 6

// MARK: Эффект перегрузки

/datum/overmap/ship/controlled
	var/last_overload_alarm = 0
	var/last_overload_throw = 0

/datum/overmap/ship/controlled/adjust_speed(n_x, n_y)
	. = ..()
	if(acceleration_speed <= 0)
		return
	var/overload = ((abs(n_x) + abs(n_y)) / acceleration_speed)

	if(world.time - last_overload_alarm > OVERLOAD_COOLDOWN)
		last_overload_alarm = world.time
		for(var/obj/i in helms)
			if(i)
				playsound(i, 'sound/effects/alert.ogg', 25, FALSE)

	var/speeding_angle = ATAN2(n_y, n_x)
	var/ang = SIMPLIFY_DEGREES(speeding_angle - bow_heading + 270)
	var/overload_st = 10 * OVERLOAD_FACTOR * overload
	var/disgust_amount = round(overload * OVERLOAD_FACTOR)
	var/throw_range = clamp(round(overload_st), 1, OVERLOAD_THROW_RANGE_MAX)
	var/throw_speed = max(1, round(throw_range / 2))

	for(var/mob/living/M in GLOB.player_list)
		if(!M.client)
			continue

		var/obj/check = pick(helms)
		if(!check || M.virtual_z() != check.virtual_z())
			continue

		M.client.pixel_x = round(overload_st * sin(ang))
		M.client.pixel_y = round(overload_st * cos(ang))
		animate(M.client, pixel_x = 0, pixel_y = 0, 10, 1)

		if(!iscarbon(M))
			continue

		var/mob/living/carbon/C = M
		var/is_protected = check_overload_protection(C)

		if(!is_protected)
			apply_overload_effects(C, overload_st, disgust_amount, ang, throw_range, throw_speed, src)

// MARK: Функции

/proc/check_overload_protection(mob/living/carbon/C)
	var/obj/item/clothing/shoes/magboots/boots = C.get_item_by_slot(ITEM_SLOT_FEET)
	if(istype(boots) && boots.magpulse)
		return TRUE

	if(C.buckled && istype(C.buckled, /obj/structure/chair/comfy/shuttle))
		return TRUE

/proc/apply_overload_effects(mob/living/carbon/C, overload_st, disgust_amount, ang, throw_range, throw_speed, datum/overmap/ship/controlled/ship)
	var/chance_overload = OVERLOAD_CHANCE
	if(!C.resting)
		chance_overload += OVERLOAD_CHANCE
	if(!C.buckled)
		chance_overload += OVERLOAD_CHANCE

	if(prob(chance_overload))
		C.adjust_disgust(disgust_amount)

	if(disgust_amount > 0 && world.time - ship.last_overload_throw > OVERLOAD_COOLDOWN && !C.anchored && !C.buckled)
		ship.last_overload_throw = world.time
		C.throw_at(get_ranged_target_turf(C, angle2dir(ang), range = throw_range), range = throw_range, speed = throw_speed, thrower = C)

#undef OVERLOAD_FACTOR
#undef OVERLOAD_CHANCE
#undef OVERLOAD_COOLDOWN
#undef OVERLOAD_THROW_RANGE_MAX

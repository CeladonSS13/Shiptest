// Глобальные переменные для Rust-G физики
GLOBAL_VAR_INIT(water_physics_enabled, FALSE)
GLOBAL_LIST_EMPTY(water_simulation_queue)

// Объект воды поверх турфа
/obj/effect/water_overlay
	name = "water"
	desc = "Dynamic water that can spread and flow. Contains water_volumeL of water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "water"
	color = "#FFFFFF"
	alpha = 120
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	anchored = TRUE

	var/water_volume = 0
	var/max_water_volume = INFINITY
	var/spread_rate = WATER_SPREAD_RATE * 50
	var/last_spread_time = 0
	var/spread_delay = 1

/obj/effect/water_overlay/Initialize(mapload, initial_volume = 100)
	. = ..()
	water_volume = initial_volume
	update_water_appearance()
	if(water_volume > 0)
		START_PROCESSING(SSprocessing, src)

/obj/effect/water_overlay/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/obj/effect/water_overlay/proc/get_water_level()
	return round(water_volume / WATER_VOLUME_PER_LEVEL)

/obj/effect/water_overlay/proc/add_water(amount)
	if(amount <= 0)
		return 0

	var/old_volume = water_volume
	water_volume += amount
	var/added = water_volume - old_volume

	if(added > 0)
		update_water_appearance()
		START_PROCESSING(SSprocessing, src)

	return added

/obj/effect/water_overlay/proc/remove_water(amount)
	if(amount <= 0)
		return 0

	var/old_volume = water_volume
	water_volume = max(water_volume - amount, 0)
	var/removed = old_volume - water_volume

	if(removed > 0)
		update_water_appearance()

		if(water_volume <= 0)
			STOP_PROCESSING(SSprocessing, src)
			qdel(src)
			return removed

	return removed

/obj/effect/water_overlay/proc/update_water_appearance()
	var/level = get_water_level()

	switch(level)
		if(WATER_LEVEL_NONE)
			alpha = 80
			name = "wet floor"
			desc = "The floor is slightly wet."
		if(WATER_LEVEL_ANKLES)
			alpha = 120
			name = "shallow water"
			desc = "Water that reaches your ankles."
		if(WATER_LEVEL_WAIST)
			alpha = 160
			name = "water"
			desc = "Water that reaches your waist."
		if(WATER_LEVEL_CHEST)
			alpha = 190
			name = "deep water"
			desc = "Water that reaches your chest."
		if(WATER_LEVEL_NECK)
			alpha = 210
			name = "deep water"
			desc = "Water that reaches your neck."
		if(WATER_LEVEL_SUBMERGED)
			alpha = 240
			name = "deep water"
			desc = "Deep water that can completely submerge you."

/obj/effect/water_overlay/process(seconds_per_tick)
	if(GLOB.water_physics_enabled)
		// Используем Rust-G физику
		var/turf/T = get_turf(src)
		if(T && water_volume > 0)
			GLOB.water_simulation_queue["[T.x],[T.y],[T.z]"] = water_volume
		return
	
	// Старая физика
	if(world.time < last_spread_time + spread_delay)
		return

	last_spread_time = world.time

	if(water_volume <= 0)
		STOP_PROCESSING(SSprocessing, src)
		return

	spread_water()

/obj/effect/water_overlay/proc/spread_water()
	if(water_volume <= WATER_VOLUME_PER_LEVEL)
		return

	var/list/adjacent_turfs = list()
	for(var/direction in GLOB.cardinals)
		var/turf/T = get_step(loc, direction)
		if(T && can_spread_to(T))
			adjacent_turfs += T

	if(!length(adjacent_turfs))
		return

	var/spread_amount = min(spread_rate, water_volume - WATER_VOLUME_PER_LEVEL)
	var/amount_per_turf = spread_amount / length(adjacent_turfs)

	for(var/turf/T in adjacent_turfs)
		var/actual_spread = spread_to_turf(T, amount_per_turf)
		water_volume -= actual_spread

/obj/effect/water_overlay/proc/can_spread_to(turf/T)
	if(T.density)
		return FALSE

	if(istype(T, /turf/closed))
		return FALSE

	for(var/obj/O in T)
		if(O.density)
			return FALSE

	if(istype(T, /turf/open) && !istype(T, /turf/open/space))
		return TRUE

	return FALSE

/obj/effect/water_overlay/proc/spread_to_turf(turf/T, amount)
	if(amount <= 0)
		return 0

	var/obj/effect/water_overlay/existing_water = locate(/obj/effect/water_overlay) in T
	if(existing_water)
		return existing_water.add_water(amount)

	new /obj/effect/water_overlay(T, amount)
	return amount

/obj/effect/water_overlay/Crossed(atom/movable/AM)
	. = ..()
	if(isliving(AM))
		var/mob/living/L = AM
		apply_water_effects_to_mob(L, get_turf(src))

/obj/effect/water_overlay/Uncrossed(atom/movable/AM)
	. = ..()
	if(isliving(AM))
		var/mob/living/L = AM
		var/turf/T = get_turf(L)
		if(get_water_level_at_turf(T) == WATER_LEVEL_NONE)
			L.remove_status_effect(/datum/status_effect/drowning)
			L.remove_status_effect(/datum/status_effect/water_slowdown)
			L.remove_status_effect(/datum/status_effect/underwater_overlay)
			L.remove_status_effect(/datum/status_effect/water_pressure)
			L.apply_status_effect(/datum/status_effect/lung_water_clearing)



// Универсальные функции получения уровня воды
/proc/get_water_level_at_turf(turf/T)
	if(!T)
		return WATER_LEVEL_NONE
	
	// Проверяем эффект воды
	var/obj/effect/water_overlay/water_effect = locate(/obj/effect/water_overlay) in T
	if(water_effect)
		return water_effect.get_water_level()
	
	// Проверяем турф воды
	if(istype(T, /turf/open/water))
		return WATER_LEVEL_SUBMERGED
	
	return WATER_LEVEL_NONE

/proc/get_water_volume_at_turf(turf/T)
	if(!T)
		return 0
	
	// Проверяем эффект воды
	var/obj/effect/water_overlay/water_effect = locate(/obj/effect/water_overlay) in T
	if(water_effect)
		return water_effect.water_volume
	
	// Проверяем турф воды
	if(istype(T, /turf/open/water))
		return 500
	
	return 0

// Универсальная функция применения водных эффектов
/proc/apply_water_effects_to_mob(mob/living/L, turf/T)
	if(!L || !T)
		return

	var/level = get_water_level_at_turf(T)
	var/volume = get_water_volume_at_turf(T)

	if(level >= WATER_LEVEL_NECK)
		L.apply_status_effect(/datum/status_effect/drowning)
	else
		L.remove_status_effect(/datum/status_effect/drowning)

	if(level >= WATER_LEVEL_CHEST)
		L.apply_status_effect(/datum/status_effect/water_slowdown)
	else
		L.remove_status_effect(/datum/status_effect/water_slowdown)

	if(level >= WATER_LEVEL_SUBMERGED)
		L.apply_status_effect(/datum/status_effect/underwater_overlay)
	else
		L.remove_status_effect(/datum/status_effect/underwater_overlay)

	if(volume >= 1000)
		L.apply_status_effect(/datum/status_effect/water_pressure)
	else
		L.remove_status_effect(/datum/status_effect/water_pressure)

/obj/effect/water_overlay/examine(mob/user)
	. = ..()
	var/level = get_water_level()
	var/level_name
	switch(level)
		if(WATER_LEVEL_NONE)
			level_name = "wet floor"
		if(WATER_LEVEL_ANKLES)
			level_name = "ankle deep"
		if(WATER_LEVEL_WAIST)
			level_name = "waist deep"
		if(WATER_LEVEL_CHEST)
			level_name = "chest deep"
		if(WATER_LEVEL_NECK)
			level_name = "neck deep"
		if(WATER_LEVEL_SUBMERGED)
			level_name = "fully submerged"
	. += span_notice("Water level: [level_name] ([water_volume]L)")

// Предустановленные уровни воды
/obj/effect/water_overlay/ankle_deep
	water_volume = WATER_VOLUME_PER_LEVEL

/obj/effect/water_overlay/waist_deep
	water_volume = WATER_VOLUME_PER_LEVEL * 2

/obj/effect/water_overlay/chest_deep
	water_volume = WATER_VOLUME_PER_LEVEL * 3

/obj/effect/water_overlay/neck_deep
	water_volume = WATER_VOLUME_PER_LEVEL * 4

/obj/effect/water_overlay/submerged
	water_volume = WATER_VOLUME_PER_LEVEL * 5

/obj/effect/water_overlay/full
	name = "deep water"
	desc = "Deep water that completely submerges everything."
	water_volume = 5000
	var/permanent_water = TRUE

/obj/effect/water_overlay/full/remove_water(amount)
	if(permanent_water)
		return 0
	return ..()

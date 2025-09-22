// Динамическая вода
/turf/open/water/dynamic
	name = "water"
	desc = "Dynamic water that can spread and flow."
	icon = 'icons/turf/floors.dmi'
	icon_state = "water"
	baseturfs = /turf/open/floor/plating

	var/water_volume = 0 // Объем воды в литрах
	var/max_water_volume = WATER_MAX_VOLUME
	var/spread_rate = WATER_SPREAD_RATE * 5
	var/water_flags = NONE

	// Для обработки распространения
	var/last_spread_time = 0
	var/spread_delay = 3 // Задержка между распространениями в тиках

/turf/open/water/dynamic/Initialize(mapload, inherited_virtual_z)
	. = ..()
	update_water_appearance()
	if(water_volume > 0)
		START_PROCESSING(SSprocessing, src)

/turf/open/water/dynamic/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	return ..()

// Получить уровень воды (0-5)
/turf/open/water/dynamic/proc/get_water_level()
	return round(water_volume / WATER_VOLUME_PER_LEVEL)

// Добавить воду
/turf/open/water/dynamic/proc/add_water(amount)
	if(amount <= 0)
		return 0

	var/old_volume = water_volume
	water_volume = min(water_volume + amount, max_water_volume)
	var/added = water_volume - old_volume

	if(added > 0)
		update_water_appearance()
		update_air_displacement()

		START_PROCESSING(SSprocessing, src)

	return added

// Убрать воду
/turf/open/water/dynamic/proc/remove_water(amount)
	if(amount <= 0)
		return 0

	var/old_volume = water_volume
	water_volume = max(water_volume - amount, 0)
	var/removed = old_volume - water_volume

	if(removed > 0)
		update_water_appearance()
		update_air_displacement()

		if(water_volume <= 0)
			STOP_PROCESSING(SSprocessing, src)
			// Превращаем обратно в обычный тайл
			ChangeTurf(baseturfs, flags = CHANGETURF_INHERIT_AIR)
			return removed

	return removed

// Обновить внешний вид в зависимости от уровня воды
/turf/open/water/dynamic/proc/update_water_appearance()
	var/level = get_water_level()

	// Меняем только альфа канал
	icon_state = "water"
	color = "#FFFFFF"
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
			alpha = 200
			name = "deep water"
			desc = "Water that reaches your chest."
		if(WATER_LEVEL_NECK)
			alpha = 230
			name = "deep water"
			desc = "Water that reaches your neck."
		if(WATER_LEVEL_SUBMERGED)
			alpha = 255
			name = "deep water"
			desc = "Deep water that can completely submerge you."

// Обновить вытеснение воздуха
/turf/open/water/dynamic/proc/update_air_displacement()
	if(!air)
		return

	var/level = get_water_level()
	var/displacement_ratio = level / WATER_LEVEL_SUBMERGED

	// Вода вытесняет воздух
	if(displacement_ratio > 0)
		var/displaced_moles = air.total_moles() * displacement_ratio * 0.1
		if(displaced_moles > 0)
			air.remove(displaced_moles)

// Обработка распространения воды
/turf/open/water/dynamic/process(seconds_per_tick)
	if(world.time < last_spread_time + spread_delay)
		return

	last_spread_time = world.time

	if(water_volume <= 0)
		STOP_PROCESSING(SSprocessing, src)
		return

	spread_water()

// Распространение воды на соседние тайлы
/turf/open/water/dynamic/proc/spread_water()
	if(water_volume <= WATER_VOLUME_PER_LEVEL)
		return // Недостаточно воды для распространения

	var/list/adjacent_turfs = list()
	for(var/direction in GLOB.cardinals)
		var/turf/T = get_step(src, direction)
		if(T && can_spread_to(T))
			adjacent_turfs += T

	if(!length(adjacent_turfs))
		return

	var/spread_amount = min(spread_rate, water_volume - WATER_VOLUME_PER_LEVEL)
	var/amount_per_turf = spread_amount / length(adjacent_turfs)

	for(var/turf/T in adjacent_turfs)
		var/actual_spread = spread_to_turf(T, amount_per_turf)
		water_volume -= actual_spread

// Проверить, можно ли распространиться на тайл
/turf/open/water/dynamic/proc/can_spread_to(turf/T)
	if(T.density)
		return FALSE

	// Проверяем на стены и шлюзы
	if(istype(T, /turf/closed))
		return FALSE

	// Проверяем на объекты с плотностью
	for(var/obj/O in T)
		if(O.density)
			return FALSE

	// Можем распространиться на обычные открытые тайлы
	if(istype(T, /turf/open) && !istype(T, /turf/open/space))
		return TRUE

	return FALSE

// Распространить воду на конкретный тайл
/turf/open/water/dynamic/proc/spread_to_turf(turf/T, amount)
	if(amount <= 0)
		return 0

	// Проверяем есть ли уже водный эффект
	for(var/obj/effect/water_overlay/existing_water in T)
		return existing_water.add_water(amount)

	// Создаем новый водный эффект
	var/obj/effect/water_overlay/new_water = new(T)
	return new_water.add_water(amount)

// Обработка входа мобов - передаем обработку эффекту воды
/turf/open/water/dynamic/Entered(atom/movable/AM, atom/old_loc)
	. = ..()
	var/obj/effect/water_overlay/water_effect = locate(/obj/effect/water_overlay) in src
	if(water_effect && isliving(AM))
		water_effect.update_mob_water_effects(AM)

// Обработка выхода мобов - передаем обработку эффекту воды
/turf/open/water/dynamic/Exited(atom/movable/AM, direction)
	. = ..()
	var/obj/effect/water_overlay/water_effect = locate(/obj/effect/water_overlay) in src
	if(water_effect && isliving(AM))
		// Проверяем новый тайл
		var/turf/new_turf = get_turf(AM)
		var/obj/effect/water_overlay/new_water = locate(/obj/effect/water_overlay) in new_turf
		if(!new_water)
			// Убираем водные эффекты только если вышли из воды полностью
			var/mob/living/L = AM
			L.remove_status_effect(/datum/status_effect/drowning)
			L.remove_status_effect(/datum/status_effect/water_slowdown)
			L.remove_status_effect(/datum/status_effect/underwater_overlay)
			L.remove_status_effect(/datum/status_effect/water_pressure)
			L.apply_status_effect(/datum/status_effect/lung_water_clearing)

// Обновить эффекты воды на мобе - теперь через эффект воды
/turf/open/water/dynamic/proc/update_mob_water_effects(mob/living/L)
	var/obj/effect/water_overlay/water_effect = locate(/obj/effect/water_overlay) in src
	if(water_effect)
		water_effect.update_mob_water_effects(L)

// Предустановленные уровни воды
/turf/open/water/dynamic/ankle_deep
	water_volume = WATER_VOLUME_PER_LEVEL

/turf/open/water/dynamic/waist_deep
	water_volume = WATER_VOLUME_PER_LEVEL * 2

/turf/open/water/dynamic/chest_deep
	water_volume = WATER_VOLUME_PER_LEVEL * 3

/turf/open/water/dynamic/neck_deep
	water_volume = WATER_VOLUME_PER_LEVEL * 4

/turf/open/water/dynamic/submerged
	water_volume = WATER_MAX_VOLUME

// Специальный турф с текстурой воды и полным объемом
/turf/open/water/dynamic/full
	name = "deep water"
	desc = "Deep water that completely submerges everything."
	icon_state = "water"
	water_volume = 0 // Турф не содержит воды, только эффект

	// Этот турф всегда остается водным
	var/permanent_water = TRUE
	var/obj/effect/water_overlay/water_effect

/turf/open/water/dynamic/full/Initialize(mapload, inherited_virtual_z)
	. = ..()
	// Создаем водный эффект с полным объемом
	water_effect = new /obj/effect/water_overlay/full(src)
	return .

/turf/open/water/dynamic/full/Destroy()
	if(water_effect)
		QDEL_NULL(water_effect)
	return ..()

/turf/open/water/dynamic/full/remove_water(amount)
	if(permanent_water)
		return 0 // Не позволяем убирать воду
	return ..()
// Осмотр тайла с водой
/turf/open/water/dynamic/examine(mob/user)
	. = ..()
	var/level = get_water_level()
	var/level_name
	switch(level)
		if(WATER_LEVEL_NONE)
			level_name = "нет воды"
		if(WATER_LEVEL_ANKLES)
			level_name = "по щиколотки"
		if(WATER_LEVEL_WAIST)
			level_name = "по пояс"
		if(WATER_LEVEL_CHEST)
			level_name = "по грудь"
		if(WATER_LEVEL_NECK)
			level_name = "по шею"
		if(WATER_LEVEL_SUBMERGED)
			level_name = "полное погружение"
	. += "<span class='notice'>Уровень воды: [level_name] ([water_volume] литров)</span>"

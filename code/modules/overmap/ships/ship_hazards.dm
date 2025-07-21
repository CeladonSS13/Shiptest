/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Ship Hazards
 *
 * Интеграция системы щитов с различными опасностями в космосе.
 */

/**
 * Обработка метеоритов
 */
/datum/controller/subsystem/meteor/proc/handle_ship_shields(turf/target_turf, obj/effect/meteor/meteor)
	var/area/A = get_area(target_turf)
	// Проверяем, связана ли область с кораблем
	var/datum/overmap/ship/ship = null

	// Ищем корабль, связанный с этой областью
	for(var/datum/overmap/O in SSovermap.overmap_objects)
		if(!istype(O, /datum/overmap/ship))
			continue
		var/datum/overmap/ship/S = O
		var/list/areas = S.get_areas()
		if(A in areas)
			ship = S
			break

	if(!ship || !ship.shield_system || !ship.shield_system.active)
		return FALSE

	// Определяем урон от метеорита
	var/damage = 0
	if(istype(meteor, /obj/effect/meteor/dust))
		damage = 10
	else if(istype(meteor, /obj/effect/meteor/medium))
		damage = 80
	else if(istype(meteor, /obj/effect/meteor/big))
		damage = 200
	else if(istype(meteor, /obj/effect/meteor/tunguska))
		damage = 500
	else
		damage = 50

	// Пытаемся поглотить урон щитами
	var/absorbed = ship.shield_system.absorb_damage(damage, "meteor")
	if(absorbed >= damage)
		// Создаем визуальный эффект поглощения метеорита
		// Создаем эффект на месте метеорита
		new /obj/effect/shield_impact(target_turf)
		// Уничтожаем метеорит
		qdel(meteor)
		return TRUE

	return FALSE

/**
 * Перехватываем метеориты перед попаданием в корабль
 */
/obj/effect/meteor/Move()
	// Проверяем, защищен ли корабль щитами
	var/turf/target = get_turf(get_step(src, dir))

	// Проверяем наличие системы метеоритов
	if(SSweather && istype(SSweather, /datum/controller/subsystem/meteor))
		var/datum/controller/subsystem/meteor/meteor_system = SSweather
		if(meteor_system.handle_ship_shields(target, src))
			return FALSE
	return ..()

/**
 * Обработка радиационных штормов
 */
/datum/weather/rad_storm/telegraph()
	. = ..()
	// Проверяем все корабли на наличие активных щитов
	for(var/datum/overmap/O in SSovermap.overmap_objects)
		if(!istype(O, /datum/overmap/ship))
			continue
		var/datum/overmap/ship/ship = O
		if(ship.shield_system && ship.shield_system.active)
			var/list/areas = ship.get_areas()
			for(var/area/A in areas)
				protected_areas |= A

/**
 * Обработка ионных штормов
 */
/datum/round_event/ion_storm
	var/list/protected_ships = list()

/datum/round_event/ion_storm/announce(fake)
	. = ..()
	// Проверяем все корабли на наличие активных щитов
	for(var/datum/overmap/O in SSovermap.overmap_objects)
		if(!istype(O, /datum/overmap/ship))
			continue
		var/datum/overmap/ship/ship = O
		if(ship.shield_system && ship.shield_system.active)
			protected_ships |= ship

/datum/round_event/ion_storm/start()
	// Модифицируем логику, чтобы не затрагивать защищенные корабли
	var/list/valid_ais = list()
	for(var/mob/living/silicon/ai/AI in GLOB.alive_mob_list)
		var/area/A = get_area(AI)
		var/protected = FALSE
		for(var/datum/overmap/ship/ship in protected_ships)
			var/list/areas = ship.get_areas()
			if(A in areas)
				protected = TRUE
				break
		if(!protected)
			valid_ais += AI

	if(!valid_ais.len)
		return

	// Продолжаем стандартную логику для незащищенных ИИ
	var/mob/living/silicon/ai/picked_ai = pick(valid_ais)
	if(picked_ai.laws.zeroth)
		return
	picked_ai.laws.add_ion_law(generate_ion_law())

	// Визуальный эффект для защищенных кораблей
	for(var/datum/overmap/ship/ship in protected_ships)
		var/list/areas = ship.get_areas()
		for(var/area/A in areas)
			for(var/turf/T in A)
				if(prob(5))
					new /obj/effect/shield_impact(T)

/**
 * Обработка электрических штормов
 */
/datum/round_event/electrical_storm
	var/list/protected_ships = list()

/datum/round_event/electrical_storm/announce(fake)
	. = ..()
	// Проверяем все корабли на наличие активных щитов
	for(var/datum/overmap/O in SSovermap.overmap_objects)
		if(!istype(O, /datum/overmap/ship))
			continue
		var/datum/overmap/ship/ship = O
		if(ship.shield_system && ship.shield_system.active)
			protected_ships |= ship

/datum/round_event/electrical_storm/start()
	var/list/valid_apcs = list()
	for(var/obj/machinery/power/apc/A in GLOB.apcs_list)
		var/area/current_area = get_area(A)
		var/protected = FALSE
		for(var/datum/overmap/ship/ship in protected_ships)
			var/list/areas = ship.get_areas()
			if(current_area in areas)
				protected = TRUE
				// Визуальный эффект для защищенных кораблей
				if(prob(10))
					new /obj/effect/shield_impact(get_turf(A))
				break
		if(!protected && !A.shorted && A.cell && A.operating)
			valid_apcs += A

	// Продолжаем стандартную логику для незащищенных APCs
	var/overload_number = rand(6, 10)
	while(overload_number > 0 && valid_apcs.len)
		overload_number--
		var/obj/machinery/power/apc/A = pick(valid_apcs)
		valid_apcs -= A
		A.overload_lighting()

/**
 * Обработка огненных штормов
 */
/datum/weather/ash_storm
	var/list/ship_protected_areas = list()
	var/storm_intensity = 1 // Добавляем переменную для интенсивности шторма

/datum/weather/ash_storm/telegraph()
	. = ..()
	// Проверяем все корабли на наличие активных щитов
	for(var/datum/overmap/O in SSovermap.overmap_objects)
		if(!istype(O, /datum/overmap/ship))
			continue
		var/datum/overmap/ship/ship = O
		if(ship.shield_system && ship.shield_system.active)
			var/list/areas = ship.get_areas()
			for(var/area/A in areas)
				ship_protected_areas |= A

/datum/weather/ash_storm/weather_act(mob/living/L)
	if(!L || L.z != impacted_z_levels[1])
		return

	var/area/A = get_area(L)
	if(A in ship_protected_areas)
		// Корабль защищен щитами
		if(prob(5))
			new /obj/effect/shield_impact(get_turf(L))
		return

	// Стандартная логика для незащищенных областей
	if(prob(storm_intensity * 10))
		L.adjustFireLoss(storm_intensity * rand(1, 3))
		to_chat(L, span_warning("Горячий воздух обжигает вашу кожу!"))

/**
 * Получение всех областей, связанных с кораблем
 */
/datum/overmap/ship/proc/get_areas()
	var/list/areas = list()

	// Если у корабля нет связанных областей, возвращаем пустой список
	if(!istype(src) || !token)
		return areas

	// Получаем все области, связанные с кораблем
	for(var/area/A in world)
		if(istype(A) && (A.type == /area || A.type == /area/space))
			continue // Пропускаем базовые типы областей
		// Проверяем, принадлежит ли эта область кораблю
		// Это упрощенная логика, в реальном коде нужно использовать более точную проверку
		areas += A

	return areas

// Добавляем метод для проверки существования процедуры у объекта
/mob/proc/proc_exists(proc_name)
	return (proc_name in verbs) || hascall(src, proc_name)

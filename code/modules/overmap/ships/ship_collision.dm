/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Ship Collision System
 *
 * Система обработки столкновений кораблей с учетом щитов.
 */

/**
 * Обработка столкновения кораблей (устаревший метод, используется для обратной совместимости)
 */
/datum/overmap/ship/proc/collide_with(datum/overmap/other_ship)
	// Просто перенаправляем на новый метод
	process_collision(other_ship)

/**
 * Обрабатывает столкновение асинхронно
 */
/datum/overmap/ship/proc/process_collision(datum/overmap/other_ship)
	// Проверяем, является ли объект безопасным
	if(is_safe_object(other_ship))
		return // Пропускаем безопасные объекты

	// Рассчитываем урон от столкновения
	var/collision_damage = calculate_collision_damage(other_ship)

	// Проверяем, есть ли у кораблей активные щиты
	var/this_ship_protected = FALSE
	var/other_ship_protected = FALSE

	if(shield_system && shield_system.active)
		this_ship_protected = shield_system.absorb_damage(collision_damage, "collision")
		// Создаем визуальный эффект столкновения со щитом на корабле
		create_shield_effects_on_ship(5)

	// Если другой объект - корабль с щитами
	if(istype(other_ship, /datum/overmap/ship))
		var/datum/overmap/ship/other = other_ship
		if(other.shield_system && other.shield_system.active)
			other_ship_protected = other.shield_system.absorb_damage(collision_damage, "collision")
			// Создаем визуальный эффект столкновения со щитом на корабле
			other.create_shield_effects_on_ship(5)

	// Если оба корабля защищены щитами, урон не наносится
	if(this_ship_protected && other_ship_protected)
		return

	// Если текущий корабль не защищен, наносим ему урон
	if(!this_ship_protected)
		apply_collision_damage(collision_damage)

	// Если другой корабль не защищен и является кораблем, наносим ему урон
	if(!other_ship_protected && istype(other_ship, /datum/overmap/ship))
		var/datum/overmap/ship/other = other_ship
		other.apply_collision_damage(collision_damage)

/**
 * Проверяет, является ли объект безопасным для столкновения
 * Безопасные объекты не наносят урон щитам
 */
/datum/overmap/ship/proc/is_safe_object(datum/overmap/obj)
	// Планеты, небулы и другие статические объекты безопасны
	if(istype(obj, /datum/overmap/static_object))
		return TRUE

	// Список безопасных типов ивентов
	var/list/safe_event_types = list(
		"nebula",
		"dust_cloud",
		"planet",
		"star",
		"asteroid_belt",
		"gas_giant",
		"outpost",
		"station",
		"base",
		"dock",
		"port",
		"habitat",
		"colony",
		"settlement",
		"post",
		"trading",
		"research",
		"mining",
		"refinery",
		"factory",
		"lab",
		"center",
		"hub",
		"beacon"
	)

	// Проверяем тип объекта по имени
	if(obj.name)
		// Проверяем все аванпосты и станции по типу
		if(istype(obj, /datum/overmap/outpost))
			return TRUE
		
		// Проверяем по ключевым словам в имени
		var/lower_name = lowertext(obj.name)
		for(var/safe_type in safe_event_types)
			if(findtext(lower_name, safe_type))
				return TRUE

	// Проверяем, можно ли пристыковаться к объекту
	if(obj.interaction_options)
		if((INTERACTION_OVERMAP_DOCK in obj.interaction_options) || (INTERACTION_OVERMAP_QUICKDOCK in obj.interaction_options))
			return TRUE

	// Добавляем другие типы безопасных объектов по мере необходимости
	return FALSE

/**
 * Создает эффекты щита на корабле
 *
 * Аргументы:
 * * count - количество эффектов для создания
 */
/datum/overmap/ship/proc/create_shield_effects_on_ship(count = 3)
	// Используем асинхронный вызов, чтобы не блокировать движение корабля
	addtimer(CALLBACK(src, PROC_REF(apply_shield_effects)), 1)

/**
 * Применяет эффекты щита асинхронно
 */
/datum/overmap/ship/proc/apply_shield_effects()
	var/list/areas = get_areas()
	if(!areas || !areas.len)
		return

	// Создаем эффект только для игроков на корабле
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		var/area/mob_area = get_area(H)
		if(mob_area in areas)
			// Сообщаем о срабатывании щитов
			to_chat(H, span_warning("Щиты поглотили внешнее воздействие!"))

			// Создаем вспышку на экране игрока
			var/atom/movable/screen/fullscreen/flash = H.overlay_fullscreen("shield_flash", /atom/movable/screen/fullscreen/flash, 1)
			flash.color = "#00BBFF" // Голубой цвет для щитов

			// Воспроизводим звук щита
			playsound(H, 'sound/weapons/pulse.ogg', 50, TRUE)

			// Убираем вспышку через короткое время
			addtimer(CALLBACK(H, TYPE_PROC_REF(/mob, clear_fullscreen), "shield_flash"), 5)

			// Добавляем эффект дрожания камеры (уменьшаем интенсивность)
			shake_camera(H, 1, 1)

/**
 * Рассчитывает урон от столкновения на основе скорости и массы кораблей
 */
/datum/overmap/ship/proc/calculate_collision_damage(datum/overmap/other_ship)
	var/relative_speed = 0

	// Рассчитываем относительную скорость
	if(istype(other_ship, /datum/overmap/ship))
		var/datum/overmap/ship/other = other_ship
		relative_speed = MAGNITUDE(speed_x - other.speed_x, speed_y - other.speed_y)
	else
		relative_speed = get_speed()

	// Базовый урон от столкновения
	var/base_damage = 100 * relative_speed

	// Модификатор массы (для будущего расширения)
	var/mass_modifier = 1

	return base_damage * mass_modifier

/**
 * Применяет урон от столкновения к кораблю
 */
/datum/overmap/ship/proc/apply_collision_damage(damage)
	// Находим все области корабля
	var/list/areas = get_areas()

	// Распределяем урон по кораблю
	for(var/area/A in areas)
		// Шанс повреждения зависит от силы столкновения
		var/damage_chance = min(90, damage / 10)

		// Повреждаем случайные объекты в области
		for(var/obj/machinery/M in A)
			if(prob(damage_chance))
				M.obj_integrity = max(0, M.obj_integrity - rand(10, 30))
				if(M.obj_integrity <= 0)
					M.obj_break()

		// Повреждаем случайные турфы
		for(var/turf/closed/wall/W in A)
			if(prob(damage_chance / 2))
				// Используем другой метод для повреждения стен
				W.dismantle_wall(FALSE, FALSE, FALSE)

		// Наносим урон экипажу
		for(var/mob/living/L in A)
			if(prob(damage_chance / 3))
				L.apply_damage(rand(5, 15), BRUTE)
				to_chat(L, span_danger("Вас бросает от столкновения!"))

	// Отправляем сообщение всем на корабле
	for(var/mob/M in GLOB.player_list)
		var/area/mob_area = get_area(M)
		if(mob_area in areas)
			to_chat(M, span_danger("<font size=3>Корабль содрогается от сильного удара!</font>"))
			shake_camera(M, 10, 1)

/**
 * Перехватываем движение корабля для проверки столкновений
 */
/datum/overmap/ship/overmap_move(new_x, new_y)
	// Выполняем движение немедленно
	var/result = ..()

	// Проверяем только опасные объекты в текущей позиции
	for(var/datum/overmap/O in SSovermap.overmap_objects)
		if(O == src || O.x != x || O.y != y)
			continue
		// Пропускаем безопасные объекты
		if(istype(O, /datum/overmap/static_object))
			continue
		// Обрабатываем только опасные столкновения
		process_collision(O)

	return result

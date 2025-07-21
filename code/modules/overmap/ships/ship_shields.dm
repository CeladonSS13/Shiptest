/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Ship Shield System
 *
 * Система щитов для кораблей, которая защищает от внешних угроз.
 * Щиты потребляют энергию и могут поглощать урон от различных источников.
 */

/datum/ship_shield
	/// Название системы щитов
	var/name = "корабельные щиты"
	/// Ссылка на корабль, к которому привязаны щиты
	var/datum/overmap/ship/parent_ship
	/// Максимальная мощность щитов (кВт)
	var/max_shield_power = 1000
	/// Текущая мощность щитов (кВт)
	var/current_shield_power = 1000
	/// Скорость восстановления щитов (кВт в секунду)
	var/shield_regen_rate = 5
	/// Потребление энергии в активном состоянии (кВт в секунду)
	var/power_usage = 100
	/// Множитель потребления энергии при поглощении урона
	var/damage_power_multiplier = 2
	/// Активны ли щиты
	var/active = FALSE
	/// Находятся ли щиты на перезарядке
	var/recharging = FALSE
	/// Время перезарядки в секундах
	var/recharge_time = 60
	/// ID таймера перезарядки
	var/recharge_timer_id = null

/**
 * Создает новую систему щитов для корабля
 *
 * Аргументы:
 * * ship - корабль, к которому привязываются щиты
 */
/datum/ship_shield/New(datum/overmap/ship/ship)
	. = ..()
	parent_ship = ship
	if(parent_ship)
		parent_ship.shield_system = src

/**
 * Активирует щиты корабля
 */
/datum/ship_shield/proc/activate()
	if(recharging)
		return FALSE
	active = TRUE
	START_PROCESSING(SSobj, src)
	return TRUE

/**
 * Деактивирует щиты корабля
 */
/datum/ship_shield/proc/deactivate()
	active = FALSE
	STOP_PROCESSING(SSobj, src)
	return TRUE

/**
 * Обработка состояния щитов
 */
/datum/ship_shield/process(delta_time)
	if(!active)
		return

	// Потребление энергии
	var/power_draw = power_usage * delta_time
	var/obj/machinery/power/shield_generator/generator = locate() in GLOB.shield_generators
	if(generator)
		if(!generator.consume_power(power_draw))
			deactivate()
			recharging = TRUE
			recharge_timer_id = addtimer(CALLBACK(src, PROC_REF(finish_recharge)), recharge_time SECONDS, TIMER_STOPPABLE)
			return

	// Восстановление щитов
	if(current_shield_power < max_shield_power)
		current_shield_power = min(current_shield_power + (shield_regen_rate * delta_time), max_shield_power)

	// Проверка на критический уровень щитов
	if(current_shield_power < max_shield_power * 0.25) // Меньше 25% от максимального уровня
		// Воспроизводим звук предупреждения на корабле
		if(parent_ship)
			var/list/areas = parent_ship.get_areas()
			for(var/area/A in areas)
				for(var/mob/M in A)
					if(prob(10)) // Воспроизводим звук с вероятностью 10%, чтобы не спамить
						playsound(M, 'sound/machines/warning-buzzer.ogg', 50, TRUE)
						// Отправляем визуальное предупреждение
						if(isliving(M))
							to_chat(M, span_danger("ВНИМАНИЕ: Критический уровень щитов!"))

		// Создаем эффект мерцания щитов
		if(prob(30)) // 30% шанс создать эффект мерцания
			create_flicker_effect()

/**
 * Создает визуальный эффект мерцания щитов на корабле
 */
/datum/ship_shield/proc/create_flicker_effect()
	if(!parent_ship)
		return

	// Получаем все зоны корабля
	var/list/areas = parent_ship.get_areas()
	if(!areas || !areas.len)
		return

	// Гарантируем создание минимум 5 эффектов щита
	var/flicker_count = max(5, min(areas.len, 8)) // Минимум 5, максимум 8 эффектов
	var/list/selected_areas = areas.Copy()
	// Перемешиваем список областей для случайного выбора
	shuffle_inplace(selected_areas)

	// Создаем эффекты щита в выбранных областях
	var/effects_created = 0
	for(var/i = 1 to min(flicker_count, selected_areas.len))
		var/area/A = selected_areas[i]
		var/list/turfs = get_area_turfs(A)
		if(turfs.len > 0)
			var/turf/T = pick(turfs)
			new /obj/effect/shield_flicker(T)
			effects_created++

	// Если не удалось создать достаточно эффектов в разных областях,
	// добавляем оставшиеся в случайных местах
	while(effects_created < 5 && areas.len > 0)
		var/area/A = pick(areas)
		var/list/turfs = get_area_turfs(A)
		if(turfs.len > 0)
			var/turf/T = pick(turfs)
			new /obj/effect/shield_flicker(T)
			effects_created++

	// Создаем дополнительный эффект щита
	// Используем объект из shield_effects.dm
	var/area/impact_area = pick(areas)
	var/list/impact_turfs = get_area_turfs(impact_area)
	if(impact_turfs.len > 0)
		var/turf/impact_T = pick(impact_turfs)
		new /obj/effect/shield_impact(impact_T)

/**
 * Завершает перезарядку щитов
 */
/datum/ship_shield/proc/finish_recharge()
	recharging = FALSE
	recharge_timer_id = null

/**
 * Поглощает урон от внешних источников
 *
 * Аргументы:
 * * damage_amount - количество урона
 * * damage_type - тип урона (метеорит, радиация, ионный шторм и т.д.)
 */
/datum/ship_shield/proc/absorb_damage(damage_amount, damage_type)
	if(!active || current_shield_power <= 0)
		return 0

	var/absorbed = min(damage_amount, current_shield_power)
	current_shield_power -= absorbed

	// Дополнительное потребление энергии при поглощении урона
	var/extra_power = absorbed * damage_power_multiplier
	var/obj/machinery/power/shield_generator/generator = locate() in GLOB.shield_generators
	if(generator)
		generator.consume_power(extra_power)

	// Если щиты истощены, отключаем их и ставим на перезарядку
	if(current_shield_power <= 0)
		deactivate()
		recharging = TRUE
		recharge_timer_id = addtimer(CALLBACK(src, PROC_REF(finish_recharge)), recharge_time SECONDS, TIMER_STOPPABLE)

	return absorbed

/**
 * Возвращает текущее состояние щитов в процентах
 */
/datum/ship_shield/proc/get_shield_percentage()
	return (current_shield_power / max_shield_power) * 100

/**
 * Проверяет, могут ли щиты защитить от конкретного типа угрозы
 */
/datum/ship_shield/proc/can_protect_from(threat_type)
	var/list/protected_threats = list(
		"meteor",
		"radiation",
		"ion_storm",
		"electric_storm",
		"fire_storm",
		"collision",
		"anomaly" // Добавляем защиту от аномалий
	)
	return (threat_type in protected_threats)

// Глобальный список генераторов щитов
GLOBAL_LIST_EMPTY(shield_generators)

/**
 * Генератор щитов - устройство, которое обеспечивает энергией систему щитов корабля
 */
/obj/machinery/power/shield_generator
	name = "генератор щитов"
	desc = "Мощное устройство, создающее защитное поле вокруг корабля."
	icon = 'icons/obj/machines/ship_gravity.dmi'
	icon_state = "shipgrav_o"
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 100
	active_power_usage = 1000

	/// Активен ли генератор
	var/active = FALSE
	/// Максимальная мощность генератора (кВт)
	var/max_power = 10000
	/// Текущая накопленная мощность (кВт)
	var/stored_power = 5000
	/// Скорость накопления энергии (кВт в секунду)
	var/charge_rate = 100
	/// Ссылка на систему щитов
	var/datum/ship_shield/shield_system = null

/obj/machinery/power/shield_generator/Initialize()
	. = ..()
	GLOB.shield_generators += src
	connect_to_network()
	update_icon()

/obj/machinery/power/shield_generator/Destroy()
	GLOB.shield_generators -= src
	if(shield_system)
		shield_system.deactivate()
		shield_system = null
	return ..()

/obj/machinery/power/shield_generator/update_icon_state()
	. = ..()
	if(active)
		icon_state = "shipgrav"
	else
		icon_state = "shipgrav_o"

/obj/machinery/power/shield_generator/process()
	if(!active)
		return

	// Получение энергии из сети
	var/power_draw = min(charge_rate, max_power - stored_power)
	var/power_received = draw_power(power_draw)
	stored_power = min(stored_power + power_received, max_power)

	update_icon()

/**
 * Получает энергию из сети
 *
 * Аргументы:
 * * amount - количество энергии для получения
 */
/obj/machinery/power/shield_generator/proc/draw_power(amount)
	if(!powernet)
		return 0

	var/power_available = surplus()

	// Если доступно больше энергии, используем больше
	var/power_to_draw = min(amount * 10, power_available) // Увеличиваем потребление в 10 раз, если есть возможность

	add_load(power_to_draw)
	return power_to_draw

/**
 * Активирует генератор щитов
 */
/obj/machinery/power/shield_generator/proc/activate()
	if(active)
		return
	active = TRUE
	use_power = ACTIVE_POWER_USE
	update_icon()

	// Если есть система щитов, активируем её
	if(shield_system)
		shield_system.activate()
	else
		// Ищем корабль, на котором находится генератор
		var/area/A = get_area(src)
		if(A && istype(A))
			// Ищем корабль в списке объектов overmap
			for(var/datum/overmap/O in SSovermap.overmap_objects)
				if(istype(O, /datum/overmap/ship))
					var/datum/overmap/ship/ship = O
					var/list/areas = ship.get_areas()
					if(A in areas)
						shield_system = new /datum/ship_shield(ship)
						shield_system.activate()
						break

/**
 * Деактивирует генератор щитов
 */
/obj/machinery/power/shield_generator/proc/deactivate()
	if(!active)
		return
	active = FALSE
	use_power = IDLE_POWER_USE
	update_icon()

	// Деактивируем систему щитов
	if(shield_system)
		shield_system.deactivate()

/**
 * Использует накопленную энергию
 *
 * Аргументы:
 * * amount - количество энергии для использования
 */
/obj/machinery/power/shield_generator/proc/consume_power(amount)
	if(stored_power >= amount)
		stored_power -= amount
		return TRUE
	return FALSE

/**
 * Интерфейс для управления генератором щитов
 */
/obj/machinery/power/shield_generator/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ShieldGenerator", name)
		ui.open()

/obj/machinery/power/shield_generator/ui_data(mob/user)
	var/list/data = list()

	data["active"] = active
	data["stored_power"] = stored_power
	data["max_power"] = max_power
	data["charge_rate"] = charge_rate

	if(shield_system)
		data["shield_active"] = shield_system.active
		data["shield_power"] = shield_system.current_shield_power
		data["max_shield_power"] = shield_system.max_shield_power
		data["shield_percentage"] = shield_system.get_shield_percentage()
		data["recharging"] = shield_system.recharging
	else
		data["shield_active"] = FALSE
		data["shield_power"] = 0
		data["max_shield_power"] = 0
		data["shield_percentage"] = 0
		data["recharging"] = FALSE

	return data

/obj/machinery/power/shield_generator/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle")
			if(active)
				deactivate()
			else
				activate()
			return TRUE

/**
 * Добавляем систему щитов к кораблю
 */
/datum/overmap/ship
	/// Система щитов корабля
	var/datum/ship_shield/shield_system = null

/**
 * Обработка столкновения с другими объектами
 */
/datum/overmap/ship/proc/handle_collision(datum/overmap/other_object, collision_damage)
	if(shield_system && shield_system.active)
		var/absorbed = shield_system.absorb_damage(collision_damage, "collision")
		if(absorbed >= collision_damage)
			// Создаем визуальный эффект поглощения урона на корабле
			create_shield_effects_on_ship(5) // Создаем 5 эффектов на корабле
			return TRUE
	return FALSE

// Объект /obj/effect/shield_impact определен в shield_effects.dm

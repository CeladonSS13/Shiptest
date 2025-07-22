/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Shield Control Console
 *
 * Консоль для управления системой щитов корабля.
 */

/obj/machinery/computer/ship/shield_control
	name = "консоль управления щитами"
	desc = "Используется для управления системой щитов корабля."
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "shields"
	// icon_screen = "shields"
	circuit = /obj/item/circuitboard/computer/ship/shield_control

	/// Связанный генератор щитов
	var/obj/machinery/power/shield_generator/linked_generator = null

	/// Активны ли щиты
	var/shields_active = FALSE
	/// Находятся ли щиты на перезарядке
	var/shields_recharging = FALSE
	/// Текущая мощность щитов
	var/shield_power = 1000
	/// Максимальная мощность щитов
	var/max_shield_power = 1000
	/// Потребление энергии щитами
	var/power_usage = 100
	/// Время перезарядки щитов
	var/recharge_time = 60
	/// ID таймера перезарядки
	var/recharge_timer_id = null

/**
 * Инициализация консоли
 */
/obj/machinery/computer/ship/shield_control/Initialize()
	. = ..()
	// Ищем генератор щитов на корабле
	find_generator()
	update_appearance()
	START_PROCESSING(SSobj, src)

/obj/machinery/computer/ship/shield_control/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/machinery/computer/ship/shield_control/process()
	update_appearance()

/**
 * Обновление иконки в зависимости от состояния щитов
 */
/obj/machinery/computer/ship/shield_control/update_appearance(updates)
	. = ..(updates)
	update_icon_state()
	update_overlays()

/obj/machinery/computer/ship/shield_control/update_icon_state()
	. = ..()
	if(machine_stat & (NOPOWER|BROKEN))
		icon_state = "computer-off"
		return
	
	icon_state = "computer"

/obj/machinery/computer/ship/shield_control/update_overlays()
	. = ..()
	
	if(machine_stat & (NOPOWER|BROKEN))
		return

	if(!linked_generator)
		. += "shields"
		return

	if(linked_generator.shield_system && linked_generator.shield_system.recharging)
		. += "shield_recharge"
	else if(linked_generator.active && linked_generator.shield_system)
		var/shield_percentage = linked_generator.shield_system.get_shield_percentage()
		if(shield_percentage > 75)
			. += "shields-integrity-100"
		else if(shield_percentage > 50)
			. += "shields-integrity-60"
		else if(shield_percentage > 25)
			. += "shields-integrity-40"
		else
			. += "shields-integrity-20"
	else
		. += "shields"

/**
 * Поиск генератора щитов на корабле
 */
/obj/machinery/computer/ship/shield_control/proc/find_generator()
	// Получаем область консоли
	var/area/console_area = get_area(src)
	if(!console_area)
		return

	// Ищем генератор щитов в той же области
	for(var/obj/machinery/power/shield_generator/generator in GLOB.shield_generators)
		var/area/generator_area = get_area(generator)
		if(generator_area == console_area)
			linked_generator = generator
			break

	// Если не нашли в той же области, ищем на всем корабле
	if(!linked_generator)
		// Получаем корабль
		var/datum/overmap/ship/ship = null
		for(var/datum/overmap/O in SSovermap.overmap_objects)
			if(!istype(O, /datum/overmap/ship))
				continue
			var/datum/overmap/ship/S = O
			var/list/areas = S.get_areas()
			if(console_area in areas)
				ship = S
				break

		if(ship)
			// Ищем генератор щитов на корабле
			for(var/obj/machinery/power/shield_generator/generator in GLOB.shield_generators)
				var/area/generator_area = get_area(generator)
				if(generator_area in ship.get_areas())
					linked_generator = generator
					update_appearance()
					break

/**
 * Интерфейс для управления щитами
 */
/obj/machinery/computer/ship/shield_control/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ShieldControl", name)
		ui.open()

/obj/machinery/computer/ship/shield_control/ui_data(mob/user)
	var/list/data = list()

	// Если нет связанного генератора, пытаемся найти его
	if(!linked_generator)
		find_generator()

	data["has_shield_system"] = linked_generator ? TRUE : FALSE

	if(linked_generator)
		// Используем данные из генератора
		data["active"] = linked_generator.active
		data["has_generator"] = TRUE
		data["generator_active"] = linked_generator.active
		data["stored_power"] = linked_generator.stored_power
		data["max_power"] = linked_generator.max_power
		data["power_percentage"] = (linked_generator.stored_power / linked_generator.max_power) * 100

		// Используем данные из системы щитов
		if(linked_generator.shield_system)
			data["recharging"] = linked_generator.shield_system.recharging
			data["shield_power"] = linked_generator.shield_system.current_shield_power
			data["max_shield_power"] = linked_generator.shield_system.max_shield_power
			data["shield_percentage"] = linked_generator.shield_system.get_shield_percentage()
			// Отображаем реальное потребление энергии
			var/power_draw = linked_generator.charge_rate
			data["power_usage"] = power_draw
		else
			data["recharging"] = FALSE
			data["shield_power"] = 0
			data["max_shield_power"] = 0
			data["shield_percentage"] = 0
			data["power_usage"] = 0
	else
		// Используем стандартные значения
		data["active"] = FALSE
		data["recharging"] = FALSE
		data["shield_power"] = 0
		data["max_shield_power"] = 0
		data["shield_percentage"] = 0
		data["power_usage"] = 0
		data["has_generator"] = FALSE
		data["generator_active"] = FALSE
		data["stored_power"] = 0
		data["max_power"] = 0
		data["power_percentage"] = 0

	return data

/obj/machinery/computer/ship/shield_control/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle_shields")
			if(!linked_generator)
				to_chat(usr, span_warning("Генератор щитов не найден!"))
				return

			if(linked_generator.shield_system && linked_generator.shield_system.recharging)
				to_chat(usr, span_warning("Щиты находятся на перезарядке!"))
				return

			if(linked_generator.active)
				linked_generator.deactivate()
			else
				linked_generator.activate()
			update_appearance()
			return TRUE

		if("find_generator")
			find_generator()
			if(linked_generator)
				to_chat(usr, span_notice("Генератор щитов обнаружен."))
			else
				to_chat(usr, span_warning("Генератор щитов не найден!"))
			return TRUE

/**
 * Плата для консоли управления щитами
 */
/obj/item/circuitboard/computer/ship/shield_control
	name = "Shield Control (Computer Board)"
	build_path = /obj/machinery/computer/ship/shield_control

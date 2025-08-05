// Консоль управления модулями корабля

/obj/machinery/computer/ship_module_control
	name = "ship module control console"
	desc = "Консоль для мониторинга и управления модулями корабля."
	icon_screen = "shuttle"
	circuit = /obj/item/circuitboard/computer/ship_module_control

	var/datum/overmap/ship/linked_ship

/obj/machinery/computer/ship_module_control/Initialize()
	. = ..()
	find_linked_ship()

/obj/machinery/computer/ship_module_control/process()
	if(!linked_ship)
		find_linked_ship()

/obj/machinery/computer/ship_module_control/proc/find_linked_ship()
	var/area/ship_area = get_area(src)
	if(!ship_area)
		return

	for(var/datum/overmap/ship/controlled/ship in SSovermap.controlled_ships)
		if(ship.shuttle_port && ship.shuttle_port.is_in_shuttle_bounds(src))
			linked_ship = ship
			break

/obj/machinery/computer/ship_module_control/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ShipModuleControl")
		ui.open()

/obj/machinery/computer/ship_module_control/ui_data(mob/user)
	var/list/data = list()
	data["ship_name"] = linked_ship?.name || "No ship detected"

	if(linked_ship && linked_ship.installed_modules)
		var/list/modules_info = list()
		for(var/datum/ship_module/module in linked_ship.installed_modules)
			var/list/module_info = module.get_info()
			module_info["enabled"] = !module.disabled
			module_info["power_usage"] = module.power_usage
			modules_info += list(module_info)
		data["modules"] = modules_info
	else
		data["modules"] = list()

	return data

/obj/machinery/computer/ship_module_control/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle_module")
			var/module_name = params["module"]
			if(module_name && linked_ship)
				toggle_module(module_name, usr)
			return TRUE
		if("extract_module")
			var/module_name = params["module"]
			if(module_name && linked_ship)
				extract_module(module_name, usr)
			return TRUE

/obj/machinery/computer/ship_module_control/proc/toggle_module(module_name, mob/user)
	if(!linked_ship || !linked_ship.installed_modules)
		return

	for(var/datum/ship_module/module in linked_ship.installed_modules)
		if(module.name == module_name)
			if(module.broken)
				to_chat(user, span_warning("[module.name] поврежден и не может быть включен!"))
				return

			module.disabled = !module.disabled

			if(module.disabled)
				module.remove_effects()
				to_chat(user, span_notice("[module.name] отключен."))
			else
				module.add_effects()
				to_chat(user, span_notice("[module.name] включен."))

			// Обновляем интерфейс
			SStgui.update_uis(src)
			return

/obj/machinery/computer/ship_module_control/proc/extract_module(module_name, mob/user)
	if(!linked_ship || !linked_ship.installed_modules)
		return

	for(var/datum/ship_module/module in linked_ship.installed_modules)
		if(module.name == module_name)
			// Проверяем, можно ли извлечь d-mod
			if(module.value < 0)
				to_chat(user, span_warning("[module.name] - это d-mod! Необходимо сначала отремонтировать."))
				return

			// Создаем чип модуля
			var/obj/item/ship_module_chip/chip = new(get_turf(user))
			chip.stored_module_type = module.type
			chip.name = "[module.name] chip"
			chip.desc = "Чип с данными модуля [module.name]."

			// Удаляем модуль сначала
			qdel(module)
			
			// Обновляем интерфейс
			SStgui.update_uis(src)
			
			to_chat(user, span_notice("Извлечен [module.name] из системы корабля."))
			return

/obj/machinery/computer/ship_module_control/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ship_module_chip))
		var/obj/item/ship_module_chip/chip = I
		install_module_from_chip(user, chip)
		return

	return ..()

/obj/machinery/computer/ship_module_control/proc/install_module_from_chip(mob/user, obj/item/ship_module_chip/chip)
	if(!chip.stored_module_type)
		to_chat(user, span_warning("Чип поврежден!"))
		return

	if(!linked_ship)
		to_chat(user, span_warning("Нет связи с кораблем!"))
		return

	var/datum/ship_module/new_module = new chip.stored_module_type()

	if(!new_module.can_install(linked_ship))
		to_chat(user, span_warning("Невозможно установить [new_module.name] на этот корабль!"))
		qdel(new_module)
		return
	
	// Проверяем на дубликаты по имени
	if(linked_ship.installed_modules)
		for(var/datum/ship_module/existing_module in linked_ship.installed_modules)
			if(existing_module.name == new_module.name)
				to_chat(user, span_warning("Модуль [new_module.name] уже установлен на корабле!"))
				qdel(new_module)
				return

	to_chat(user, span_notice("Устанавливаете [new_module.name] из чипа..."))

	// Устанавливаем модуль
	new_module.ship_holder = linked_ship
	if(!linked_ship.installed_modules)
		linked_ship.installed_modules = list()
	linked_ship.installed_modules += new_module
	new_module.add_effects()

	// Удаляем чип
	qdel(chip)

	// Обновляем интерфейс
	SStgui.update_uis(src)

	to_chat(user, span_notice("[new_module.name] успешно установлен!"))

// Плата для консоли
/obj/item/circuitboard/computer/ship_module_control
	name = "Ship Module Control Console"
	build_path = /obj/machinery/computer/ship_module_control

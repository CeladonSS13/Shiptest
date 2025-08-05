/obj/machinery/computer/ship_module_console
	name = "ship module service console"
	desc = "Консоль для покупки, продажи и ремонта модулей кораблей."
	icon_screen = "supply"
	circuit = /obj/item/circuitboard/computer/ship_module_console
	
	var/current_tab = SHIP_MODULE_CONSOLE_BUY
	var/datum/overmap/ship/docked_ship
	var/list/available_modules = list() // Модули в продаже
	var/obj/docking_port/stationary/linked_dock

/obj/machinery/computer/ship_module_console/Initialize()
	. = ..()
	generate_available_modules()

/obj/machinery/computer/ship_module_console/proc/generate_available_modules()
	available_modules = list()
	// Добавляем базовые модули в продажу
	available_modules += /datum/ship_module/positive/enhanced_engines
	available_modules += /datum/ship_module/positive/reinforced_hull
	available_modules += /datum/ship_module/positive/advanced_sensors

/obj/machinery/computer/ship_module_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ShipModuleConsole")
		ui.open()

/obj/machinery/computer/ship_module_console/ui_data(mob/user)
	var/list/data = list()
	data["current_tab"] = current_tab
	data["docked_ship"] = docked_ship?.name || "No ship docked"
	
	// Данные для вкладки покупки
	if(current_tab == SHIP_MODULE_CONSOLE_BUY)
		var/list/modules_for_sale = list()
		for(var/module_type in available_modules)
			var/datum/ship_module/temp_module = new module_type()
			var/list/module_info = temp_module.get_info()
			module_info["type"] = module_type
			modules_for_sale += list(module_info)
			qdel(temp_module)
		data["available_modules"] = modules_for_sale
	
	// Данные для вкладки продажи/ремонта
	if(docked_ship && docked_ship.installed_modules)
		var/list/ship_modules_info = list()
		for(var/datum/ship_module/module in docked_ship.installed_modules)
			ship_modules_info += list(module.get_info())
		data["ship_modules"] = ship_modules_info
	else
		data["ship_modules"] = list()
	
	return data

/obj/machinery/computer/ship_module_console/ui_act(action, params)
	. = ..()
	if(.)
		return
	
	switch(action)
		if("change_tab")
			current_tab = text2num(params["tab"])
			return TRUE
		if("buy_module")
			var/module_type = text2path(params["module_type"])
			if(module_type && docked_ship)
				buy_module(module_type, usr)
			return TRUE
		if("sell_module")
			// TODO: Реализовать продажу модулей
			return TRUE
		if("repair_module")
			// TODO: Реализовать ремонт модулей
			return TRUE

/obj/machinery/computer/ship_module_console/proc/buy_module(module_type, mob/user)
	if(!docked_ship)
		to_chat(user, span_warning("Нет пристыкованного корабля!"))
		return FALSE
	
	var/datum/ship_module/new_module = new module_type()
	if(!new_module.can_install(docked_ship))
		to_chat(user, span_warning("Невозможно установить [new_module.name] на этот корабль!"))
		qdel(new_module)
		return FALSE
	
	// TODO: Проверка денег и оплата
	to_chat(user, span_notice("Установка [new_module.name] на [docked_ship.name]..."))
	
	// Устанавливаем модуль
	new_module.ship_holder = docked_ship
	if(!docked_ship.installed_modules)
		docked_ship.installed_modules = list()
	docked_ship.installed_modules += new_module
	new_module.add_effects()
	
	return TRUE

/obj/machinery/computer/ship_module_console/proc/find_docked_ship()
	if(!linked_dock)
		return null
	
	var/obj/docking_port/mobile/ship_dock = linked_dock.docked
	if(!ship_dock || !ship_dock.current_ship)
		return null
	
	return ship_dock.current_ship

/obj/machinery/computer/ship_module_console/process()
	docked_ship = find_docked_ship()

// Плата для консоли
/obj/item/circuitboard/computer/ship_module_console
	name = "Ship Module Console"
	build_path = /obj/machinery/computer/ship_module_console

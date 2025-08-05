// Черный рынок модулей для пиратов

/obj/machinery/computer/black_market_console
	name = "black market terminal"
	desc = "Подпольный терминал для торговли модулями кораблей. Вопросов не задают."
	icon_screen = "syndicate"
	circuit = /obj/item/circuitboard/computer/black_market_console
	
	var/list/wanted_modules = list() // Модули, которые скупают
	var/list/available_modules = list() // Модули в продаже
	var/reputation = 0 // Репутация игрока на черном рынке

/obj/machinery/computer/black_market_console/Initialize()
	. = ..()
	generate_market_stock()

/obj/machinery/computer/black_market_console/proc/generate_market_stock()
	// Генерируем список разыскиваемых модулей
	wanted_modules = list(
		/datum/ship_module/positive/enhanced_engines = rand(500, 800),
		/datum/ship_module/positive/reinforced_hull = rand(600, 900),
		/datum/ship_module/positive/advanced_sensors = rand(400, 700),
		/datum/ship_module/faction/nanotrasen_efficiency = rand(1000, 1500)
	)
	
	// Генерируем модули в продаже (в основном пиратские и краденые)
	available_modules = list(
		/datum/ship_module/pirate/jury_rigged_engines,
		/datum/ship_module/pirate/scrap_armor
	)

/obj/machinery/computer/black_market_console/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ship_module_chip))
		var/obj/item/ship_module_chip/chip = I
		sell_module_chip(user, chip)
		return
	
	return ..()

/obj/machinery/computer/black_market_console/proc/sell_module_chip(mob/user, obj/item/ship_module_chip/chip)
	if(!chip.stored_module_type)
		to_chat(user, span_warning("Чип поврежден, не принимаем."))
		return
	
	var/base_price = 0
	var/reputation_bonus = 0
	
	// Проверяем, есть ли спрос на этот модуль
	if(chip.stored_module_type in wanted_modules)
		base_price = wanted_modules[chip.stored_module_type]
		reputation_bonus = 10
		to_chat(user, span_notice("Отличный товар! Мы как раз искали такой."))
	else
		// Базовая цена для обычных модулей
		var/datum/ship_module/temp_module = new chip.stored_module_type()
		base_price = temp_module.installation_cost * 0.6 // 60% от стоимости установки
		reputation_bonus = 5
		qdel(temp_module)
	
	// Бонус за репутацию
	var/final_price = base_price * (1 + (reputation * 0.01))
	
	to_chat(user, span_notice("Предлагаем [final_price] кредитов за этот модуль."))
	
	// TODO: Интеграция с экономической системой
	// Пока просто удаляем чип и добавляем репутацию
	reputation += reputation_bonus
	qdel(chip)
	
	to_chat(user, span_notice("Сделка заключена. Ваша репутация: [reputation]"))

/obj/machinery/computer/black_market_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "BlackMarketConsole")
		ui.open()

/obj/machinery/computer/black_market_console/ui_data(mob/user)
	var/list/data = list()
	data["reputation"] = reputation
	
	// Список разыскиваемых модулей
	var/list/wanted_list = list()
	for(var/module_type in wanted_modules)
		var/datum/ship_module/temp_module = new module_type()
		wanted_list += list(list(
			"name" = temp_module.name,
			"price" = wanted_modules[module_type],
			"desc" = temp_module.desc
		))
		qdel(temp_module)
	data["wanted_modules"] = wanted_list
	
	// Список модулей в продаже
	var/list/for_sale = list()
	for(var/module_type in available_modules)
		var/datum/ship_module/temp_module = new module_type()
		for_sale += list(list(
			"name" = temp_module.name,
			"price" = temp_module.installation_cost * 0.8, // Дешевле чем на аванпосте
			"desc" = temp_module.desc,
			"type" = module_type
		))
		qdel(temp_module)
	data["available_modules"] = for_sale
	
	return data

/obj/machinery/computer/black_market_console/ui_act(action, params)
	. = ..()
	if(.)
		return
	
	switch(action)
		if("buy_module")
			var/module_type = text2path(params["module_type"])
			if(module_type in available_modules)
				buy_black_market_module(module_type, usr)
			return TRUE

/obj/machinery/computer/black_market_console/proc/buy_black_market_module(module_type, mob/user)
	// TODO: Проверка денег
	
	var/obj/item/ship_module_chip/chip = new(get_turf(user))
	chip.stored_module_type = module_type
	
	var/datum/ship_module/temp_module = new module_type()
	chip.name = "[temp_module.name] chip"
	chip.desc = "Чип с данными модуля [temp_module.name]. Происхождение сомнительное."
	qdel(temp_module)
	
	to_chat(user, span_notice("Покупка завершена. Чип выдан."))

// Плата для консоли черного рынка
/obj/item/circuitboard/computer/black_market_console
	name = "Black Market Console"
	build_path = /obj/machinery/computer/black_market_console

// Расширение для пиратских баз - добавляем черный рынок
/obj/effect/landmark/outpost/black_market
	name = "black market spawn"
	desc = "Место появления терминала черного рынка."

/obj/effect/landmark/outpost/black_market/Initialize()
	. = ..()
	new /obj/machinery/computer/black_market_console(loc)
	qdel(src)

// Интеграция с экономической системой

// Расширение консоли аванпоста для работы с деньгами
/obj/machinery/computer/ship_module_console/proc/process_payment(mob/user, cost, operation_name)
	if(!cost)
		return TRUE
	
	// Ищем банковскую карту у пользователя
	var/obj/item/card/bank/user_card = user.get_bank_card()
	if(!user_card || !user_card.registered_account)
		to_chat(user, span_warning("Нужна банковская карта для оплаты!"))
		return FALSE
	
	var/datum/bank_account/account = user_card.registered_account
	if(!account.has_money(cost))
		to_chat(user, span_warning("Недостаточно средств! Требуется [cost] кредитов."))
		return FALSE
	
	if(!account.adjust_money(-cost, "Ship Module [operation_name]"))
		to_chat(user, span_warning("Ошибка при списании средств!"))
		return FALSE
	
	to_chat(user, span_notice("Списано [cost] кредитов за [operation_name]."))
	return TRUE

// Обновленная процедура покупки модуля
/obj/machinery/computer/ship_module_console/buy_module(module_type, mob/user)
	if(!docked_ship)
		to_chat(user, span_warning("Нет пристыкованного корабля!"))
		return FALSE
	
	var/datum/ship_module/new_module = new module_type()
	if(!new_module.can_install(docked_ship))
		to_chat(user, span_warning("Невозможно установить [new_module.name] на этот корабль!"))
		qdel(new_module)
		return FALSE
	
	// Проверяем и списываем деньги
	if(!process_payment(user, new_module.installation_cost, "установку [new_module.name]"))
		qdel(new_module)
		return FALSE
	
	// Создаем чип модуля вместо прямой установки
	var/obj/item/ship_module_chip/chip = new(get_turf(user))
	chip.stored_module_type = module_type
	chip.name = "[new_module.name] chip"
	chip.desc = "Чип с данными модуля [new_module.name]. Куплен на аванпосте."
	
	to_chat(user, span_notice("Покупка завершена! Получен чип [new_module.name]."))
	
	// Удаляем временный модуль
	qdel(new_module)
	
	return TRUE

// Процедура продажи модуля
/obj/machinery/computer/ship_module_console/proc/sell_module(module_name, mob/user)
	if(!docked_ship || !docked_ship.installed_modules)
		to_chat(user, span_warning("Нет модулей для продажи!"))
		return FALSE
	
	var/datum/ship_module/target_module
	for(var/datum/ship_module/module in docked_ship.installed_modules)
		if(module.name == module_name)
			target_module = module
			break
	
	if(!target_module)
		to_chat(user, span_warning("Модуль не найден!"))
		return FALSE
	
	// Рассчитываем цену продажи (50% от стоимости установки)
	var/sell_price = round(target_module.installation_cost * 0.5)
	
	// Выплачиваем деньги
	var/obj/item/card/bank/user_card = user.get_bank_card()
	if(!user_card || !user_card.registered_account)
		to_chat(user, span_warning("Нужна банковская карта для получения оплаты!"))
		return FALSE
	
	var/datum/bank_account/account = user_card.registered_account
	account.adjust_money(sell_price, "Ship Module Sale")
	
	to_chat(user, span_notice("Продан [target_module.name] за [sell_price] кредитов."))
	
	// Удаляем модуль
	qdel(target_module)
	return TRUE

// Процедура ремонта модуля
/obj/machinery/computer/ship_module_console/proc/repair_module(module_name, mob/user)
	if(!docked_ship || !docked_ship.installed_modules)
		to_chat(user, span_warning("Нет модулей для ремонта!"))
		return FALSE
	
	var/datum/ship_module/target_module
	for(var/datum/ship_module/module in docked_ship.installed_modules)
		if(module.name == module_name)
			target_module = module
			break
	
	if(!target_module)
		to_chat(user, span_warning("Модуль не найден!"))
		return FALSE
	
	if(!target_module.broken && target_module.value >= 0)
		to_chat(user, span_warning("[target_module.name] не нуждается в ремонте!"))
		return FALSE
	
	// Проверяем и списываем деньги
	if(!process_payment(user, target_module.repair_cost, "ремонт [target_module.name]"))
		return FALSE
	
	to_chat(user, span_notice("Ремонт [target_module.name] завершен!"))
	
	// Чиним модуль
	if(target_module.broken)
		target_module.repair_module()
	else if(target_module.value < 0)
		// Для d-mods - удаляем их полностью
		qdel(target_module)
	
	return TRUE

// Обновление UI действий
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
			var/module_name = params["module"]
			if(module_name)
				sell_module(module_name, usr)
			return TRUE
		if("repair_module")
			var/module_name = params["module"]
			if(module_name)
				repair_module(module_name, usr)
			return TRUE

// Интеграция черного рынка с экономикой
/obj/machinery/computer/black_market_console/sell_module_chip(mob/user, obj/item/ship_module_chip/chip)
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
	
	// Выплачиваем деньги наличными (голочип)
	new /obj/item/holochip(get_turf(user), final_price)
	
	to_chat(user, span_notice("Сделка заключена за [final_price] кредитов."))
	
	// Добавляем репутацию и удаляем чип
	reputation += reputation_bonus
	qdel(chip)
	
	to_chat(user, span_notice("Ваша репутация: [reputation]"))

/obj/machinery/computer/black_market_console/buy_black_market_module(module_type, mob/user)
	var/datum/ship_module/temp_module = new module_type()
	var/cost = temp_module.installation_cost * 0.8 // Дешевле чем на аванпосте
	qdel(temp_module)
	
	// Ищем голочипы и бумажные деньги у пользователя
	var/total_credits = 0
	var/list/holochips = list()
	var/list/cash_stacks = list()
	
	for(var/obj/item/holochip/chip in user.get_contents())
		holochips += chip
		total_credits += chip.credits
	
	for(var/obj/item/spacecash/bundle/cash in user.get_contents())
		cash_stacks += cash
		total_credits += cash.value
	
	if(total_credits < cost)
		to_chat(user, span_warning("Недостаточно денег! Требуется [cost], у вас [total_credits]."))
		return FALSE
	
	// Списываем деньги сначала с голочипов, потом с наличных
	var/remaining_cost = cost
	for(var/obj/item/holochip/chip in holochips)
		if(remaining_cost <= 0)
			break
		var/spent = chip.spend(remaining_cost, TRUE)
		remaining_cost -= spent
	
	for(var/obj/item/spacecash/bundle/cash in cash_stacks)
		if(remaining_cost <= 0)
			break
		var/spent = min(remaining_cost, cash.value)
		cash.adjust_value(-spent)
		remaining_cost -= spent
		if(cash.value <= 0)
			qdel(cash)
	
	// Создаем чип модуля
	var/obj/item/ship_module_chip/new_chip = new(get_turf(user))
	new_chip.stored_module_type = module_type
	
	var/datum/ship_module/temp_module2 = new module_type()
	new_chip.name = "[temp_module2.name] chip"
	new_chip.desc = "Чип с данными модуля [temp_module2.name]. Происхождение сомнительное."
	qdel(temp_module2)
	
	to_chat(user, span_notice("Покупка завершена за [cost] кредитов."))
	return TRUE

// Хелпер для получения банковской карты
/mob/proc/get_bank_card()
	// Ищем в руках
	for(var/obj/item/card/bank/card in held_items)
		return card
	
	// Ищем в инвентаре
	for(var/obj/item/card/bank/card in get_contents())
		return card
	
	return null

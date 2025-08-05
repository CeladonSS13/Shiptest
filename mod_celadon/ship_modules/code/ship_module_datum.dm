/datum/ship_module
	var/name = "Test Ship Module"
	var/desc = "This is a test ship module."
	var/value = 0 // Положительный = улучшение, отрицательный = d-mod, 0 = нейтральный
	var/category = "Generic" // Категория модуля (двигатели, броня, системы и т.д.)
	var/installation_cost = 100 // Стоимость установки
	var/removal_cost = 50 // Стоимость удаления
	var/repair_cost = 75 // Стоимость ремонта (для d-mods)
	var/rarity = MODULE_RARITY_COMMON // Редкость модуля
	var/faction_locked = FALSE // Доступен только определенной фракции
	var/list/allowed_factions = list() // Список разрешенных фракций
	var/list/conflicting_modules = list() // Модули, которые нельзя устанавливать вместе
	var/datum/overmap/ship/ship_holder // Корабль, на котором установлен модуль
	var/broken = FALSE // Сломан ли модуль
	var/installation_time = 30 SECONDS // Время установки
	var/removal_time = 20 SECONDS // Время удаления
	var/repair_time = 25 SECONDS // Время ремонта
	var/power_usage = 0 // Потребление энергии в ваттах
	var/disabled = FALSE // Отключен ли модуль

/datum/ship_module/New(datum/overmap/ship/target_ship)
	..(target_ship)
	if(!target_ship)
		qdel(src)
		return
	ship_holder = target_ship
	if(!ship_holder.installed_modules)
		ship_holder.installed_modules = list()
	ship_holder.installed_modules += src
	add_effects()

/datum/ship_module/Destroy()
	remove_effects()
	if(ship_holder)
		ship_holder.installed_modules -= src
		ship_holder = null
	return ..()

/// Применяет эффекты модуля к кораблю
/datum/ship_module/proc/add_effects()
	if(disabled || broken)
		return
	return

/// Убирает эффекты модуля с корабля
/datum/ship_module/proc/remove_effects()
	return

/// Проверяет, можно ли установить модуль на корабль
/datum/ship_module/proc/can_install(datum/overmap/ship/target_ship)
	if(!target_ship)
		return FALSE
	
	// Проверка фракционных ограничений
	if(faction_locked && length(allowed_factions))
		var/ship_faction = "Independent"
		if(istype(target_ship, /datum/overmap/ship/controlled))
			var/datum/overmap/ship/controlled/controlled_ship = target_ship
			if(controlled_ship.source_template && controlled_ship.source_template.faction)
				ship_faction = controlled_ship.source_template.faction
		if(!(ship_faction in allowed_factions))
			return FALSE
	
	// Проверка конфликтующих модулей
	if(length(conflicting_modules) && target_ship.installed_modules)
		for(var/datum/ship_module/existing_module in target_ship.installed_modules)
			if(existing_module.type in conflicting_modules)
				return FALSE
	
	return TRUE

/// Ломает модуль
/datum/ship_module/proc/break_module()
	if(broken)
		return
	broken = TRUE
	remove_effects()

/// Чинит модуль
/datum/ship_module/proc/repair_module()
	if(!broken)
		return
	broken = FALSE
	add_effects()

/// Возвращает информацию о модуле для UI
/datum/ship_module/proc/get_info()
	var/list/info = list()
	info["name"] = name
	info["desc"] = desc
	info["value"] = value
	info["category"] = category
	info["broken"] = broken
	info["installation_cost"] = installation_cost
	info["removal_cost"] = removal_cost
	info["repair_cost"] = repair_cost
	info["power_usage"] = power_usage
	info["disabled"] = disabled
	return info

// Расширение для кораблей - добавляем поддержку модулей

/datum/overmap/ship
	/// Список установленных модулей корабля
	var/list/datum/ship_module/installed_modules

/datum/overmap/ship/Initialize(position, system_spawned_in, ...)
	. = ..()
	installed_modules = list()
	generate_faction_modules()

/datum/overmap/ship/Destroy()
	if(installed_modules)
		for(var/datum/ship_module/module in installed_modules)
			qdel(module)
		installed_modules = null
	return ..()

/// Генерирует модули в зависимости от фракции корабля
/datum/overmap/ship/proc/generate_faction_modules()
	var/faction = "Independent" // По умолчанию
	if(istype(src, /datum/overmap/ship/controlled))
		var/datum/overmap/ship/controlled/controlled_ship = src
		if(controlled_ship.source_template && controlled_ship.source_template.faction)
			faction = controlled_ship.source_template.faction
	
	if(!faction)
		faction = "Independent"
	
	switch(faction)
		if("Independent")
			// Независимые: 0-1 случайный d-mod
			if(prob(60))
				add_random_dmod()
		
		if("Pirates")
			// Пираты: 1-3 d-mods
			var/dmod_count = rand(1, 3)
			for(var/i in 1 to dmod_count)
				add_random_dmod()
		
		if("Nanotrasen", "SolGov", "CLIP", "Inteq")
			// Фракционные корабли: 1 уникальный модуль
			add_faction_module(faction)

/// Добавляет случайный d-mod
/datum/overmap/ship/proc/add_random_dmod()
	var/list/possible_dmods = list(
		/datum/ship_module/negative/damaged_engines,
		/datum/ship_module/negative/hull_breach,
		/datum/ship_module/negative/faulty_power_grid,
		/datum/ship_module/negative/unreliable_subsystems
	)
	
	var/chosen_dmod = pick(possible_dmods)
	new chosen_dmod(src)

/// Добавляет фракционный модуль
/datum/overmap/ship/proc/add_faction_module(faction_name)
	var/module_type
	switch(faction_name)
		if("Nanotrasen")
			module_type = /datum/ship_module/faction/nanotrasen_efficiency
		if("SolGov")
			module_type = /datum/ship_module/faction/solgov_military
		if("CLIP")
			module_type = /datum/ship_module/faction/clip_corporate
		if("Inteq")
			module_type = /datum/ship_module/faction/inteq_security
	
	if(module_type)
		new module_type(src)

/// Получает модуль по типу
/datum/overmap/ship/proc/get_module_by_type(module_type)
	if(!installed_modules)
		return null
	
	for(var/datum/ship_module/module in installed_modules)
		if(module.type == module_type)
			return module
	return null

/// Проверяет, есть ли модуль определенного типа
/datum/overmap/ship/proc/has_module_type(module_type)
	return get_module_by_type(module_type) != null

/// Получает все модули определенной категории
/datum/overmap/ship/proc/get_modules_by_category(category)
	if(!installed_modules)
		return list()
	
	var/list/result = list()
	for(var/datum/ship_module/module in installed_modules)
		if(module.category == category)
			result += module
	return result

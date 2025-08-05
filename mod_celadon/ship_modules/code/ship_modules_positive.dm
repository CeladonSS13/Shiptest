// Положительные модули - улучшения корабля

/datum/ship_module/positive
	value = MODULE_TYPE_POSITIVE
	installation_cost = 200
	removal_cost = 100

/datum/ship_module/positive/enhanced_engines
	name = "Enhanced Engines"
	desc = "Улучшенные двигатели увеличивают скорость корабля."
	category = MODULE_CATEGORY_ENGINE
	installation_cost = 300
	rarity = MODULE_RARITY_UNCOMMON
	power_usage = 150

/datum/ship_module/positive/enhanced_engines/add_effects()
	if(!ship_holder || broken)
		return
	ship_holder.acceleration_speed *= 1.25

/datum/ship_module/positive/enhanced_engines/remove_effects()
	if(!ship_holder)
		return
	ship_holder.acceleration_speed /= 1.25

/datum/ship_module/positive/reinforced_hull
	name = "Reinforced Hull"
	desc = "Усиленный корпус повышает живучесть корабля."
	category = MODULE_CATEGORY_ARMOR
	installation_cost = 400
	rarity = MODULE_RARITY_RARE
	power_usage = 0 // Пассивный модуль

/datum/ship_module/positive/advanced_sensors
	name = "Advanced Sensors"
	desc = "Продвинутые сенсоры улучшают обнаружение объектов."
	category = MODULE_CATEGORY_SYSTEMS
	installation_cost = 250
	rarity = MODULE_RARITY_UNCOMMON
	power_usage = 75

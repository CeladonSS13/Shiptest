// Отрицательные модули - d-mods (дефектные модули)

/datum/ship_module/negative
	value = MODULE_TYPE_NEGATIVE
	installation_cost = 0 // D-mods не покупаются, появляются от повреждений
	removal_cost = 150
	repair_cost = 100

/datum/ship_module/negative/damaged_engines
	name = "Damaged Engines"
	desc = "Поврежденные двигатели снижают скорость корабля."
	category = MODULE_CATEGORY_ENGINE
	repair_cost = 200

/datum/ship_module/negative/damaged_engines/add_effects()
	if(!ship_holder || broken)
		return
	ship_holder.acceleration_speed *= 0.75

/datum/ship_module/negative/damaged_engines/remove_effects()
	if(!ship_holder)
		return
	ship_holder.acceleration_speed /= 0.75

/datum/ship_module/negative/hull_breach
	name = "Hull Breach"
	desc = "Пробоина в корпусе снижает прочность корабля."
	category = MODULE_CATEGORY_ARMOR
	repair_cost = 300

/datum/ship_module/negative/faulty_power_grid
	name = "Faulty Power Grid"
	desc = "Неисправная энергосеть вызывает случайные сбои."
	category = MODULE_CATEGORY_SYSTEMS
	repair_cost = 250

/datum/ship_module/negative/unreliable_subsystems
	name = "Unreliable Subsystems"
	desc = "Ненадежные подсистемы могут отказать в критический момент."
	category = MODULE_CATEGORY_SYSTEMS
	repair_cost = 180

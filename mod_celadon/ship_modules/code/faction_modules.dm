// Фракционные модули - уникальные модули для каждой фракции

/datum/ship_module/faction
	value = MODULE_TYPE_POSITIVE
	faction_locked = TRUE
	installation_cost = 0 // Предустановлены
	removal_cost = 500 // Дорого удалить уникальный модуль
	rarity = MODULE_RARITY_RARE

/datum/ship_module/faction/nanotrasen_efficiency
	name = "NT Corporate Efficiency Module"
	desc = "Корпоративный модуль эффективности Nanotrasen оптимизирует все системы корабля."
	category = MODULE_CATEGORY_SYSTEMS
	allowed_factions = list("Nanotrasen")

/datum/ship_module/faction/nanotrasen_efficiency/add_effects()
	if(!ship_holder || broken)
		return
	// Небольшое улучшение всех систем
	ship_holder.acceleration_speed *= 1.1

/datum/ship_module/faction/nanotrasen_efficiency/remove_effects()
	if(!ship_holder)
		return
	ship_holder.acceleration_speed /= 1.1

/datum/ship_module/faction/solgov_military
	name = "SolGov Military Grade Systems"
	desc = "Военные системы SolGov обеспечивают повышенную надежность."
	category = MODULE_CATEGORY_SYSTEMS
	allowed_factions = list("SolGov")

/datum/ship_module/faction/clip_corporate
	name = "CLIP Logistics Optimizer"
	desc = "Логистический оптимизатор CLIP улучшает управление ресурсами."
	category = MODULE_CATEGORY_UTILITY
	allowed_factions = list("CLIP")

/datum/ship_module/faction/inteq_security
	name = "Inteq Security Package"
	desc = "Пакет безопасности Inteq обеспечивает дополнительную защиту."
	category = MODULE_CATEGORY_ARMOR
	allowed_factions = list("Inteq")

// Пиратские самодельные модули (для альтернативного ремонта)
/datum/ship_module/pirate
	value = MODULE_TYPE_NEUTRAL
	installation_cost = 50
	removal_cost = 25
	rarity = MODULE_RARITY_COMMON

/datum/ship_module/pirate/jury_rigged_engines
	name = "Jury-Rigged Engine Boost"
	desc = "Самодельное улучшение двигателей. Работает, но ненадежно."
	category = MODULE_CATEGORY_ENGINE
	// Конфликтует с нормальными модулями двигателей
	conflicting_modules = list(/datum/ship_module/positive/enhanced_engines)

/datum/ship_module/pirate/jury_rigged_engines/add_effects()
	if(!ship_holder || broken)
		return
	ship_holder.acceleration_speed *= 1.15
	// Шанс поломки при использовании
	if(prob(5))
		break_module()

/datum/ship_module/pirate/jury_rigged_engines/remove_effects()
	if(!ship_holder)
		return
	ship_holder.acceleration_speed /= 1.15

/datum/ship_module/pirate/scrap_armor
	name = "Scrap Metal Plating"
	desc = "Дополнительная броня из металлолома. Лучше чем ничего."
	category = MODULE_CATEGORY_ARMOR
	conflicting_modules = list(/datum/ship_module/positive/reinforced_hull)

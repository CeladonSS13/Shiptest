// Система снятия модулей с кораблей

/obj/item/ship_module_extractor
	name = "module extraction tool"
	desc = "Инструмент для извлечения модулей с кораблей. Требует времени и навыков."
	icon = 'icons/obj/tools.dmi'
	icon_state = "welder"
	w_class = WEIGHT_CLASS_NORMAL

	var/extraction_time = 60 SECONDS
	var/success_chance = 70 // Базовый шанс успеха

/obj/item/ship_module_extractor/examine(mob/user)
	. = ..()
	. += span_notice("Используйте на консоли корабля для извлечения модулей.")
	. += span_warning("Есть шанс повредить модуль при извлечении!")

// Консоль для извлечения модулей (устанавливается на захваченных кораблях)
/obj/machinery/computer/ship_module_extractor
	name = "ship module extraction console"
	desc = "Консоль для извлечения модулей с захваченного корабля."
	icon_screen = "engineering"
	circuit = /obj/item/circuitboard/computer/ship_module_extractor

	var/datum/overmap/ship/target_ship
	var/extraction_in_progress = FALSE

/obj/machinery/computer/ship_module_extractor/Initialize()
	. = ..()
	find_target_ship()

/obj/machinery/computer/ship_module_extractor/proc/find_target_ship()
	var/area/ship_area = get_area(src)
	if(!ship_area)
		return

	for(var/datum/overmap/ship/ship in SSovermap.controlled_ships)
		if(ship.docked_to && get_area(ship.docked_to) == ship_area)
			target_ship = ship
			break

/obj/machinery/computer/ship_module_extractor/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ship_module_extractor))
		if(!target_ship || !target_ship.installed_modules || !length(target_ship.installed_modules))
			to_chat(user, span_warning("На этом корабле нет модулей для извлечения!"))
			return

		if(extraction_in_progress)
			to_chat(user, span_warning("Извлечение уже в процессе!"))
			return

		start_extraction(user, I)
		return

	return ..()

/obj/machinery/computer/ship_module_extractor/proc/start_extraction(mob/user, obj/item/ship_module_extractor/tool)
	if(!target_ship || !target_ship.installed_modules)
		return

	// Выбираем случайный модуль для извлечения
	var/datum/ship_module/target_module = pick(target_ship.installed_modules)

	to_chat(user, span_notice("Начинаете извлечение [target_module.name]..."))
	extraction_in_progress = TRUE

	if(!do_after(user, tool.extraction_time, target = src))
		extraction_in_progress = FALSE
		return

	// Проверяем успех извлечения
	var/success_chance = tool.success_chance

	// Бонус за навыки (упрощенная проверка)
	if(user.mind && user.mind.assigned_role in list("Chief Engineer", "Station Engineer", "Atmospheric Technician"))
		success_chance += 20

	if(prob(success_chance))
		extract_module_success(user, target_module, tool)
	else
		extract_module_failure(user, target_module, tool)

	extraction_in_progress = FALSE

/obj/machinery/computer/ship_module_extractor/proc/extract_module_success(mob/user, datum/ship_module/module, obj/item/ship_module_extractor/tool)
	to_chat(user, span_notice("Успешно извлекли [module.name]!"))

	// Создаем физический предмет модуля
	var/obj/item/ship_module_chip/chip = new(get_turf(user))
	chip.stored_module_type = module.type
	chip.name = "[module.name] chip"
	chip.desc = "Чип с данными модуля [module.name]. Можно установить на другой корабль."

	// Удаляем модуль с корабля
	qdel(module)

/obj/machinery/computer/ship_module_extractor/proc/extract_module_failure(mob/user, datum/ship_module/module, obj/item/ship_module_extractor/tool)
	to_chat(user, span_warning("Извлечение не удалось! [module.name] поврежден."))

	// Если это был положительный модуль, превращаем в d-mod
	if(module.value > 0)
		var/datum/ship_module/negative/damaged_module = new /datum/ship_module/negative/unreliable_subsystems(module.ship_holder)
		damaged_module.name = "Damaged [module.name]"
		damaged_module.desc = "Поврежденный при извлечении [module.name]."

	// Удаляем оригинальный модуль
	qdel(module)

// Чип модуля - переносимый предмет с данными модуля
/obj/item/ship_module_chip
	name = "ship module chip"
	desc = "Чип с данными модуля корабля."
	icon = 'icons/obj/contractor_tablet.dmi'
	icon_state = "tablet"
	w_class = WEIGHT_CLASS_SMALL

	var/stored_module_type

/obj/item/ship_module_chip/examine(mob/user)
	. = ..()
	if(stored_module_type)
		var/datum/ship_module/temp_module = new stored_module_type()
		. += span_notice("Содержит: [temp_module.name]")
		. += span_notice("[temp_module.desc]")
		qdel(temp_module)

// Расширение консоли аванпоста для установки чипов
/obj/machinery/computer/ship_module_console/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ship_module_chip))
		var/obj/item/ship_module_chip/chip = I
		if(!chip.stored_module_type)
			to_chat(user, span_warning("Чип поврежден!"))
			return

		if(!docked_ship)
			to_chat(user, span_warning("Нет пристыкованного корабля!"))
			return

		install_module_from_chip(user, chip)
		return

	return ..()

/obj/machinery/computer/ship_module_console/proc/install_module_from_chip(mob/user, obj/item/ship_module_chip/chip)
	var/datum/ship_module/new_module = new chip.stored_module_type()

	if(!new_module.can_install(docked_ship))
		to_chat(user, span_warning("Невозможно установить [new_module.name] на этот корабль!"))
		qdel(new_module)
		return

	to_chat(user, span_notice("Устанавливаете [new_module.name] из чипа..."))

	// Устанавливаем модуль
	new_module.ship_holder = docked_ship
	if(!docked_ship.installed_modules)
		docked_ship.installed_modules = list()
	docked_ship.installed_modules += new_module
	new_module.add_effects()

	// Удаляем чип
	qdel(chip)

	to_chat(user, span_notice("[new_module.name] успешно установлен!"))

// Плата для консоли извлечения
/obj/item/circuitboard/computer/ship_module_extractor
	name = "Ship Module Extractor Console"
	build_path = /obj/machinery/computer/ship_module_extractor

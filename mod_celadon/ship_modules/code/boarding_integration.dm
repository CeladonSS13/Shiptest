// Интеграция с системой абордажа кораблей

// Портативная консоль извлечения модулей
/obj/item/ship_module_extractor_kit
	name = "portable module extraction kit"
	desc = "Портативный набор для извлечения модулей с захваченных кораблей. Разворачивается в консоль."
	icon = 'icons/obj/storage.dmi'
	icon_state = "toolbox_blue"
	w_class = WEIGHT_CLASS_BULKY
	
	var/deployment_time = 30 SECONDS

/obj/item/ship_module_extractor_kit/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, span_warning("Нужно больше места для развертывания!"))
		return
	
	to_chat(user, span_notice("Начинаете развертывание консоли извлечения модулей..."))
	
	if(!do_after(user, deployment_time, target = src))
		return
	
	var/obj/machinery/computer/ship_module_extractor/console = new(get_turf(user))
	console.name = "portable [console.name]"
	console.desc = "Портативная консоль для извлечения модулей. Менее надежна чем стационарная."
	
	// Портативная версия менее эффективна
	console.circuit = null // Нельзя разобрать обратно
	
	to_chat(user, span_notice("Консоль извлечения модулей развернута!"))
	qdel(src)

// Расширение для абордажных команд
/datum/outfit/job/independent/boarder
	name = "Ship Boarder"
	
	backpack_contents = list(
		/obj/item/ship_module_extractor = 1,
		/obj/item/ship_module_extractor_kit = 1
	)

// Событие: обнаружение попытки извлечения модулей
/datum/ship_module/proc/on_extraction_attempt(mob/user)
	if(!ship_holder)
		return
	
	// Уведомляем экипаж корабля
	var/area/ship_area = get_area(src)
	if(ship_area)
		for(var/mob/living/crew_member in ship_area)
			if(crew_member != user)
				to_chat(crew_member, span_userdanger("ВНИМАНИЕ: Обнаружена попытка несанкционированного доступа к модулям корабля!"))

// Расширение консоли извлечения для уведомлений
/obj/machinery/computer/ship_module_extractor/start_extraction(mob/user, obj/item/ship_module_extractor/tool)
	// Уведомляем о попытке извлечения
	var/datum/ship_module/target_module = pick(target_ship.installed_modules)
	target_module.on_extraction_attempt(user)
	
	return ..()

// Защитные модули - усложняют извлечение
/datum/ship_module/positive/security_package
	name = "Security Package"
	desc = "Пакет безопасности затрудняет несанкционированный доступ к модулям корабля."
	category = MODULE_CATEGORY_SYSTEMS
	installation_cost = 350
	rarity = MODULE_RARITY_UNCOMMON

/datum/ship_module/positive/security_package/add_effects()
	if(!ship_holder || broken)
		return
	// Снижает шанс успешного извлечения модулей
	for(var/obj/machinery/computer/ship_module_extractor/console in range(20, src))
		console.security_modifier = -30 // Снижает шанс успеха на 30%

/datum/ship_module/positive/security_package/remove_effects()
	if(!ship_holder)
		return
	for(var/obj/machinery/computer/ship_module_extractor/console in range(20, src))
		console.security_modifier = 0

// Расширение консоли для учета защиты
/obj/machinery/computer/ship_module_extractor
	var/security_modifier = 0

/obj/machinery/computer/ship_module_extractor/start_extraction(mob/user, obj/item/ship_module_extractor/tool)
	// Применяем модификатор безопасности
	tool.success_chance += security_modifier
	
	return ..()

// Улучшенный инструмент извлечения
/obj/item/ship_module_extractor/advanced
	name = "advanced module extraction tool"
	desc = "Продвинутый инструмент для извлечения модулей. Выше шанс успеха и быстрее работает."
	icon_state = "adv_welder"
	
	extraction_time = 40 SECONDS
	success_chance = 85

// Модуль-ловушка
/datum/ship_module/negative/extraction_trap
	name = "Module Extraction Trap"
	desc = "Скрытая ловушка, активируется при попытке извлечения модулей."
	category = MODULE_CATEGORY_SYSTEMS
	installation_cost = 0
	removal_cost = 200

/datum/ship_module/negative/extraction_trap/on_extraction_attempt(mob/user)
	. = ..()
	
	// Шанс сработать
	if(prob(75))
		to_chat(user, span_userdanger("ЛОВУШКА! Модуль взрывается!"))
		explosion(get_turf(user), 0, 1, 2, 3)
		qdel(src) // Ловушка срабатывает один раз

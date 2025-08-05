// Альтернативные способы ремонта модулей для пиратов

/obj/structure/ship_module_workbench
	name = "makeshift module workbench"
	desc = "Самодельный верстак для ремонта и создания модулей кораблей. Требует больше ресурсов, но доступен пиратам."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "protolathe"
	anchored = TRUE
	density = TRUE
	
	var/datum/overmap/ship/linked_ship
	var/obj/item/ship_module_part/loaded_part
	var/repair_progress = 0
	var/max_repair_progress = 100

/obj/structure/ship_module_workbench/Initialize()
	. = ..()
	find_linked_ship()

/obj/structure/ship_module_workbench/proc/find_linked_ship()
	var/area/ship_area = get_area(src)
	if(!ship_area)
		return
	
	for(var/datum/overmap/ship/ship in SSovermap.controlled_ships)
		if(ship.docked_to && get_area(ship.docked_to) == ship_area)
			linked_ship = ship
			break

/obj/structure/ship_module_workbench/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ship_module_part))
		if(loaded_part)
			to_chat(user, span_warning("В верстаке уже есть деталь!"))
			return
		
		loaded_part = I
		I.forceMove(src)
		to_chat(user, span_notice("Вы загружаете [I] в верстак."))
		return
	
	if(istype(I, /obj/item/stack/sheet/metal) && loaded_part)
		var/obj/item/stack/sheet/metal/metal = I
		if(metal.amount < 5)
			to_chat(user, span_warning("Нужно минимум 5 листов металла!"))
			return
		
		start_repair(user, metal)
		return
	
	return ..()

/obj/structure/ship_module_workbench/proc/start_repair(mob/user, obj/item/stack/sheet/metal/metal)
	if(!loaded_part || !linked_ship)
		return
	
	to_chat(user, span_notice("Начинаете ремонт [loaded_part]..."))
	
	if(!do_after(user, 30 SECONDS, target = src))
		return
	
	metal.use(5)
	repair_progress += 25
	
	if(repair_progress >= max_repair_progress)
		complete_repair(user)
	else
		to_chat(user, span_notice("Ремонт [loaded_part] завершен на [repair_progress]%."))

/obj/structure/ship_module_workbench/proc/complete_repair(mob/user)
	if(!loaded_part || !linked_ship)
		return
	
	// Создаем пиратский модуль вместо оригинального
	var/datum/ship_module/new_module
	switch(loaded_part.original_module_type)
		if(/datum/ship_module/negative/damaged_engines)
			new_module = new /datum/ship_module/pirate/jury_rigged_engines(linked_ship)
		if(/datum/ship_module/negative/hull_breach)
			new_module = new /datum/ship_module/pirate/scrap_armor(linked_ship)
		else
			// Базовый пиратский модуль
			new_module = new /datum/ship_module/pirate/jury_rigged_engines(linked_ship)
	
	to_chat(user, span_notice("Ремонт завершен! Создан [new_module.name]."))
	
	qdel(loaded_part)
	loaded_part = null
	repair_progress = 0

// Детали модулей, которые можно снять с поврежденных модулей
/obj/item/ship_module_part
	name = "damaged module part"
	desc = "Поврежденная деталь от модуля корабля. Можно отремонтировать на верстаке."
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "prox_sensor"
	
	var/original_module_type

/obj/item/ship_module_part/engine
	name = "damaged engine component"
	desc = "Поврежденный компонент двигателя."
	original_module_type = /datum/ship_module/negative/damaged_engines

/obj/item/ship_module_part/hull
	name = "hull plating fragment"
	desc = "Фрагмент обшивки корпуса."
	original_module_type = /datum/ship_module/negative/hull_breach

// Расширение для отрицательных модулей - возможность снять детали
/datum/ship_module/negative/proc/salvage_parts(mob/user)
	if(!ship_holder)
		return
	
	var/obj/item/ship_module_part/part
	switch(type)
		if(/datum/ship_module/negative/damaged_engines)
			part = new /obj/item/ship_module_part/engine(get_turf(user))
		if(/datum/ship_module/negative/hull_breach)
			part = new /obj/item/ship_module_part/hull(get_turf(user))
	
	if(part)
		to_chat(user, span_notice("Вы извлекаете [part] из [name]."))
		qdel(src)
		return part
	
	return null

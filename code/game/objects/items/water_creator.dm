// Простые предметы для создания водных эффектов
/obj/item/water_creator
	name = "water creator"
	desc = "Creates water effects on floors. Click to add 100L, Alt+Click to add 5000L."
	icon = 'icons/obj/device.dmi'
	icon_state = "multitool"
	
/obj/item/water_creator/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	
	var/turf/T = get_turf(target)
	if(!T || !istype(T, /turf/open))
		to_chat(user, span_warning("You can't create water here!"))
		return
	
	// Определяем количество воды для добавления
	var/water_amount = 100
	if(user.client?.keys_held["Alt"])
		water_amount = 5000
	
	// Проверяем есть ли уже вода
	for(var/obj/effect/water_overlay/existing in T)
		existing.add_water(water_amount)
		to_chat(user, span_notice("You add [water_amount]L of water."))
		return
	
	// Создаем новую воду
	var/obj/effect/water_overlay/W = new(T)
	W.add_water(water_amount)
	to_chat(user, span_notice("You create [water_amount]L of water."))

/obj/item/water_drain
	name = "water drain"
	desc = "Removes water effects. Click to remove 100L, Alt+Click to remove all water."
	icon = 'icons/obj/device.dmi'
	icon_state = "analyzer"
	
/obj/item/water_drain/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	
	var/turf/T = get_turf(target)
	if(!T)
		return
	
	for(var/obj/effect/water_overlay/water in T)
		var/drain_amount = 100
		if(user.client?.keys_held["Alt"])
			drain_amount = water.water_volume // Убираем всю воду
		
		var/removed = water.remove_water(drain_amount)
		to_chat(user, span_notice("You remove [removed] liters of water."))
		return
	
	to_chat(user, span_warning("No water to remove here!"))
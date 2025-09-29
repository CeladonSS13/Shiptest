// // Простой предмет для создания воды (для тестирования)
// /obj/item/water_spawner
// 	name = "water spawner"
// 	desc = "A device that can create water. Use it on a floor to spawn water."
// 	icon = 'icons/obj/device.dmi'
// 	icon_state = "multitool"

// /obj/item/water_spawner/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
// 	. = ..()
// 	if(!proximity_flag)
// 		return

// 	var/turf/T = get_turf(target)
// 	if(!T)
// 		return

// 	// Проверяем есть ли уже водный эффект
// 	for(var/obj/effect/water_overlay/existing in T)
// 		existing.add_water(100)
// 		to_chat(user, span_notice("You add more water to [T]."))
// 		return

// 	if(istype(T, /turf/open))
// 		var/obj/effect/water_overlay/W = new(T)
// 		W.add_water(100)
// 		to_chat(user, span_notice("You create water on [T]."))
// 	else
// 		to_chat(user, span_warning("You can't create water on [T]!"))

// // Предмет для удаления воды
// /obj/item/water_remover
// 	name = "water remover"
// 	desc = "A device that can remove water. Use it on water to drain it."
// 	icon = 'icons/obj/device.dmi'
// 	icon_state = "analyzer"

// /obj/item/water_remover/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
// 	. = ..()
// 	if(!proximity_flag)
// 		return

// 	var/turf/T = get_turf(target)
// 	if(!T)
// 		return

// 	// Ищем водный эффект
// 	for(var/obj/effect/water_overlay/water in T)
// 		var/removed = water.remove_water(100)
// 		to_chat(user, span_notice("You remove [removed] liters of water from [T]."))
// 		return

// 	to_chat(user, span_warning("There's no water to remove on [T]!"))

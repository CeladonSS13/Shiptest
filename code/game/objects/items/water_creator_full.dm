// Предмет для создания полной воды (500L)
/obj/item/water_creator/full
	name = "full water creator"
	desc = "Creates 5000L of water instantly."
	icon_state = "multitool_red"
	
/obj/item/water_creator/full/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	
	var/turf/T = get_turf(target)
	if(!T || !istype(T, /turf/open))
		to_chat(user, span_warning("You can't create water here!"))
		return
	
	// Проверяем есть ли уже вода
	for(var/obj/effect/water_overlay/existing in T)
		existing.add_water(5000)
		to_chat(user, span_notice("You add 5000L of water."))
		return
	
	// Создаем новую воду с полным объемом
	new /obj/effect/water_overlay/full(T)
	to_chat(user, span_notice("You create 5000L of deep water."))
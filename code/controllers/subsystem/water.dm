// Обработчик движения мобов для водных эффектов
/mob/living/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0)
	. = ..()
	if(!.)
		return
	
	// Проверяем воду в новой локации
	var/turf/T = get_turf(src)
	if(!T)
		return
	
	var/water_level = get_water_level_at_turf(T)
	if(water_level > WATER_LEVEL_NONE)
		apply_water_effects_to_mob(src, T)
	else
		// Убираем эффекты если нет воды
		remove_status_effect(/datum/status_effect/drowning)
		remove_status_effect(/datum/status_effect/water_slowdown)
		remove_status_effect(/datum/status_effect/underwater_overlay)
		remove_status_effect(/datum/status_effect/water_pressure)
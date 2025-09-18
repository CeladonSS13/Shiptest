/datum/overmap/ship/controlled/Dock(datum/overmap/to_dock, datum/docking_ticket/ticket, force = FALSE)
	// Проверяем все динамические объекты с активным таймером удаления - планеты тоже сюда попадают
	if(istype(to_dock, /datum/overmap/dynamic) && to_dock.token?.countdown && to_dock.death_time)
		if((to_dock.death_time - world.time) < 15 SECONDS)	// Если таймер истек или скоро истечет (менее 15 секунд), блокируем стыковку
			return "Объект нестабилен и скоро исчезнет. Стыковка отменена."

	return ..(to_dock, ticket, force) // А вот это, вызовет родителя со всеми параметрами как обычно

/datum/overmap/proc/is_docking_safe()
	if(!istype(src, /datum/overmap/dynamic) || !token?.countdown || !death_time)
		return TRUE
	return (death_time - world.time) >= 15 SECONDS // Осталось больше 15 секунд?

/datum/overmap/ship/controlled/dock_in_empty_space()
	var/datum/overmap/dynamic/empty/empty_space = locate() in current_overmap.overmap_container[x][y]
	if(empty_space && !empty_space.is_docking_safe())
		return "Объект нестабилен и скоро исчезнет. Стыковка отменена."

	if(!empty_space)
		empty_space = new(list("x" = x, "y" = y), current_overmap)

	if(empty_space)
		Dock(empty_space)

/datum/overmap/dynamic/empty/post_undocked(datum/overmap/dock_requester)
	// НЕ запускаем таймер удаления сразу после отстыковки
	// Даем время на возможную повторную стыковку, на подумать игрокам. Даём 10 сек
	addtimer(CALLBACK(src, PROC_REF(delayed_countdown)), 10 SECONDS)

/datum/overmap/dynamic/empty/proc/delayed_countdown()
	// Проверяем, не пристыковался ли кто-то за это время
	if(length(mapzone?.get_mind_mobs()))
		return // Кто-то есть, не удаляем

	// Запускаем обычный таймер удаления - он равен 60 сек
	start_countdown()

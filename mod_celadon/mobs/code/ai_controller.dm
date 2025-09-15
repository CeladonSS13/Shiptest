/datum/ai_controller/proc/check_should_sleep()
	if(!pawn)
		return

	var/virt_z = 0
	// Вводим два метода, получения виртуального уровня
	// Если у нас нету моба на турфе но есть запись об урвоне. И если есть моб на турфе, то берем с турфа информацию
	// Это исключит некоторые ошибки и пропуски, и мы не ограничиваемся одним методом
	if(istype(pawn.loc, /turf))
		var/turf/T = pawn.loc
		virt_z = T.virtual_z
	else
		virt_z = pawn.virtual_z()

	var/players_on_virtual_z = 0
	if(virt_z)
		var/mob/temp = pawn
		players_on_virtual_z = LAZYACCESS(SSmobs.players_by_virtual_z, "[virt_z]")
		if((ai_status == AI_STATUS_ON && !length(players_on_virtual_z)) || temp?.key)
			set_ai_status(AI_STATUS_OFF)
		else if((ai_status == AI_STATUS_OFF && length(players_on_virtual_z)) && !temp?.key)
			set_ai_status(AI_STATUS_ON)

// Вызывается при создании моба для проверки наличия игроков поблизости
/datum/ai_controller/proc/initial_ai_status_check()
	if(!pawn)
		return

	var/virt_z = 0
	if(istype(pawn.loc, /turf))
		var/turf/T = pawn.loc
		virt_z = T.virtual_z
	else
		virt_z = pawn.virtual_z()

	if(virt_z && length(LAZYACCESS(SSmobs.players_by_virtual_z, "[virt_z]")))
		set_ai_status(AI_STATUS_ON)

// Переопределяем PossessPawn для вызова проверки игроков при инициализации
/datum/ai_controller/PossessPawn(atom/new_pawn)
	. = ..() // Вызываем родительский метод
	initial_ai_status_check() // Проверяем наличие игроков сразу после создания

// Хук для обновления статуса AI при изменении списка игроков
/datum/ai_controller/proc/update_ai_status_for_zone()
	addtimer(CALLBACK(src, PROC_REF(initial_ai_status_check)), 2 SECONDS) // Небольшая задержка для уверенности, что список игроков обновлен

// Добавляем хук для обновления всех AI при входе игрока в зону
/mob/Login()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(update_ai_for_zone)), 1 SECONDS)

/mob/proc/update_ai_for_zone()
	var/virt_z = 0
	if(istype(loc, /turf))
		var/turf/T = loc
		virt_z = T.virtual_z
	else
		virt_z = virtual_z()

	if(!virt_z)
		return

	// Обновляем всех мобов в текущей виртуальной зоне
	for(var/mob/living/M in GLOB.mob_living_list)
		if(M.ai_controller && M.ai_controller.ai_status == AI_STATUS_OFF)
			var/mob_virt_z = 0
			if(istype(M.loc, /turf))
				var/turf/MT = M.loc
				mob_virt_z = MT.virtual_z
			else
				mob_virt_z = M.virtual_z()

			if(mob_virt_z == virt_z)
				M.ai_controller.update_ai_status_for_zone()

// SHIP_SELECTION_REWORK
// Статические переменные для защиты от дублированных запросов
/datum/ship_select
	var/static/list/join_cooldown_by_ckey = list()
	var/static/list/recently_cancelled_by_ckey = list()
	var/static/list/join_lock_by_ckey = list()
	var/static/list/processed_nonces = list()

// Добавляем assets для логотипов фракций
/datum/ship_select/ui_assets(mob/user)
	return list(get_asset_datum(/datum/asset/simple/faction_logos))

// OVERRIDE ui_act - перехватываем join action
/datum/ship_select/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if(!isnewplayer(usr))
		return ..()

	// ПЕРЕХВАТ: только для наших новых actions - обрабатываем с защитой
	if(action == "join")
		return handle_protected_join(action, params, ui, state)

	if(action == "apply_for_job")
		return handle_protected_job_application(action, params, ui, state)

	if(action == "cancel_job_application")
		return handle_cancel_job_application(action, params, ui, state)

	// Обрабатываем actions для выбора фракций
	if(action == "open_faction")
		return handle_open_faction(action, params, ui, state)

	if(action == "back_factions")
		return handle_back_factions(action, params, ui, state)

	if(action == "close")
		ui.close()
		return TRUE

	// Для всех остальных actions - вызываем оригинальную логику
	return ..()

// OVERRIDE ui_data - добавляем динамическую информацию о статусах заявок
/datum/ship_select/ui_data(mob/user)
	. = ..()  // Получаем оригинальные данные

	if(!isnewplayer(user))
		return

	var/mob/dead/new_player/spawnee = user
	var/user_ckey = ckey(spawnee.key)

	// Добавляем статусы заявок для каждой профессии (динамические данные)
	.["jobApplicationStatuses"] = list()

	for(var/datum/overmap/ship/controlled/ship in SSovermap.controlled_ships)
		if(!ship.is_join_option())
			continue

		// Получаем заявку пользователя на этот корабль (если есть)
		var/datum/ship_application/user_application = ship.applications?[user_ckey]

		var/ship_ref = REF(ship)
		.["jobApplicationStatuses"][ship_ref] = list()

		// Проверяем статусы для каждой профессии на этом корабле
		for(var/datum/job/job in ship.job_slots)
			var/job_ref = REF(job)
			var/application_status = "none"  // none, pending, approved, denied

			if(user_application)
				// Если заявка есть, проверяем её статус и целевую профессию
				switch(user_application.status)
					if(SHIP_APPLICATION_PENDING)
						// Если заявка на конкретную профессию - проверяем соответствие
						if(user_application.target_job == job)
							application_status = "pending"
						else if(!user_application.target_job)
							// Общая заявка на корабль - все профессии в pending
							application_status = "pending"
					if(SHIP_APPLICATION_ACCEPTED)
						// Если заявка одобрена
						if(user_application.target_job == job)
							application_status = "approved"
						else if(!user_application.target_job)
							// Общая заявка одобрена - все профессии доступны
							application_status = "approved"
					if(SHIP_APPLICATION_DENIED)
						// Если заявка отклонена
						if(user_application.target_job == job)
							application_status = "denied"
						else if(!user_application.target_job)
							// Общая заявка отклонена
							application_status = "denied"

			.["jobApplicationStatuses"][ship_ref][job_ref] = application_status

			// Добавляем причину отказа в статусы заявлений о приеме на роль
			if(application_status == "denied" && user_application?.denial_reason)
				.["jobApplicationStatuses"][ship_ref][job_ref + "_denial_reason"] = user_application.denial_reason

	// Добавляем информацию о выбранной фракции (уникальная для каждого пользователя)
	.["selectedFaction"] = selected_faction_by_ckey[user_ckey]

	return .

// Защищённая обработка join action
/datum/ship_select/proc/handle_protected_join(action, list/params, datum/tgui/ui, datum/ui_state/state)
	var/mob/dead/new_player/spawnee = usr
	var/nonce = params["nonce"]
	var/ck = spawnee?.ckey

	// ЗАЩИТА ОТ ПОВТОРНЫХ NONCE - блокируем дублированные запросы
	if(nonce)
		// Очищаем старые nonce (cleanup)
		for(var/old_nonce in processed_nonces)
			if(processed_nonces[old_nonce] < world.time)
				processed_nonces -= old_nonce

		// Проверяем дубликат
		if(processed_nonces[nonce])
			to_chat(spawnee, span_notice("This request was already processed. Please wait."))
			return FALSE
		processed_nonces[nonce] = world.time + 600

	if(ck)
		// ЖЁСТКИЙ LOCK
		var/lock_until = join_lock_by_ckey[ck]
		if(isnum(lock_until) && world.time < lock_until)
			to_chat(spawnee, span_notice("Application form is already open or recently closed. Please wait."))
			return FALSE

		// УСТАНАВЛИВАЕМ LOCK
		join_lock_by_ckey[ck] = world.time + 100

	// ВЫЗОВ ОРИГИНАЛЬНОЙ ЛОГИКИ через прямой вызов базового ui_act с action="join"
	var/result = call_original_ui_act(action, params, ui, state)

	// СНЯТИЕ LOCK после завершения (короткий хвост для предотвращения автоповтора)
	if(ck)
		join_lock_by_ckey[ck] = world.time + 20  // 2 секунды защиты от автоповтора

	return result

// Прямой вызов оригинальной логики ui_act("join") без рекурсии
/datum/ship_select/proc/call_original_ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	var/mob/dead/new_player/spawnee = usr

	// Копия оригинальной логики из базового ship_select.dm
	if(action == "join")
		var/datum/overmap/ship/controlled/target = locate(params["ship"]) in SSovermap.controlled_ships
		if(!target)
			to_chat(spawnee, span_danger("Unable to locate ship. Please contact admins!"))
			spawnee.new_player_panel()
			return FALSE
		if(!target.is_join_option())
			to_chat(spawnee, span_danger("This ship is not currently accepting new players!"))
			spawnee.new_player_panel()
			return FALSE

		var/did_application = FALSE
		if(target.join_mode == SHIP_JOIN_MODE_APPLY)
			var/datum/ship_application/current_application = target.get_application(spawnee)
			if(isnull(current_application))
				var/datum/ship_application/app = new(spawnee, target)
				if(app.get_user_response())
					to_chat(spawnee, span_notice("Ship application sent. You will be notified if the application is accepted."))
				else
					to_chat(spawnee, span_notice("Application cancelled, or there was an error sending the application."))
				return TRUE
			switch(current_application.status)
				if(SHIP_APPLICATION_PENDING)
					to_chat(spawnee, span_notice("You already have a pending application to this ship."))
					return TRUE
				if(SHIP_APPLICATION_DENIED)
					to_chat(spawnee, span_notice("Your application to this ship has been denied."))
					return TRUE
				if(SHIP_APPLICATION_ACCEPTED)
					did_application = TRUE
				else
					to_chat(spawnee, span_danger("There seems to be an issue with your application. Please contact an admin."))
					return FALSE

		if(did_application)
			message_admins("[spawnee.key] ([spawnee.client?.prefs?.real_name]) is joining [target] via ship application.")

		var/datum/job/selected_job = locate(params["job"]) in target.job_slots
		if(!selected_job)
			to_chat(spawnee, span_danger("Unable to locate job on ship!"))
			spawnee.new_player_panel()
			return FALSE

		// Пытается запустить спавн самостоятельно. При этом проверяются требования ко времени воспроизведения.
		if(!spawnee.AttemptLateSpawn(selected_job, target))
			to_chat(spawnee, span_danger("Unable to spawn on ship!"))
			spawnee.new_player_panel()
			return FALSE
		return TRUE

	return FALSE  // Не обновляем UI автоматически

// Защищённая обработка подачи заявки на профессию
/datum/ship_select/proc/handle_protected_job_application(action, list/params, datum/tgui/ui, datum/ui_state/state)
	var/mob/dead/new_player/spawnee = usr
	var/nonce = params["nonce"]
	var/ck = spawnee?.ckey

	// ЗАЩИТА ОТ ПОВТОРНЫХ NONCE
	if(nonce)
		// Очищаем старые nonce (cleanup)
		for(var/old_nonce in processed_nonces)
			if(processed_nonces[old_nonce] < world.time)
				processed_nonces -= old_nonce

		// Проверяем дубликат
		if(processed_nonces[nonce])
			to_chat(spawnee, span_notice("This request was already processed. Please wait."))
			return FALSE

		// Регистрируем nonce на 60 секунд
		processed_nonces[nonce] = world.time + 600

	// ЖЁСТКИЙ LOCK - блокируем параллельные join
	if(ck)
		var/lock_until = join_lock_by_ckey[ck]
		if(isnum(lock_until) && world.time < lock_until)
			to_chat(spawnee, span_notice("Please wait before applying again."))
			return FALSE

		// Устанавливаем lock на 10 секунд
		join_lock_by_ckey[ck] = world.time + 100

	// ЛОГИКА ПОДАЧИ ЗАЯВКИ НА ПРОФЕССИЮ
	var/datum/overmap/ship/controlled/target = locate(params["ship"]) in SSovermap.controlled_ships
	if(!target)
		to_chat(spawnee, span_danger("Unable to locate ship. Please contact admins!"))
		if(ck)
			join_lock_by_ckey[ck] = world.time + 20
		return FALSE

	// Находим выбранную профессию
	var/datum/job/selected_job = locate(params["job"]) in target.job_slots
	if(!selected_job)
		to_chat(spawnee, span_danger("Unable to locate job. Please contact admins!"))
		if(ck)
			join_lock_by_ckey[ck] = world.time + 20
		return FALSE

	// Проверяем режим присоединения
	if(target.join_mode != SHIP_JOIN_MODE_APPLY)
		to_chat(spawnee, span_notice("This ship doesn't require applications."))
		if(ck)
			join_lock_by_ckey[ck] = world.time + 20
		return FALSE

	// Проверки ролей будут выполнены при фактическом спавне

	// Создаём заявку для конкретной профессии
	var/datum/ship_application/app = new(spawnee, target)
	app.target_job = selected_job

	// Получаем ответ пользователя
	var/app_result = app.get_user_response()

	// СНЯТИЕ LOCK после завершения
	if(ck)
		join_lock_by_ckey[ck] = world.time + 20  // короткий хвост

	if(app_result)
		to_chat(spawnee, span_notice("Job application submitted successfully."))
	else
		to_chat(spawnee, span_notice("Job application cancelled or failed."))

	return app_result

// Обработка выбора фракции
/datum/ship_select/proc/handle_open_faction(action, list/params, datum/tgui/ui, datum/ui_state/state)
	var/mob/dead/new_player/spawnee = usr
	var/faction_id = params["faction"]
	var/user_ckey = ckey(spawnee.key)

	// Устанавливаем выбранную фракцию для конкретного пользователя
	selected_faction_by_ckey[user_ckey] = faction_id

	return TRUE

// Обработка возврата к списку фракций
/datum/ship_select/proc/handle_back_factions(action, list/params, datum/tgui/ui, datum/ui_state/state)
	var/mob/dead/new_player/spawnee = usr
	var/user_ckey = ckey(spawnee.key)

	// Сбрасываем выбранную фракцию для конкретного пользователя
	selected_faction_by_ckey[user_ckey] = null

	return TRUE

// Обработка отмены заявки на профессию
/datum/ship_select/proc/handle_cancel_job_application(action, list/params, datum/tgui/ui, datum/ui_state/state)
	var/mob/dead/new_player/spawnee = usr
	var/nonce = params["nonce"]
	var/ck = spawnee?.ckey

	// ЗАЩИТА ОТ ПОВТОРНЫХ NONCE
	if(nonce)
		// Очищаем старые nonce (cleanup)
		for(var/old_nonce in processed_nonces)
			if(processed_nonces[old_nonce] < world.time)
				processed_nonces -= old_nonce

		// Проверяем дубликат
		if(processed_nonces[nonce])
			to_chat(spawnee, span_notice("This request was already processed. Please wait."))
			return FALSE

		// Регистрируем nonce на 60 секунд
		processed_nonces[nonce] = world.time + 600

	// ЖЁСТКИЙ LOCK - блокируем параллельные действия
	if(ck)
		var/lock_until = join_lock_by_ckey[ck]
		if(isnum(lock_until) && world.time < lock_until)
			to_chat(spawnee, span_notice("Please wait before cancelling application."))
			return FALSE

		// Устанавливаем lock на 5 секунд
		join_lock_by_ckey[ck] = world.time + 50

	// ОТМЕНА ЗАЯВКИ
	var/datum/overmap/ship/controlled/target = locate(params["ship"]) in SSovermap.controlled_ships
	if(!target)
		to_chat(spawnee, span_danger("Unable to locate ship. Please contact admins!"))
		if(ck)
			join_lock_by_ckey[ck] = world.time + 10
		return FALSE

	// Находим и удаляем заявку пользователя
	var/user_ckey = ckey(spawnee.key)
	var/datum/ship_application/user_application = target.applications?[user_ckey]

	if(!user_application)
		to_chat(spawnee, span_notice("У вас нет заявки на этот корабль."))
		if(ck)
			join_lock_by_ckey[ck] = world.time + 10
		return FALSE

	if(user_application.status != SHIP_APPLICATION_PENDING)
		to_chat(spawnee, span_notice("Заявка уже обработана и не может быть отменена."))
		if(ck)
			join_lock_by_ckey[ck] = world.time + 10
		return FALSE

	// Уведомляем владельца корабля об отмене
	if(target.owner_mob)
		to_chat(target.owner_mob, span_notice("[spawnee.client?.prefs?.real_name || spawnee.key] отменил заявку на корабль."), MESSAGE_TYPE_INFO)

	// Удаляем заявку
	LAZYREMOVE(target.applications, user_ckey)
	qdel(user_application)

	to_chat(spawnee, span_notice("Заявка отменена."))

	// СНЯТИЕ LOCK
	if(ck)
		join_lock_by_ckey[ck] = world.time + 10  // короткий хвост

	return TRUE

// Переменная для хранения выбранной фракции (уникальная для каждого пользователя)
/datum/ship_select
	var/static/list/selected_faction_by_ckey = list()

// Очистка данных при закрытии UI
/datum/ship_select/ui_close(mob/user)
	. = ..()

	// Очищаем данные выбранной фракции при закрытии UI
	if(isnewplayer(user))
		var/mob/dead/new_player/spawnee = user
		var/user_ckey = ckey(spawnee.key)
		if(user_ckey)
			selected_faction_by_ckey[user_ckey] = null

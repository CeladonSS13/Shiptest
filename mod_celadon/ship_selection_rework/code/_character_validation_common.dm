// SHIP_SELECTION_REWORK - Common character validation functions
// Общие функции валидации персонажа для использования в базовом коде

// Общий метод для валидации персонажа при входе на корабль (для базового кода)
/proc/validate_character_for_ship_join(mob/dead/new_player/spawnee, datum/ship_application/application)
	var/datum/preferences/current_prefs = spawnee.client?.prefs
	if(!current_prefs)
		to_chat(spawnee, span_danger("Ошибка: невозможно получить данные персонажа. Попробуйте перезайти."))
		return FALSE

	var/current_hash = application.generate_character_hash(current_prefs)
	var/stored_hash = application.character_hash

	if(!stored_hash)
		to_chat(spawnee, span_danger("Ошибка: данные о персонаже в заявке отсутствуют. Подайте заявку заново."))
		// Удаляем невалидную заявку
		application.application_status_change(SHIP_APPLICATION_DENIED)
		return FALSE

	if(current_hash != stored_hash)
		// Персонаж изменился после принятия заявки
		var/original_name = application.app_name || "Неизвестно"
		var/current_name = current_prefs.real_name || "Неизвестно"
		var/original_species = application.character_species || "Неизвестно"
		var/current_species = current_prefs.pref_species?.name || "Неизвестно"

		to_chat(spawnee, span_danger("Ваша заявка была принята для другого персонажа!"))
		to_chat(spawnee, span_notice("Было: [original_name] ([original_species])"))
		to_chat(spawnee, span_notice("Стало: [current_name] ([current_species])"))
		to_chat(spawnee, span_warning("Заявка аннулирована. Подайте новую заявку для текущего персонажа."))

		// Аннулируем заявку
		application.denial_reason = "Персонаж изменён после принятия заявки: было '[original_name] ([original_species])', стало '[current_name] ([current_species])'"
		application.application_status_change(SHIP_APPLICATION_DENIED)

		// Уведомляем владельца корабля
		if(application.parent_ship.owner_mob)
			to_chat(application.parent_ship.owner_mob, span_warning("Заявка от [original_name] аннулирована - игрок сменил персонажа на [current_name]."))
			if(application.parent_ship.owner_act)
				application.parent_ship.owner_act.check_blinking()

		return FALSE

	return TRUE

// Общий метод для безопасного изменения статуса заявки
// Разрешает изменение с ACCEPTED на DENIED (например, при смене персонажа)
/proc/safe_application_status_change(datum/ship_application/application, new_status)
	// Разрешаем изменение статуса с ACCEPTED на DENIED (например, при смене персонажа)
	// Но запрещаем изменение с DENIED на что-то еще
	if(application.status == SHIP_APPLICATION_DENIED && new_status != SHIP_APPLICATION_DENIED)
		return FALSE
	// Запрещаем изменение статуса, если заявка уже в финальном состоянии и мы не переходим в DENIED
	if(application.status == SHIP_APPLICATION_ACCEPTED && new_status != SHIP_APPLICATION_DENIED)
		return FALSE

	application.status = new_status
	if(application.parent_ship.owner_act)
		application.parent_ship.owner_act.check_blinking()

	if(!application.app_mob)
		return TRUE
	SEND_SOUND(application.app_mob, sound('sound/misc/server-ready.ogg', volume=50))
	switch(new_status)
		if(SHIP_APPLICATION_ACCEPTED)
			to_chat(application.app_mob, span_notice("Your application to [application.parent_ship] was accepted!"), MESSAGE_TYPE_INFO)
		if(SHIP_APPLICATION_DENIED)
			var/denial_message = "Your application to [application.parent_ship] was denied!"
			if(application.denial_reason && length(application.denial_reason))
				denial_message += "\nПричина: [application.denial_reason]"
			to_chat(application.app_mob, span_warning(denial_message), MESSAGE_TYPE_INFO)

	return TRUE

// Отслеживание изменений персонажа для аннулирования заявок

// Сохраняем хеш персонажа перед изменениями
/datum/preferences
	var/last_saved_character_hash

// Переопределяем save_character для отслеживания изменений персонажа
/datum/preferences/save_character()
	var/old_hash = last_saved_character_hash

	// Вызываем оригинальный save_character
	. = ..()

			// Генерируем новый хеш после сохранения
	if(parent?.ckey)
		var/new_hash = generate_character_hash_for_tracking()

		// Если персонаж изменился, аннулируем заявки
		if(old_hash && new_hash && old_hash != new_hash)
			log_admin("Character change detected for [parent.ckey]: [old_hash] -> [new_hash]")
			invalidate_applications_for_character_change(old_hash, new_hash)

		// Обновляем сохраненный хеш
		last_saved_character_hash = new_hash

// Инициализируем хеш при загрузке персонажа
/datum/preferences/load_character(slot)
	var/old_hash = last_saved_character_hash
	. = ..()
	if(. && parent?.ckey)
		var/new_hash = generate_character_hash_for_tracking()

		// Если персонаж изменился из-за смены слота, аннулируем заявки
		if(old_hash && new_hash && old_hash != new_hash)
			log_admin("Character slot change detected for [parent.ckey]: [old_hash] -> [new_hash]")
			invalidate_applications_for_character_change(old_hash, new_hash)

		last_saved_character_hash = new_hash

/// Генерирует хеш персонажа для отслеживания изменений
/datum/preferences/proc/generate_character_hash_for_tracking()
	var/hash_string = "[real_name]|[gender]|[pref_species?.id]"
	return md5(hash_string)

/// Аннулирует все заявки при изменении персонажа
/datum/preferences/proc/invalidate_applications_for_character_change(old_hash, new_hash)
	if(!parent?.ckey)
		return

	var/player_ckey = ckey(parent.ckey)
	var/old_name = "Unknown"
	var/new_name = real_name || "Unknown"
	var/invalidated_count = 0

			// Находим все заявки для этого игрока
	for(var/datum/overmap/ship/controlled/ship in SSovermap.controlled_ships)
		var/datum/ship_application/app = ship.applications?[player_ckey]
		if(!app)
			continue

		// Пропускаем уже отклоненные заявки
		if(app.status == SHIP_APPLICATION_DENIED)
			continue

		// Сохраняем старое имя для уведомления
		if(app.app_name)
			old_name = app.app_name

				// Аннулируем заявку
		app.denial_reason = "Персонаж изменён: было '[old_name]', стало '[new_name]'"
		app.application_status_change(SHIP_APPLICATION_DENIED)
		invalidated_count++

		// Уведомляем владельца корабля если он онлайн
		if(ship.owner_mob)
			to_chat(ship.owner_mob, span_warning("Заявка от [old_name] аннулирована - игрок сменил персонажа на [new_name]."))
			if(ship.owner_act)
				ship.owner_act.check_blinking()

		// Уведомляем игрока
		if(parent?.mob)
			to_chat(parent.mob, span_warning("Ваша заявка на корабль [ship.name] аннулирована из-за смены персонажа."))
			to_chat(parent.mob, span_notice("Было: [old_name], стало: [new_name]. Подайте новую заявку если хотите присоединиться."))

	// Логируем результат
	if(invalidated_count > 0)
		log_admin("Invalidated [invalidated_count] applications for [player_ckey] due to character change: [old_name] -> [new_name]")


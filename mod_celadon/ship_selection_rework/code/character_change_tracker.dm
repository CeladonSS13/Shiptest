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
	var/datum/species/s = src.pref_species
	var/spec_id = s ? s.id : ""
	var/hash_string = "[src.real_name]|[src.gender]|[spec_id]"
	return md5(hash_string)

/// Получает детальное описание изменений персонажа
/datum/preferences/proc/get_character_changes_description(datum/preferences/old_prefs)
	var/list/changes = list()

	if(!old_prefs)
		return "неизвестные изменения"

	// Сравниваем имя
	var/old_name = old_prefs.real_name
	var/new_name = real_name
	if(old_name != new_name)
		changes += "имя: '[old_name]' → '[new_name]'"

	// Сравниваем пол
	var/old_gender = old_prefs.gender
	var/new_gender = gender
	if(old_gender != new_gender)
		changes += "пол: '[old_gender]' → '[new_gender]'"

	// Сравниваем расу - используем локальные переменные с явным типом
	var/datum/species/old_s = old_prefs.pref_species
	var/datum/species/new_s = pref_species

	var/old_sid = old_s ? old_s.id : null
	var/new_sid = new_s ? new_s.id : null

	if(old_sid != new_sid)
		var/old_species_name = old_s ? old_s.name : "Неизвестно"
		var/new_species_name = new_s ? new_s.name : "Неизвестно"
		changes += "раса: '[old_species_name]' → '[new_species_name]'"

	if(length(changes))
		return jointext(changes, ", ")
	else
		return "неизвестные изменения"

/// Получает детальное описание изменений персонажа между заявкой и текущими префсами
/proc/get_detailed_character_changes(datum/ship_application/app)
	var/list/changes = list()

	// Получаем текущие префсы игрока
	var/datum/preferences/current_prefs = app.app_mob?.client?.prefs
	if(!current_prefs)
		return "неизвестные изменения"

	// Сравниваем имя
	if(app.app_name && app.app_name != current_prefs.real_name)
		changes += "имя: '[app.app_name]' → '[current_prefs.real_name]'"

	// Сравниваем пол
	if(app.character_gender && app.character_gender != current_prefs.gender)
		changes += "пол: '[app.character_gender]' → '[current_prefs.gender]'"

	// Сравниваем расу - используем локальную переменную с явным типом
	var/datum/species/cs = current_prefs.pref_species
	var/current_species_name = cs ? cs.name : "Неизвестно"
	if(app.character_species && app.character_species != current_species_name)
		changes += "раса: '[app.character_species]' → '[current_species_name]'"

	if(length(changes))
		return jointext(changes, ", ")
	else
		return "неизвестные изменения"

/// Аннулирует все заявки при изменении персонажа
/datum/preferences/proc/invalidate_applications_for_character_change(old_hash, new_hash)
	if(!parent?.ckey)
		return

	var/player_ckey = ckey(parent.ckey)
	var/invalidated_count = 0

			// Находим все заявки для этого игрока
	for(var/datum/overmap/ship/controlled/ship in SSovermap.controlled_ships)
		var/datum/ship_application/app = ship.applications?[player_ckey]
		if(!app)
			continue

		// Пропускаем уже отклоненные заявки
		if(app.status == SHIP_APPLICATION_DENIED)
			continue

		// Аннулируем ВСЕ активные заявки (pending и accepted)
		// Принятые заявки тоже должны быть аннулированы при смене персонажа

		// Получаем детальное описание изменений
		var/change_description = get_detailed_character_changes(app)

		// Сохраняем текущий статус ДО изменения
		var/was_accepted = (app.status == SHIP_APPLICATION_ACCEPTED)

		// Аннулируем заявку с детальным описанием изменений
		app.denial_reason = "Персонаж изменён: [change_description]"
		safe_application_status_change(app, SHIP_APPLICATION_DENIED)
		invalidated_count++

		// Уведомляем владельца корабля если он онлайн
		if(ship.owner_mob)
			var/status_text = was_accepted ? "принятая " : ""
			to_chat(ship.owner_mob, span_warning("[status_text]Заявка от [app.app_name] аннулирована - игрок изменил персонажа: [change_description]."))
			if(ship.owner_act)
				ship.owner_act.check_blinking()

		// Уведомляем игрока
		if(parent?.mob)
			var/status_text = was_accepted ? "принятая " : ""
			to_chat(parent.mob, span_warning("Ваша [status_text]заявка на корабль [ship.name] аннулирована из-за смены персонажа."))
			to_chat(parent.mob, span_notice("Изменения: [change_description]. Подайте новую заявку если хотите присоединиться."))

	// Логируем результат
	if(invalidated_count > 0)
		log_admin("Invalidated [invalidated_count] applications for [player_ckey] due to character change ([old_hash] -> [new_hash])")

		// Обновляем UI только один раз для игрока (дебаунсинг множественных обновлений)
		if(parent?.mob)
			for(var/datum/tgui/ui in SStgui.open_uis)
				if(ui.interface == "ShipSelect" && ui.user == parent.mob && istype(ui.src_object, /datum/ship_select))
					var/datum/ship_select/ship_select = ui.src_object
					ship_select.queue_ui_update()
					break


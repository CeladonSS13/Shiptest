// SHIP_SELECTION_REWORK - Enhanced ship owner interface
// Улучшенный интерфейс владельца корабля с фото персонажей

/datum/action/ship_owner/ui_data(mob/user)
	. = ..()

	// Enhance application data with character info
	.["applications"] = list()
	for(var/a_key as anything in parent_ship.applications)
		var/datum/ship_application/app = parent_ship.applications[a_key]
		if(app.status == SHIP_APPLICATION_PENDING)
			.["pending"] = TRUE

		// Populate character info if not already done
		if(!app.character_photo_base64 && app.app_mob?.client?.prefs)
			var/datum/preferences/prefs = app.app_mob.client.prefs
			if(!app.character_age)
				app.character_age = prefs.age
			if(!length(app.character_quirks))
				app.character_quirks = prefs.all_quirks?.Copy() || list()
			if(!app.character_species)
				app.character_species = prefs.pref_species?.name || "Human"
			if(!app.character_gender)
				app.character_gender = prefs.gender
			if(!app.character_photo_base64)
				app.character_photo_base64 = app.generate_character_photo_base64(prefs)

		.["applications"] += list(list(
			ref = REF(app),
			key = (app.show_key ? app.app_key : "<Empty>"),
			name = app.app_name,
			text = app.app_msg,
			status = app.status,
			character_photo = app.character_photo_base64,
			character_age = app.character_age,
			character_quirks = app.get_formatted_quirks(),
			character_species = app.character_species,
			character_gender = app.character_gender,
			target_job = app.target_job?.name,
			denial_reason = app.denial_reason,
			character_valid = app.status == SHIP_APPLICATION_ACCEPTED ? app.validate_character(app.app_mob?.client?.prefs) : TRUE
		))

/datum/action/ship_owner/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ShipOwnerEnhanced", name)
		ui.open()

// Enhanced UI actions for denial with reason and character validation
/datum/action/ship_owner/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	var/mob/user = usr
	// admins get to use the panel even if they're not the owner
	if(!user.client?.holder && user != parent_ship.owner_mob)
		return TRUE

	switch(action)
		if("setApplication")
			var/datum/ship_application/target_app = locate(params["ref"])
			if(!target_app || target_app != parent_ship.applications[ckey(target_app.app_key)])
				return TRUE

			switch(params["newStatus"])
				if("yes")
					var/datum/preferences/current_prefs = target_app.app_mob?.client?.prefs
					if(!current_prefs)
						to_chat(user, span_warning("Игрок не в сети или недоступен. Невозможно проверить персонажа."))
						return TRUE

					// Получаем текущий хеш персонажа игрока
					var/current_hash = target_app.generate_character_hash(current_prefs)
					var/stored_hash = target_app.character_hash

					// Сравниваем с сохраненным хешем из заявки
					if(!stored_hash)
						to_chat(user, span_warning("Ошибка: отсутствуют данные о персонаже в заявке. Попросите игрока подать заявку заново."))
						return TRUE

					if(current_hash != stored_hash)
						// Получаем детали изменений для информативного сообщения
						var/original_name = target_app.app_name || "Неизвестно"
						var/current_name = current_prefs.real_name || "Неизвестно"
						var/original_species = target_app.character_species || "Неизвестно"
						var/current_species = current_prefs.pref_species?.name || "Неизвестно"
						var/original_gender = target_app.character_gender || "Неизвестно"
						var/current_gender = current_prefs.gender || "Неизвестно"

						to_chat(user, span_warning("Персонаж заявителя изменился!"))
						to_chat(user, span_notice("Было: [original_name] ([original_species], [original_gender])"))
						to_chat(user, span_notice("Стало: [current_name] ([current_species], [current_gender])"))
						to_chat(user, span_warning("Заявка автоматически отклонена."))

						target_app.denial_reason = "Персонаж изменён: было '[original_name] ([original_species], [original_gender])', стало '[current_name] ([current_species], [current_gender])'"
						target_app.application_status_change(SHIP_APPLICATION_DENIED)
						check_blinking()
						return TRUE

					// Если все проверки пройдены - принимаем заявку
					to_chat(user, span_notice("Персонаж проверен успешно. Заявка принята."))
					target_app.application_status_change(SHIP_APPLICATION_ACCEPTED)
				if("no")
					target_app.application_status_change(SHIP_APPLICATION_DENIED)
			check_blinking()
			return TRUE

		if("denyWithReason")
			var/datum/ship_application/target_app = locate(params["ref"])
			if(!target_app || target_app != parent_ship.applications[ckey(target_app.app_key)])
				return TRUE

			var/reason = sanitize(stripped_input(user, "Укажите причину отказа:", "Отказ в заявке", "", 200))
			if(!reason || !length(reason))
				return TRUE

			target_app.denial_reason = reason
			target_app.application_status_change(SHIP_APPLICATION_DENIED)
			check_blinking()
			return TRUE

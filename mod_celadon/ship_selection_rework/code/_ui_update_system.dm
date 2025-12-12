// SHIP_SELECTION_REWORK - UI Update Queue System
// Система очереди обновлений UI для предотвращения race conditions

#define UI_UPDATE_DELAY 1  // 1 тик задержки

/datum/ship_select
	var/tmp/ui_update_scheduled = FALSE
	var/tmp/ui_epoch = 0
	var/tmp/ui_loading = FALSE

/datum/ship_select/proc/queue_ui_update()
	if(ui_update_scheduled)
		return
	ui_update_scheduled = TRUE
	addtimer(CALLBACK(src, PROC_REF(_do_ui_update)), UI_UPDATE_DELAY)

/datum/ship_select/proc/_do_ui_update()
	ui_update_scheduled = FALSE
	try
		SStgui.update_uis(src)
	catch
		log_runtime("Failed to update ShipSelect UI: [src]")

/datum/ship_select/proc/bump_epoch_and_queue()
	ui_epoch++
	queue_ui_update()

/datum/ship_select/proc/set_loading_state(loading)
	ui_loading = loading
	queue_ui_update()

// Расширяем ui_data для передачи epoch и loading состояния
/datum/ship_select/ui_data(mob/user)
	var/list/data = ..()
	if(!data)
		data = list()
	data["epoch"] = ui_epoch
	data["loading"] = ui_loading
	return data

// Общий метод для валидации персонажа при входе на корабль
/datum/ship_select/proc/validate_character_for_join(mob/dead/new_player/spawnee, datum/ship_application/application)
	var/datum/preferences/current_prefs = spawnee.client?.prefs
	if(!current_prefs)
		to_chat(spawnee, span_danger("Ошибка: невозможно получить данные персонажа. Попробуйте перезайти."))
		return FALSE

	var/current_hash = application.generate_character_hash(current_prefs)
	var/stored_hash = application.character_hash

	if(!stored_hash)
		to_chat(spawnee, span_danger("Ошибка: данные о персонаже в заявке отсутствуют. Подайте заявку заново."))
		// Удаляем невалидную заявку
		safe_application_status_change(application, SHIP_APPLICATION_DENIED)
		queue_ui_update()
		return FALSE

	if(current_hash != stored_hash)
		// Персонаж изменился после принятия заявки
		var/change_description = get_detailed_character_changes(application)

		to_chat(spawnee, span_danger("Ваша заявка была принята для другого персонажа!"))
		to_chat(spawnee, span_notice("Изменения: [change_description]"))
		to_chat(spawnee, span_warning("Заявка аннулирована. Подайте новую заявку для текущего персонажа."))

		// Аннулируем заявку
		application.denial_reason = "Персонаж изменён после принятия заявки: [change_description]"
		safe_application_status_change(application, SHIP_APPLICATION_DENIED)

		// Уведомляем владельца корабля
		if(application.parent_ship.owner_mob)
			to_chat(application.parent_ship.owner_mob, span_warning("Заявка от [application.app_name] аннулирована - игрок изменил персонажа: [change_description]."))
			if(application.parent_ship.owner_act)
				application.parent_ship.owner_act.check_blinking()

		// Обновляем UI после аннулирования заявки
		queue_ui_update()
		return FALSE

	return TRUE

/datum/ship_application
	/// The ship this application is linked to.
	var/datum/overmap/ship/controlled/parent_ship
	/// The applicant's new player mob. We keep track of it to send them an update message if they haven't joined a ship yet.
	var/mob/dead/new_player/app_mob
	/// Whether to expose the user's key to the application recipient. Even if this is false, we still store apps using the key.
	var/show_key = FALSE
	/// The character name of the applicant at the time they applied. Isn't involved in the application logic,
	/// but it's nice to have, in case the ship owner recognizes the name but not the key.
	var/app_name
	/// The applicant's key. Comparisons are done using ckeys to ensure consistence, but we store the key so
	/// that if we send it in the application message it's in a format that might be more familiar to the recipient.
	var/app_key
	/// The extra message sent by the applicant.
	var/app_msg
	/// The application's status -- whether or not it has been accepted, rejected, or hasn't been answered yet.
	var/status = SHIP_APPLICATION_UNFINISHED
	// [CELADON-ADD] - SHIP_SELECTION_REWORK - Добавляем поле для хранения целевой профессии
	/// Target job for job-specific applications (optional)
	var/datum/job/target_job
	// [/CELADON-ADD]

/datum/ship_application/New(mob/dead/new_player/applicant, datum/overmap/ship/controlled/parent)
	// If the admin is in stealth mode, we use their fakekey.
	app_mob = applicant
	// [CELADON-EDIT] - SHIP_SELECTION_REWORK
	//app_name = app_mob.client?.prefs.real_name
	app_name = clean_html_entities(app_mob.client?.prefs.real_name)
	// [/CELADON-EDIT]
	app_key = app_mob.client?.holder?.fakekey ? app_mob.client.holder.fakekey : applicant.key
	parent_ship = parent

	// these are registered so we can cancel the application fill-out if the ship
	// gets deleted before the application is finalized, or the character spawns in.
	// your currently-open tgui windows don't get removed if you spawn into a body
	RegisterSignal(app_mob, COMSIG_PARENT_QDELETING, PROC_REF(applicant_deleting))
	RegisterSignal(parent_ship, COMSIG_PARENT_QDELETING, PROC_REF(important_deleting_during_apply))

/datum/ship_application/Destroy()
	SStgui.close_uis(src)
	if(status != SHIP_APPLICATION_UNFINISHED && status != SHIP_APPLICATION_CANCELLED)
		LAZYREMOVE(parent_ship.applications, ckey(app_key))
		if(app_mob)
			SEND_SOUND(app_mob, sound('sound/misc/server-ready.ogg', volume=50))
			to_chat(app_mob, span_warning("Your application to [parent_ship] has been deleted."), MESSAGE_TYPE_INFO)
	app_mob = null
	parent_ship = null
	. = ..()

/datum/ship_application/proc/get_user_response()
	ui_interact(app_mob)
	// wait for the user to either write the application or cancel
	while(status == SHIP_APPLICATION_UNFINISHED)
		stoplag(1)

	if(status == SHIP_APPLICATION_CANCELLED)
		qdel(src)
		return FALSE

	// we are now ready to finalize
	// unregister the ship qdel signal -- we add ourselves to the ship's applications, and it qdels us
	// when it deletes, so we don't need to worry about that anymore. we keep the applicant deletion signal
	UnregisterSignal(parent_ship, COMSIG_PARENT_QDELETING)
	LAZYSET(parent_ship.applications, ckey(app_key), src)

	if(parent_ship.owner_mob != null)
		// don't need to use check_blinking, because it DAMN well better be blinking now that we exist
		parent_ship.owner_act.set_blinking(TRUE)
		SEND_SOUND(parent_ship.owner_mob, sound('sound/misc/server-ready.ogg', volume=50))
		// [CELADON-EDIT] - SHIP_SELECTION_REWORK
		/*
		var/message = \
			"<span class='looc'>[app_name] [show_key ? "([app_key]) " : null]applied to your ship: [app_msg]\n" + \//
			"<a href=?src=[REF(src)];application_accept=1>(ACCEPT)</a> / <a href=?src=[REF(src)];application_deny=1>(DENY)</a></span>"
		*/
		var/message = \
			"<span class='looc'>[app_name] [show_key ? "([app_key]) " : null]applied to your ship: [clean_html_entities(app_msg)]\n" + \
			"<a href=?src=[REF(src)];application_accept=1>(ACCEPT)</a> / <a href=?src=[REF(src)];application_deny=1>(DENY)</a></span>"
		// [/CELADON-EDIT]
		to_chat(parent_ship.owner_mob, message, MESSAGE_TYPE_INFO)
	return TRUE

/datum/ship_application/proc/applicant_deleting()
	SIGNAL_HANDLER
	if(status == SHIP_APPLICATION_UNFINISHED)
		return important_deleting_during_apply()
	UnregisterSignal(app_mob, COMSIG_PARENT_QDELETING)
	app_mob = null

// we should get deleted soon, which clears up the references, since this can only fire if
// the applicant is in the midst of writing their application
/datum/ship_application/proc/important_deleting_during_apply()
	SIGNAL_HANDLER
	UnregisterSignal(parent_ship, COMSIG_PARENT_QDELETING)
	UnregisterSignal(app_mob, COMSIG_PARENT_QDELETING)
	status = SHIP_APPLICATION_CANCELLED

/datum/ship_application/ui_interact(mob/user, datum/tgui/ui)
	// ui only shows up when the application is being filled out
	if(status != SHIP_APPLICATION_UNFINISHED)
		return
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Application", "Application")
		ui.open()

/datum/ship_application/ui_close(mob/user)
	if(status == SHIP_APPLICATION_UNFINISHED)
		status = SHIP_APPLICATION_CANCELLED

/datum/ship_application/ui_state(mob/user)
	return GLOB.always_state

// [CELADON-ADD] - SHIP_SELECTION_REWORK - Вспомогательная функция для очистки HTML-сущностей
/datum/ship_application/proc/clean_html_entities(text)
	if(!text)
		return text
	// Очищаем HTML-сущности в правильном порядке (сначала сложные, потом простые)
	// Кавычки
	text = replacetext(text, "&quot;", "\"")
	text = replacetext(text, "&#34;", "\"")
	text = replacetext(text, "&#x22;", "\"")
	// Апострофы
	text = replacetext(text, "&#39;", "'")
	text = replacetext(text, "&#x27;", "'")
	// Амперсанд
	text = replacetext(text, "&amp;", "&")
	text = replacetext(text, "&#38;", "&")
	// Угловые скобки
	text = replacetext(text, "&lt;", "<")
	text = replacetext(text, "&#60;", "<")
	text = replacetext(text, "&gt;", ">")
	text = replacetext(text, "&#62;", ">")
	return text
// [/CELADON-ADD]

/datum/ship_application/ui_data(mob/user)
	. = list()
	.["ship_name"] = parent_ship.name
	.["player_name"] = app_name
	.["job_name"] = clean_html_entities(target_job?.name) // [CELADON-ADD] - SHIP_SELECTION_REWORK - Добавляем передачу job_name в UI

/datum/ship_application/ui_act(action, list/params, datum/tgui/ui)
	. = ..()
	if(. || status != SHIP_APPLICATION_UNFINISHED)
		return

	switch(action)
		if("submit")
			status = SHIP_APPLICATION_PENDING
			show_key = !!params["ckey"]
			// [CELADON-ADD] - SHIP_SELECTION_REWORK
			// Очищаем текст от HTML-сущностей и санитизируем
			var/raw_text = params["text"]
			app_msg = clean_html_entities(copytext(sanitize(raw_text), 1, 1024))
			// [/CELADON-EDIT]
			SStgui.close_uis(src)
			return TRUE

		if("cancel")
			status = SHIP_APPLICATION_CANCELLED
			SStgui.close_uis(src)
			return TRUE

// Topic() for when the ship owner clicks on approve/deny in their chat window
/datum/ship_application/Topic(href, href_list)
	. = ..()
	if(usr != parent_ship.owner_mob)
		return

	if(href_list["application_accept"])
		application_status_change(SHIP_APPLICATION_ACCEPTED)
	else if(href_list["application_deny"])
		application_status_change(SHIP_APPLICATION_DENIED)

/datum/ship_application/proc/application_status_change(new_status)
	// no alternating accept / deny spam
	if(status != SHIP_APPLICATION_PENDING)
		return
	status = new_status
	to_chat(usr, span_notice("Application [status]."), MESSAGE_TYPE_INFO)

	if(parent_ship.owner_act)
		parent_ship.owner_act.check_blinking()

	if(!app_mob)
		return
	SEND_SOUND(app_mob, sound('sound/misc/server-ready.ogg', volume=50))
	switch(status)
		if(SHIP_APPLICATION_ACCEPTED)
			to_chat(app_mob, span_notice("Your application to [parent_ship] was accepted!"), MESSAGE_TYPE_INFO)
			// [CELADON-EDIT] - SHIP_SELECTION_REWORK - Автообновление Ship Select UI после принятия заявки
			// Обновляем Ship Select UI если оно открыто
			for(var/datum/tgui/ui in SStgui.open_uis)
				if(ui.interface == "ShipSelect" && ui.user == app_mob)
					ui.send_update()
					break
			// [/CELADON-EDIT]
		if(SHIP_APPLICATION_DENIED)
			to_chat(app_mob, span_warning("Your application to [parent_ship] was denied!"), MESSAGE_TYPE_INFO)
			// [CELADON-EDIT] - SHIP_SELECTION_REWORK - Автообновление Ship Select UI после отклонения заявки
			// Обновляем Ship Select UI если оно открыто
			for(var/datum/tgui/ui in SStgui.open_uis)
				if(ui.interface == "ShipSelect" && ui.user == app_mob)
					ui.send_update()
					break
			// [/CELADON-EDIT]

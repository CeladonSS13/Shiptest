// SHIP_SELECTION_REWORK - Enhanced ship application with character photo and info
// Расширение заявки на корабль с фото и информацией о персонаже

/datum/ship_application
	/// Character photo as base64 string for TGUI display
	var/character_photo_base64
	/// Character age from preferences
	var/character_age
	/// List of character quirks from preferences
	var/list/character_quirks = list()
	/// Character species name
	var/character_species
	/// Character gender
	var/character_gender
	/// Reason for denial (if denied)
	var/denial_reason
	/// Character hash to validate character hasn't changed after acceptance
	var/character_hash

/datum/ship_application/New(mob/dead/new_player/applicant, datum/overmap/ship/controlled/parent)
	. = ..()

	// Collect character information from preferences
	if(applicant?.client?.prefs)
		var/datum/preferences/prefs = applicant.client.prefs
		character_age = prefs.age
		character_quirks = prefs.all_quirks?.Copy() || list()
		character_species = prefs.pref_species?.name || "Human"
		character_gender = prefs.gender
		character_hash = generate_character_hash(prefs)

		// Generate character photo
		character_photo_base64 = generate_character_photo_base64(prefs)

/// Generate base64 character photo from preferences
/datum/ship_application/proc/generate_character_photo_base64(datum/preferences/prefs)
	if(!prefs)
		return null

	try
		// Generate high-quality character preview similar to character setup
		var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)
		prefs.copy_to(mannequin, TRUE, TRUE, TRUE)

		// Create high-quality icon (similar to makeERTPreviewIcon approach)
		var/icon/preview_icon = icon('icons/effects/effects.dmi', "nothing")
		preview_icon.Scale(128, 128) // Create 128x128 canvas

		mannequin.setDir(SOUTH)
		var/icon/character_stamp = getFlatIcon(mannequin)

		// Scale the character stamp to fit nicely in the preview
		character_stamp.Scale(96, 96) // Scale character to 96x96 to leave some padding

		// Center the character in the 128x128 canvas
		preview_icon.Blend(character_stamp, ICON_OVERLAY, 17, 17) // Center position (128-96)/2 = 16

		unset_busy_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)

		// Convert to base64 for TGUI
		return icon2base64(preview_icon)
	catch(var/exception)
		// Log error but don't crash
		log_runtime("Failed to generate character photo: [exception]")
		// Make sure to clean up dummy if error occurs
		unset_busy_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)

	return null

/// Get formatted quirks list for display
/datum/ship_application/proc/get_formatted_quirks()
	if(!character_quirks || !length(character_quirks))
		return "Нет особенностей"

	var/list/formatted = list()
	for(var/quirk_name in character_quirks)
		// Get quirk info from subsystem
		var/datum/quirk/quirk_datum = SSquirks.quirks[quirk_name]
		if(quirk_datum)
			var/quirk_value = initial(quirk_datum.value)
			var/color = quirk_value > 0 ? "good" : (quirk_value < 0 ? "bad" : "neutral")
			formatted += list(list(
				"name" = quirk_name,
				"value" = quirk_value,
				"color" = color,
				"desc" = initial(quirk_datum.desc)
			))
		else
			formatted += list(list(
				"name" = quirk_name,
				"value" = 0,
				"color" = "neutral",
				"desc" = "Неизвестная особенность"
			))

	return formatted

/// Generate unique hash for character validation (simplified - only core identity)
/datum/ship_application/proc/generate_character_hash(datum/preferences/prefs)
	if(!prefs)
		return null

	// Create hash from core character identity: name, gender, species
	var/hash_string = "[prefs.real_name]|[prefs.gender]|[prefs.pref_species?.id]"

	return md5(hash_string)

/// Check if current character matches the one from application
/datum/ship_application/proc/validate_character(datum/preferences/current_prefs)
	if(!character_hash || !current_prefs)
		return FALSE

	var/current_hash = generate_character_hash(current_prefs)
	return current_hash == character_hash

// Enhanced application status change with denial reason notification
/datum/ship_application/application_status_change(new_status)
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
			for(var/datum/tgui/ui in SStgui.open_uis)
				if(ui.interface == "ShipSelect" && ui.user == app_mob)
					ui.send_update()
					break
		if(SHIP_APPLICATION_DENIED)
			var/denial_message = "Your application to [parent_ship] was denied!"
			if(denial_reason && length(denial_reason))
				denial_message += "\nПричина: [denial_reason]"
			to_chat(app_mob, span_warning(denial_message), MESSAGE_TYPE_INFO)
			for(var/datum/tgui/ui in SStgui.open_uis)
				if(ui.interface == "ShipSelect" && ui.user == app_mob)
					ui.send_update()
					break

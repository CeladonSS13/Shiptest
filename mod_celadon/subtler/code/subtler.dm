///////////////// SUBTLE 2: NO GHOST BOOGALOO

/datum/emote/living/subtlerag
	key = "subtlerag"
	key_third_person = "subtlerag"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/living/subtlerag/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, span_danger("Invalid emote."))
		return TRUE
	return FALSE

/datum/emote/living/subtlerag/run_emote(mob/user, params, type_override = null)
	if(is_banned_from(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/subtle_emote = stripped_multiline_input(user, "Choose an emote to display.", "subtlerag" , null, MAX_MESSAGE_LEN)
		if(subtle_emote && !check_invalid(user, subtle_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Unable to use this emote, must be either hearable or visible.")
					return
			message = subtle_emote
		else
			return FALSE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = TRUE
	if(!can_run_emote(user))
		return FALSE

	user.log_message(message, LOG_SUBTLER)
	message = "<b>[user]</b> " + "<i>[user.say_emphasis(message)]</i>"

	if(emote_type == EMOTE_AUDIBLE)
		user.audible_message_subtlerag(message = message, hearing_distance = 1, ignored_mobs = GLOB.dead_mob_list)
	else
		user.visible_message(message = message, self_message = message, vision_distance = 1, ignored_mobs = GLOB.dead_mob_list)

///////////////// VERB CODE 2
/mob/living/verb/subtlerag()
	set name = "Subtler Anti-Ghost"
	set category = "IC"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return
	usr.emote("subtlerag")

//This is bad code.
/atom/proc/audible_message_subtlerag(message, deaf_message, hearing_distance = DEFAULT_MESSAGE_RANGE, list/ignored_mobs, self_message, audible_message_flags = NONE)
	var/list/hearers = get_hearers_in_view(hearing_distance, src)
	if(self_message)
		hearers -= src
	hearers -= ignored_mobs
	var/raw_msg = message
	if(audible_message_flags & EMOTE_MESSAGE)
		raw_msg = "<b>[src]</b> [raw_msg]"
	for(var/mob/M in hearers)
		if(audible_message_flags & EMOTE_MESSAGE && runechat_prefs_check(M, audible_message_flags) && M.can_hear())
			M.create_chat_message(src, raw_message = raw_msg, runechat_flags = audible_message_flags)
		M.show_message(message, MSG_AUDIBLE, deaf_message, MSG_VISUAL)

///////////////// SUBTLE 2: NO GHOST BOOGALOO

/datum/emote/living/subtlerag
	key = "subtlerag"
	key_third_person = "subtlerag"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/living/subtlerag/proc/check_invalid(mob/user, input)
	if(stop_bypasser.Find(input, 1, 1))
		to_chat(user, span_danger("Invalid emote."))
		return TRUE
	return FALSE

/datum/emote/living/subtlerag/run_emote(mob/living/user, params, type_override = null)
	if(SSdbcore.IsConnected())
		if(is_banned_from(user, "emote"))
			to_chat(user, "You cannot send subtle emotes (banned).")
			return FALSE
		else if(user.client && user.client.prefs.muted & MUTE_IC)
			to_chat(user, "You cannot send IC messages (muted).")
			return FALSE
	else if(!params)
		user.set_typing_indicator(TRUE, isMe = TRUE)
		var/subtle_emote = stripped_multiline_input(user, "Choose an emote to display.", "Subtlerag" , null, MAX_MESSAGE_LEN)
		user.set_typing_indicator(FALSE)
		if(subtle_emote && !check_invalid(user, subtle_emote))
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
	user.visible_message(message = message, self_message = message, vision_distance = 1, ignored_mobs = GLOB.dead_mob_list)

///////////////// VERB CODE 2
/mob/living/verb/subtlerag()
	set name = "Subtler Anti-Ghost"
	set category = "IC"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return
	usr.emote("subtlerag")

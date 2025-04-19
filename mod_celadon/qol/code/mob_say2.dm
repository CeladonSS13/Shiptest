// Also made a small change in "mod_celadon\_components\code\emotes\emotes_living.dm".
// `/datum/emote/living/custom/run_emote()` now requires "." to do custom emotes instead of null


// Part from "code\modules\mob\mob_say.dm"

// Overrides verbs to use input() instead of verb arguments
///The me emote verb
/mob/verb/me_verb_2()
	set name = "Me"
	set category = "IC"
	var/message = input(usr, "", "me \"text\"", "") as text|null
	if(typing_indicator || isnull(message))
		set_typing_indicator(FALSE)
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return

	message = trim(copytext_char(sanitize(message), 1, MAX_MESSAGE_LEN))

	QUEUE_OR_CALL_VERB_FOR(VERB_CALLBACK(src, TYPE_PROC_REF(/mob, emote), "me", 1, message, TRUE), SSspeech_controller)

///Say verb
/mob/verb/say_verb_2()
	set name = "Say"
	set category = "IC"
	set instant = TRUE
	var/message = input(usr, "", "say \"text\"", "") as text|null
	if(typing_indicator || isnull(message))
		set_typing_indicator(FALSE)
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return
	//queue this message because verbs are scheduled to process after SendMaps in the tick and speech is pretty expensive when it happens.
	//by queuing this for next tick the mc can compensate for its cost instead of having speech delay the start of the next tick
	if(message)
		QUEUE_OR_CALL_VERB_FOR(VERB_CALLBACK(src, TYPE_PROC_REF(/atom/movable, say), message), SSspeech_controller)

// Overrides proc to use _char variants of findtext and copytext
/mob/check_for_custom_say_emote(message, list/mods)
	var/customsaypos = findtext_char(message, "*")
	if(!customsaypos)
		return message
	if (is_banned_from(ckey, "Emote"))
		return copytext(message, customsaypos + 1)
	mods[MODE_CUSTOM_SAY_EMOTE] = lowertext(copytext_char(message, 1, customsaypos))
	message = copytext_char(message, customsaypos + 1)
	if (!message)
		mods[MODE_CUSTOM_SAY_ERASE_INPUT] = TRUE
		message = "an interesting thing to say"
	return message

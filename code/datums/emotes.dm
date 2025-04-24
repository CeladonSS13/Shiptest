#define EMOTE_VISIBLE 1
#define EMOTE_AUDIBLE 2

/datum/emote
	var/key = "" //What calls the emote
	var/key_third_person = "" //This will also call the emote
	var/message = "" //Message displayed when emote is used
	var/message_mime = "" //Message displayed if the user is a mime
	var/message_alien = "" //Message displayed if the user is a grown alien
	var/message_larva = "" //Message displayed if the user is an alien larva
	var/message_robot = "" //Message displayed if the user is a robot
	var/message_AI = "" //Message displayed if the user is an AI
	var/message_monkey = "" //Message displayed if the user is a monkey
	var/message_ipc = "" // Message to display if the user is an IPC
	var/message_simple = "" //Message to display if the user is a simple_animal
	var/message_param = "" //Message to display if a param was given
	var/emote_type = EMOTE_VISIBLE //Whether the emote is visible or audible
	/// Checks if the mob can use its hands before performing the emote.
	var/hands_use_check = FALSE
	var/muzzle_ignore = FALSE //Will only work if the emote is EMOTE_AUDIBLE
	var/list/mob_type_allowed_typecache = /mob //Types that are allowed to use that emote
	var/list/mob_type_blacklist_typecache //Types that are NOT allowed to use that emote
	var/list/mob_type_ignore_stat_typecache
	var/stat_allowed = CONSCIOUS
	var/sound //Sound to play when emote is called
	var/vary = FALSE	//used for the honk borg emote
	var/only_forced_audio = FALSE //can only code call this event instead of the player.
	var/cooldown = 0.8 SECONDS
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")
	// [CELADON-ADD] - CELADON_EMOTES
	/// Message with %t at the end to allow adding params to the message, like for mobs doing an emote relatively to something else.
	/// Set this to EMOTE_PARAM_USE_POSTFIX to just use the postfix.
	/// Message postfix with %t used when we don't want to use message_param for our targeting. Used for things like message_monkey or message_mime.
	/// Punctuation from the message will be stripped when this is applied, so make sure it's punctuated as well.
	var/message_postfix = ""
	/// Sounds emitted when the user is muzzled. Generally used like "[user] makes a pick(muzzled_noises) noise!"
	var/muzzled_noises = list("strong", "weak")
	/// If true, an emote will completely bypass any cooldown when called unintentionally. Necessary for things like deathgasp.
	var/bypass_unintentional_cooldown = FALSE
	/// Whether or not to adjust the frequency of the emote sound based on age.
	var/age_based = FALSE
	/// How loud is the audio emote?
	var/volume = 50
	// [/CELADON-ADD]

/datum/emote/New()
	if (ispath(mob_type_allowed_typecache))
		switch (mob_type_allowed_typecache)
			if (/mob)
				mob_type_allowed_typecache = GLOB.typecache_mob
			if (/mob/living)
				mob_type_allowed_typecache = GLOB.typecache_living
			else
				mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	else
		mob_type_allowed_typecache = typecacheof(mob_type_allowed_typecache)
	mob_type_blacklist_typecache = typecacheof(mob_type_blacklist_typecache)
	mob_type_ignore_stat_typecache = typecacheof(mob_type_ignore_stat_typecache)

/datum/emote/proc/run_emote(mob/user, params, type_override, intentional = FALSE)
	. = TRUE
	if(!can_run_emote(user, TRUE, intentional))
		return FALSE
	var/msg = select_message_type(user, intentional)
	if(params && message_param)
		// [CELADON-EDIT] - CELADON_EMOTES
		// msg = select_param(user, params)	// CELADON-EDIT - ORIGINAL
		// In this case, we did make some changes to the message that will be used, and we want to add the postfix on with the new parameters.
		// This is applicable to things like mimes, who this lets have a target on their canned emote responses.
		// Note that we only do this if we would otherwise have a message param, meaning there should be some target by default.
		// If we're using EMOTE_PARAM_USE_POSTFIX, we don't want to bother specifying a message_param and just want to use the postfix for everything.
		if(message_param == EMOTE_PARAM_USE_POSTFIX || (msg != message && message_postfix))
			if(!message_postfix)
				CRASH("Emote was specified to use postfix but message_postfix is empty.")
			msg = select_param(user, params, "[remove_ending_punctuation(msg)] [message_postfix]", msg)
		else if(msg == message)
			// In this case, we're not making any substitutions in select_message_type, but we do have some params we want to sub in.
			msg = select_param(user, params, message_param, message)

		// If this got propogated up, jump out.
		if(msg == EMOTE_ACT_STOP_EXECUTION)
			return TRUE

		if(isnull(msg))
			to_chat(user, "<span class='warning'>'[params]' isn't a valid parameter for [key].</span>")
			return TRUE
		// [/CELADON-EDIT]
	msg = replace_pronoun(user, msg)

	// [CELADON-ADD] - CELADON_EMOTES
	var/suppressed = FALSE

	// Keep em quiet if they can't speak
	if(!can_vocalize_emotes(user) && (emote_type & (EMOTE_MOUTH | EMOTE_AUDIBLE)))
		var/noise_emitted = pick(muzzled_noises)
		suppressed = TRUE
		msg = "издаёт [noise_emitted] звук."
	// [/CELADON-ADD]

	if(isliving(user))
		var/mob/living/L = user
		for(var/obj/item/implant/I in L.implants)
			I.trigger(key, L)

	if(!msg)
		return

	user.log_message(msg, LOG_EMOTE)
	var/space = should_have_space_before_emote(html_encode(msg)[1]) ? " " : ""
	var/dchatmsg = "<b>[user]</b>[space][msg]"

	// [CELADON-ADD] - CELADON_EMOTES
	var/sound_volume = get_volume(user)
	// [/CELADON-ADD]
	var/tmp_sound = get_sound(user)
	if(tmp_sound && (!only_forced_audio || !intentional))
		// [CELADON-EDIT] - CELADON_EMOTES
		// playsound(user, tmp_sound, 50, vary)	// CELADON-EDIT - ORIGINAL
		playsound(user, tmp_sound, sound_volume, vary)
		// [/CELADON-EDIT]

	for(var/mob/M in GLOB.dead_mob_list)
		if(!M.client || isnewplayer(M))
			continue
		var/T = get_turf(user)
		if(M.stat == DEAD && M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(T, null)))
			M.show_message("[FOLLOW_LINK(M, user)] [dchatmsg]")

	// [CELADON-ADD] - CELADON_EMOTES
	if(isliving(user))
	// [/CELADON-EDIT]
		if(emote_type == EMOTE_AUDIBLE)	// Да, это определённо слегка забавно.
			user.audible_message(msg, deaf_message = span_emote("Ты видишь как <b>[user]</b> [msg]"), audible_message_flags = EMOTE_MESSAGE)
		else
			user.visible_message(msg, blind_message = span_emote("Ты замечаешь как <b>[user]</b> [msg]"), visible_message_flags = EMOTE_MESSAGE)
	// [CELADON-ADD] - CELADON_EMOTES
	if(!((emote_type & EMOTE_FORCE_NO_RUNECHAT) || suppressed) && !isobserver(user))
		to_chat(user, msg)
	// [/CELADON-ADD]

/// For handling emote cooldown, return true to allow the emote to happen
/datum/emote/proc/check_cooldown(mob/user, intentional)
	if(!intentional)
		return TRUE
	if(user.emotes_used && user.emotes_used[src] && user.emotes_used[src] + cooldown > world.time)
		return FALSE
	if(!user.emotes_used)
		user.emotes_used = list()
	user.emotes_used[src] = world.time
	return TRUE

/datum/emote/proc/get_sound(mob/living/user)
	return sound //by default just return this var.

/datum/emote/proc/replace_pronoun(mob/user, message)
	if(findtext(message, "their"))
		message = replacetext(message, "their", user.p_their())
	if(findtext(message, "them"))
		message = replacetext(message, "them", user.p_them())
	if(findtext(message, "%s"))
		message = replacetext(message, "%s", user.p_s())
	return message

/datum/emote/proc/select_message_type(mob/user, intentional)
	. = message
	if(!muzzle_ignore && user.is_muzzled() && emote_type == EMOTE_AUDIBLE)
		return "makes a [pick("strong ", "weak ", "")]noise."
	if(user.mind && user.mind.miming && message_mime)
		. = message_mime
	if(isalienadult(user) && message_alien)
		. = message_alien
	else if(islarva(user) && message_larva)
		. = message_larva
	else if(iscyborg(user) && message_robot)
		. = message_robot
	else if(isAI(user) && message_AI)
		. = message_AI
	else if(ismonkey(user) && message_monkey)
		. = message_monkey
	else if(isipc(user) && message_ipc)
		. = message_ipc
	else if(isanimal(user) && message_simple)
		. = message_simple

/datum/emote/proc/select_param(mob/user, params)
	return replacetext(message_param, "%t", params)

/datum/emote/proc/can_run_emote(mob/user, status_check = TRUE, intentional = FALSE)
	. = TRUE
	if(!is_type_in_typecache(user, mob_type_allowed_typecache))
		return FALSE
	if(is_type_in_typecache(user, mob_type_blacklist_typecache))
		return FALSE
	if(status_check && !is_type_in_typecache(user, mob_type_ignore_stat_typecache))
		if(user.stat > stat_allowed)
			if(!intentional)
				return FALSE
			switch(user.stat)
				if(SOFT_CRIT)
					to_chat(user, span_warning("You cannot [key] while in a critical condition!"))
				if(UNCONSCIOUS, HARD_CRIT)
					to_chat(user, span_warning("You cannot [key] while unconscious!"))
				if(DEAD)
					to_chat(user, span_warning("You cannot [key] while dead!"))
			return FALSE
		if(hands_use_check && HAS_TRAIT(user, TRAIT_HANDS_BLOCKED))
			if(!intentional)
				return FALSE
			to_chat(user, span_warning("You cannot use your hands to [key] right now!"))
			return FALSE

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_EMOTEMUTE))
			return FALSE
/**
* Allows the intrepid coder to send a basic emote
* Takes text as input, sends it out to those who need to know after some light parsing
* If you need something more complex, make it into a datum emote
* Arguments:
* * text - The text to send out
*/
/mob/proc/manual_emote(text) //Just override the song and dance
	. = TRUE
	if(findtext(text, "their"))
		text = replacetext(text, "their", p_their())
	if(findtext(text, "them"))
		text = replacetext(text, "them", p_them())
	if(findtext(text, "%s"))
		text = replacetext(text, "%s", p_s())

	if(stat != CONSCIOUS)
		return

	if(!text)
		CRASH("Someone passed nothing to manual_emote(), fix it")

	log_message(text, LOG_EMOTE)
	text = "<b>[src]</b> " + text

	for(var/mob/M in GLOB.dead_mob_list)
		if(!M.client || isnewplayer(M))
			continue
		var/T = get_turf(src)
		if(M.stat == DEAD && M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(T, null)))
			M.show_message(text)

	visible_message(text)

/**
 * Returns a boolean based on whether or not the string contains a comma or an apostrophe,
 * to be used for emotes to decide whether or not to have a space between the name of the user
 * and the emote.
 *
 * Requires the message to be HTML decoded beforehand. Not doing it here for performance reasons.
 *
 * Returns TRUE if there should be a space, FALSE if there shouldn't.
 */
/proc/should_have_space_before_emote(string)
	var/static/regex/no_spacing_emote_characters = regex(@"(,|')")
	return no_spacing_emote_characters.Find(string) ? FALSE : TRUE

// [CELADON-ADD] - CELADON_EMOTES
/**
 * Play the sound effect in an emote.
 * If you want to change the way the playsound call works, override this.
 * Note! If you want age_based to work, you need to force vary to TRUE.
 * * user - The user of the emote.
 * * intentional - Whether or not the emote was triggered intentionally.
 * * sound_path - Filesystem path to the audio clip to play.
 * * sound_volume - Volume at which to play the audio clip.
 */
/datum/emote/proc/play_sound_effect(mob/user, intentional, sound_path, sound_volume)
	if(age_based && ishuman(user))
		var/mob/living/carbon/human/H = user
		// Vary needs to be true as otherwise frequency changes get ignored deep within playsound_local :(
		playsound(user.loc, sound_path, sound_volume, TRUE, frequency = H.get_age_pitch(H.dna.species.species_age_max) * alter_emote_pitch(user))
	else
		playsound(user.loc, sound_path, sound_volume, TRUE, frequency = alter_emote_pitch(user, FALSE))

/datum/emote/proc/alter_emote_pitch(mob/user, multiplicative = TRUE)
	if(HAS_TRAIT(user, TRAIT_ALCOHOL_TOLERANCE))
		return 0.7
	return multiplicative

/datum/emote/proc/get_volume(mob/living/user)
	return volume

/**
 * Return whether a user should be able to vocalize emotes or not, due to a mask or inability to speak.
 * If this returns false, any mouth emotes will be replaced with muzzled noises.
 */
/datum/emote/proc/can_vocalize_emotes(mob/user)
	if(user.mind?.miming)
		// mimes get special treatment; though they can't really "vocalize" we don't want to replace their message.
		return TRUE
	if(!muzzle_ignore && !user.can_speak())
		return FALSE

	return TRUE

/datum/emote/proc/remove_ending_punctuation(msg)
	var/static/list/end_punctuation = list(".", "?", "!")
	if(copytext(msg, -1) in end_punctuation)
		msg = copytext(msg, 1, -1)
	return msg
// [/CELADON-ADD]

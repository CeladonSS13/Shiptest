/client/verb/mentorhelp(msg as text)
	set category = "Mentor"	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	set name = "Mentorhelp"	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом

	if(GLOB.say_disabled)	//This is here to try to identify lag problems	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		to_chat(usr, span_danger("Speech is currently admin-disabled."), confidential = TRUE)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		return
	//handle muting and automuting
	if(prefs.muted & MUTE_MENTORHELP)
		to_chat(src, span_danger("Error: Mentor-PM: You cannot send mentorhelps (Muted)."), confidential = TRUE)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		return	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	if(handle_spam_prevention(msg,MUTE_MENTORHELP))	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		return

	msg = trim(msg)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом

	if(!msg)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		return

	if(current_mticket)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		if(alert(usr, "You already have a ticket open. Is this for the same issue?","Mentorhelp","Yes","No") != "No")
			if(current_mticket)
				current_mticket.message_no_recipient(msg)
				current_mticket.timeout_verb()
				return
			else
				to_chat(usr, span_warning("Ticket not found, creating new one..."), confidential = TRUE)
		else
			current_mticket.add_interaction("[key_name_mentor(usr)] opened a new ticket.")
			current_mticket.close()

	new /datum/mentor_help(msg, src)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом

/proc/get_mentor_counts()
	. = list("total" = 0, "afk" = 0, "present" = 0)
	for(var/client/X in GLOB.mentors)
		.["total"]++
		if(X.is_afk())
			.["afk"]++
		else
			.["present"]++

/proc/key_name_mentor(whom, include_link = null, include_name = 0, char_name_only = 0)
	var/mob/M
	var/client/C
	var/key
	var/ckey

	if(!whom)	return "*null*"
	if(istype(whom, /client))
		C = whom
		M = C.mob
		key = C.key
		ckey = C.ckey
	else if(ismob(whom))
		M = whom
		C = M.client
		key = M.key
		ckey = M.ckey
	else if(istext(whom))
		key = whom
		ckey = ckey(whom)
		C = GLOB.directory[ckey]
		if(C)
			M = C.mob
	else
		return "*invalid*"

	. = ""

	if(!ckey)
		include_link = 0

	if(key)
		if(include_link)
			if(CONFIG_GET(flag/mentors_mobname_only))
				. += "<a href='byond://?mentor_msg=[REF(M)]'>"
			else
				. += "<a href='byond://?mentor_msg=[ckey]'>"

		if(C && C.holder && C.holder.fakekey)
			. += "Administrator"
		else if (char_name_only && CONFIG_GET(flag/mentors_mobname_only))
			if(istype(C.mob,/mob/dead/new_player) || istype(C.mob, /mob/dead/observer)) //If they're in the lobby or observing, display their ckey
				. += key
			else if(C && C.mob) //If they're playing/in the round, only show the mob name
				. += C.mob.name
			else //If for some reason neither of those are applicable and they're mentorhelping, show ckey
				. += key
		else
			. += key
		if(!C)
			. += "\[DC\]"

		if(include_link)
			. += "</a>"
	else
		. += "*no key*"

	return .

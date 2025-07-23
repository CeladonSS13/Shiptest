//shows a list of clients we could send PMs to, then forwards our choice to cmd_Mentor_pm
/client/proc/cmd_mentor_pm_panel(msg as text)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	set category = "Mentor"	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	set name = "Mentor PM"	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	if(!check_mentor())
		to_chat(src, span_warning("Error: Mentor-PM-Panel: Only Mentors may use this command."))
		return
	var/list/client/targets[0]
	for(var/client/T)
		if(T.mob)
			if(isnewplayer(T.mob))
				targets["(New Player) - [T]"] = T
			else if(isobserver(T.mob))
				targets["[T.mob.name](Ghost) - [T]"] = T
			else
				targets["[T.mob.real_name](as [T.mob.name]) - [T]"] = T
		else
			targets["(No Mob) - [T]"] = T
	var/target = input(src,"To whom shall we send a message?","Mentor PM",null) as null|anything in sortList(targets)
	cmd_mentor_pm(targets[target],null)
	SSblackbox.record_feedback("tally", "mentor_verb", 1, "Mentor PM")

	msg = emoji_parse(copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN))	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	mob.log_talk(msg, LOG_MSAY)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	mob.log_talk(msg, LOG_MENTOR)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом

//takes input from cmd_mentor_pm_context, cmd_Mentor_pm_panel or /client/Topic and sends them a PM.
//Fetching a message if needed. src is the sender and C is the target client
/client/proc/cmd_mentor_pm(whom, msg)
	var/client/C
	if(ismob(whom))
		var/mob/M = whom
		C = M.client
	else if(istext(whom))
		C = GLOB.directory[whom]
	else if(istype(whom,/client))
		C = whom
	if(!C)
		if(check_mentor())
			to_chat(src, span_warning("Error: Mentor-PM: Client not found."))
		else
			mentorhelp(msg)	//Mentor we are replying to left. Mentorhelp instead
		return

	// Создаем или используем существующий тикет
	if(C.current_mticket && C.current_mticket.initiator == C)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		var/datum/mentor_help/MH = C.current_mticket
		if(check_mentor())
			if(!MH.claimed_by)
				MH.claim(key_name_mentor(src))
			else if(MH.claimed_by != usr.key)
				if(alert("Ticket уже взят [MH.claimed_by]. Перехватить?", "Mentorhelp", "Да", "Нет") != "Да")
					return
				MH.claim(key_name_mentor(src))
		MH.add_interaction("[key_name_mentor(src)] ответил [key_name_mentor(C)]: [msg]")

	to_chat(GLOB.admins | GLOB.mentors, "<font color='notice'>[src] has started replying to [whom]'s mhelp.</font>")

	//get message text, limit its length.and clean/escape html
	if(!msg)
		msg = input(src,"Message:", "Private message") as text|null

		if(!msg)
			to_chat(GLOB.admins | GLOB.mentors, span_notice("[src] has stopped their reply to [whom]'s mhelp."))
			return

		if(!C)
			if(holder)
				to_chat(src, span_warning("Error: Mentor-PM: Client not found."))
			else
				mentorhelp(msg)	//Mentor we are replying to has vanished, Mentorhelp instead
			return

	msg = sanitize(copytext(msg,1,MAX_MESSAGE_LEN))
	if(!msg)
		return

	log_mentor("Mentor PM: [key_name(src)]->[key_name(C)]: [msg]")

	msg = emoji_parse(msg)
	C << 'sound/items/bikehorn.ogg'
	var/show_char = CONFIG_GET(flag/mentors_mobname_only)
	if(check_mentor_other(C))
		if(check_mentor())	//both are mentors
			to_chat(C, span_notice("Mentor PM from-<b>[key_name_mentor(src, C, 1, 0)]</b>: [msg]"))
			to_chat(src, span_green("Mentor PM to-<b>[key_name_mentor(C, C, 1, 0)]</b>: [msg]"))

		else		//recipient is an mentor but sender is not
			to_chat(C, span_notice("Reply PM from-<b>[key_name_mentor(src, C, 1, show_char)]</b>: [msg]"))
			to_chat(src, span_green("Mentor PM to-<b>[key_name_mentor(C, C, 1, 0, 0)]</b>: [msg]"))

	else
		if(check_mentor())	//sender is an mentor but recipient is not.
			to_chat(C, span_notice("Mentor PM from-<b>[key_name_mentor(src, C, 1, 0)]</b>: [msg]"))
			to_chat(src, span_green("Mentor PM to-<b>[key_name_mentor(C, C, 1, show_char)]</b>: [msg]"))

	//we don't use message_Mentors here because the sender/receiver might get it too
	for(var/client/X in GLOB.mentors)
		if(X.key!=key && X.key!=C.key)	//check client/X is an Mentor and isn't the sender or recipient
			to_chat(X, span_mentornotice("<B>Mentor PM: [key_name(src, X, 0)]-&gt;[key_name(C, X, 0)]:</B> [msg]")) //inform X

	// Обновляем тикет, если он существует
	if(C.current_mticket && C.current_mticket.initiator == C)	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
		var/datum/mentor_help/MH = C.current_mticket
		MH.add_interaction("[key_name_mentor(src)] to [key_name_mentor(C)]: [msg]")
		if(check_mentor())
			MH.claim(key_name_mentor(src))

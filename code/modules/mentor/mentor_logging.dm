// Функция для логирования ментор тикетов
/proc/log_mhelp(text)
	GLOB.mentorlog.Add(text)
	// Всегда логируем ментор тикеты, независимо от настроек
	var/log_file = GLOB.world_mentor_log || "data/logs/mentor.log"
	WRITE_FILE(log_file, "MHELP: [text]\n")
	// Также логируем в основной лог игры с идентификатором MENTORPRIVATE
	WRITE_LOG(GLOB.world_game_log, "MENTORPRIVATE: [text]")


	GLOB.mentorlog.Add(text)
	if (CONFIG_GET(flag/log_mentor))
		WRITE_FILE(GLOB.world_mentor_log, "MENTOR: [text]")


// Функция для логирования ментор тикетов
/proc/mentor_ticket_log(what, message)
	var/client/C
	var/mob/Mob = what
	if(istype(Mob))
		C = Mob.client
	else
		C = what
	if(istype(C) && C.current_mticket)
		C.current_mticket.add_interaction(message)
		return C.current_mticket
	if(istext(what))	//ckey
		var/datum/mentor_help/MH = GLOB.mhelp_tickets.ckey2active_ticket(what)
		if(MH)
			MH.add_interaction(message)
			return MH

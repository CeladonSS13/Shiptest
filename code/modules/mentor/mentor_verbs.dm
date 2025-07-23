GLOBAL_LIST_INIT(mentor_verbs, list(
	/client/proc/cmd_mentor_pm_panel,
	/client/proc/show_mentor_memo,
	/client/proc/cmd_mentor_say,
	/client/proc/cmd_mentor_dementor,
	/client/proc/mentor_ticket_panel,	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	))
GLOBAL_PROTECT(mentor_verbs)

/client/proc/add_mentor_verbs()
	if(check_mentor())
		add_verb(src, GLOB.mentor_verbs)

/client/proc/remove_mentor_verbs()
	remove_verb(src, GLOB.mentor_verbs)

/client/proc/mentor_ticket_panel()	// [CELADON] - CELADON_MENTOR_TICKET - вынести в модуль потом
	set category = "Mentor"
	set name = "Mentor Ticket Panel"
	if(!check_mentor())
		to_chat(src, span_warning("Error: Only mentors may use this command."))
		return
	GLOB.mhelp_tickets.browse_tickets(MHELP_ACTIVE)

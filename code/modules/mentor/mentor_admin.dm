/datum/admins/proc/mentor_tickets()
	set category = "Admin"
	set name = "Mentor Tickets"
	set desc = "View and manage mentor tickets"

	if(!check_rights(R_ADMIN))
		return

	var/list/dat = list("<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Mentor Ticket Panel</title></head>")
	dat += "<a href='byond://?_src_=holder;[HrefToken()];mhelp_tickets=1'>Refresh</a><br><br>"
	dat += "<A href='byond://?_src_=holder;[HrefToken()];mhelp_tickets=[MHELP_ACTIVE]'>Active Tickets</A><br>"
	dat += "<A href='byond://?_src_=holder;[HrefToken()];mhelp_tickets=[MHELP_CLOSED]'>Closed Tickets</A><br>"
	dat += "<A href='byond://?_src_=holder;[HrefToken()];mhelp_tickets=[MHELP_RESOLVED]'>Resolved Tickets</A><br><br>"

	usr << browse(dat.Join(), "window=mhelp_tickets;size=400x300")

/datum/admins/Topic(href, href_list)
	..()
	if(href_list["mhelp_tickets"])
		if(!check_rights(R_ADMIN))
			return
		var/state = text2num(href_list["mhelp_tickets"])
		if(isnull(state))
			state = MHELP_ACTIVE
		GLOB.mhelp_tickets.browse_tickets(state)

	else if(href_list["mhelp"])
		if(!check_rights(R_ADMIN))
			return
		var/datum/mentor_help/MH = locate(href_list["mhelp"]) in GLOB.mhelp_tickets.active_tickets
		if(!MH)
			to_chat(usr, span_warning("Mentor ticket not found!"), confidential = TRUE)
			return
		switch(href_list["mhelp_action"])
			if("ticket")
				MH.ticket_panel()
			if("claim")
				MH.claim()
			if("close")
				MH.close()
			if("resolve")
				MH.resolve()
			if("reopen")
				MH.reopen()
			if("reply")
				usr.client.cmd_mentor_pm(MH.initiator)

// Добавляем статистику тикетов в админ-панель
/datum/admin_help_tickets/proc/stat_entry_mentors()
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	var/list/L = list()
	L[++L.len] = list("Mentor Tickets:", null, null, null)
	L[++L.len] = list("Active:", "[GLOB.mhelp_tickets.active_tickets.len]", null, null)
	L[++L.len] = list("Closed:", "[GLOB.mhelp_tickets.closed_tickets.len]", null, null)
	L[++L.len] = list("Resolved:", "[GLOB.mhelp_tickets.resolved_tickets.len]", null, null)
	return L

// Хук для добавления статистики менторских тикетов в админ-панель
/datum/admin_help_tickets/stat_entry()
	. = ..()
	. += stat_entry_mentors()
/client/var/mentorhelptimerid = 0	//a timer id for returning the mhelp verb
/client/var/datum/mentor_help/current_mticket	//the current ticket the (usually) not-mentor client is dealing with

//
//TICKET MANAGER
//

GLOBAL_DATUM_INIT(mhelp_tickets, /datum/mentor_help_tickets, new)

/datum/mentor_help_tickets
	var/list/active_tickets = list()
	var/list/closed_tickets = list()
	var/list/resolved_tickets = list()

	var/obj/effect/statclick/mentor_ticket_list/mstatclick = new(null, null, MHELP_ACTIVE)
	var/obj/effect/statclick/mentor_ticket_list/mcstatclick = new(null, null, MHELP_CLOSED)
	var/obj/effect/statclick/mentor_ticket_list/mrstatclick = new(null, null, MHELP_RESOLVED)

/datum/mentor_help_tickets/Destroy()
	QDEL_LIST(active_tickets)
	QDEL_LIST(closed_tickets)
	QDEL_LIST(resolved_tickets)
	QDEL_NULL(mstatclick)
	QDEL_NULL(mcstatclick)
	QDEL_NULL(mrstatclick)
	return ..()

/datum/mentor_help_tickets/proc/ticket_by_id(id)
	var/list/lists = list(active_tickets, closed_tickets, resolved_tickets)
	for(var/I in lists)
		for(var/J in I)
			var/datum/mentor_help/MH = J
			if(MH.id == id)
				return J

/datum/mentor_help_tickets/proc/tickets_by_ckey(ckey)
	. = list()
	var/list/lists = list(active_tickets, closed_tickets, resolved_tickets)
	for(var/I in lists)
		for(var/J in I)
			var/datum/mentor_help/MH = J
			if(MH.initiator_ckey == ckey)
				. += MH

//private
/datum/mentor_help_tickets/proc/list_insert(datum/mentor_help/new_ticket)
	var/list/ticket_list
	switch(new_ticket.state)
		if(MHELP_ACTIVE)
			ticket_list = active_tickets
		if(MHELP_CLOSED)
			ticket_list = closed_tickets
		if(MHELP_RESOLVED)
			ticket_list = resolved_tickets
		else
			CRASH("Invalid ticket state: [new_ticket.state]")
	var/num_closed = ticket_list.len
	if(num_closed)
		for(var/I in 1 to num_closed)
			var/datum/mentor_help/MH = ticket_list[I]
			if(MH.id > new_ticket.id)
				ticket_list.Insert(I, new_ticket)
				return
	ticket_list += new_ticket

//opens the ticket listings for one of the 3 states
/datum/mentor_help_tickets/proc/browse_tickets(state)
	var/list/l2b
	var/title
	switch(state)
		if(MHELP_ACTIVE)
			l2b = active_tickets
			title = "Active Mentor Tickets"
		if(MHELP_CLOSED)
			l2b = closed_tickets
			title = "Closed Mentor Tickets"
		if(MHELP_RESOLVED)
			l2b = resolved_tickets
			title = "Resolved Mentor Tickets"
	if(!l2b)
		return
	var/list/dat = list("<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>[title]</title></head>")
	dat += "<A href='byond://?_src_=holder;[HrefToken()];mhelp_tickets=[state]'>Refresh</A><br><br>"
	for(var/I in l2b)
		var/datum/mentor_help/MH = I
		dat += "[span_adminnotice("<span class='mentorhelp'>Ticket #[MH.id]")]: <A href='byond://?_src_=holder;[HrefToken()];mhelp=[REF(MH)];mhelp_action=ticket'>[MH.initiator_key_name]: [MH.name]</A></span><br>"

	usr << browse(dat.Join(), "window=mhelp_list[state];size=600x480")

//Tickets statpanel
/datum/mentor_help_tickets/proc/stat_entry()
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	var/list/L = list()
	var/num_disconnected = 0
	L[++L.len] = list("Active Mentor Tickets:", "[mstatclick.update("[length(active_tickets)]")]", null, REF(mstatclick))
	mstatclick.update("[length(active_tickets)]")
	for(var/I in active_tickets)
		var/datum/mentor_help/MH = I
		if(MH.initiator)
			L[++L.len] = list("#[MH.id]. [MH.initiator_key_name] (Claimed by [MH.claimed_by || "nobody"]):", "[MH.statclick.update()]", REF(MH))
		else
			++num_disconnected

	if(num_disconnected)
		L[++L.len] = list("Disconnected:", "[mstatclick.update("[num_disconnected]")]", null, REF(mstatclick))
	L[++L.len] = list("Closed Mentor Tickets:", "[mcstatclick.update("[length(closed_tickets)]")]", null, REF(mcstatclick))
	L[++L.len] = list("Resolved Mentor Tickets:", "[mrstatclick.update("[length(resolved_tickets)]")]", null, REF(mrstatclick))
	return L

//Reassociate still open ticket if one exists
/datum/mentor_help_tickets/proc/client_login(client/C)
	C.current_mticket = ckey2active_ticket(C.ckey)
	if(C.current_mticket)
		C.current_mticket.initiator = C
		C.current_mticket.add_interaction("Client reconnected.")

//Dissasociate ticket
/datum/mentor_help_tickets/proc/client_logout(client/C)
	if(C.current_mticket)
		var/datum/mentor_help/T = C.current_mticket
		T.add_interaction("Client disconnected.")
		T.initiator = null

//Get a ticket given a ckey
/datum/mentor_help_tickets/proc/ckey2active_ticket(ckey)
	for(var/I in active_tickets)
		var/datum/mentor_help/MH = I
		if(MH.initiator_ckey == ckey)
			return MH

//
//TICKET LIST STATCLICK
//

/obj/effect/statclick/mentor_ticket_list
	var/current_state

/obj/effect/statclick/mentor_ticket_list/New(loc, name, state)
	current_state = state
	..()

/obj/effect/statclick/mentor_ticket_list/Click()
	GLOB.mhelp_tickets.browse_tickets(current_state)

//called by admin topic
/obj/effect/statclick/mentor_ticket_list/proc/MentorAction()
	Click()

//
//TICKET DATUM
//

/datum/mentor_help
	var/id
	var/name
	var/state = MHELP_ACTIVE

	var/opened_at
	var/closed_at

	var/client/initiator	//semi-misnomer, it's the person who ahelped/was bwoinked
	var/initiator_ckey
	var/initiator_key_name
	var/claimed_by

	var/list/_interactions	//use add_interaction() or, preferably, mentor_ticket_log()

	var/obj/effect/statclick/mhelp/statclick

	var/static/ticket_counter = 0

//call this on its own to create a ticket, don't manually assign current_ticket
//msg is the title of the ticket: usually the mhelp text
/datum/mentor_help/New(msg, client/C)
	//clean the input msg
	msg = sanitize(copytext_char(msg, 1, MAX_MESSAGE_LEN))
	if(!msg || !C || !C.mob)
		qdel(src)
		return

	id = ++ticket_counter
	opened_at = world.time

	name = copytext_char(msg, 1, 100)

	initiator = C
	initiator_ckey = initiator.ckey
	initiator_key_name = key_name_mentor(initiator, FALSE, TRUE)
	if(initiator.current_mticket)	//This is a bug
		stack_trace("Multiple mhelp current_tickets")
		initiator.current_mticket.add_interaction("Ticket erroneously left open by code")
		initiator.current_mticket.close()
	initiator.current_mticket = src

	timeout_verb()

	statclick = new(null, src)
	_interactions = list()

	message_no_recipient(msg)

	GLOB.mhelp_tickets.active_tickets += src

/datum/mentor_help/Destroy()
	remove_active()
	QDEL_NULL(statclick)
	GLOB.mhelp_tickets.closed_tickets -= src
	GLOB.mhelp_tickets.resolved_tickets -= src
	return ..()

/datum/mentor_help/proc/add_interaction(formatted_message)
	_interactions += "[time_stamp()]: [formatted_message]"

//Removes the mhelp verb and returns it after 2 minutes
/datum/mentor_help/proc/timeout_verb()
	remove_verb(initiator, /client/verb/mentorhelp)
	initiator.mentorhelptimerid = addtimer(CALLBACK(initiator, TYPE_PROC_REF(/client, givementorhelp)), 1200, TIMER_STOPPABLE) //2 minute cooldown of mentor helps

//private
/datum/mentor_help/proc/ticket_actions(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	. = " <br>"
	. += " ([ticket_href("CLOSE", ref_src, "close")])"
	. += " ([ticket_href("RSLVE", ref_src, "resolve")])"
	. += " ([ticket_href("CLAIM", ref_src, "claim")])"

//private
/datum/mentor_help/proc/linked_reply_name(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	return "<A href='byond://?_src_=holder;[HrefToken(TRUE)];mhelp=[ref_src];mhelp_action=reply'>[initiator_key_name]</A>"

//private
/datum/mentor_help/proc/ticket_href(msg, ref_src, action = "ticket")
	if(!ref_src)
		ref_src = "[REF(src)]"
	return "<A href='byond://?_src_=holder;[HrefToken(TRUE)];mhelp=[ref_src];mhelp_action=[action]'>[msg]</A>"

//message from the initiator without a target, all mentors will see this
/datum/mentor_help/proc/message_no_recipient(msg)
	var/ref_src = "[REF(src)]"
	//Message to be sent to all mentors
	var/mentor_msg = span_mentornotice("[span_mentorhelp("Ticket [ticket_href("#[id]", ref_src)]")]<b>: [linked_reply_name(ref_src)]:</b> [span_linkify("[msg]")]")

	add_interaction("<font color='red'>[linked_reply_name(ref_src)]: [msg]</font>")
	log_mhelp("Ticket #[id]: [key_name(initiator)]: [msg]")

	//send this msg to all mentors
	for(var/client/X in GLOB.mentors)
		SEND_SOUND(X, sound('sound/items/bikehorn.ogg'))
		to_chat(X, mentor_msg)

	//show it to the person mentorhelping too
	to_chat(initiator, span_mentornotice("PM to-<b>Mentors</b>: [span_linkify("[msg]")]"))

//Reopen a closed ticket
/datum/mentor_help/proc/reopen()
	if(state == MHELP_ACTIVE)
		to_chat(usr, span_warning("This ticket is already open."), confidential = TRUE)
		return

	if(GLOB.mhelp_tickets.ckey2active_ticket(initiator_ckey))
		to_chat(usr, span_warning("This user already has an active ticket, cannot reopen this one."), confidential = TRUE)
		return

	GLOB.mhelp_tickets.active_tickets += src
	GLOB.mhelp_tickets.closed_tickets -= src
	GLOB.mhelp_tickets.resolved_tickets -= src
	state = MHELP_ACTIVE
	closed_at = null
	if(initiator)
		initiator.current_mticket = src

	add_interaction("<font color='purple'>Reopened by [key_name_mentor(usr)]</font>")
	var/msg = span_mentorhelp("Ticket [ticket_href("#[id]")] reopened by [key_name_mentor(usr)].")
	message_mentors(msg)
	log_mhelp(msg)
	ticket_panel()	//can only be done from here, so refresh it

//private
/datum/mentor_help/proc/remove_active()
	if(state != MHELP_ACTIVE)
		stack_trace("Attempt to remove non-active ticket")
		return
	closed_at = world.time
	GLOB.mhelp_tickets.active_tickets -= src
	if(initiator && initiator.current_mticket == src)
		initiator.current_mticket = null

/datum/mentor_help/proc/claim(key_name = key_name_mentor(usr))
	if(state != MHELP_ACTIVE)
		return FALSE
	if(claimed_by && claimed_by != usr.key && alert(usr, "Ticket #[id] already claimed by [claimed_by]. Override?", "Mentorhelp", "Yes", "No") != "Yes")
		return FALSE
	if(claimed_by == usr.key)
		return TRUE
	add_interaction(span_grey("Claimed by [key_name]."))
	to_chat(initiator, span_mentorhelp("Your ticket has been claimed by a mentor. Expect a response shortly."), confidential = TRUE)
	claimed_by = usr.key
	var/msg = "Ticket [ticket_href("#[id]")] claimed by [key_name]."
	message_mentors(msg)
	log_mhelp(msg)
	return TRUE

/datum/mentor_help/proc/unclaim(key_name = key_name_mentor(usr))
	if(state != MHELP_ACTIVE)
		return
	if(claimed_by != usr.key)
		return
	add_interaction(span_grey("Unclaimed by [key_name]."))
	claimed_by = null
	var/msg = "Ticket [ticket_href("#[id]")] unclaimed by [key_name]."
	message_mentors(msg)
	log_mhelp(msg)

//Mark open ticket as closed/meme
/datum/mentor_help/proc/close(key_name = key_name_mentor(usr), silent = FALSE)
	if(state != MHELP_ACTIVE)
		return
	remove_active()
	state = MHELP_CLOSED
	GLOB.mhelp_tickets.list_insert(src)
	add_interaction("<font color='red'>Closed by [key_name].</font>")
	if(!silent)
		var/msg = "Ticket [ticket_href("#[id]")] closed by [key_name]."
		message_mentors(msg)
		log_mhelp(msg)

//Mark open ticket as resolved/legitimate, returns mhelp verb
/datum/mentor_help/proc/resolve(key_name = key_name_mentor(usr), silent = FALSE)
	if(state != MHELP_ACTIVE)
		return
	remove_active()
	state = MHELP_RESOLVED
	GLOB.mhelp_tickets.list_insert(src)

	addtimer(CALLBACK(initiator, TYPE_PROC_REF(/client, givementorhelp)), 50)

	add_interaction("<font color='green'>Resolved by [key_name].</font>")
	to_chat(initiator, span_mentorhelp("Your ticket has been resolved by a mentor. The Mentorhelp verb will be returned to you shortly."), confidential = TRUE)
	if(!silent)
		var/msg = "Ticket [ticket_href("#[id]")] resolved by [key_name]"
		message_mentors(msg)
		log_mhelp(msg)

//Show the ticket panel
/datum/mentor_help/proc/ticket_panel()
	var/list/dat = list()
	var/ref_src = "[REF(src)]"
	dat += "<h4>Mentor Help Ticket #[id]: [linked_reply_name(ref_src)] (Claimed by [claimed_by || "nobody"])</h4>"
	dat += "<b>Статус: "
	if(state == MHELP_ACTIVE)
		dat += "<font color='red'>ОТКРЫТО</font>"
	else if(state == MHELP_RESOLVED)
		dat += "<font color='green'>РЕШЕНО</font>"
	else if(state == MHELP_CLOSED)
		dat += "<font color='blue'>ЗАКРЫТО</font>"
	else
		dat += "НЕИЗВЕСТНО"
	dat += "</b>[FOURSPACES][ticket_href("Refresh", ref_src)]"
	if(state != MHELP_ACTIVE)
		dat += "[FOURSPACES][ticket_href("Reopen", ref_src, "reopen")]"
	dat += "<br><br>Opened at: [game_timestamp(wtime = opened_at)] (Approx [DisplayTimeText(world.time - opened_at)] ago)"
	if(closed_at)
		dat += "<br>Closed at: [game_timestamp(wtime = closed_at)] (Approx [DisplayTimeText(world.time - closed_at)] ago)"
	dat += "<br><br>"
	if(initiator)
		dat += "<b>Actions:</b> [ticket_actions(ref_src)]<br>"
	else
		dat += "<b>DISCONNECTED</b>[ticket_actions(ref_src)]<br>"
	dat += "<br><b>Log:</b><br><br>"
	for(var/I in _interactions)
		dat += "[I]<br>"

	var/datum/browser/popup = new(usr, "mhelp[id]", "Ticket #[id]", 620, 480)
	popup.set_content(dat.Join())
	popup.open()

//Forwarded action from admin/Topic
/datum/mentor_help/proc/action(mob/user, action)
	switch(action)
		if("claim")
			if(user.key == claimed_by)
				unclaim()
				return
			claim()
		if("ticket")
			ticket_panel()
		if("close")
			close()
		if("resolve")
			resolve()
		if("reopen")
			reopen()
		if("reply")
			user.client.cmd_mentor_pm(initiator)

//
// TICKET STATCLICK
//

/obj/effect/statclick/mhelp
	var/datum/mentor_help/mhelp_datum

/obj/effect/statclick/mhelp/Initialize(mapload, datum/mentor_help/MH)
	mhelp_datum = MH
	. = ..()

/obj/effect/statclick/mhelp/update()
	return ..(mhelp_datum.name)

/obj/effect/statclick/mhelp/Click()
	mhelp_datum.ticket_panel()

/obj/effect/statclick/mhelp/Destroy()
	mhelp_datum = null
	return ..()

//
// CLIENT PROCS
//

/client/proc/givementorhelp()
	add_verb(src, /client/verb/mentorhelp)
	deltimer(mentorhelptimerid)
	mentorhelptimerid = 0

/proc/message_mentors(msg)
	for(var/client/X in GLOB.mentors)
		to_chat(X, msg)

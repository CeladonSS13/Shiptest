#define NO_ADMINS_ONLINE_MESSAGE "Adminhelps are also sent to Discord. If no admins are available in game adminhelp anyways and an admin on Discord will see it and respond."

/// BYOND's string procs don't support being used on datum references (as in it doesn't look for a name for stringification)
/// We just use this macro to ensure that we will only pass strings to this BYOND-level function without developers needing to really worry about it.
#define LOWER_TEXT(thing) lowertext(UNLINT("[thing]"))

#define DEFAULT_WHO_CELLS_PER_ROW 4

/client/verb/staffwho()
	set category = "Admin"
	set name = "Adminwho"
	staff_who("Adminwho")

/client/verb/who()
	set name = "Who"
	set category = "OOC"

	var/msg = "<b>Current Players:</b>\n"

	var/list/Lines = list()
	var/columns_per_row = DEFAULT_WHO_CELLS_PER_ROW

	if(holder)
		if (check_rights(R_ADMIN,0) && isobserver(src.mob))//If they have +ADMIN and are a ghost they can see players IC names and statuses.
			columns_per_row = 1
			var/mob/dead/observer/G = src.mob
			if(!G.started_as_observer)//If you aghost to do this, KorPhaeron will deadmin you in your sleep.
				log_admin("[key_name(usr)] checked advanced who in-round")
			for(var/client/C in GLOB.clients)
				var/entry = "\t[C.key]"
				if(!C.prefs?.whois_visible)
					entry += "\[<b>WhoIs-Invisible</b>\]"
				if(C.holder && C.holder.fakekey)
					entry += " <i>(as [C.holder.fakekey])</i>"
				if (isnewplayer(C.mob))
					entry += " - <font color='darkgray'><b>In Lobby</b></font>"
				else
					entry += " - Playing as [C.mob.real_name]"
					switch(C.mob.stat)
						if(UNCONSCIOUS, HARD_CRIT)
							entry += " - <font color='darkgray'><b>Unconscious</b></font>"
						if(DEAD)
							if(isobserver(C.mob))
								var/mob/dead/observer/O = C.mob
								if(O.started_as_observer)
									entry += " - <font color='gray'>Observing</font>"
								else
									entry += " - <font color='black'><b>DEAD</b></font>"
							else
								entry += " - <font color='black'><b>DEAD</b></font>"
					if(is_special_character(C.mob))
						entry += " - <b><font color='red'>Antagonist</font></b>"
				entry += " [ADMIN_QUE(C.mob)]"
				entry += " ([round(C.avgping, 1)]ms)"
				Lines += entry
		else//If they don't have +ADMIN, only show hidden admins
			for(var/client/C in GLOB.clients)
				var/entry = "[C.key]"
				if(C.holder && C.holder.fakekey)
					entry += " <i>(as [C.holder.fakekey])</i>"
				entry += " ([round(C.avgping, 1)]ms)"
				Lines += entry
	else
		for(var/client/C in GLOB.clients)
			if(!C.prefs?.whois_visible)
				continue
			if(C.holder && C.holder.fakekey)
				Lines += "[C.holder.fakekey] ([round(C.avgping, 1)]ms)"
			else
				Lines += "[C.key] ([round(C.avgping, 1)]ms)"

	var/num_lines = 0
	msg += "<table style='width: 100%; table-layout: fixed'><tr>"
	for(var/line in sortList(Lines))
		msg += "<td>[line]</td>"

		num_lines += 1
		if (num_lines == columns_per_row)
			num_lines = 0
			msg += "</tr><tr>"
	msg += "</tr></table>"

	msg += "<b>Total Players: [length(Lines)]</b>"
	to_chat(src, fieldset_block(span_bold("Current Players"), span_infoplain(msg), "boxed_message"), type = MESSAGE_TYPE_OOC)

/*
	var/msg = "<b>Current Admins:</b>\n"
	if(holder)
		for(var/client/C in GLOB.admins)
			var/display_rank = LOWER_TEXT(C.holder.rank)
			if(display_rank == "!localhost!")
				display_rank = "localhost"
			var/css_class = replacetext(display_rank, " ", "_")
			msg += "• <b>\t[C]</b> is a <span class='[css_class]'>[C.holder.rank]</span>"

			if(C.holder.fakekey)
				msg += " <i>(as [C.holder.fakekey])</i>"

			if(isobserver(C.mob))
				msg += " - Observing"
			else if(isnewplayer(C.mob))
				msg += " - Lobby"
			else
				msg += " - Playing"

			if(C.is_afk())
				msg += " (AFK)"
			msg += "\n"
	else
		for(var/client/C in GLOB.admins)
			if(C.is_afk())
				continue //Don't show afk admins to adminwho
			if(!C.holder.fakekey)
				msg += "<b>\t[C]</b> is a [C.holder.rank]\n"
	if(length(GLOB.mentors) > 0)
		msg += "<b>Mentors:</b> \n"
		for(var/client/C in sortList(GLOB.clients))
			if(C in GLOB.admins)
				continue
			var/mentor = GLOB.mentor_datums[C.ckey]
			if(mentor)
				msg += "<b>\t[C.key]</b> is a Mentor \n"
		msg += span_info("Adminhelps are also sent to Discord. If no admins are available in game adminhelp anyways and an admin on Discord will see it and respond.")
	to_chat(src, msg)
*/
#undef DEFAULT_WHO_CELLS_PER_ROW

/client/proc/staff_who(via)
	var/list/lines = list()
	//Assoc list
	var/list/staff_info = list(
		"admin" = list(
			"header" = "Current Admins:",
			"empty_header" = "No Admins Currently Online",
			"data" = generate_staff_list("admin")
		),
		"developer" = list(
			"header" = "Current Developers:",
			"data" = generate_staff_list("developer")
		),
		//"mentor" = list(
		//	"header" = "Current Mentors:",
		//	"data" = generate_staff_list("mentor")
		//)
	)

	var/admin_data = staff_info["admin"]["data"]
	lines += span_bold(admin_data ? span_bold(staff_info["admin"]["header"]) : staff_info["admin"]["empty_header"])
	lines += admin_data || NO_ADMINS_ONLINE_MESSAGE

	// Add disclaimer if other staff exists
	if(!admin_data && (staff_info["developer"]["data"]))
		lines += "<b>Non-admin staff are unable to handle adminhelp tickets.</b>"

	for(var/staff_type in list("developer"))
		var/list/staff_data = staff_info[staff_type]
		if(!isnull(staff_data["data"]))
			lines += span_bold(staff_data["header"])
			lines += staff_data["data"]

	message_admins("[ADMIN_LOOKUPFLW(src.mob)] has checked online staff[via ? " (via [via])" : ""].")
	log_admin("[key_name(src)] has checked online staff[via ? " (via [via])" : ""].")
	to_chat(src, fieldset_block(span_bold("Current Staff"), jointext(lines, "\n"), "boxed_message"), type = MESSAGE_TYPE_OOC)

//

/client/proc/generate_staff_list(staff_type)
	var/list/staff_list
	switch(staff_type)
		if("admin")
			staff_list = get_staff_list(GLOB.admins, R_ADMIN, TRUE)
		else if("developer")
			staff_list = get_staff_list(GLOB.admins, R_DEBUG, TRUE)
		//("mentor")
		//	staff_list = get_staff_list(GLOB.mentors)

	return length(staff_list) ? format_staff_list(staff_list, holder != null) : null

/proc/get_staff_list(list/global_list, rights = null, has_rights = null)
	var/list/staff = list()
	for(var/client/C in global_list)
		if(!isnull(rights) && !isnull(has_rights))
			if(has_rights != check_rights_for(C, rights))
				continue
		staff += C
	return length(staff) ? staff : null

/proc/format_staff_list(list/staff_list, show_sensitive = FALSE)
	var/list/formatted = list()
	for(var/client/C in staff_list)
		if(!show_sensitive && (C.is_afk() || (!isnull(C.holder) && !isnull(C.holder.fakekey))))
			continue

		var/list/info = list()
		//We check for admins first, since you can have a mentor datum and a holder datum at the same time
		if(C?.holder)
			var/display_rank = LOWER_TEXT(C.holder.rank)
			if(display_rank == "!localhost!")
				display_rank = "localhost"
			// Convert spaces to underscores
			var/css_class = replacetext(display_rank, " ", "_")
			info += "• [C] is a <span class='[css_class]'><b>[C.holder.rank]</b></span>"
		//You are just a mint green, no admin about you
		//else if(C?.mentor_datum)
		//	info += "• [C] is a <span class='mentor'>Mentor</span>"
		else
			message_admins("Client [C] has no admin holder or mentor datum, yet is being passed as staff in staffwho. What the FUCK.")
			continue

		if(show_sensitive)
			if(C?.holder.fakekey)
				info += "<i>(as [C.holder.fakekey])</i>"

			if(isobserver(C.mob))
				info += "- <font color='gray'>Observing</font>"
			else if(isnewplayer(C.mob))
				info += "- <font color='darkgray'><b>Lobby</b></font>"
			else
				info += "- Playing"

			if(C.is_afk())
				info += "<font color='darkgray'>(AFK)</font>"

		formatted += jointext(info, " ")
	return jointext(formatted, "\n")

#undef NO_ADMINS_ONLINE_MESSAGE

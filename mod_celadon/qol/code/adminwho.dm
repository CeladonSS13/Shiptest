/// BYOND's string procs don't support being used on datum references (as in it doesn't look for a name for stringification)
/// We just use this macro to ensure that we will only pass strings to this BYOND-level function without developers needing to really worry about it.
#define LOWER_TEXT(thing) lowertext(UNLINT("[thing]"))

/client/verb/staffwho()
	set category = "Admin"
	set name = "Adminwho"
	staff_who("Adminwho")

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
	lines += admin_data || span_info("Все запросы к администрации передаются в Discord. Если в данный момент администраторов нет в игре, сообщение автоматически уходит в Discord, где его увидят и отреагируют.")

	//// Add disclaimer if other staff exists
	//if(!admin_data && (staff_info["developer"]["data"]))
	//	lines += "<b>Non-admin staff are unable to handle adminhelp tickets.</b>"

	for(var/staff_type in list("developer"))
		var/list/staff_data = staff_info[staff_type]
		if(!isnull(staff_data["data"]))
			lines += span_bold(staff_data["header"])
			lines += staff_data["data"]

	message_admins("[ADMIN_LOOKUPFLW(src.mob)] has checked online staff[via ? " (via [via])" : ""].")
	log_admin("[key_name(src)] has checked online staff[via ? " (via [via])" : ""].")
	to_chat(src, fieldset_block(span_bold("Current Staff"), jointext(lines, "\n"), "boxed_message"), type = MESSAGE_TYPE_OOC)

/client/proc/generate_staff_list(staff_type)
	var/list/staff_list
	switch(staff_type)
		if("admin")
			staff_list = get_staff_list(GLOB.admins, R_BAN, TRUE)
		if("developer")
			staff_list = get_staff_list(GLOB.admins, R_BAN, FALSE)
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

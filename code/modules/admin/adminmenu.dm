/datum/verbs/Admin/Generate_list(client/C)	// /datum/verbs/menu/Admin/Generate_list(client/C) // [CELADON-EDIT] - ADMIN-PANEL - НЕ МЕНЯТЬ ЭТО: /menu/
	if (C.holder)
		. = ..()

/datum/verbs/Admin/verb/playerpanel()	// /datum/verbs/menu/Admin/verb/playerpanel()	// [CELADON-EDIT] - ADMIN-PANEL - НЕ МЕНЯТЬ ЭТО: /menu/
	set name = "Player Panel"
	set desc = "Player Panel"
	set category = "Admin.Game"
	if(usr.client.holder)
		usr.client.holder.player_panel_new()
		BLACKBOX_LOG_ADMIN_VERB("Player Panel New")

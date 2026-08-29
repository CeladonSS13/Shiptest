/proc/tgui_alert_middle(mob/user, message, title, list/buttons, timeout = 60 SECONDS)
	if (!user)
		user = usr
	if (!istype(user))
		if (istype(user, /client))
			var/client/client = user
			user = client.mob
		else
			return
	var/datum/tgui_modal/alert_middle/alert = new(user, message, title, buttons, timeout)
	alert.ui_interact(user)
	alert.wait()
	if (alert)
		. = alert.choice
		qdel(alert)

/datum/tgui_modal/alert_middle/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "AlertMiddleModal")
		ui.open()

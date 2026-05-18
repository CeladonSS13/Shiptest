// Чинит иногда ломающееся окна ТГУИ

/client/verb/refresh_tgui()
	set name = "Refresh TGUI"
	set category = "Special Verbs"

	var/choice = alert(usr,
		"Use it ONLY if you have trouble with TGUI window.\
		That's UI's with EYE on top-left corner.\
		Otherwise, you can get a white window that will only close when you restart the game!", "Refresh TGUI", "Refresh", "Cancel")
	if(choice != "Refresh")
		return
	var/refreshed_count = 0
	for(var/window_id in tgui_windows)
		var/datum/tgui_window/window = tgui_windows[window_id]
		if(!window.locked)
			window.acquire_lock()
			continue
		window.reinitialize()
		refreshed_count++
	to_chat(usr, span_notice("TGUI windows refreshed - [refreshed_count].<br>If you have blank window - restart the game, or open previous TGUI window."))

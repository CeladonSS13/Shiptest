//
//	FixChat2, ускоренная версия FixChat => code\modules\tgui_panel\external.dm
//

/client/verb/fix_tgui_panel_2()
	set name = "Fix chat"
	set category = "Special Verbs"
	set waitfor = FALSE

	winset(src, "output", "on-show=&is-disabled=0&is-visible=1")
	winset(src, "browseroutput", "is-disabled=1;is-visible=0")

	sleep(1)
	if (!tgui_panel || !istype(tgui_panel))
		tgui_panel = new(src)
	tgui_panel.initialize(force = TRUE)

	sleep(1)
	if (tgui_panel)
		tgui_panel.window.send_message("ping", force = TRUE)

	sleep(1)
	winset(src, "output", "is-disabled=1&is-visible=0")
	winset(src, "browseroutput", "is-disabled=0;is-visible=1")

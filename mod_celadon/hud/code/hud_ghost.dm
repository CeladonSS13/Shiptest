/*

Связано с работой файла - 'code\_onclick\hud\ghost.dm'

*/


/atom/movable/screen/ghost
	icon = 'mod_celadon/_storage_icons/icons/assets/hud/screen_ghost.dmi'

/atom/movable/screen/ghost/dnr
	name = "Do Not Resuscitate"
	icon_state = "dnr"

/atom/movable/screen/ghost/dnr/Click()
	var/mob/dead/observer/dnring = usr
	dnring.stay_dead()

/atom/movable/screen/ghost/hudbox
	icon_state = "smallbox"
	bad_type = /atom/movable/screen/ghost/hudbox
	/// Icon state used for the overlay representing this hudbox
	var/hud_icon_state
	/// The flag this hudbox toggles
	var/relevant_flag

/atom/movable/screen/ghost/hudbox/update_overlays()
	. = ..()
	. += hud_icon_state

/atom/movable/screen/ghost/hudbox/update_icon_state()
	. = ..()
	var/mob/dead/observer/observer = usr
	if(!istype(observer))
		return

	icon_state = "smallbox[is_active(observer) ? "_active" : ""]"

/atom/movable/screen/ghost/hudbox/proc/is_active(mob/dead/observer/observer)
	return (observer.ghost_hud_flags & relevant_flag)

/atom/movable/screen/ghost/hudbox/Click(location, control, params)
	var/mob/dead/observer/observer = usr
	switch(relevant_flag)
		if(GHOST_DARKNESS_LEVEL)
			observer.toggle_darkness()
		if(GHOST_TRAY)
			observer.tray_view()
		else
			observer.toggle_ghost_hud_flag(relevant_flag)

	update_appearance(UPDATE_ICON_STATE)

/atom/movable/screen/ghost/hudbox/health_scanner
	name = "Health Scanner"
	desc = "Toggles your ability to health scan mobs on click."
	hud_icon_state = "health_vision"
	relevant_flag = GHOST_HEALTH

/atom/movable/screen/ghost/hudbox/chem_scanner
	name = "Chem Scanner"
	desc = "Toggles your ability to chemical scan mobs on click."
	hud_icon_state = "chem_vision"
	relevant_flag = GHOST_CHEM

/atom/movable/screen/ghost/hudbox/gas_scanner
	name = "Gas Scanner"
	desc = "Toggles your ability to gas scan objects on click."
	hud_icon_state = "atmos_vision"
	relevant_flag = GHOST_GAS

/atom/movable/screen/ghost/hudbox/ghost
	name = "Ghost Vision"
	desc = "Toggles whether you can see other ghosts."
	hud_icon_state = "ghost_vision"
	relevant_flag = GHOST_VISION

/atom/movable/screen/ghost/hudbox/data_huds
	name = "Data HUDs"
	desc = "Toggles the display of data HUDs (health, security, diagnostics, etc)."
	hud_icon_state = "data_vision"
	relevant_flag = GHOST_DATA_HUDS

/atom/movable/screen/ghost/hudbox/tray_icon
	name = "Tray View"
	desc = "Shows the t-ray view of the area around your ghost."
	hud_icon_state = "tray_vision"
	relevant_flag = GHOST_TRAY

/atom/movable/screen/ghost/hudbox/darkness_level
	name = "Darkness Level"
	desc = "Cycles through different darkness levels for ghost vision."
	hud_icon_state = "darkness_vision"
	relevant_flag = GHOST_DARKNESS_LEVEL

/atom/movable/screen/ghost/hudbox/language_menu
	name = "language menu"
	hud_icon_state = "talk_wheel"

/atom/movable/screen/ghost/hudbox/language_menu/Click()
	usr.get_language_holder().open_language_menu(usr)

/atom/movable/screen/ghost/hudbox/tray_icon
	name = "Tray View"
	desc = "Shows the t-ray view of the area around your ghost."
	hud_icon_state = "tray_vision"
	relevant_flag = GHOST_TRAY

/atom/movable/screen/ghost/hudbox/darkness_level
	name = "Darkness Level"
	desc = "Cycles through different darkness levels for ghost vision."
	hud_icon_state = "darkness_vision"
	relevant_flag = GHOST_DARKNESS_LEVEL

/atom/movable/screen/ghost/hudbox/language_menu
	name = "language menu"
	hud_icon_state = "talk_wheel"

/atom/movable/screen/ghost/hudbox/language_menu/Click()
	usr.get_language_holder().open_language_menu(usr)

/datum/hud/ghost/proc/position_hudbox(i)
	var/row = floor(i / 5)
	var/column = i % 5
	return "SOUTH:[6 + row * 16], CENTER+2:[7 + column * 15]"

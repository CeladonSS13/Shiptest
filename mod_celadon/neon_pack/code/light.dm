// Coloured lighting because fabulous
/obj/machinery/light/colored
	name = "light fixture"
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/coloredlights.dmi'
	base_state = "yellow"		// base description and icon_state
	icon_state = "yellow1"
	// emissive_state = "emissive"
	desc = "A lighting fixture."
	brightness = 8
	bulb_power = 6
	light_color = LIGHT_COLOR_HALOGEN
	var/emissive_state = "tube-emissive"
	// var/on_wall = 1

/obj/machinery/light/colored/update_icon_state()
	. = ..()
	cut_overlays()
	switch(status)
		if(LIGHT_OK)
			icon_state = (on ? "[base_state]1" : "off")
			if(on && emissive_state)
				add_overlay(emissive_appearance(icon, emissive_state))
		if(LIGHT_EMPTY)
			icon_state = "empty"
			on = 0
		if(LIGHT_BURNED)
			icon_state = "tube-burned"
			on = 0
		if(LIGHT_BROKEN)
			icon_state = "tube-broken"
			on = 0

/obj/machinery/light/colored/orange
	base_state = "orange"		// base description and icon_state
	icon_state = "orange1"
	color = LIGHT_COLOR_ORANGE
	light_color = LIGHT_COLOR_ORANGE

/obj/machinery/light/colored/purple
	base_state = "purple"		// base description and icon_state
	icon_state = "purple1"
	color = LIGHT_COLOR_PURPLE
	light_color = LIGHT_COLOR_PURPLE

/obj/machinery/light/colored/red
	base_state = "red"		// base description and icon_state
	icon_state = "red1"
	color = LIGHT_COLOR_RED
	light_color = LIGHT_COLOR_RED

/obj/machinery/light/colored/pink
	base_state = "pink"		// base description and icon_state
	icon_state = "pink1"
	color = LIGHT_COLOR_PINK
	light_color = LIGHT_COLOR_PINK

/obj/machinery/light/colored/blue
	base_state = "blue"		// base description and icon_state
	icon_state = "blue1"
	color = LIGHT_COLOR_BLUE
	light_color = LIGHT_COLOR_BLUE

/obj/machinery/light/colored/green
	base_state = "green"		// base description and icon_state
	icon_state = "green1"
	color = LIGHT_COLOR_GREEN
	light_color = LIGHT_COLOR_GREEN

/obj/machinery/light/colored/white
	base_state = "white"		// base description and icon_state
	icon_state = "white1"
	color = "#f0ffff"
	light_color = "#f0ffff"

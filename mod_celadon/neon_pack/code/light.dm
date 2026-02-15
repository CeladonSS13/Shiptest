// Coloured lighting because fabulous
/obj/machinery/light/colored
	name = "light fixture"
	desc = "A lighting fixture."
	icon = MAP_SWITCH('mod_celadon/_storage_icons/icons/structures/obj/lighting.dmi', 'mod_celadon/_storage_icons/icons/structures/obj/lighting_editor.dmi')
	icon_state = "tube_editor"
	base_state = "tube"
	brightness = 8
	bulb_power = 6
	///What overlay the light should use
	var/overlay_icon = 'mod_celadon/_storage_icons/icons/structures/obj/lighting_overlay.dmi'
	mod_light = TRUE

/obj/machinery/light/colored/update_icon_state()
	. = ..()
	switch(status)
		if(LIGHT_OK)
			var/area/local_area = get_area(src)
			if(emergency_mode || (local_area?.fire))
				icon_state = "[base_state]-emergency"
			else if(local_area?.vacuum)
				icon_state = "[base_state]-vacuum"
			else
				icon_state = "[base_state]"
		if(LIGHT_EMPTY)
			icon_state = "[base_state]-empty"
		if(LIGHT_BURNED)
			icon_state = "[base_state]-burned"
		if(LIGHT_BROKEN)
			icon_state = "[base_state]-broken"

/obj/machinery/light/colored/update_overlays()
	. = ..()
	if(!on || status != LIGHT_OK)
		return

	. += emissive_appearance(overlay_icon, "[base_state]", src, alpha = src.alpha)

	if(flickering)
		. += mutable_appearance(overlay_icon, "[base_state]_flickering")
		return
	var/area/local_area = get_area(src)
	if(emergency_mode || (local_area?.fire) || (local_area?.vacuum))
		. += emissive_appearance(overlay_icon, "[base_state]_emergency")
		return
	var/mutable_appearance/light = mutable_appearance(overlay_icon, base_state)
	if(local_area?.vacuum)
		light.color = COLOR_BLUE
	else if(nightshift_enabled)
		. += mutable_appearance(overlay_icon, "[base_state]_nightshift")
		return
	else
		light.color = bulb_colour
	. += light

/obj/machinery/light/colored/orange
	bulb_colour = LIGHT_COLOR_ORANGE
	nightshift_light_color = LIGHT_COLOR_ORANGE
	icon_state = "tube_editor_orange"

/obj/machinery/light/colored/purple
	bulb_colour = LIGHT_COLOR_PURPLE
	nightshift_light_color = LIGHT_COLOR_PURPLE
	icon_state = "tube_editor_purple"

/obj/machinery/light/colored/red
	bulb_colour = LIGHT_COLOR_RED
	nightshift_light_color = LIGHT_COLOR_RED
	icon_state = "tube_editor_red"

/obj/machinery/light/colored/pink
	bulb_colour = LIGHT_COLOR_PINK
	nightshift_light_color = LIGHT_COLOR_PINK
	icon_state = "tube_editor_pink"

/obj/machinery/light/colored/blue
	light_color = LIGHT_COLOR_BLUE
	nightshift_light_color = LIGHT_COLOR_BLUE
	icon_state = "tube_editor_blue"

/obj/machinery/light/colored/green
	bulb_colour = LIGHT_COLOR_GREEN
	nightshift_light_color = LIGHT_COLOR_GREEN
	icon_state = "tube_editor_green"

/obj/machinery/light/colored/white
	icon_state = "tube_editor"
/*
/obj/machinery/light/colored/built
	icon_state = "tube-empty"
	start_with_cell = FALSE

/obj/machinery/light/small/mod
	icon_state = "tube_editor_green"

/obj/machinery/light/small/mod/broken
	status = LIGHT_BROKEN
	icon_state = "bulb-broken"

/obj/machinery/light/small/mod/built
	icon_state = "bulb-empty"
	start_with_cell = FALSE
*/

// [HORIZON-ADD]
/// Create directional subtypes for a path to simplify mapping.
#define MAPPING_INVERSE_DIRECTIONAL_HELPERS(path, offset) ##path/directional/north {\
	dir = NORTH; \
	pixel_y = offset + 12; \
} \
##path/directional/south {\
	dir = SOUTH; \
	pixel_y = -offset - 6; \
} \
##path/directional/east {\
	dir = EAST; \
	pixel_x = offset + 8; \
} \
##path/directional/west {\
	dir = WEST; \
	pixel_x = -offset - 8; \
}
// [/HORIZON-ADD]

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/broken, 28)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/built, 32)

MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/default, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/orange, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/purple, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/red, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/pink, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/blue, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/green, 0)
MAPPING_INVERSE_DIRECTIONAL_HELPERS(/obj/machinery/light/colored/white, 0)

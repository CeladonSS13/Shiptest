/obj/structure/neon_spline
	name = "neon spline"
	icon = 'mod_celadon/_storage_icons/icons/structures/neon_decals.dmi'
	icon_state = "spline_fancy"
	layer = NEON_DECALS_PLANE
	light_power = 1.5
	light_range = 2.5
	anchored = TRUE
	blocks_emissive = FALSE

#define NEON_SPLINE(id, col) /obj/structure/neon_spline/##id {color = col ; light_color = col }
#define NEON_SPLINE_CORNER(id) /obj/structure/neon_spline/##id/corner { icon_state = "spline_fancy_corner" ; }
#define NEON_SPLINE_CEE(id) /obj/structure/neon_spline/##id/cee { icon_state = "spline_fancy_cee" ; }
#define NEON_SPLINE_THREE_QUARTERS(id) /obj/structure/neon_spline/##id/three_quarters { icon_state = "spline_fancy_full" ; }

NEON_SPLINE(green, LIGHT_COLOR_NEONGREEN)
NEON_SPLINE_CORNER(green)
NEON_SPLINE_CEE(green)
NEON_SPLINE_THREE_QUARTERS(green)

NEON_SPLINE(blue, LIGHT_COLOR_NEONBLUE)
NEON_SPLINE_CORNER(blue)
NEON_SPLINE_CEE(blue)
NEON_SPLINE_THREE_QUARTERS(blue)

NEON_SPLINE(pink, LIGHT_COLOR_HOTPINK)
NEON_SPLINE_CORNER(pink)
NEON_SPLINE_CEE(pink)
NEON_SPLINE_THREE_QUARTERS(pink)

NEON_SPLINE(red, LIGHT_COLOR_NEONRED)
NEON_SPLINE_CORNER(red)
NEON_SPLINE_CEE(red)
NEON_SPLINE_THREE_QUARTERS(red)

NEON_SPLINE(purple, LIGHT_COLOR_PURPLE)
NEON_SPLINE_CORNER(purple)
NEON_SPLINE_CEE(purple)
NEON_SPLINE_THREE_QUARTERS(purple)

NEON_SPLINE(white, "#f0ffff")
NEON_SPLINE_CORNER(white)
NEON_SPLINE_CEE(white)
NEON_SPLINE_THREE_QUARTERS(white)

NEON_SPLINE(orange, LIGHT_COLOR_NEONORANGE)
NEON_SPLINE_CORNER(orange)
NEON_SPLINE_CEE(orange)
NEON_SPLINE_THREE_QUARTERS(orange)

NEON_SPLINE(yellow, LIGHT_COLOR_NEONYELLOW)
NEON_SPLINE_CORNER(yellow)
NEON_SPLINE_CEE(yellow)
NEON_SPLINE_THREE_QUARTERS(yellow)

NEON_SPLINE(lightblue, LIGHT_COLOR_NEONLIGHTBLUE)
NEON_SPLINE_CORNER(lightblue)
NEON_SPLINE_CEE(lightblue)
NEON_SPLINE_THREE_QUARTERS(lightblue)

#undef NEON_SPLINE
#undef NEON_SPLINE_CORNER
#undef NEON_SPLINE_CEE
#undef NEON_SPLINE_THREE_QUARTERS

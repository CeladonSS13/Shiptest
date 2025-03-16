/obj/structure/light_prism
	name = "light prism"
	desc = "A shining crystal of semi-solid light. Looks fragile."
	icon = 'icons/obj/slimecrossing.dmi'
	icon_state = "lightprism"
	density = FALSE
	anchored = TRUE
	max_integrity = 10

/obj/structure/light_prism/Initialize(mapload, newcolor)
	. = ..()
	color = newcolor
	set_light_color(newcolor)
	set_light(5)

/obj/structure/light_prism/attack_hand(mob/user)
	to_chat(user, "<span class='notice'>You dispel [src].</span>")
	qdel(src)

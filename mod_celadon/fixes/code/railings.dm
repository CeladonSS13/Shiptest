/obj/structure/railing
	name = "railing"
	desc = "Basic railing meant to protect idiots like you from falling."
	icon = 'mod_celadon/_storge_icons/icons/obj/railing.dmi'
	icon_state = "railing"
	obj_flags = CAN_BE_HIT
	plane = ABOVE_GAME_PLANE

/obj/structure/railing/corner/end //end of a segment of railing without making a loop
	icon_state = "railing_end"

/obj/structure/railing/corner/end/flip //same as above but flipped around
	icon_state = "railing_end_flip"

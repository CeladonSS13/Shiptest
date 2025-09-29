/obj/structure/bed/event_escape_from_prison
	var/linked_spawner_type

/obj/structure/bed/event_escape_from_prison/proc/try_replenish_role()
	if(!linked_spawner_type)
		return

	new linked_spawner_type(get_turf(src))
	qdel(src)

/obj/structure/bed/event_escape_from_prison/prisoner
	name = "bed a prisoner"
	icon_state = "bottom_bunk"

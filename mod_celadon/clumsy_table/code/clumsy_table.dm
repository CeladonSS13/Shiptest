/obj/structure/table/Crossed(atom/movable/AM, oldloc)
	AddComponent(/datum/component/clumsy_climb, 5)
	. = ..()

// /obj/structure/table/do_climb(mob/living/user)	// Отключено
// 	. = ..()
// 	if(!.)
// 		return FALSE
// 	AddComponent(/datum/component/clumsy_climb, 15)
// 	SEND_SIGNAL(src, COMSIG_CLIMBED_ON, user)

// /obj/structure/proc/do_climb(atom/movable/A)	// Удалено офами
// 	if(climbable)
// 		if(A.loc == src.loc)
// 			var/turf/where_to_climb = get_step(A,dir)
// 			if(!where_to_climb.is_blocked_turf())
// 				A.forceMove(where_to_climb)
// 				return TRUE
// 		density = FALSE
// 		. = step(A,get_dir(A,src.loc))
// 		density = TRUE

// /obj/structure/proc/climb_structure(mob/living/user)	// Удалено офами
// 	src.add_fingerprint(user)
// 	user.visible_message("<span class='warning'>[user] starts climbing onto [src].</span>",
// 								"<span class='notice'>You start climbing onto [src]...</span>")
// 	var/adjusted_climb_time = climb_time
// 	if(HAS_TRAIT(user, TRAIT_HANDS_BLOCKED)) //climbing takes twice as long without help from the hands.
// 		adjusted_climb_time *= 2
// 	if(isalien(user))
// 		adjusted_climb_time *= 0.25 //aliens are terrifyingly fast
// 	if(HAS_TRAIT(user, TRAIT_FREERUNNING)) //do you have any idea how fast I am???
// 		adjusted_climb_time *= 0.8
// 	structureclimber = user
// 	if(do_after(user, adjusted_climb_time))
// 		if(src.loc) //Checking if structure has been destroyed
// 			if(do_climb(user))
// 				user.visible_message("<span class='warning'>[user] climbs onto [src].</span>",
// 									"<span class='notice'>You climb onto [src].</span>")
// 				log_combat(user, src, "climbed onto")
// 				. = 1
// 			else
// 				to_chat(user, "<span class='warning'>You fail to climb onto [src].</span>")
// 	structureclimber = null

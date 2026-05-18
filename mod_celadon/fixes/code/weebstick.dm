/obj/item/storage/belt/weebstick/proc/unprime_unlock() // If smth unpredicted happens admins can proccall this
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	CP.locked = FALSE
	primed = FALSE

/obj/item/storage/belt/weebstick/dropped(mob/user, silent)
	. = ..()
	if(primed == TRUE)
		primed = FALSE
		update_appearance()
		return

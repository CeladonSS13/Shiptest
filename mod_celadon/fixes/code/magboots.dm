/mob/proc/magboots_has_gravity()
	return has_gravity()

/mob/living/carbon/human/magboots_has_gravity()
	. = ..()
	if(!.)
		if(mob_negates_gravity())
			. = 1

/mob/living/proc/magboots_handle_gravity()
	var/gravity = magboots_has_gravity()
	update_gravity(gravity)

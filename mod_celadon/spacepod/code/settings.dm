
/mob
	///List of datums that this has which make use of MouseMove()
	var/list/mousemove_intercept_objects

///Is the mob restrained
/mob/proc/restrained(ignore_grab)
	return HAS_TRAIT(src, TRAIT_RESTRAINED)

//Please don't roast me too hard
/client/MouseMove(object, location, control, params)
	mouseParams = params
	mouse_location_ref = WEAKREF(location)
	mouse_object_ref = WEAKREF(object)
	mouseControlObject = control
	if(mob && LAZYLEN(mob.mousemove_intercept_objects))
		for(var/datum/D in mob.mousemove_intercept_objects)
			D.onMouseMove(object, location, control, params)
	..()

/datum/proc/onMouseMove(object, location, control, params)
	return

/obj
	uses_integrity = TRUE

/atom
	///Current integrity, defaults to max_integrity on init
	VAR_PRIVATE/atom_integrity
	///any atom that uses integrity and can be damaged must set this to true, otherwise the integrity procs will throw an error
	var/uses_integrity = FALSE

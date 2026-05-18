// Same as before, but returns null if false
/proc/get_open_turf_in_dir_null(atom/center, dir)
	var/turf/open/T = get_step(center, dir)
	if(istype(T))
		return T
	else
		return null

/obj/singularity/energy_ball/proc/tesla_can_move(turf/T)
	if(!T)
		return FALSE
	if(istype(T, /turf/open/overmap))
		return FALSE
	return TRUE

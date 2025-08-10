/datum/overmap/dynamic/proc/stop_countdown()
	QDEL_NULL(token.countdown)
	STOP_PROCESSING(SSfastprocess, src)

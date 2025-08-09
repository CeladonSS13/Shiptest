// Initialize body recovery drone on outpost
/datum/controller/subsystem/mapping/proc/init_body_recovery_drone()
	// Find outpost areas and spawn recovery drone
	for(var/area/outpost/medical/morgue/A in world)
		var/turf/spawn_location
		for(var/turf/T in A)
			if(!T.density)
				spawn_location = T
				break
		
		if(spawn_location)
			new /obj/effect/body_recovery_drone(spawn_location)
			break

// Hook into mapping subsystem initialization
/datum/controller/subsystem/mapping/Initialize()
	. = ..()
	init_body_recovery_drone()
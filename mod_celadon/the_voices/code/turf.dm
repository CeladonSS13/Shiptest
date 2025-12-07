/turf/proc/get_yelling_resistance(power)
	. = 0
	// don't bother checking fulltile, we don't need accuracy
	var/obj/window = locate(/obj/structure/window) in src
	if(!window)
		window = locate(/obj/machinery/door/window) in src
	if(window)
		. += 4		// windows are minimally resistant
	// if there's more than one someone fucked up as that shouldn't happen
	var/obj/machinery/door/D = locate() in src
	if(D?.density)
		. += D.opacity? 29 : 19			// glass doors are slightly more resistant to screaming

/turf/closed
	/// How much we block yelling
	var/yelling_resistance = 10
	/// how much of inbound yelling to dampen
	var/yelling_dampen = 0.5

/turf/closed/get_yelling_resistance(power)
	return yelling_resistance + (power * yelling_dampen)

/turf/open/space/get_yelling_resistance(power)
	return INFINITY				// no sound through space for crying out loud

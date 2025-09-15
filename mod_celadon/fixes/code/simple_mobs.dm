/// Check if the mob can move to the target turf without clipping through diagonal walls
/mob/living/simple_animal/proc/can_move_to_turf(turf/target, direction)
	if(!target)
		return FALSE

	// For diagonal movement, check if both adjacent walls would block movement
	if(direction & (direction - 1)) // This checks if direction is diagonal
		var/turf/current = get_turf(src)
		if(!current)
			return FALSE

		// Get the two cardinal directions that make up this diagonal
		var/dir1 = direction & NORTH ? NORTH : SOUTH
		var/dir2 = direction & EAST ? EAST : WEST

		// Get the turfs in those directions
		var/turf/side1 = get_step(current, dir1)
		var/turf/side2 = get_step(current, dir2)

		// If either side is blocked by a dense object, prevent diagonal movement
		if(side1 && side1.density)
			return FALSE
		if(side2 && side2.density)
			return FALSE

		// Check for dense objects on the side turfs
		for(var/atom/movable/AM in side1)
			if(AM.density && !AM.CanPass(src, direction))
				return FALSE
		for(var/atom/movable/AM in side2)
			if(AM.density && !AM.CanPass(src, direction))
				return FALSE

	// Check if the target turf itself is passable
	if(target.density)
		return FALSE

	for(var/atom/movable/AM in target)
		if(AM.density && !AM.CanPass(src, direction))
			return FALSE

	return TRUE

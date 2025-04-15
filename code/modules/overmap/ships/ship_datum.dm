/**
 * # Overmap ships
 *
 * Basically, any overmap object that is capable of moving by itself.
 *
 */

// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
/obj/shiptrail
	icon = 'mod_celadon/_storge_icons/icons/overmap/overmap.dmi'
	icon_state = "ship_trail"
	alpha = 200
	glide_size = 32
	mouse_opacity = 0

/datum/overmap/ship/proc/clear_trails()
	if(trails[1])
		QDEL_NULL(trails[1])
	if(trails[2])
		QDEL_NULL(trails[2])
	if(trails[3])
		QDEL_NULL(trails[3])

/datum/overmap/ship/proc/hide_trails()
	if(trails[1])
		trails[1].alpha = 0
	if(trails[2])
		trails[2].alpha = 0
	if(trails[3])
		trails[3].alpha = 0

/datum/overmap/ship/proc/update_trails(var/obj/shiptrail/newtrail)
	if(trails[1])
		trails[1].alpha = 128
		if(trails[2])
			trails[2].alpha = 64
			if(trails[3])
				var/obj/first_trail = trails[3]
				trails[3] = trails[2]
				trails[2] = trails[1]
				first_trail.alpha = 200
				first_trail.forceMove(token.loc)
				first_trail.pixel_w = last_anim["x"]
				first_trail.pixel_z = last_anim["y"]
				var/matrix/M = matrix()
				M.Turn(bow_heading)
				first_trail.transform = M
				trails[1] = first_trail
			else
				trails[3] = trails[2]
				trails[2] = trails[1]
				var/obj/shiptrail/S = new(token.loc)
				S.pixel_w = last_anim["x"]
				S.pixel_z = last_anim["y"]
				var/matrix/M = matrix()
				M.Turn(bow_heading)
				S.transform = M
				trails[1] = S

		else
			trails[2] = trails[1]
			var/obj/shiptrail/S = new(token.loc)
			S.pixel_w = last_anim["x"]
			S.pixel_z = last_anim["y"]
			var/matrix/M = matrix()
			M.Turn(bow_heading)
			S.transform = M
			trails[1] = S

	else
		var/obj/shiptrail/S = new(token.loc)
		S.pixel_w = last_anim["x"]
		S.pixel_z = last_anim["y"]
		var/matrix/M = matrix()
		M.Turn(bow_heading)
		S.transform = M
		trails[1] = S
// [/CELADON-ADD]

/datum/overmap/ship
	name = "overmap vessel"
	char_rep = ">"
	// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	// token_icon_state = "ship"
	token_icon_state = "ship_point"
	// [/CELADON-EDIT]
	///Timer ID of the looping movement timer
	var/movement_callback_id
	///Max possible speed (1 tile per tick / 600 tiles per minute)
	var/static/max_speed = 1
	///Minimum speed. Any lower is rounded down. (0.01 tiles per minute)
	var/static/min_speed = 1/(100 MINUTES)

	///The current speed in x direction in grid squares per minute
	var/speed_x = 0
	///The current speed in y direction in grid squares per minute
	var/speed_y = 0
	///The direction being accelerated in
	var/burn_direction = BURN_NONE
	///Percentage of thruster power being used
	var/burn_percentage = 50

	///ONLY USED FOR NON-SIMULATED SHIPS. The amount per burn that this ship accelerates
	var/acceleration_speed = 0.02

// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	///For bay overmap
	var/x_pixels_moved = 0
	var/y_pixels_moved = 0

	var/list/position_to_move = list("x" = 0, "y" = 0)
	var/list/last_anim = list("x" = 0, "y" = 0)
	var/list/vector_to_add = list("x" = 0, "y" = 0)

	var/list/arpa = list()

	var/bow_heading = 0
	var/rotating = 0
	var/rotation_velocity = 0

	var/skiptickfortrail = 0
	// [CELADON-EDIT] - Убираем предупреждение валидатора
	var/list/obj/shiptrail/trails = list(1 = null,
							2 = null,
							3 = null)
	// [/CELADON-EDIT]

/datum/overmap/ship/proc/check_proximity()
//	token.collision_alarm()
	var/list/arpa_add = list()
	for(var/obj/overmap/rendered/i in orange(4, token))
		calculate_cpa(src, i.parent)
		arpa_add |= i.parent
	return arpa_add
// [/CELADON-ADD]

/datum/overmap/ship/Initialize(position, ...)
	. = ..()
	if(docked_to)
		position_to_move["x"] = docked_to.x
		position_to_move["y"] = docked_to.y
	else
		position_to_move["x"] = x
		position_to_move["y"] = y
	if(docked_to)
		RegisterSignal(docked_to, COMSIG_OVERMAP_MOVED, PROC_REF(on_docked_to_moved))

/datum/overmap/ship/Destroy()
	// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	//	if(movement_callback_id)
	//		deltimer(movement_callback_id, SSovermap_movement)
	clear_trails()
	// [/CELADON-EDIT]
	return ..()

/datum/overmap/ship/complete_dock(datum/overmap/dock_target, datum/docking_ticket/ticket)
	. = ..()
	// override prevents runtime on controlled ship init due to docking after initializing at a position
	RegisterSignal(dock_target, COMSIG_OVERMAP_MOVED, PROC_REF(on_docked_to_moved), override = TRUE)

/datum/overmap/ship/complete_undock()
	UnregisterSignal(docked_to, COMSIG_OVERMAP_MOVED)
	. = ..()

/datum/overmap/ship/Undock(force = FALSE)
	. = ..()
	if(istype(docked_to, /datum/overmap/ship))
		var/datum/overmap/ship/old_dock = docked_to
		adjust_speed(old_dock.speed_x, old_dock.speed_y)
	// [CELADON-ADD] - subshuttles fix
		x_pixels_moved = old_dock.x_pixels_moved + (pick(6, -6))
		y_pixels_moved = old_dock.y_pixels_moved + (pick(6, -6))

	x = docked_to.x
	y = docked_to.y
	position_to_move["x"] = docked_to.x
	position_to_move["y"] = docked_to.y
	if(docked_to.x == null || docked_to.y == null)
		x = docked_to.docked_to.x
		y = docked_to.docked_to.y
		position_to_move["x"] = docked_to.docked_to.x
		position_to_move["y"] = docked_to.docked_to.y
	// [/CELADON-ADD] - subshuttles fix
/datum/overmap/ship/proc/on_docked_to_moved()
	token.update_screen()

/**
 * Change the speed in any direction.
 * * n_x - Speed in the X direction to change
 * * n_y - Speed in the Y direction to change
 */

/datum/overmap/ship/proc/adjust_speed(n_x, n_y)
// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
//	var/offset = 1
//	if(movement_callback_id)
//		var/previous_time = 1 / MAGNITUDE(speed_x, speed_y)
//		offset = clamp(timeleft(movement_callback_id, SSovermap_movement) / previous_time, 0, 1)
//		deltimer(movement_callback_id, SSovermap_movement)
//		movement_callback_id = null //just in case

	if(QDELING(src) || docked_to)
		return

// [/CELADON-EDIT]

	speed_x = min(max_speed, speed_x + n_x)
	speed_y = min(max_speed, speed_y + n_y)

	if(speed_x < min_speed && speed_x > -min_speed)
		speed_x = 0
	if(speed_y < min_speed && speed_y > -min_speed)
		speed_y = 0

// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	// token.update_icon_state()
	speed_x = speed_x+vector_to_add["x"]
	speed_y = speed_y+vector_to_add["y"]
	vector_to_add["x"] = 0
	vector_to_add["y"] = 0

	if(60 SECONDS * MAGNITUDE(speed_x, speed_y) >= 60)
		speed_x = speed_x*0.98
		speed_y = speed_y*0.98

// [/CELADON-EDIT]

	update_visuals()

// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	//	if(is_still() || QDELING(src) || movement_callback_id || docked_to || docking)
	//		return
	//	var/timer = 1 / MAGNITUDE(speed_x, speed_y) * offset
	//	movement_callback_id = addtimer(CALLBACK(src, PROC_REF(tick_move)), timer, TIMER_STOPPABLE, SSovermap_movement)
	if(token)
		var/matrix/M = matrix()
		M.Scale(1, get_speed()/3)
		M.Turn(get_alt_heading())
		if(token.move_vec)
			token.move_vec.transform = M
// [/CELADON-EDIT]

/**
 * Called by [/datum/overmap/ship/proc/adjust_speed], this continually moves the ship according to its speed
 */

// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
/datum/overmap/ship/proc/not_tick_move(var/xmov, var/ymov)
	if(QDELING(src))
		return
	overmap_move(x + xmov, y + ymov)
	update_visuals()
	if(token)
		token.update_screen()
		if(token.ship_image)
			token.ship_image.forceMove(token.loc)
		if(token.move_vec)
			token.move_vec.forceMove(token.loc)
// [/CELADON-ADD]

// [CELADON-REMOVE] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
/*
/datum/overmap/ship/proc/tick_move()
	if(is_still() || QDELING(src) || docked_to)
		adjust_speed(-speed_x, -speed_y)
		deltimer(movement_callback_id, SSovermap_movement)
		movement_callback_id = null
		return
	overmap_move(x + SIGN(speed_x), y + SIGN(speed_y))
	update_visuals()

	if(movement_callback_id)
		deltimer(movement_callback_id, SSovermap_movement)

	//Queue another movement
	var/current_speed = MAGNITUDE(speed_x, speed_y)
	if(!current_speed)
		return

	var/timer = 1 / current_speed
	movement_callback_id = addtimer(CALLBACK(src, PROC_REF(tick_move)), timer, TIMER_STOPPABLE, SSovermap_movement)
	token.update_screen()
*/
// [/CELADON-REMOVE]

/**
 * Returns whether or not the ship is moving in any direction.
 */
/datum/overmap/ship/proc/is_still()
	return !speed_x && !speed_y

/**
 * Returns the total speed in all directions.
 *
 * The equation for acceleration is as follows:
 * 60 SECONDS / (1 / ([ship's speed] / ([ship's mass] * 100)))
 */
/datum/overmap/ship/proc/get_speed()
	if(is_still())
		return 0
	return 60 SECONDS * MAGNITUDE(speed_x, speed_y) //It's per tick, which is 0.1 seconds

/**
 * Returns the direction the ship is moving in terms of dirs
 */

// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
/datum/overmap/ship/proc/get_alt_heading()
	. = 0
	var/stuff = -arctan(speed_x, speed_y)
	stuff = stuff+90
	if(stuff >= 360)
		stuff = stuff-360
	if(stuff < 0)
		stuff = stuff+360
	. = stuff
// [/CELADON-ADD]

/datum/overmap/ship/proc/get_heading()
	. = NONE
	if(speed_x)
		if(speed_x > 0)
			. |= EAST
		else
			. |= WEST
	if(speed_y)
		if(speed_y > 0)
			. |= NORTH
		else
			. |= SOUTH

/**
 * Returns the estimated time in deciseconds to the next tile at current speed, or approx. time until reaching the destination when on autopilot
 */
/datum/overmap/ship/proc/get_eta()
	// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
	// . += timeleft(movement_callback_id, SSovermap_movement)
	// if(!.)
	// 	return "--:--"
	// . /= 10 //they're in deciseconds
	// return "[add_leading(num2text((. / 60) % 60), 2, "0")]:[add_leading(num2text(. % 60), 2, "0")]"
	if(speed_x == 0 && speed_y == 0)
		return "--:--"
	var/x_pixels_to_move = 16
	if(speed_x >= 0)
		x_pixels_to_move = x_pixels_to_move-token.pixel_w
	else
		x_pixels_to_move = x_pixels_to_move+token.pixel_w
	var/y_pixels_to_move = 16
	if(speed_y >= 0)
		y_pixels_to_move = y_pixels_to_move-token.pixel_z
	else
		y_pixels_to_move = y_pixels_to_move+token.pixel_z

	var/stuff



	var/stuffx = 0
	if(speed_x != 0)
		stuffx = round(x_pixels_to_move/(max(speed_x, -speed_x)*(30 SECONDS)))
	var/stuffy = 0
	if(speed_y != 0)
		stuffy = round(y_pixels_to_move/(max(speed_y, -speed_y)*(30 SECONDS)))
	if(stuffy != 0 && stuffx != 0)
		stuff = min(stuffx, stuffy)
	else
		if(stuffy != 0)
			stuff = stuffy
		else
			stuff = stuffx

	if(round(stuff) == 0)
		return "00:00"

	if(round(stuff) < 0)
		return "00:00"

	return "[add_leading(num2text((stuff / 60) % 60), 2, "0")]:[add_leading(num2text(stuff % 60), 2, "0")]"
	// [/CELADON-EDIT]


/datum/overmap/ship/process(seconds_per_tick)
	if((burn_direction == BURN_STOP && is_still()) || docked_to || docking)
		change_heading(BURN_NONE)
		return

// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
//	var/added_velocity = calculate_burn(burn_direction, burn_engines(burn_percentage, delta_time))
// //Slows down the ship just enough to come to a full stop
// if(burn_direction == BURN_STOP)
//		if(speed_x > 0)
//			added_velocity["x"] = max(-speed_x, added_velocity["x"])
//		else
//			added_velocity["x"] = min(-speed_x, added_velocity["x"])
//		if(speed_y > 0)
//			added_velocity["y"] = max(-speed_y, added_velocity["y"])
//		else
//			added_velocity["y"] = min(-speed_y, added_velocity["y"])
//	adjust_speed(added_velocity["x"], added_velocity["y"])

// НОВЫЕ ИЗМЕНЕНИЯ ОТ ОФОВ! 3 недели назад (марта 11th, 2025 12:09 ночи) ID: ALARM_CONFLICTS_OFFOS
//	var/added_velocity = calculate_burn(burn_direction, burn_engines(burn_percentage, seconds_per_tick))

	var/newx = 0
	var/newy = 0
	if(burn_direction == BURN_STOP)
		if(speed_x > 0)
			newx = -min(speed_x, burn_engines(burn_percentage, seconds_per_tick))
		else
			newx = min(-speed_x, burn_engines(burn_percentage, seconds_per_tick))
		if(speed_y > 0)
			newy = -min(speed_y, burn_engines(burn_percentage, seconds_per_tick))
		else
			newy = min(-speed_y, burn_engines(burn_percentage, seconds_per_tick))
	else
		switch(burn_direction)
			if(NORTH)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading)
			if(SOUTH)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading+180)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading+180)
			if(WEST)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading+270)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading+270)
			if(EAST)
				newx = burn_engines(burn_percentage, seconds_per_tick)*sin(bow_heading+90)
				newy = burn_engines(burn_percentage, seconds_per_tick)*cos(bow_heading+90)

	adjust_speed(newx, newy)
// [/CELADON-EDIT]

/**
 * Calculates the amount of acceleration to apply to the ship given the direction and velocity increase
 * * direction - The direction to accelerate in
 * * acceleration - The acceleration to apply
 */
/datum/overmap/ship/proc/calculate_burn(direction, acceleration)
	var/heading = get_heading()
	//Slowing down
	if(direction == BURN_STOP && heading)
		direction = DIRFLIP(heading)
	if(!(direction in GLOB.cardinals))
		acceleration /= SQRT_2 //Makes it so going diagonally isn't 2x as efficient

	var/list/acceleration_vector = list("x" = 0, "y" = 0)

	if(direction & EAST)
		acceleration_vector["x"] = acceleration
	else if(direction & WEST)
		acceleration_vector["x"] = -acceleration
	if(direction & NORTH)
		acceleration_vector["y"] = acceleration
	else if(direction & SOUTH)
		acceleration_vector["y"] = -acceleration

	return acceleration_vector

/**
 * Returns the amount of acceleration to apply to the ship based on the percentage of the engines that are burning, and the time since the last burn tick.
 * * percentage - The percentage of the engines that are burning
 * * seconds_per_tick - The time since the last burn tick
 */
/datum/overmap/ship/proc/burn_engines(percentage = 100, seconds_per_tick)
	if(docked_to || docking)
		CRASH("Ship burned engines while docking or docked!")

	return acceleration_speed * (percentage / 100) * seconds_per_tick

/datum/overmap/ship/proc/change_heading(direction)
	burn_direction = direction
	if(burn_direction == BURN_NONE)
		STOP_PROCESSING(SSphysics, src)
		// [CELADON-ADD] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
		rotating = 0
		// [/CELADON-ADD]
	else
		START_PROCESSING(SSphysics, src)

/**
 * Updates the visuals of the ship based on heading and whether or not it's moving.
 */
/datum/overmap/ship/proc/update_visuals()
	var/direction = get_heading()
	if(direction & EAST)
		char_rep = ">"
	else if(direction & WEST)
		char_rep = "<"
	else if(direction & NORTH)
		char_rep = "^"
	else if(direction & SOUTH)
		char_rep = "v"
	if(direction)
		// [CELADON-EDIT] - CELADON_OVERMAP_STUFF - Это вагабонд насрал
		//		token.icon_state = "ship_moving"
		//		M.Turn(altdirection)
		//	else
		//		token.icon_state = "ship"
		token.dir = NORTH
		// [/CELADON-EDIT]


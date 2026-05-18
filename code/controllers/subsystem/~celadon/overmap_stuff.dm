// [CELADON-ADD] - OVERMAP PHYSICS - Это вагабонд насрал

SUBSYSTEM_DEF(overmap_stuff)
	name = "Overmap Stuff"
	wait = 10
	init_order = INIT_ORDER_OVERMAP
	flags = SS_KEEP_TIMING|SS_NO_TICK_CHECK
	runlevels = RUNLEVEL_SETUP | RUNLEVEL_GAME

	var/list/controlled_ships

/datum/controller/subsystem/overmap_stuff/get_metrics()
	. = ..()
	var/list/cust = list()
	cust["controlled_ships"] = length(controlled_ships)
	.["custom"] = cust

/datum/controller/subsystem/overmap_stuff/fire()
	controlled_ships = SSovermap.controlled_ships
	for(var/datum/overmap/ship/i in controlled_ships)
		if(QDELING(i) || i.docked_to)
			i.speed_x = 0
			i.speed_y = 0
		if(!i.docked_to)
			i.check_proximity()
			i.x_pixels_moved += i.speed_x*(30 SECONDS)
			i.y_pixels_moved += i.speed_y*(30 SECONDS)

			if(i.x != i.position_to_move["x"] || i.y != i.position_to_move["y"])
				i.not_tick_move(i.position_to_move["x"]-i.x, i.position_to_move["y"]-i.y)
				i.token.update_screen()
			var/list/smooth_anim = list("x" = round(i.x_pixels_moved), "y" = round(i.y_pixels_moved))

			if(i.x_pixels_moved >= 16)
				i.x_pixels_moved = i.x_pixels_moved-32
				i.position_to_move["x"] = i.x+1
			if(i.x_pixels_moved <= -16)
				i.x_pixels_moved = i.x_pixels_moved+32
				i.position_to_move["x"] = i.x-1
			if(i.y_pixels_moved >= 16)
				i.y_pixels_moved = i.y_pixels_moved-32
				i.position_to_move["y"] = i.y+1
			if(i.y_pixels_moved <= -16)
				i.y_pixels_moved = i.y_pixels_moved+32
				i.position_to_move["y"] = i.y-1

			if(i.token)
				i.token.pixel_w = i.last_anim["x"]
				i.token.pixel_z = i.last_anim["y"]

				animate(i.token, pixel_w = smooth_anim["x"], pixel_z = smooth_anim["y"], wait, 1)
				if(i.token.ship_image)
					i.token.ship_image.pixel_w = i.last_anim["x"]
					i.token.ship_image.pixel_z = i.last_anim["y"]
					animate(i.token.ship_image, pixel_w = smooth_anim["x"], pixel_z = smooth_anim["y"], wait, 1)
				if(i.token.move_vec)
					i.token.move_vec.pixel_w = i.last_anim["x"]
					i.token.move_vec.pixel_z = i.last_anim["y"]
					animate(i.token.move_vec, pixel_w = smooth_anim["x"], pixel_z = smooth_anim["y"], wait, 1)

			if(i.speed_x != 0 || i.speed_y != 0)
				if(i.skiptickfortrail < 4)
					i.skiptickfortrail = i.skiptickfortrail+1
				else
					i.skiptickfortrail = 0
					i.update_trails()
			else
				i.hide_trails()

			i.last_anim["x"] = round(i.x_pixels_moved)
			i.last_anim["y"] = round(i.y_pixels_moved)

SUBSYSTEM_DEF(overmap_rotation_velocity)
	name = "Overmap Rotation Velocity"
	wait = 4		//Пиздец немного но сойдёт
	init_order = INIT_ORDER_OVERMAP
	flags = SS_KEEP_TIMING|SS_NO_TICK_CHECK
	runlevels = RUNLEVEL_SETUP | RUNLEVEL_GAME

	var/list/controlled_ships

/datum/controller/subsystem/overmap_rotation_velocity/get_metrics()
	. = ..()
	var/list/cust = list()
	cust["controlled_ships"] = length(controlled_ships)
	.["custom"] = cust

/datum/controller/subsystem/overmap_rotation_velocity/fire()
	controlled_ships = SSovermap.controlled_ships
	for(var/datum/overmap/ship/i in controlled_ships)
		if(!i.docked_to)
			if(i.rotating == 1)
				i.bow_heading = SIMPLIFY_DEGREES(i.bow_heading+i.rotation_velocity)
				i.rotation_velocity = min(90, i.rotation_velocity+1)
			if(i.rotating == -1)
				i.bow_heading = SIMPLIFY_DEGREES(i.bow_heading+i.rotation_velocity)
				i.rotation_velocity = max(-90, i.rotation_velocity-1)

			var/matrix/N = matrix()
			N.Turn(i.bow_heading)
			if(i.token.ship_image)
				i.token.ship_image.transform = N

/datum/overmap/ship/complete_dock(datum/overmap/dock_target, datum/docking_ticket/ticket)
	if(token)
		if(token.ship_image)
			token.ship_image.forceMove(token)
		if(token.move_vec)
			token.move_vec.forceMove(token)
	. = ..()

/datum/overmap/ship/complete_undock()
	if(token)
		if(token.ship_image)
			token.ship_image.forceMove(get_turf(docked_to.token))
		if(token.move_vec)
			token.move_vec.forceMove(get_turf(docked_to.token))
	. = ..()

// [/CELADON-ADD]

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

// [/CELADON-ADD] - OVERMAP_ORBIT - orbity planet

/datum/overmap/dynamic
	var/base_offset = list("x_pixel" = 0, "y_pixel" = 0)
	var/next_pos = list("x" = 0, "y" = 0, "x_pix" = 0, "y_pix" = 0)
	var/keep_dist = -1

/datum/overmap/dynamic/Initialize()
	. = ..()
	SSovermap_orbit.controlled_planets += src

/datum/overmap/dynamic/Destroy()
	. = ..()
	SSovermap_orbit.controlled_planets -= src

/datum/overmap/star/Destroy()
	. = ..()
	if(SSovermap_orbit.star == src)
		SSovermap_orbit.star = null

SUBSYSTEM_DEF(overmap_orbit)
	name = "Overmap Orbit"
	wait = 100
	init_order = INIT_ORDER_OVERMAP
	flags = SS_KEEP_TIMING|SS_NO_TICK_CHECK
	runlevels = RUNLEVEL_SETUP | RUNLEVEL_GAME

	var/list/controlled_planets = list()

	var/datum/overmap/star/star

/datum/controller/subsystem/overmap_orbit/get_metrics()
	. = ..()
	var/list/cust = list()
	cust["controlled_planets"] = length(controlled_planets)
	.["custom"] = cust

/datum/controller/subsystem/overmap_orbit/fire()
	for(var/datum/overmap/dynamic/i in controlled_planets)
//			if(QDELING(i))
//				continue
		if(star && i.token)
			if(i.keep_dist == -1)
				i.keep_dist = get_pixel_distance(i.token, star.token)
				i.base_offset["x_pixel"] = i.token.pixel_w
				i.base_offset["y_pixel"] = i.token.pixel_z
				i.next_pos["x"] = i.token.x
				i.next_pos["y"] = i.token.y
			else
				var/check_x = i.x+(i.next_pos["x"]-i.token.x)
				var/check_y = i.y+(i.next_pos["y"]-i.token.y)
				if(check_x != i.x || check_y != i.y)
					to_chat(world, "[i] moving to [check_x] x [check_y]")
					i.overmap_move(check_x, check_y)
				i.token.x = i.next_pos["x"]
				i.token.y = i.next_pos["y"]
//			overmap_move(i.next_pos["x"], i.next_pos["y"])
				i.token.pixel_w = i.base_offset["x_pixel"]+i.next_pos["x_pix"]
				i.token.pixel_z = i.base_offset["y_pixel"]+i.next_pos["y_pix"]
				var/current_angle = SIMPLIFY_DEGREES(get_angle_raw(star.token.x, star.token.y, 0, 0, i.token.x, i.token.y, i.token.pixel_w-i.base_offset["x_pixel"], i.token.pixel_z-i.base_offset["y_pixel"]))
				var/future_angle = SIMPLIFY_DEGREES(current_angle+(22.5/(i.keep_dist/world.icon_size)))
				var/dif_pix_x = sin(future_angle)*i.keep_dist
				var/dif_pix_y = cos(future_angle)*i.keep_dist
				var/dif_x = round(dif_pix_x/32)
				var/dif_y = round(dif_pix_y/32)
				i.next_pos["x"] = star.token.x+dif_x
				i.next_pos["y"] = star.token.y+dif_y
				i.next_pos["x_pix"] = dif_pix_x-dif_x*32
				i.next_pos["y_pix"] = dif_pix_y-dif_y*32
				var/add_x_anim = (i.next_pos["x"]-i.token.x)*32
				var/add_y_anim = (i.next_pos["y"]-i.token.y)*32
				animate(i.token, pixel_w = i.base_offset["x_pixel"]+i.next_pos["x_pix"]+add_x_anim, pixel_z = i.base_offset["y_pixel"]+i.next_pos["y_pix"]+add_y_anim, time = wait, loop = 1)

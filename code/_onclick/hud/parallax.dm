
/datum/hud/proc/create_parallax(mob/viewmob)
	var/mob/screenmob = viewmob || mymob
	var/client/current_client = screenmob.client
	if (!apply_parallax_pref(viewmob)) //don't want shit computers to crash when specing someone with insane parallax, so use the viewer's pref
		return

	if(!length(current_client.parallax_layers_cached))
		current_client.parallax_layers_cached = list()

		// [CELADON-EDIT] - CELADON_PARALLAX
		// Layer 1 - Background stars (выбираем случайно 1 из 17)
		var/layer_1_index = rand(0, 16)
		var/layer_1_path = text2path("/atom/movable/screen/parallax_layer/layer_1/l_[layer_1_index]")
		var/atom/movable/screen/parallax_layer/layer_1 = new layer_1_path(null, current_client.view)
		layer_1.alpha = 200
		current_client.parallax_layers_cached += layer_1

		// Layer 2 - Nebulae
		var/list/layer_2_configs = list(
			list("type" = /atom/movable/screen/parallax_layer/layer_2, "chance" = 20, "alpha" = 150),
			list("type" = /atom/movable/screen/parallax_layer/layer_2/l_1, "chance" = 10, "alpha" = 150),
			list("type" = /atom/movable/screen/parallax_layer/layer_2/l_2, "chance" = 5, "alpha" = 150),
			list("type" = /atom/movable/screen/parallax_layer/layer_2/l_3, "chance" = 30, "alpha" = 150),
			list("type" = /atom/movable/screen/parallax_layer/layer_2/l_4, "chance" = 30, "alpha" = 150)
		)
		for(var/list/config in layer_2_configs)
			var/chance_val = config["chance"]
			if(prob(chance_val))
				var/layer_type = config["type"]
				var/atom/movable/screen/parallax_layer/new_layer = new layer_type(null, current_client.view)
				new_layer.alpha = config["alpha"]
				current_client.parallax_layers_cached += new_layer

		// Layer 3 - Foreground
		var/list/layer_3_configs = list(
			list("type" = /atom/movable/screen/parallax_layer/layer_3, "chance" = 30, "alpha" = 255),
			list("type" = /atom/movable/screen/parallax_layer/layer_3/l_1, "chance" = 30, "alpha" = 255),
			list("type" = /atom/movable/screen/parallax_layer/layer_3/l_2, "chance" = 30, "alpha" = 255)
		)
		for(var/list/config in layer_3_configs)
			var/chance_val = config["chance"]
			if(prob(chance_val))
				var/layer_type = config["type"]
				var/atom/movable/screen/parallax_layer/new_layer = new layer_type(null, current_client.view)
				new_layer.alpha = config["alpha"]
				current_client.parallax_layers_cached += new_layer

		// Layer 4 - Random objects (выбираем случайно 1 из random слоев)
		if(prob(10))
			var/list/random_types = list("trash", "asteroids")
			var/selected_type = pick(random_types)
			var/layer_4_path = selected_type ? text2path("/atom/movable/screen/parallax_layer/random/[selected_type]") : /atom/movable/screen/parallax_layer/random
			var/atom/movable/screen/parallax_layer/layer_4 = new layer_4_path(null, current_client.view)
			layer_4.alpha = 255
			current_client.parallax_layers_cached += layer_4
		// Обязательные слои
		// [/CELADON-EDIT]
		current_client.parallax_layers_cached += new /atom/movable/screen/parallax_layer/planet(null, current_client.view)
		if(SSparallax.random_layer)
			current_client.parallax_layers_cached += new SSparallax.random_layer

	current_client.parallax_layers = current_client.parallax_layers_cached.Copy()

	if (length(current_client.parallax_layers) > current_client.parallax_layers_max)
		current_client.parallax_layers.len = current_client.parallax_layers_max

	current_client.screen |= (current_client.parallax_layers)
	var/atom/movable/screen/plane_master/PM = screenmob.hud_used.plane_masters["[PLANE_SPACE]"]
	if(screenmob != mymob)
		current_client.screen -= locate(/atom/movable/screen/plane_master/parallax_white) in current_client.screen
		current_client.screen += PM
	PM.color = list(
		0, 0, 0, 0,
		0, 0, 0, 0,
		0, 0, 0, 0,
		1, 1, 1, 1,
		0, 0, 0, 0
		)


/datum/hud/proc/remove_parallax(mob/viewmob)
	var/mob/screenmob = viewmob || mymob
	var/client/current_client = screenmob.client
	current_client.screen -= (current_client.parallax_layers_cached)
	var/atom/movable/screen/plane_master/PM = screenmob.hud_used.plane_masters["[PLANE_SPACE]"]
	if(screenmob != mymob)
		current_client.screen -= locate(/atom/movable/screen/plane_master/parallax_white) in current_client.screen
		current_client.screen += PM
	PM.color = initial(PM.color)
	current_client.parallax_layers = null

/datum/hud/proc/apply_parallax_pref(mob/viewmob)
	var/mob/screenmob = viewmob || mymob

	if (SSlag_switch.measures[DISABLE_PARALLAX] && !HAS_TRAIT(viewmob, TRAIT_BYPASS_MEASURES))
		return FALSE

	var/client/current_client = screenmob.client
	if(current_client.prefs)
		var/pref = current_client.prefs.parallax
		if (isnull(pref))
			pref = PARALLAX_HIGH
		switch(current_client.prefs.parallax)
			if (PARALLAX_INSANE)
				current_client.parallax_throttle = PARALLAX_DELAY_DEFAULT
				current_client.parallax_layers_max = 5
				return TRUE

			if (PARALLAX_MED)
				current_client.parallax_throttle = PARALLAX_DELAY_MED
				current_client.parallax_layers_max = 3
				return TRUE

			if (PARALLAX_LOW)
				current_client.parallax_throttle = PARALLAX_DELAY_LOW
				current_client.parallax_layers_max = 1
				return TRUE

			if (PARALLAX_DISABLE)
				return FALSE

	//This is high parallax.
	current_client.parallax_throttle = PARALLAX_DELAY_DEFAULT
	current_client.parallax_layers_max = 4
	return TRUE

/datum/hud/proc/update_parallax_pref(mob/viewmob)
	remove_parallax(viewmob)
	create_parallax(viewmob)
	update_parallax()

// This sets which way the current shuttle is moving (returns true if the shuttle has stopped moving so the caller can append their animation)
/datum/hud/proc/set_parallax_movedir(new_parallax_movedir, skip_windups)
	. = FALSE
	var/client/current_client = mymob.client
	if(new_parallax_movedir == current_client.parallax_movedir)
		return
	var/animatedir = new_parallax_movedir
	if(new_parallax_movedir == FALSE)
		var/animate_time = 0
		for(var/thing in current_client.parallax_layers)
			var/atom/movable/screen/parallax_layer/L = thing
			L.icon_state = initial(L.icon_state)
			L.update_o(current_client.view)
			var/T = PARALLAX_LOOP_TIME / L.speed
			if (T > animate_time)
				animate_time = T
		current_client.dont_animate_parallax = world.time + min(animate_time, PARALLAX_LOOP_TIME)
		animatedir = current_client.parallax_movedir

	var/matrix/newtransform
	switch(animatedir)
		if(NORTH)
			newtransform = matrix(1, 0, 0, 0, 1, 480)
		if(SOUTH)
			newtransform = matrix(1, 0, 0, 0, 1,-480)
		if(EAST)
			newtransform = matrix(1, 0, 480, 0, 1, 0)
		if(WEST)
			newtransform = matrix(1, 0,-480, 0, 1, 0)

	var/shortesttimer
	if(!skip_windups)
		for(var/thing in current_client.parallax_layers)
			var/atom/movable/screen/parallax_layer/L = thing

			var/T = PARALLAX_LOOP_TIME / L.speed
			if (isnull(shortesttimer))
				shortesttimer = T
			if (T < shortesttimer)
				shortesttimer = T
			L.transform = newtransform
			animate(L, transform = matrix(), time = T, easing = QUAD_EASING | (new_parallax_movedir ? EASE_IN : EASE_OUT), flags = ANIMATION_END_NOW)
			if (new_parallax_movedir)
				L.transform = newtransform
				animate(transform = matrix(), time = T) //queue up another animate so lag doesn't create a shutter

	current_client.parallax_movedir = new_parallax_movedir
	if (current_client.parallax_animate_timer)
		deltimer(current_client.parallax_animate_timer)
	var/datum/callback/CB = CALLBACK(src, PROC_REF(update_parallax_motionblur), current_client, animatedir, new_parallax_movedir, newtransform)
	if(skip_windups)
		CB.Invoke()
	else
		current_client.parallax_animate_timer = addtimer(CB, min(shortesttimer, PARALLAX_LOOP_TIME), TIMER_CLIENT_TIME|TIMER_STOPPABLE)


/datum/hud/proc/update_parallax_motionblur(client/current_client, animatedir, new_parallax_movedir, matrix/newtransform)
	if(!current_client)
		return
	current_client.parallax_animate_timer = FALSE
	for(var/thing in current_client.parallax_layers)
		var/atom/movable/screen/parallax_layer/L = thing
		if (!new_parallax_movedir)
			animate(L)
			continue

		var/newstate = initial(L.icon_state)
		var/T = PARALLAX_LOOP_TIME / L.speed

		if (newstate in icon_states(L.icon))
			L.icon_state = newstate
			L.update_o(current_client.view)

		L.transform = newtransform

		animate(L, transform = L.transform, time = 0, loop = -1, flags = ANIMATION_END_NOW)
		animate(transform = matrix(), time = T)

/datum/hud/proc/update_parallax()
	var/client/current_client = mymob.client
	var/turf/posobj = get_turf(current_client.eye)
	if(!posobj)
		return
	var/area/areaobj = posobj.loc

	// Update the movement direction of the parallax if necessary (for shuttles)
	set_parallax_movedir(areaobj.parallax_movedir, FALSE)

	var/force
	if(!current_client.previous_turf || (current_client.previous_turf.z != posobj.z))
		current_client.previous_turf = posobj
		force = TRUE

	if (!force && world.time < current_client.last_parallax_shift+current_client.parallax_throttle)
		return

	//Doing it this way prevents parallax layers from "jumping" when you change Z-Levels.
	var/offset_x = posobj.x - current_client.previous_turf.x
	var/offset_y = posobj.y - current_client.previous_turf.y

	if(!offset_x && !offset_y && !force)
		return

	var/last_delay = world.time - current_client.last_parallax_shift
	last_delay = min(last_delay, current_client.parallax_throttle)
	current_client.previous_turf = posobj
	current_client.last_parallax_shift = world.time

	for(var/thing in current_client.parallax_layers)
		var/atom/movable/screen/parallax_layer/L = thing
		L.update_status(mymob)
		if (L.view_sized != current_client.view)
			L.update_o(current_client.view)

		var/change_x
		var/change_y

		if(L.absolute)
			L.offset_x = -(posobj.x - SSparallax.planet_x_offset) * L.speed
			L.offset_y = -(posobj.y - SSparallax.planet_y_offset) * L.speed
		else
			change_x = offset_x * L.speed
			L.offset_x -= change_x
			change_y = offset_y * L.speed
			L.offset_y -= change_y

			if(L.offset_x > 240)
				L.offset_x -= 480
			if(L.offset_x < -240)
				L.offset_x += 480
			if(L.offset_y > 240)
				L.offset_y -= 480
			if(L.offset_y < -240)
				L.offset_y += 480


		if(!areaobj.parallax_movedir && current_client.dont_animate_parallax <= world.time && (offset_x || offset_y) && abs(offset_x) <= max(current_client.parallax_throttle/world.tick_lag+1,1) && abs(offset_y) <= max(current_client.parallax_throttle/world.tick_lag+1,1) && (round(abs(change_x)) > 1 || round(abs(change_y)) > 1))
			L.transform = matrix(1, 0, offset_x*L.speed, 0, 1, offset_y*L.speed)
			animate(L, transform=matrix(), time = last_delay)

		L.screen_loc = "CENTER-7:[round(L.offset_x,1)],CENTER-7:[round(L.offset_y,1)]"

/atom/movable/proc/update_parallax_contents()
	if(length(client_mobs_in_contents))
		for(var/mob/client_mob as anything in client_mobs_in_contents)
			if(length(client_mob?.client?.parallax_layers) && client_mob.hud_used)
				client_mob.hud_used.update_parallax()

/mob/proc/update_parallax_teleport()	//used for arrivals shuttle
	if(client && client.eye && hud_used && length(client.parallax_layers))
		var/area/areaobj = get_area(client.eye)
		hud_used.set_parallax_movedir(areaobj.parallax_movedir, TRUE)

/atom/movable/screen/parallax_layer
	icon = 'icons/effects/parallax.dmi'
	var/speed = 1
	var/offset_x = 0
	var/offset_y = 0
	var/view_sized
	var/absolute = FALSE
	blend_mode = BLEND_ADD
	plane = PLANE_SPACE_PARALLAX
	screen_loc = "CENTER-7,CENTER-7"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT


/atom/movable/screen/parallax_layer/Initialize(mapload, view)
	. = ..()
	if (!view)
		view = world.view
	update_o(view)

/atom/movable/screen/parallax_layer/proc/update_o(view)
	if (!view)
		view = world.view

	var/list/viewscales = getviewsize(view)
	var/countx = CEILING((viewscales[1]/2)/(480/world.icon_size), 1)+1
	var/county = CEILING((viewscales[2]/2)/(480/world.icon_size), 1)+1
	var/list/new_overlays = new
	for(var/x in -countx to countx)
		for(var/y in -county to county)
			if(x == 0 && y == 0)
				continue
			var/mutable_appearance/texture_overlay = mutable_appearance(icon, icon_state)
			texture_overlay.transform = matrix(1, 0, x*480, 0, 1, y*480)
			new_overlays += texture_overlay
	cut_overlays()
	add_overlay(new_overlays)
	view_sized = view

/atom/movable/screen/parallax_layer/proc/update_status(mob/M)
	return

/atom/movable/screen/parallax_layer/layer_1
	icon_state = "layer1"
	blend_mode = BLEND_DEFAULT	// [CELADON-ADD] - CELADON_PARALLAX
	speed = 0.6
	layer = 1

/atom/movable/screen/parallax_layer/layer_2
	icon_state = "layer2"
	speed = 1
	layer = 2

/atom/movable/screen/parallax_layer/layer_3
	icon_state = "layer3"
	speed = 1.4
	layer = 3

/atom/movable/screen/parallax_layer/random
	// [CELADON-ADD] - CELADON_PARALLAX
	icon_state = "empty"
	alpha = 0
	// [/CELADON-ADD]
	blend_mode = BLEND_ADD	// [CELADON-EDIT] - CELADON_PARALLAX // ORIGINAL // blend_mode = BLEND_OVERLAY
	speed = 3
	layer = 3

/atom/movable/screen/parallax_layer/random/asteroids
	icon_state = "asteroids"
	alpha = 255

/atom/movable/screen/parallax_layer/planet
	icon_state = "planet"
	blend_mode = BLEND_OVERLAY
	absolute = TRUE //Status of seperation
	speed = 3
	layer = 30
	invisibility = INVISIBILITY_ABSTRACT //currently not used

/atom/movable/screen/parallax_layer/planet/update_o()
	icon_state = "planet"

// [CELADON-ADD] - CELADON_PARALLAX
// MARK:Random
// /atom/movable/screen/parallax_layer/random/gas
// 	icon_state = "gas"
// 	speed = 0.1

/atom/movable/screen/parallax_layer/random/trash
	icon_state = "trash"
	alpha = 255
	speed = 0.3

// /atom/movable/screen/parallax_layer/random/infection
// 	icon_state = "infection"
// 	speed = 0.6
// 	layer = 1

// MARK:Layer 1
/atom/movable/screen/parallax_layer/layer_1/l_0
	icon_state = "layer1_0"

/atom/movable/screen/parallax_layer/layer_1/l_1
	icon_state = "layer1_1"

/atom/movable/screen/parallax_layer/layer_1/l_2
	icon_state = "layer1_2"

/atom/movable/screen/parallax_layer/layer_1/l_3
	icon_state = "layer1_3"

/atom/movable/screen/parallax_layer/layer_1/l_4
	icon_state = "layer1_4"

/atom/movable/screen/parallax_layer/layer_1/l_5
	icon_state = "layer1_5"

/atom/movable/screen/parallax_layer/layer_1/l_6
	icon_state = "layer1_6"

/atom/movable/screen/parallax_layer/layer_1/l_7
	icon_state = "layer1_7"

/atom/movable/screen/parallax_layer/layer_1/l_8
	icon_state = "layer1_8"

/atom/movable/screen/parallax_layer/layer_1/l_9
	icon_state = "layer1_9"

/atom/movable/screen/parallax_layer/layer_1/l_10
	icon_state = "layer1_10"

/atom/movable/screen/parallax_layer/layer_1/l_11
	icon_state = "layer1_11"

/atom/movable/screen/parallax_layer/layer_1/l_12
	icon_state = "layer1_12"

/atom/movable/screen/parallax_layer/layer_1/l_13
	icon_state = "layer1_13"

/atom/movable/screen/parallax_layer/layer_1/l_14
	icon_state = "layer1_14"

/atom/movable/screen/parallax_layer/layer_1/l_15
	icon_state = "layer1_15"

/atom/movable/screen/parallax_layer/layer_1/l_16
	icon_state = "layer1_16"

// MARK:Layer 2
/atom/movable/screen/parallax_layer/layer_2/l_1
	icon_state = "layer2_1"

/atom/movable/screen/parallax_layer/layer_2/l_2
	icon_state = "layer2_2"

/atom/movable/screen/parallax_layer/layer_2/l_3
	icon_state = "layer2_3"

/atom/movable/screen/parallax_layer/layer_2/l_4
	icon_state = "layer2_4"

/atom/movable/screen/parallax_layer/layer_2/l_5
	icon_state = "layer2_5"

// MARK:Layer 3
/atom/movable/screen/parallax_layer/layer_3/l_1
	icon_state = "layer3_1"

/atom/movable/screen/parallax_layer/layer_3/l_2
	icon_state = "layer3_2"
// [/CELADON-ADD]

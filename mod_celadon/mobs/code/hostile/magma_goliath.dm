/mob/living/simple_animal/hostile/asteroid/goliath/magma
	name = "magma goliath"
	desc = "Огромный, закованный в броню, магмовый зверь с длинными отростками, выходящие из его спины."
	icon = 'mod_celadon/_storge_icons/icons/mobs/magma_mobs/goliaph_magma.dmi'
	icon_state = "goliath"
	icon_living = "goliath"
	icon_aggro = "goliath"
	icon_dead = "goliath_dead"
	throw_message = "does nothing to the tough hide of the"
	pre_attack_icon = "goliath_preattack"
	// mob_trophy = /obj/item/mob_trophy/goliath_tentacle
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/goliath = 2, /obj/item/stack/sheet/bone = 2, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/ore/silver = 10)
	guaranteed_butcher_results = list(/obj/item/stack/sheet/animalhide/goliath_hide = 2)
	loot = list(/obj/item/stack/ore/hellstone)
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	move_to_delay = 20
	speed = 3
	ranged_cooldown_time = 240
	tentacle_type = /obj/effect/temp_visual/goliath_tentacle/magma
	armor = list("melee" = 20, "bullet" = 60, "laser" = 60, "energy" = 60, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	maxHealth = 100
	health = 100
	mob_biotypes = MOB_MINERAL | MOB_BEAST
	var/saddled = FALSE
	var/charging = FALSE
	var/revving_charge = FALSE
	var/charge_range = 7
	var/tent_range = 3

/mob/living/simple_animal/hostile/asteroid/goliath/magma/proc/charge(atom/chargeat = target, delay = 10, chargepast = 2)
	if(!chargeat)
		return
	var/chargeturf = get_turf(chargeat)
	if(!chargeturf)
		return
	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir, chargepast)
	if(!T)
		return
	charging = TRUE
	revving_charge = TRUE
	walk(src, 0)
	setDir(dir)
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#ffa600", transform = matrix()*2, time = 3)
	SLEEP_CHECK_DEATH(delay)
	revving_charge = FALSE
	var/movespeed = 0.8
	walk_towards(src, T, movespeed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * movespeed)
	walk(src, 0) // cancel the movement
	charging = FALSE

/mob/living/simple_animal/hostile/asteroid/goliath/magma/Bump(atom/A)
	. = ..()
	if(charging && isclosedturf(A))				// We slammed into a wall while charging
		wall_slam(A)

/mob/living/simple_animal/hostile/asteroid/goliath/magma/proc/wall_slam(atom/A)
	charging = FALSE
	Stun(100, TRUE, TRUE)
	walk(src, 0)		// Cancel the movement
	if(ismineralturf(A))
		var/turf/closed/mineral/M = A
		if(M.mineralAmt < 7)
			M.mineralAmt++

/mob/living/simple_animal/hostile/asteroid/goliath/magma/OpenFire()
	var/tturf = get_turf(target)
	var/dist = get_dist(src, target)
	if(!isturf(tturf) || !isliving(target))
		return
	if(dist <= tent_range)
		visible_message(span_warning("[src] digs it's tentacles under [target]!"))
		new tentacle_type(tturf, src ,TRUE)
		ranged_cooldown = world.time + ranged_cooldown_time
		icon_state = icon_aggro
		pre_attack = 0
	else if(dist <= charge_range && can_charge)		//Screen range check, so you can't get charged offscreen
		charge()

/mob/living/simple_animal/hostile/asteroid/goliath/magma/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/saddle) && !saddled)
		if(tame && do_after(user, 55, target=src))
			user.visible_message(span_notice("You manage to put [O] on [src], you can now ride [p_them()]."))
			qdel(O)
			saddled = TRUE
			can_buckle = TRUE
			buckle_lying = FALSE
			add_overlay("goliath_saddled")
			var/datum/component/riding/D = LoadComponent(/datum/component/riding)
			D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8), TEXT_SOUTH = list(0, 8), TEXT_EAST = list(-2, 8), TEXT_WEST = list(2, 8)))
			D.set_vehicle_dir_layer(SOUTH, ABOVE_MOB_LAYER)
			D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
			D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
			D.set_vehicle_dir_layer(WEST, OBJ_LAYER)
			D.drive_verb = "ride"
		else
			user.visible_message(span_warning("[src] is rocking around! You can't put the saddle on!"))
		return
	..()

//tentacles
GLOBAL_LIST_INIT(onecardinal, NORTH) // Патерн атаки для одного щупальца

/obj/effect/temp_visual/goliath_tentacle/magma
	name = "goliath tentacle"
	icon = 'mod_celadon/_storge_icons/icons/mobs/magma_mobs/tentacle_magma.dmi'
	icon_state = "Goliath_tentacle_wiggle"
	layer = BELOW_MOB_LAYER
	wiggle = "Goliath_tentacle_spawn"
	retract = "Goliath_tentacle_retract"
	difficulty = 3

/obj/effect/temp_visual/goliath_tentacle/magma/Initialize(mapload, mob/living/new_spawner,recursive = FALSE)
	. = ..()
	flick(wiggle,src)
	for(var/obj/effect/temp_visual/goliath_tentacle/magma/T in loc)
		if(T != src)
			return INITIALIZE_HINT_QDEL
	if(!QDELETED(new_spawner))
		spawner = new_spawner
	if(ismineralturf(loc))
		var/turf/closed/mineral/M = loc
		M.gets_drilled()
	deltimer(timerid)
	timerid = addtimer(CALLBACK(src, PROC_REF(tripanim)), 7, TIMER_STOPPABLE)
	if(!recursive)
		return
	var/list/directions = get_directions()
	for(var/i in 1 to difficulty)
		var/spawndir = pick_n_take(directions)
		var/turf/T = get_step(src, spawndir)
		if(T)
			new type(T, spawner)

/obj/effect/temp_visual/goliath_tentacle/magma/get_directions()
	switch(rand(1,4))
		if(1)
			return GLOB.diagonals.Copy()
		if(2)
			return GLOB.cardinals.Copy()
		if(3)
			return GLOB.cardinals_multiz.Copy()
		if(4)
			return GLOB.onecardinal.Copy()


/obj/effect/temp_visual/goliath_tentacle/magma/tripanim()
	deltimer(timerid)
	timerid = addtimer(CALLBACK(src, PROC_REF(trip)), 3, TIMER_STOPPABLE)

/obj/effect/temp_visual/goliath_tentacle/magma/trip()
	var/latched = FALSE
	for(var/mob/living/L in loc)
		if((!QDELETED(spawner) && spawner.faction_check_mob(L)) || L.stat == DEAD)
			continue
		visible_message(span_danger("[src] wraps a mass of magma tentacles around [L]!"))
		on_hit(L)
		latched = TRUE
	if(!latched)
		retract()
	else
		deltimer(timerid)
		timerid = addtimer(CALLBACK(src, PROC_REF(retract)), 10, TIMER_STOPPABLE)

/obj/effect/temp_visual/goliath_tentacle/magma/on_hit(mob/living/target)
	target.apply_damage(rand(5,20), BURN, pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG))

/obj/effect/temp_visual/goliath_tentacle/magma/retract()
	icon_state = "marker"
	flick(retract,src)
	deltimer(timerid)
	timerid = QDEL_IN(src, 7)
	new /turf/open/lava/smooth(loc)

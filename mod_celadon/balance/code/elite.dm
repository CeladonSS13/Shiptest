//Elite mining mobs
/mob/living/simple_animal/hostile/asteroid/elite
	faction = list("elitefauna")
	maxHealth = 400
	health = 400

// Turmor
/obj/structure/elite_tumor
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/tumor.dmi'
	var/doom = FALSE
	var/mfauna

/obj/structure/elite_tumor/proc/make_activator(mob/user)
	if(activator)
		return
	activator = user
	ADD_TRAIT(user, TRAIT_ELITE_CHALLENGER, REF(src))
	RegisterSignal(user, COMSIG_PARENT_QDELETING, PROC_REF(clear_activator))
	user.log_message("activated an Elite Tumor!", LOG_GAME, color="#960000")

/obj/structure/elite_tumor/proc/clear_activator(mob/source)
	SIGNAL_HANDLER
	if(!activator)
		return
	activator = null
	REMOVE_TRAIT(source, TRAIT_ELITE_CHALLENGER, REF(src))
	UnregisterSignal(source, COMSIG_PARENT_QDELETING)

/mob/living/simple_animal/hostile/asteroid/elite/broodmother
	armor = list("melee" = 10, "bullet" = 20, "laser" = 20, "energy" = 30, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 40, "acid" = 20)
	melee_damage_lower = 10
	melee_damage_upper = 10
	armour_penetration = 0
	var/hp_high = 0
	var/hp_mid = 0
	var/hp_low = 0
	var/hp_dead = 0
	var/childragecall = 0

/mob/living/simple_animal/hostile/asteroid/elite/broodmother/update_stat()
	. = ..()
	if(hp_high != 1 && health < maxHealth * 0.75 && health >= maxHealth * 0.5)
		spawn_children()
		hp_high = 1
	if(hp_mid != 1 && health < maxHealth * 0.50 && health >= maxHealth * 0.25)
		spawn_children()
		hp_mid = 1
	if(hp_low != 1 && health < maxHealth * 0.25 && health >= 1)
		spawn_children()
		hp_low = 1
	if(hp_dead != 1 && stat == DEAD)
		spawn_children()
		hp_dead = 1

/mob/living/simple_animal/hostile/asteroid/elite/broodmother/AttackingTarget()
	if(target && isliving(target))
		if(childragecall != 0)
			call_children()
			childragecall = 0
	return ..()

/mob/living/simple_animal/hostile/asteroid/elite/herald
	armor = list("melee" = 20, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 50, "bio" = 40, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/asteroid/elite/herald/AttackingTarget()
	if(target && isliving(target))
		if(prob(10))
			herald_teleshot(target)
	return ..()

/mob/living/simple_animal/hostile/asteroid/elite/legionnaire
	armor = list("melee" = 10, "bullet" = 20, "laser" = 20, "energy" = 30, "bomb" = 40, "bio" = 100, "rad" = 20, "fire" = 20, "acid" = 20)
	speed = 5
	retreat_distance = 4
	minimum_distance = 3

/mob/living/simple_animal/hostile/asteroid/elite/legionnairehead
	melee_damage_lower = 5

/obj/structure/legionnaire_bonfire
	max_integrity = 50
	armor = list("melee" = 20, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = -10)

/obj/structure/legionnaire_bonfire/Initialize()
	. = ..()
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(1, loc)
	smoke.start()
	addtimer(CALLBACK(src, PROC_REF(conjure_broodlings)), 5 SECONDS)

/obj/structure/legionnaire_bonfire/proc/conjure_broodlings()
	var/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/A = new /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion(get_turf(src),src)
	A.faction = myowner.faction
	addtimer(CALLBACK(src, PROC_REF(conjure_broodlings)), 5 SECONDS)


/// PANDORA
/mob/living/simple_animal/hostile/asteroid/elite/pandora
	desc = "A large magic box with similar power and design to the Hierophant. Once it opens, it's not easy to close it."
	faction = list("elitefauna", "pandora")
	armor = list("melee" = 20, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 50, "bio" = 40, "rad" = 20, "fire" = 20, "acid" = 20)
	melee_damage_lower = 0
	melee_damage_upper = 0
	friendly_verb_continuous = "wails at"
	friendly_verb_simple = "wails at"
	speed = 3
	retreat_distance = 4
	minimum_distance = 3

	var/turf/startingloc	// Saves the turf the mob was created at
	var/rage_check = FALSE
	var/blast_charges = 0
	var/magicconstructs = list(/mob/living/simple_animal/hostile/construct/juggernaut/wizard/hostile,
								/mob/living/simple_animal/hostile/construct/wraith/wizard/hostile)
	var/hp_high = 0
	var/hp_mid = 0
	var/hp_low = 0
	var/hp_dead = 0

/mob/living/simple_animal/hostile/asteroid/elite/pandora/Initialize()
	. = ..()
	startingloc = get_turf(src)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/AttackingTarget()
	var/aiattack = rand(1,2)
	if(target && isliving(target))
		switch(aiattack)
			if(1)
				singular_shot(target)
			if(2)
				aoe_squares(target)
	return ..()

/mob/living/simple_animal/hostile/asteroid/elite/pandora/update_stat()
	. = ..()
	if(hp_high != 1 && health < maxHealth * 0.75 && health >= maxHealth * 0.5)
		aoe_squares(loc)
		hp_high = 1
	if(hp_mid != 1 && health < maxHealth * 0.50 && health >= maxHealth * 0.25)
		aoe_squares(loc)
		pandoras_secrets()
		hp_mid = 1
	if(hp_low != 1 && health < maxHealth * 0.25 && health >= 1)
		aoe_squares(loc)
		hp_low = 1
	if(hp_dead != 1 && stat == DEAD)
		aoe_squares(loc)
		hp_dead = 1

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/blast_spam()
	if(stat != DEAD)
		if(blast_charges >= 1)
			blast_charges -= 1
			var/list/turf/blast_turfs = RANGE_TURFS(10, startingloc)
			var/list/turf/blast_picked_turfs = list()
			for(var/i in 1 to 50)
				var/turf/T = pick_n_take(blast_turfs)
				blast_picked_turfs += T
				new /obj/effect/temp_visual/hierophant/blast/pandora(T, src)
			addtimer(CALLBACK(src, PROC_REF(blast_spam)), 3 SECONDS)
			return blast_picked_turfs
		else
			return blast_charges
	else
		return stat

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/conjure_hostiles(switchdir)
	if(stat != DEAD)
		switch(switchdir)
			if(1)
				conjure_hostile(NORTH)
				conjure_hostile(SOUTH)
				conjure_hostile(WEST)
				conjure_hostile(EAST)
				addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 2), 10 SECONDS)
	else
		return

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/conjure_hostile(dir)
	var/turf/stepturf = get_turf(src)
	var/turf/startingturf = get_turf(src)
	var/pickconstruct = pick(magicconstructs)
	for(var/T in 1 to 5)
		stepturf = get_open_turf_in_dir(stepturf, dir)
		sleep(2)
		if(get_dist(startingturf, stepturf) > 4)
			new /obj/effect/temp_visual/hierophant/blast/pandora(stepturf)
			sleep(7)
			new pickconstruct(stepturf)
		else
			if(get_open_turf_in_dir_null(stepturf, dir) == null)
				new /obj/effect/temp_visual/hierophant/blast/pandora(stepturf)
				sleep(7)
				new pickconstruct(stepturf)
			else
				new /obj/effect/temp_visual/revenant(stepturf)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/Move(atom/newloc, dir, step_x , step_y)
	if(rage_check == TRUE)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/reinforce()
	armor = list("melee" = 200, "bullet" = 200, "laser" = 200, "energy" = 200, "bomb" = 200, "bio" = 200, "rad" = 200, "fire" = 200, "acid" = 200)
	armor = getArmor(arglist(armor)) // so it actually be real armor and not simple list
	ranged = FALSE
	rage_check = TRUE

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/reinforce_end()
	armor = list("melee" = 20, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 50, "bio" = 40, "rad" = 20, "fire" = 20, "acid" = 20)
	armor = getArmor(arglist(armor))
	ranged = TRUE
	rage_check = FALSE

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/pandoras_secrets()
	if(isturf(startingloc))
		pandora_teleport(startingloc)
		reinforce()
		addtimer(CALLBACK(src, PROC_REF(reinforce_end)), 15 SECONDS)
		blast_charges += 20
		addtimer(CALLBACK(src, PROC_REF(blast_spam)), 1 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 1), 20 SECONDS)
		speed = 2.5

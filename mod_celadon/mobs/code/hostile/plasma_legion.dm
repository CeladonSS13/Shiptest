/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma
	icon = 'mod_celadon/_storge_icons/icons/mob/plasma_legion.dmi'
	name = "disfigured legion"
	desc = "Disfigured, contorted, and corrupted. This thing was once part of the legion, now it has a different vile and twisted allegiance."
	icon_state = "disfigured_legion"
	icon_living = "disfigured_legion"
	icon_aggro = "disfigured_legion"
	icon_dead = "disfigured_legion"
	brood_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/crystal_plasma
	loot = list(/obj/item/organ/regenerative_core/legion/crystal/plasma)

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/crystal_plasma
	icon = 'mod_celadon/_storge_icons/icons/mob/plasma_legion.dmi'
	name = "disfigured legion"
	desc = "One of none."
	icon_state = "disfigured_legion_head"
	icon_living = "disfigured_legion_head"
	icon_aggro = "disfigured_legion_head"
	icon_dead = "disfigured_legion_head"
	speed = 3
	move_to_delay = 1

/obj/projectile/crystal_legion
	icon = 'mod_celadon/_storge_icons/icons/mob/projectile.dmi'
	name = "Crystalline Shard"
	icon_state = "crystal_shard"
	range = 2
	damage = 6
	damage_type = BRUTE
	speed = 3

/obj/projectile/crystal_legion/on_hit(atom/target, blocked)
	. = ..()
	var/turf/turf_hit = get_turf(target)
	new /obj/effect/temp_visual/goliath_tentacle/crystal_legion(turf_hit,firer)

/obj/projectile/crystal_legion/can_hit_target(atom/target, list/passthrough, direct_target, ignore_loc)
	if(istype(target,/mob/living/simple_animal/hostile/asteroid))
		return FALSE
	return ..()

/obj/effect/temp_visual/goliath_tentacle/crystal_legion
	name = "crystalline spire"
	icon = 'mod_celadon/_storge_icons/icons/mob/32x64.dmi'
	icon_state = "crystal"
	wiggle = "crystal_growth"
	retract = "crystal_reduction"
	difficulty = 5

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/crystal_plasma/death(gibbed)
	for(var/i in 0 to 5)
		var/obj/projectile/P = new /obj/projectile/crystal_legion(get_turf(src))
		P.preparePixelProjectile(get_step(src, pick(GLOB.alldirs)), get_turf(src))
		P.firer = source
		P.fire(i*(360/3))
	return ..()

/obj/item/organ/regenerative_core/legion/crystal/plasma
	icon = 'mod_celadon/_storge_icons/icons/obj/plasma_heart.dmi'

/mob/living/simple_animal/hostile/big_plasma
	name = "Legate"
	desc = "A rare and incredibly dangerous legion mutation, forming from a plethora of legion joined in union around a young necropolis spire. It's looking particularly self-confident."
	icon = 'mod_celadon/_storge_icons/icons/mob/64x64mehafauna.dmi'
	icon_state = "plasma"
	icon_living = "plasma"
	icon_dead = "plasma"
	health_doll_icon = "plasma"
	health = 500
	maxHealth = 500
	melee_damage_lower = 30
	melee_damage_upper = 30
	anchored = FALSE
	AIStatus = AI_ON
	obj_damage = 150
	stop_automated_movement = FALSE
	wander = TRUE
	attack_verb_continuous = "brutally slams"
	attack_verb_simple = "brutally slam"
	layer = MOB_LAYER
	del_on_death = TRUE
	sentience_type = SENTIENCE_BOSS
	loot = list(/obj/item/organ/regenerative_core/legion/crystal/plasma = 3, /obj/effect/mob_spawn/human/corpse/damaged/legioninfested = 5, /obj/effect/mob_spawn/human/corpse/damaged/legioninfested = 5, /obj/effect/mob_spawn/human/corpse/damaged/legioninfested = 5)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	move_to_delay = 7
	vision_range = 4
	aggro_vision_range = 4
	speed = 8
	faction = list("mining")
	weather_immunities = list("lava","ash")
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE

/mob/living/simple_animal/hostile/big_plasma/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	visible_message("<span class='userwarning'>[src] falls over with a mighty crash, the remaining legions within it falling apart!</span>")
	new /mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma(loc)
	..(gibbed)

/mob/living/simple_animal/hostile/big_plasma/Initialize()
	.=..()
	AddComponent(/datum/component/spawner, list(/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma), 200, faction, "peels itself off from", 3)

/mob/living/simple_animal/hostile/big_legion
	icon = 'mod_celadon/_storge_icons/icons/mob/64x64mehafauna.dmi'

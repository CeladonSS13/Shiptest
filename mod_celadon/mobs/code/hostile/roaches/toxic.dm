/mob/living/simple_animal/hostile/asteroid/roach/toxic
	name = "Gestrahlte Roach"
	desc = "A hulking beast of green, congealed waste. It has an enlarged salivatory gland for lobbing projectiles."
	icon_state = "radioactiveroach"
	icon_living = "radioactiveroach_move"
	icon_aggro = "radioactiveroach_move"
	icon_dead = "radioactiveroach_dead"

	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat = 3)
	turns_per_move = 1
	maxHealth = 40
	health = 40

	weather_immunities = list("acid", "ash")

	melee_damage_lower = 5
	melee_damage_upper = 9 // Lacks penetration and wounding multiplier compared to hunter

	ranged = 1
	projectiletype = /obj/projectile/roach_spit
	attack_verb_simple = "spits glowing bile"

	robust_searching = 1
	vision_range = 5
	aggro_vision_range = 3

	mob_size = MOB_SIZE_HUMAN

	// Armor related variables
	armor = list("melee" = 0, "bullet" = 5, "laser" = 5, "energy" = 0, "bomb" = 0, "bio" = 50, "rad" = 100, "fire" = 100, "acid" = 100)

	var/poison_per_bite = 2
	var/poison_type = /datum/reagent/toxin

/mob/living/simple_animal/hostile/asteroid/roach/toxic/UnarmedAttack(atom/A, var/proximity)
	. = ..()
	if(prob(25))
		if(isliving(A))
			var/mob/living/carbon/L = A
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.apply_effect(10, EFFECT_IRRADIATE)
			L.damage_clothes(damage, damage_flag = BURN)
			playsound(src, 'mod_celadon/_storge_sounds/sound/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(span_danger("\the [src] globs up some glowing bile all over \the [L]!"))

/obj/projectile/roach_spit
	name = "Glowing bile"
	icon = 'mod_celadon/_storge_icons/icons/mobs/hivemind.dmi'
	icon_state = "goo_proj"
	damage_type = list(BURN = 15)
	irradiate = 5
	flag = "bio"
	// step_delay = 2

/obj/projectile/roach_spit/on_hit(atom/the_target)
	. = ..()
	if(!.)
		return FALSE
	if(isliving(the_target))
		var/mob/living/carbon/L = the_target
		var/damage = rand(3, 7)
		L.damage_clothes(damage, damage_flag = BURN)


// /obj/projectile/roach_spit/fire(mob/living/target_mob, distance, miss_modifier=0)
// 	if (isroach(target_mob))
// 		return FALSE // so these pass through roaches
// 	..()

/mob/living/simple_animal/hostile/asteroid/roach/toxic/proc/inject_poison(mob/living/L)
	if(poison_type && istype(L) && L.reagents)
		L.reagents.add_reagent(poison_type, poison_per_bite)

/mob/living/simple_animal/hostile/asteroid/roach/benzin
	name = "Benzin Roach"
	desc = "A monstrous, dog-sized cockroach. This one smells like welding fuel."
	icon_state = "boomroach"
	icon_living = "boomroach_move"
	icon_aggro = "boomroach"
	icon_dead = "boomroach_dead"
	turns_per_move = 4
	maxHealth = 25
	health = 25
	melee_damage_upper = 3
	butcher_results = list(/obj/item/food/meat/roachmeat/benzin = 3)
	var/total_volume = 0
	weather_immunities = list("lava", "ash")


/mob/living/simple_animal/hostile/asteroid/roach/benzin/Initialize(mapload)
	. = ..()
	set_light(0.5)
	// reagents.maximum_volume = 40


// /mob/living/simple_animal/hostile/asteroid/roach/benzin/Life()
// 	if(total_volume < reagents.maximum_volume)
// 		reagents.add_reagent("fuel", 1)
// 	..()


// /mob/living/simple_animal/hostile/asteroid/roach/benzin/adjustToxLoss()
//     return


/mob/living/simple_animal/hostile/asteroid/roach/benzin/bullet_act(obj/projectile/P, def_zone)
	. = ..()
	if(prob(80))
		explosion(get_turf(src), -1, -1, 2, 3)


/mob/living/simple_animal/hostile/asteroid/roach/benzin/attackby(obj/item/I, mob/living/user, params)
	if(user.a_intent == INTENT_HELP && istool(I))
		var/obj/item/T = I
		if(T.use_fuel_cost)
			return FALSE
	. = ..()



/mob/living/simple_animal/hostile/asteroid/roach/benzin/fire_act()
	if(stat != DEAD)
		explosion(get_turf(src), -1, -1, 2, 3)


/mob/living/simple_animal/hostile/asteroid/roach/benzin/death()
	. = ..()
	// new('icons/effects/effects.dmi', "scanline")
	// new /obj/effect/decal/cleanable(loc, reagents.get_reagent_amount("fuel"), 1)

/obj/item
	var/use_fuel_cost = 0

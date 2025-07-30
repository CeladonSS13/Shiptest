/mob/living/simple_animal/iriska
	name = "Iriska"
	desc = "The captain's own cat. Fat and lazy."
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	icon_state = "iriska"
	icon_dead = "iriska_dead"
	health = 80
	maxHealth = 80
	wander = FALSE
	turns_per_move = 0
	speak_emote = list("purrs.", "meows.")
	emote_see = list("shakes her head.", "shivers.")
	speak_chance = 0.75
	butcher_results = list(/obj/item/food/meat/slab = 6)
	response_help_simple = "pets"
	response_disarm_simple = "rubs"
	response_harm_simple = "makes terrible mistake by kicking"
	atmos_requirements = list("min_oxy" = 16, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	mob_size = MOB_SIZE_HUGE
	harm_intent_damage = 20
	melee_damage_lower = 10
	melee_damage_upper = 30
	attack_verb_simple = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'

	var/obj/item/food/snack = null

	var/list/tolerated = list()
	var/list/despised = list()

	var/min_scan_interval = 1//Minimum and maximum number of procs between a foodscan. Animals will slow down if there's no food around for a while
	var/max_scan_interval = 10
	var/scan_interval = 5		//current scan interval, clamped between min and max
								//It gradually increases up to max when its left alone, to save performance
								//It will drop back to 1 if it spies any food.
								//This short time makes animals more responsive to interactions and more fun to play with

	var/foodtarget = 0
	var/turns_since_scan = 0
	var/hunger_enabled = 1 //ignores hunger if 0
	var/nutrition_tick = 0

/mob/living/simple_animal/iriska/Initialize(mapload)
	. = ..()
	nutrition = 50

/mob/living/simple_animal/iriska/proc/can_eat()
	if (!hunger_enabled || nutrition > 45)
		return 0	//full

	else if (nutrition > 40)
		return 1	//content

	else return 2	//hungry

/mob/living/simple_animal/iriska/Life()
	.=..()

	if(AIStatus == AI_ON)
		handle_nutrition()
		seek_food()
		react_to_mob()

/mob/living/simple_animal/iriska/proc/handle_nutrition()
	if(nutrition_tick < 2)
		nutrition_tick++
	else
		nutrition--
		nutrition_tick = 0

/mob/living/simple_animal/iriska/proc/seek_food()
	turns_since_scan++
	if(turns_since_scan >= scan_interval)
		turns_since_scan = 0
		if(snack && (!(isturf(snack.loc) || (foodtarget && !can_eat()) )))
			snack = null
			foodtarget = 0
		if(!snack || !(snack.loc in oview(src, 1)))
			snack = null
			foodtarget = 0
			if (can_eat())
				for(var/obj/item/food/S in oview(src,1))
					if(!istype(S, /obj/item/food/grown))
						if(isturf(S.loc))
							snack = S
							foodtarget = 1
							break

		if(snack) // once she starts eating she will not stop until food is eaten, even if she exceeds  50 nutrition. Fat bitch
			scan_interval = min_scan_interval

			if (snack.loc.x < src.x)
				setDir(WEST)
			else if (snack.loc.x > src.x)
				setDir(EAST)
			else if (snack.loc.y < src.y)
				setDir(SOUTH)
			else if (snack.loc.y > src.y)
				setDir(NORTH)
			else
				setDir(SOUTH)

			if(isturf(snack.loc) && Adjacent(get_turf(snack), src))
				var/mob/mob = get_mob_by_key(snack.fingerprintslast)
				bite_targeted_food(snack)
				if(!(mob in despised))
					tolerate(mob)
	else
		scan_interval = max(min_scan_interval, min(scan_interval+1, max_scan_interval))

/mob/living/simple_animal/iriska/proc/bite_targeted_food()
	if(snack) //sanity
		if(snack.bite_consumption == 0 || prob(25))
			manual_emote("nibbles away at \the [snack]")
		snack.bite_consumption++
		var/satur = snack.food_reagents[/datum/reagent/consumable/nutriment]
		if(satur)
			nutrition += satur
		if(snack.bite_consumption >= 5)
			qdel(snack)

/mob/living/simple_animal/iriska/proc/react_to_mob()
	for(var/mob/living/M in oview(src, 1))
		if (M.stat != DEAD)

			if(iscorgi(M))
				if(prob(5)) to_chat(M, "pointedly ignores [M].")

			else if(iscat(M))
				var/verb = pick("meows", "mews", "mrowls")
				if(prob(5)) to_chat(M, "[verb] at [M].")

			else if(ishuman(M))
				if(M.real_name in tolerated)
					if(prob(2)) say("Meoow!")

				else if ((M.job == "Captain") && !(M.real_name in despised)) // Recognize captain
					tolerated |= M.real_name
					to_chat(M, "looks at [M] with a hint of respect.")

				else
					assert_dominance(M)

			else
				assert_dominance(M)
	return

/mob/living/simple_animal/iriska/proc/assert_dominance(var/mob/target_mob)
	if(prob(15)) say("HSSSSS")
	if(!Adjacent(target_mob))
		return
	if(isliving(target_mob))
		CanAttack(target_mob)
		return target_mob

/mob/living/simple_animal/iriska/proc/despise(mob/living/carbon/human/M as mob)
	if(istype(M))
		despised |= M.real_name
		if(M.real_name in tolerated)
			tolerated -= M.real_name

/mob/living/simple_animal/iriska/proc/tolerate(mob/living/carbon/human/M as mob)
	if(istype(M))
		if(!(M.real_name in tolerated) && prob(30))
			to_chat(M, "looks at [M] approvingly.")
			tolerated += M.real_name

/mob/living/simple_animal/iriska/attackby(var/obj/item/O, var/mob/user)
	. = ..()
	if(O.force)
		despise(user)

/mob/living/simple_animal/iriska/attack_hand(mob/living/carbon/human/M as mob)
	. = ..()
	if(M.a_intent == INTENT_DISARM)
		despise(M)
	if((M.a_intent == INTENT_HELP) && (M in tolerated))
		if(prob(15)) say("PRRRR")

/mob/living/simple_animal/iriska/death(gibbed, deathmessage = "dies!")
	.=..()

	snack = null
	return ..(gibbed,deathmessage)

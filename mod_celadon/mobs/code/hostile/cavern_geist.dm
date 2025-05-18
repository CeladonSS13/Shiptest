/mob/living/simple_animal/hostile/cavern_geist
	name = "cavern geist"
	desc = "A near-mythical adhomian predator, known to haunt the caverns. Its eyes sparkle with a mixture of intelligence and malice."
	speak_emote = list("gibbers")
	icon = 'mod_celadon/_storge_icons/icons/mobs/cavern_geist.dmi'
	icon_state = "geist"
	icon_living = "geist"
	icon_dead = "geist_dead"
	faction = list("geist")
	// universal_understand = TRUE

	mob_biotypes = MOB_ORGANIC | MOB_BEAST | MOB_HUMANOID | MOB_ROBOTIC
	// mob_push_flags = ALLMOBS

	// tameable = FALSE

	// organ_names = list("chest", "lower body", "left arm", "right arm", "left leg", "right leg", "head")
	friendly_verb_simple  = "pets"
	friendly_verb_continuous = "shoves"
	// response_harm   = "harmlessly punches"
	blood_volume = 600
	maxHealth = 500
	health = 500
	harm_intent_damage = 0
	melee_damage_lower = 40
	melee_damage_upper = 40
	armour_penetration = 20
	dodging = TRUE

	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 15, "bomb" = 15, "bio" = 15, "rad" = 15, "fire" = 15, "acid" = 15)

	atmos_requirements = IMMUNE_ATMOS_REQS
	mob_size = MOB_SIZE_LARGE
	environment_smash = 2
	attack_verb_simple = "mangled"
	attack_sound = 'mod_celadon/_storge_sounds/sound/weapons/bloodyslice.ogg'

	// see_invisible = SEE_INVISIBLE_NOLIGHTING
	possible_a_intents = list(INTENT_HELP, INTENT_GRAB, INTENT_DISARM, INTENT_HARM)
	minbodytemp = 0
	maxbodytemp = 600
	pressure_resistance = 200
	pixel_x = -16
	speed = -1

	var/is_devouring = FALSE

/mob/living/simple_animal/hostile/cavern_geist/Initialize(mapload)
	. = ..()
	// ADD_TRAIT(src, TRAIT_NIGHT_VISION, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_GOOD_CHEMICAL_NIGHTVISION, INNATE_TRAIT)
	// AddSpell(new /obj/effect/proc_holder/spell/targeted/night_vision(src))

	// Give spells
	mob_spell_list += new /obj/effect/proc_holder/spell/aoe_turf/flicker_lights(src)
	mob_spell_list += new /obj/effect/proc_holder/spell/aoe_turf/blindness(src)
	mob_spell_list += new /obj/effect/proc_holder/spell/targeted/night_vision(src)



/mob/living/simple_animal/hostile/cavern_geist/death(gibbed)
	..()
	anchored = TRUE

/mob/living/simple_animal/hostile/cavern_geist/Life()
	..()
	adjustBruteLoss(-5)

/mob/living/simple_animal/hostile/cavern_geist/verb/devour(mob/living/target as mob in oview())
	set category = "Cavern Geist"
	set name = "Devour"
	set desc = "Devours a creature, destroying its body and regenerating health."

	if(!Adjacent(target))
		return

	// if(target.isSynthetic())
	// 	return

	if(is_devouring)
		to_chat(src, span_warning("You are already feasting on something!"))
		return

	if(!health)
		to_chat(src, span_notice("You are dead, you cannot use any abilities!"))
		return

	if(last_special > world.time)
		to_chat(src, span_warning("You must wait a little while before we can use this ability again!"))
		return

	visible_message(span_warning("\The [src] begins ripping apart and feasting on [target]!"))
	is_devouring = TRUE

	target.adjustBruteLoss(35)

	if(!do_after(src,150))
		to_chat(src, span_warning("You need to wait longer to devour \the [target]!"))
		src.is_devouring = FALSE
		return FALSE

	visible_message(span_warning("[src] tears a chunk from \the [target]'s flesh!"))

	target.adjustBruteLoss(35)

	if(!do_after(src, 150))
		to_chat(src, span_warning("You need to wait longer to devour \the [target]!"))
		is_devouring = FALSE
		return FALSE

	visible_message(span_warning("[target] is completely devoured by [src]!"), \
						span_warning("You completely devour \the [target]!"))
	target.gib()

	fully_heal()
	updatehealth()
	last_special = world.time + 100
	is_devouring = FALSE
	return

/mob/living/simple_animal/hostile/cavern_geist/augmented
	name = "cybernetic cavern geist"
	desc = "A cavern geist augmented with Hadiist technology. A Tajara-made horror beyond one's comprehension."
	icon_state = "cybergeist"
	icon_living = "cybergeist"
	icon_dead = "cybergeist_dead"
	maxHealth = 700
	health = 700
	speed = -2

	melee_damage_lower = 50
	melee_damage_upper = 50
	armour_penetration = 40
	dodging = FALSE

	armor = list("melee" = 45, "bullet" = 65, "laser" = 65, "energy" = 20, "bomb" = 90, "bio" = 30, "rad" = 15, "fire" = 50, "acid" = 50)

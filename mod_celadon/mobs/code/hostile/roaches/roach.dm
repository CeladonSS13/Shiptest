/mob/living/simple_animal/hostile/asteroid/roach
	name = "Kampfer Roach"
	desc = "A monstrous, dog-sized cockroach. These huge mutants can be everywhere where humans are, on ships, planets and stations."
	icon = 'mod_celadon/_storge_icons/icons/mobs/animal.dmi'
	icon_state = "roach"
	icon_living = "roach_move"
	icon_aggro = "roach_move"
	icon_dead = "roach_dead"
	maxHealth = 10
	health = 10
	mob_size = MOB_SIZE_SMALL
	density = FALSE //Swarming roaches! They also more robust that way.
	attack_sound = 'mod_celadon/_storge_sounds/sound/insect_battle_bite.ogg'
	emote_see = list("chirps loudly.", "cleans its whiskers with forelegs.")
	turns_per_move = 4
	turns_since_move = 0
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat = 2)

	var/blattedin_revives_left = 1 // how many times blattedin can get us back to life (as num for adminbus fun).
	melee_damage_lower = 4
	melee_damage_upper = 8
	faction = list("roach")
	pass_flags = PASSTABLE
	mob_biotypes = MOB_ORGANIC | MOB_BUG
	speak_emote = list("chitters")
	verb_say = "chitters"
	verb_ask = "chitters inquisitively"
	verb_exclaim = "chitters loudly"
	verb_yell = "chitters loudly"
	environment_smash = ENVIRONMENT_SMASH_NONE
	var/atom/eat_target // target that the roach wants to eat
	var/fed = 0 // roach gets fed after eating a corpse
	var/probability_egg_laying = 25 // probability to lay an egg
	var/taming_window = 30 //How long you have to tame this roach, once it's pacified.
	var/busy_time // how long it will take to eat/lay egg
	var/busy_start_time // when it started eating/laying egg
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 25, "rad" = 50, "fire" = 0, "acid" = 0)


// When roaches die near a leader, the leader may call for reinforcements
/mob/living/simple_animal/hostile/asteroid/roach/death()
	. = ..()
	if(.)
		for(var/mob/living/simple_animal/hostile/asteroid/roach/fuhrer/F in range(src,8))
			if(!F.stat)
				F.distress_call()

		layer = BELOW_MOB_LAYER // Below stunned roaches

		if(prob(3))
			visible_message(span_danger("\the [src] hacks up a tape!"))
			new /obj/item/stack/tape(get_turf(src))

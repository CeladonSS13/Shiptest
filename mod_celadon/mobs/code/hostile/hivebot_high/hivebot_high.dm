/mob/living/simple_animal/hostile/hivebot/high_alert
	name = "hivebot high alert"
	desc = "A primitive in design, hovering robot, with some menacing looking blades jutting out from it. It bears no manufacturer markings of any kind."
	icon = 'mod_celadon/_storge_icons/icons/mobs/hivebot.dmi'
	icon_state = "hivebot"
	icon_living = "hivebot"
	icon_dead = "hivebot"
	gender = NEUTER
	mob_biotypes = MOB_ROBOTIC
	health = 35
	maxHealth = 35
	healable = 0
	melee_damage_lower = 10
	melee_damage_upper = 10
	armour_penetration = 40
	speed = 4
	movement_type = FLYING
	pass_flags = PASSTABLE | PASSGRILLE | PASSPLATFORM

	attack_verb_continuous = "slashed"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	casingtype = /obj/item/ammo_casing/c10mm
	projectilesound = 'sound/weapons/gun/pistol/shot_alt.ogg'

	armor = list("melee" = 25, "bullet" = 10, "laser" = 25, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 100, "fire" = 50, "acid" = 0)

	faction = list("hivebot")
	check_friendly_fire = 1
	atmos_requirements = IMMUNE_ATMOS_REQS
	possible_a_intents = list(INTENT_HELP, INTENT_GRAB, INTENT_DISARM, INTENT_HARM)
	minbodytemp = 0
	verb_say = "states"
	verb_ask = "queries"
	verb_exclaim = "declares"
	verb_yell = "alarms"
	bubble_icon = "machine"
	speech_span = SPAN_ROBOT
	del_on_death = 1
	minbodytemp = 0
	maxbodytemp = 600
	loot = list(
		/obj/effect/decal/cleanable/robot_debris,
		/obj/effect/spawner/random/waste/hivebot,
		/obj/effect/spawner/random/waste/hivebot/part,
		)

	emote_hear = list("emits a harsh noise")
	emote_sounds = list(
		'mod_celadon/_storge_sounds/sound/mobs/hivebot/hivebot-bark-001.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hivebot/hivebot-bark-003.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hivebot/hivebot-bark-005.ogg',
	)
	speak_chance = 5

	//yeah so it turns out that /simple_animal/hostile gets upset when you call say because say contains a sleep. so we have to do this on subtypes.
	aggro_blurb = list("focuses on", "INFILTRATOR WITHIN AO!!", "TERMINATE HOSTILE!!", "DEFEND TERMINUS!!", "CODE 7-34!!")
	aggro_blurb_chance = 10

	// footstep_type = FOOTSTEP_MOB_CLAW

	/**
	 * The hivebot beacon that we are liked to (and likely generated us)
	 */
	var/mob/living/simple_animal/hostile/hivebot/high_alert/hivebotbeacon/linked_parent = null

/mob/living/simple_animal/hostile/hivebot/high_alert/Initialize(mapload, mob/living/simple_animal/hostile/hivebot/high_alert/hivebotbeacon)
	. = ..()
	deathmessage = "[src] blows apart!"

	if(hivebotbeacon)
		linked_parent = hivebotbeacon

	if(!mapload)
		new /obj/effect/particle_effect/smoke(src.loc,30)
		playsound(src.loc, 'sound/effects/EMPulse.ogg', 25, 1)

/mob/living/simple_animal/hostile/hivebot/high_alert/Aggro()
	. = ..()
	a_intent_change(INTENT_HARM)
	update_icons()
	if(prob(aggro_blurb_chance))
		say("[pick(aggro_blurb)]", forced = type)


/mob/living/simple_animal/hostile/hivebot/high_alert/LoseAggro()
	. = ..()
	a_intent_change(INTENT_HELP)

/mob/living/simple_animal/hostile/hivebot/high_alert/a_intent_change(input as text)
	. = ..()
	update_icons()

/mob/living/simple_animal/hostile/hivebot/high_alert/update_icons()
	QDEL_NULL(alert_light)
	if(a_intent != INTENT_HELP)
		icon_state = "[initial(icon_state)]_armed"
		alert_light = mob_light(6, 0.4, COLOR_RED_LIGHT)
	else
		icon_state = initial(icon_state)

/mob/living/simple_animal/hostile/hivebot/high_alert/death(gibbed)
	do_sparks(3, TRUE, src)
	..(TRUE)

/mob/living/simple_animal/hostile/hivebot/high_alert/Destroy()
	if(linked_parent)
		linked_parent.linked_bots -= src
		linked_parent = null

	. = ..()






#define LAZYPICK(L, DEFAULT) (LAZYLEN(L) ? pick(L) : DEFAULT)

/mob/living/simple_animal
	var/list/emote_sounds
	var/sound_time = TRUE

/mob/living/simple_animal/proc/reset_sound_time()
	sound_time = TRUE

/mob/living/simple_animal/proc/speak_audio()
	if(LAZYLEN(emote_sounds))
		make_noise(TRUE)
	return

/mob/living/simple_animal/proc/make_noise(var/make_sound = TRUE)
	set name = "Make Sound"
	set category = "Abilities"

	if(stat || !make_sound) //Can't make noise if there's no noise or if you're unconscious/dead
		return

	if(usr && !sound_time)
		to_chat(usr, span_warning("Ability on cooldown 2 seconds."))
		return

	var/sound_to_play = LAZYPICK(emote_sounds, FALSE)
	if(sound_to_play)
		playsound(src, sound_to_play, 75, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	if(client)
		sound_time = FALSE
		addtimer(CALLBACK(src, PROC_REF(reset_sound_time)), 2 SECONDS)


// /mob/living/simple_animal/hostile/hivebot/high_alert/handle_automated_speech()
// 	if(speak_chance && rand(0, 200) < speak_chance)
// 		if(LAZYLEN(speak))
// 			if(LAZYLEN(emote_hear) || LAZYLEN(emote_see))
// 				var/length = speak.len
// 				if(emote_hear && emote_hear.len)
// 					length += emote_hear.len
// 				if(emote_see && emote_see.len)
// 					length += emote_see.len
// 				var/randomValue = rand(1,length)
// 				if(randomValue <= speak.len)
// 					say(pick(speak))
// 				else
// 					randomValue -= speak.len
// 					if(emote_see && randomValue <= emote_see.len)
// 						manual_emote(pick(emote_see))
// 					else
// 						manual_emote(pick(emote_hear))
// 			else
// 				say(pick(speak))
// 		else
// 			if(!(emote_hear && emote_hear.len) && (emote_see && emote_see.len))
// 				manual_emote(pick(emote_see))
// 			if((emote_hear && emote_hear.len) && !(emote_see && emote_see.len))
// 				manual_emote(pick(emote_hear))
// 			if((emote_hear && emote_hear.len) && (emote_see && emote_see.len))
// 				var/length = emote_hear.len + emote_see.len
// 				var/pick = rand(1,length)
// 				if(pick <= emote_see.len)
// 					manual_emote(pick(emote_see))
// 				else
// 					manual_emote(pick(emote_hear))
// 		speak_audio()

/mob/living/simple_animal/hostile/hivebot/high_alert/Life()
	if(speak_chance && rand(0, 200) < speak_chance)
		speak_audio()
		// handle_automated_speech()

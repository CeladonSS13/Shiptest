/////////////////Juggernaut///////////////
/mob/living/simple_animal/hostile/construct/juggernaut/wizard
	name = "Juggernaut"
	real_name = "Juggernaut"
	desc = "A massive, purple glowing armored construct built to spearhead attacks and soak up enemy fire."
	icon = 'mod_celadon/_storge_icons/icons/mobs/wizard_constructs.dmi'
	icon_state = "juggernaut"
	icon_living = "juggernaut"
	maxHealth = 150
	health = 150
	damage_coeff = list(BRUTE = 0.5, BURN = 2)
	faction = list("pandora", "Wizard")
	response_harm_continuous = "harmlessly punches"
	response_harm_simple = "harmlessly punch"
	harm_intent_damage = 0
	obj_damage = 90
	melee_damage_lower = 20
	melee_damage_upper = 40
	loot = list()
	deathmessage = "vanishes into purple dust."
	attack_verb_continuous = "smashes their armored gauntlet into"
	attack_verb_simple = "smash your armored gauntlet into"
	speed = -0.8
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = 'sound/weapons/punch3.ogg'
	status_flags = 0
	mob_size = MOB_SIZE_LARGE
	force_threshold = 10
	glowtheme = "wizard"
	// construct_spells = list(/obj/effect/proc_holder/spell/targeted/forcewall/,
	// 						/obj/effect/proc_holder/spell/targeted/projectile/dumbfire/juggernaut)
	// runetype = /datum/action/innate/cult/create_rune/wall
	// playstyle_string = "<b>You are a Juggernaut. Though slow, your shell can withstand heavy punishment,
						// create shield walls, rip apart enemies and walls alike, and even deflect energy weapons.</b>"

/mob/living/simple_animal/hostile/construct/juggernaut/wizard/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(death)), 100)

/mob/living/simple_animal/hostile/construct/juggernaut/wizard/hostile //actually hostile, will move around, hit things
	AIStatus = AI_ON
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES //only token destruction, don't smash the cult wall NO STOP

/mob/living/simple_animal/hostile/construct/juggernaut/wizard/bullet_act(obj/projectile/P)
	. = ..()

////////////////////////Wraith/////////////////////////////////////////////
/mob/living/simple_animal/hostile/construct/wraith/wizard
	name = "Wraith"
	real_name = "Wraith"
	desc = "A wicked, clawed shell constructed to assassinate enemies and sow chaos behind enemy lines."
	icon = 'mod_celadon/_storge_icons/icons/mobs/wizard_constructs.dmi'
	icon_state = "wraith"
	icon_living = "wraith"
	maxHealth = 30
	health = 30
	damage_coeff = list(BRUTE = 0.8, BURN = 2)
	faction = list("pandora", "Wizard")
	loot = list()
	melee_damage_lower = 40
	melee_damage_upper = 40
	speed = 2
	retreat_distance = 2 //AI wraiths will move in and out of combat
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	// construct_spells = list(/obj/effect/proc_holder/spell/targeted/ethereal_jaunt/shift)
	// runetype = /datum/action/innate/cult/create_rune/tele
	// playstyle_string = "<b>You are a Wraith. Though relatively fragile, you are fast, deadly, can phase through walls, and your attacks will lower the cooldown on phasing.</b>"
	glowtheme = "wizard"

/mob/living/simple_animal/hostile/construct/wraith/wizard/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(death)), 100)

// /mob/living/simple_animal/hostile/construct/wraith/wizard/AttackingTarget() //refund jaunt cooldown when attacking living targets
// 	var/prev_stat
// 	if(isliving(target) && !iscultist(target))
// 		var/mob/living/L = target
// 		prev_stat = L.stat

// 	. = ..()

// 	if(. && isnum(prev_stat))
// 		var/mob/living/L = target
// 		var/refund = 0
// 		if(QDELETED(L) || (L.stat == DEAD && prev_stat != DEAD)) //they're dead, you killed them
// 			refund += kill_refund
// 		else if(HAS_TRAIT(L, TRAIT_CRITICAL_CONDITION) && prev_stat == CONSCIOUS) //you knocked them into critical
// 			refund += crit_refund
// 		if(L.stat != DEAD && prev_stat != DEAD)
// 			refund += attack_refund
// 		for(var/obj/effect/proc_holder/spell/targeted/ethereal_jaunt/shift/S in mob_spell_list)
// 			S.charge_counter = min(S.charge_counter + refund, S.charge_max)

/mob/living/simple_animal/hostile/construct/wraith/wizard/hostile //actually hostile, will move around, hit things
	AIStatus = AI_ON

//////////////
/obj/effect/temp_visual/dir_setting/wraith/wizard
	name = "shadow"
	icon = 'mod_celadon/_storge_icons/icons/mobs/wizard_constructs.dmi'
	icon_state = "phase_shift2_wizard"
	duration = 6

/obj/effect/temp_visual/dir_setting/wraith/wizard/out
	icon_state = "phase_shift_wizard"

/obj/effect/proc_holder/spell/targeted/ethereal_jaunt/shift
	name = "Phase Shift"
	desc = "This spell allows you to pass through walls."

	school = "transmutation"
	charge_max = 250
	clothes_req = FALSE
	invocation = "none"
	invocation_type = "none"
	range = -1
	include_user = TRUE
	jaunt_duration = 50 //in deciseconds
	action_icon = 'icons/mob/actions/actions_cult.dmi'
	action_icon_state = "phaseshift"
	action_background_icon_state = "bg_demon"
	jaunt_in_time = 6
	jaunt_in_type = /obj/effect/temp_visual/dir_setting/wraith/wizard
	jaunt_out_type = /obj/effect/temp_visual/dir_setting/wraith/wizard/out

/////////////////////////////Artificer/////////////////////////
/mob/living/simple_animal/hostile/construct/artificer/wizard
	name = "Artificer"
	real_name = "Artificer"
	desc = "A bulbous construct dedicated to building and maintaining the Cult of Nar'Sie's armies."
	icon = 'mod_celadon/_storge_icons/icons/mobs/wizard_constructs.dmi'
	icon_state = "artificer"
	icon_living = "artificer"
	maxHealth = 50
	health = 50
	faction = list("pandora", "Wizard")
	loot = list()
	response_harm_continuous = "viciously beats"
	response_harm_simple = "viciously beat"
	harm_intent_damage = 5
	obj_damage = 60
	melee_damage_lower = 5
	melee_damage_upper = 5
	retreat_distance = 10
	minimum_distance = 10 //AI artificers will flee like fuck
	attack_verb_continuous = "rams"
	attack_verb_simple = "ram"
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = 'sound/weapons/punch2.ogg'
	glowtheme = "wizard"
	// construct_spells = list(/obj/effect/proc_holder/spell/aoe_turf/conjure/wall,
	// 						/obj/effect/proc_holder/spell/aoe_turf/conjure/floor,
	// 						/obj/effect/proc_holder/spell/aoe_turf/conjure/soulstone,
	// 						/obj/effect/proc_holder/spell/aoe_turf/conjure/construct/lesser,
	// 						/obj/effect/proc_holder/spell/targeted/projectile/magic_missile/lesser)
	// runetype = /datum/action/innate/cult/create_rune/revive
	// playstyle_string = "<b>You are an Artificer. You are incredibly weak and fragile, but you are able to construct fortifications,
						// use magic missile, repair allied constructs, shades, and yourself (by clicking on them),
						// <i>and, most important of all,</i> create new constructs by producing soulstones to capture souls,
						// and shells to place those soulstones into.</b>"
	// can_repair_constructs = TRUE
	// can_repair_self = TRUE

/mob/living/simple_animal/hostile/construct/artificer/wizard/hostile //actually hostile, will move around, hit things, heal other constructs
	AIStatus = AI_ON
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES //only token destruction, don't smash the cult wall NO STOP

/////////////////////////////Harvester/////////////////////////
/mob/living/simple_animal/hostile/construct/harvester/wizard
	name = "Harvester"
	real_name = "Harvester"
	desc = "A long, thin construct built to herald Nar'Sie's rise. It'll be all over soon."
	icon = 'mod_celadon/_storge_icons/icons/mobs/wizard_constructs.dmi'
	icon_state = "harvester"
	icon_living = "harvester"
	maxHealth = 40
	health = 40
	faction = list("pandora", "Wizard")
	loot = list()
	sight = SEE_MOBS
	melee_damage_lower = 15
	melee_damage_upper = 20
	attack_verb_continuous = "butchers"
	attack_verb_simple = "butcher"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	glowtheme = "wizard"
	// construct_spells = list(/obj/effect/proc_holder/spell/aoe_turf/area_conversion,
	// 						/obj/effect/proc_holder/spell/targeted/forcewall/cult)
	// playstyle_string = "<B>You are a Harvester. You are incapable of directly killing humans, but your attacks will remove their limbs:
	// 					Bring those who still cling to this world of illusion back to the Geometer so they may know Truth. Your form and any you are pulling can pass through runed walls effortlessly.</B>"
	// can_repair_constructs = TRUE

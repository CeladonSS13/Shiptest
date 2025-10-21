/mob/living/basic/iriska
	name = "Iriska"
	desc = "The captain's own cat. Fat and lazy. She's absolutely massive and looks impossibly heavy."
	icon = 'mod_celadon/_storage_icons/icons/mobs/pet_content/pets.dmi'
	icon_state = "iriska"
	icon_dead = "iriska_dead"
	health = 250
	maxHealth = 250
	speak_emote = list("purrs.", "meows.")
	butcher_results = list(/obj/item/food/meat/slab = 6)
	response_help_simple = "pets"
	response_disarm_simple = "rubs"
	response_harm_simple = "makes terrible mistake by kicking"
	mob_size = MOB_SIZE_HUGE
	melee_damage_lower = 10
	melee_damage_upper = 20
	attack_verb_simple = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	ai_controller = /datum/ai_controller/basic_controller/iriska

	armor = list(MELEE = 20, BULLET = 20, LASER = 5, ENERGY = 15, BOMB = 10, BIO = 0, FIRE = 10, ACID = 0)

	var/list/tolerated = list()
	var/list/despised = list()
	var/nutrition_tick = 0
	var/hunger_timer = 0
	var/last_hunger_emote = 0
	var/killer_name = null
	var/rage_target = null
	var/rage_timer = 0
	var/list/ranged_attackers = list()

/mob/living/basic/iriska/Initialize(mapload)
	. = ..()
	nutrition = 50

/mob/living/basic/iriska/can_be_pulled(atom/movable/puller, grab_state, force, supress_message)
	if(ismecha(puller))
		return TRUE
	if(!supress_message)
		to_chat(puller, "<span class='warning'>[src] is far too heavy to move by hand! You'd need a mech or something equally powerful.</span>")
		manual_emote("doesn't budge an inch despite [puller]'s efforts")
	return FALSE

/mob/living/basic/iriska/Move()
	return FALSE

/mob/living/basic/iriska/forceMove(atom/destination)
	if(ismecha(usr))
		return ..(destination)
	return FALSE

/mob/living/basic/iriska/bullet_act(obj/projectile/P)
	if(P.firer && ishuman(P.firer))
		var/mob/living/carbon/human/shooter = P.firer
		despised += shooter.real_name
		if(shooter.real_name in tolerated)
			tolerated -= shooter.real_name
		ranged_attackers += shooter.real_name
		manual_emote("roars in fury at being shot by [shooter]!")
		say("RRRAAAAWWWWRRRR!")

		if(prob(50))
			to_chat(shooter, "<span class='userdanger'>You feel Iriska's hateful gaze burning into your soul...</span>")
			playsound(shooter, 'sound/hallucinations/growl1.ogg', 50, TRUE)

	if(prob(40))
		manual_emote("shrugs off the attack, her thick fat absorbing most of the impact")
		visible_message("[P] seems to barely penetrate [src]'s thick hide!")

	return ..()

/mob/living/basic/iriska/apply_damage(damage, damagetype = BRUTE, def_zone = null, blocked = 0, forced = FALSE, spread_damage = FALSE, wound_bonus = 0, bare_wound_bonus = 0, sharpness = NONE)
	if(damagetype == BRUTE || damagetype == BURN)
		damage = damage * 0.6
		if(prob(25))
			manual_emote("wobbles as her fat absorbs the impact")
			visible_message("The attack seems to sink into [src]'s massive bulk!")

	return ..(damage, damagetype, def_zone, blocked, forced, spread_damage, wound_bonus, bare_wound_bonus, sharpness)

/mob/living/basic/iriska/attackby(obj/item/O, mob/user)
	var/is_food = FALSE
	if(istype(O, /obj/item/food) || istype(O, /obj/item/reagent_containers/food) || (O.reagents && O.reagents.has_reagent(/datum/reagent/consumable/nutriment)))
		is_food = TRUE

	if(is_food && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.real_name in despised)
			manual_emote("refuses the food from [H] with disdain")
			say("HISSSS!")
			return

		if(nutrition < 45)
			manual_emote("eagerly devours the [O]")
			nutrition = min(nutrition + 10, 50)
			hunger_timer = 0
			if(!(H.real_name in tolerated) && prob(40))
				tolerated += H.real_name
				manual_emote("looks at [H] approvingly")
			say("Purrr...")
			qdel(O)
			return
		else
			manual_emote("sniffs the food but walks away, already full")
			return

	. = ..()
	if(O.force && ishuman(user))
		var/mob/living/carbon/human/H = user
		despised += H.real_name
		if(H.real_name in tolerated)
			tolerated -= H.real_name
		manual_emote("hisses angrily at [H], eyes filled with hatred")
		rage_target = H
		rage_timer = 100
		manual_emote("enters a furious rage!")
		say("RRRAAAAWWWWRRRR!")

/mob/living/basic/iriska/attack_hand(mob/living/carbon/human/M)
	if(!ishuman(M))
		return ..()

	if(M.real_name in despised)
		manual_emote("hisses and tries to scratch [M]")
		say("HISSSS!")
		if(prob(40))
			manual_emote("raises her massive paw menacingly")
			if(prob(30))
				M.apply_damage(rand(25, 45), BRUTE, pick(BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
				M.visible_message("[src] swipes [M] with her huge paw!", "Iriska's paw hits you like a sledgehammer!")
				playsound(src, attack_sound, 50, TRUE)
				killer_name = M.real_name
		return

	if(M.a_intent == INTENT_DISARM)
		despised += M.real_name
		if(M.real_name in tolerated)
			tolerated -= M.real_name
		manual_emote("hisses angrily at [M], eyes filled with hatred")
		return ..()

	if(M.a_intent == INTENT_HARM)
		despised += M.real_name
		if(M.real_name in tolerated)
			tolerated -= M.real_name
		rage_target = M
		rage_timer = 100
		manual_emote("enters a furious rage!")
		say("RRRAAAAWWWWRRRR!")
		return ..()

	if(M.a_intent == INTENT_HELP && M.real_name in tolerated)
		if(prob(20))
			say("PRRRR")
			manual_emote("purrs contentedly as [M] pets her")
		return

	return ..()

/mob/living/basic/iriska/death(gibbed, deathmessage = "dies!")
	rage_timer = 0
	rage_target = null

	if(killer_name)
		log_game("[killer_name] killed Iriska the cat.")
		message_admins("[killer_name] has killed Iriska and received the curse!")

	for(var/attacker_name in ranged_attackers)
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H.real_name == attacker_name)
				to_chat(H, "<span class='userdanger'>Iriska's dying curse reaches you across the station... You feel watched.</span>")
				playsound(H, 'sound/hallucinations/wail.ogg', 25, TRUE)

	playsound(src, 'sound/hallucinations/wail.ogg', 100, TRUE)
	for(var/mob/M in range(10, src))
		if(M.client)
			to_chat(M, "<span class='danger'>A bone-chilling wail echoes through the air as Iriska's spirit departs...</span>")

	return ..(gibbed, deathmessage)

/datum/ai_controller/basic_controller/iriska
	ai_movement = /datum/ai_movement/basic_avoidance
	planning_subtrees = list(
		/datum/ai_planning_subtree/iriska_behavior,
	)

/datum/ai_planning_subtree/iriska_behavior

/datum/ai_planning_subtree/iriska_behavior/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/mob/living/basic/iriska/cat = controller.pawn
	if(!istype(cat))
		return

	var/players_nearby = FALSE
	for(var/mob/living/carbon/human/H in range(7, cat))
		if(H.client && H.stat != DEAD)
			players_nearby = TRUE
			break

	if(!players_nearby)
		return

	if(cat.nutrition_tick < 3)
		cat.nutrition_tick++
	else
		cat.nutrition = max(0, cat.nutrition - 1)
		cat.nutrition_tick = 0

	if(cat.nutrition < 30 && cat.stat != DEAD)
		cat.hunger_timer++
		if(cat.hunger_timer > 10 && world.time - cat.last_hunger_emote > 300)
			cat.manual_emote("looks around hungrily and meows pitifully")
			cat.say("Mrow... mrow...")
			cat.balloon_alert_to_viewers("hungry!")
			cat.last_hunger_emote = world.time

		if(cat.hunger_timer > 20)
			cat.balloon_alert_to_viewers("starving!")
	else
		cat.hunger_timer = 0

	for(var/obj/item/S in range(1, cat))
		var/is_food = FALSE
		if(istype(S, /obj/item/food) || istype(S, /obj/item/reagent_containers/food) || (S.reagents && S.reagents.has_reagent(/datum/reagent/consumable/nutriment)))
			is_food = TRUE

		if(is_food && isturf(S.loc) && cat.nutrition < 45)
			cat.manual_emote("nibbles away at \the [S]")
			cat.nutrition = min(cat.nutrition + 5, 50)
			cat.hunger_timer = 0
			qdel(S)
			break

	if(cat.rage_timer > 0 && cat.stat != DEAD)
		cat.rage_timer--
		if(cat.rage_target && get_dist(cat, cat.rage_target) <= 1)
			var/mob/living/carbon/human/target = cat.rage_target
			if(target.stat != DEAD && target.health > 0)
				cat.manual_emote("savagely mauls [target]!")
				target.apply_damage(rand(35, 55), BRUTE, pick(BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
				if(prob(25))
					target.apply_damage(20, BRUTE, pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG))
					target.visible_message("[cat] brutally mauls [target]!", "Iriska tears into you with uncontrolled fury!")
				playsound(cat, cat.attack_sound, 75, TRUE)
				cat.killer_name = target.real_name
				if(target.health <= 0)
					cat.rage_timer = 0
					cat.rage_target = null
					cat.manual_emote("stands over the beaten [target], breathing heavily")
		else
			cat.rage_timer = 0
			cat.rage_target = null

	for(var/mob/living/carbon/human/M in range(1, cat))
		if(M.stat == DEAD || !M.client)
			continue

		if(M.real_name in cat.despised && cat.stat != DEAD)
			if(prob(30))
				cat.say("HISSSS!")
			if(prob(20))
				cat.manual_emote("raises her massive paw menacingly")
				if(prob(30))
					M.apply_damage(rand(25, 45), BRUTE, pick(BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
					if(prob(15))
						M.apply_damage(15, BRUTE, pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG))
						M.visible_message("[cat] strikes [M] with bone-crushing force!", "You feel something crack under Iriska's massive paw!")
					else
						M.visible_message("[cat] swipes [M] with her huge paw!", "Iriska's paw hits you like a sledgehammer!")
					playsound(cat, cat.attack_sound, 50, TRUE)
					cat.killer_name = M.real_name

		else if(M.real_name in cat.tolerated)
			if(prob(5))
				cat.say("Meoow!")

		else if(M.job == "Captain")
			cat.tolerated += M.real_name
			cat.manual_emote("looks at [M] with respect")

		else if(cat.nutrition < 30 && cat.hunger_timer > 15)
			if(!(M.real_name in cat.tolerated))
				cat.despised += M.real_name
				cat.manual_emote("glares angrily, remembering [M.real_name]'s neglect")

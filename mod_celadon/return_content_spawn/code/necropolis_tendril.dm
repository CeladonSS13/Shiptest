//Necropolis Tendrils, which spawn lavaland monsters and break into a chasm when killed
/obj/structure/spawner/lavaland
	name = "necropolis tendril"
	desc = "A vile tendril of corruption, originating deep underground. Terrible monsters are pouring out of it."

	icon_state = "tendril"

	faction = list("mining")
	max_mobs = 5
	max_integrity = 450
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/tendril)

	move_resist = INFINITY // just killing it tears a massive hole in the ground, let's not move it
	anchored = TRUE
	resistance_flags = FIRE_PROOF | LAVA_PROOF

	hitsound_type = PROJECTILE_HITSOUND_FLESH

	var/gps = null
	var/obj/effect/light_emitter/tendril/emitted_light

GLOBAL_LIST_INIT(tendrils, list())
/obj/structure/spawner/lavaland/Initialize()
	. = ..()
	emitted_light = new(loc)
	for(var/F in RANGE_TURFS(1, src))
		if(ismineralturf(F))
			var/turf/closed/mineral/M = F
			M.ScrapeAway(null, CHANGETURF_IGNORE_AIR)
	GLOB.tendrils += src

/obj/structure/spawner/lavaland/deconstruct(disassembled)
	new /obj/effect/collapse(loc)
	new /obj/structure/closet/crate/necropolis/tendril(loc)
	return ..()


/obj/structure/spawner/lavaland/Destroy()
	var/last_tendril = TRUE
	if(GLOB.tendrils.len>1)
		last_tendril = FALSE

	if(last_tendril && !(flags_1 & ADMIN_SPAWNED_1))
		if(SSachievements.achievements_enabled)
			for(var/mob/living/L in view(7,src))
				if(L.stat || !L.client)
					continue
				L.client.give_award(/datum/award/achievement/boss/tendril_exterminator, L)
				L.client.give_award(/datum/award/score/tendril_score, L) //Progresses score by one
	GLOB.tendrils -= src
	QDEL_NULL(emitted_light)
	return ..()

/obj/effect/light_emitter/tendril
	set_luminosity = 4
	set_cap = 2.5
	light_color = LIGHT_COLOR_LAVA

/obj/effect/collapse
	name = "collapsing necropolis tendril"
	desc = "Get clear!"
	layer = TABLE_LAYER
	icon = 'icons/mob/nest.dmi'
	icon_state = "tendril"
	anchored = TRUE
	density = TRUE
	var/obj/effect/light_emitter/tendril/emitted_light

/obj/effect/collapse/Initialize()
	. = ..()
	emitted_light = new(loc)
	visible_message(span_boldannounce("The tendril writhes in fury as the earth around it begins to crack and break apart! Get back!"))
	visible_message(span_warning("Something falls free of the tendril!"))
	playsound(loc,'sound/effects/tendril_destroyed.ogg', 200, FALSE, 50, TRUE, TRUE)
	addtimer(CALLBACK(src, PROC_REF(collapse)), 50)

/obj/effect/collapse/Destroy()
	QDEL_NULL(emitted_light)
	return ..()

/obj/effect/collapse/proc/collapse()
	for(var/mob/M in range(7,src))
		shake_camera(M, 15, 1)
	playsound(get_turf(src),'sound/effects/explosionfar.ogg', 200, TRUE)
	visible_message(span_boldannounce("The tendril falls inward, the ground around it erupting into bubbling lava!")) //WS edit.
	for(var/turf/T in range(2,src))
		if(!T.density)
			T.TerraformTurf(/turf/open/lava/smooth/lava_land_surface, /turf/open/lava/smooth/lava_land_surface, flags = CHANGETURF_INHERIT_AIR) //WS edit, instead of chasms this produces lava instead.
	qdel(src)

/obj/structure/closet/crate/necropolis/tendril/PopulateContents()
	var/loot = rand(1,29)
	switch(loot)
		if(1,2)
			new /obj/item/shared_storage/red(src)
		if(3)
			new /obj/item/necromantic_stone/lava(src)
		if(4)
			new /obj/item/clothing/neck/memento_mori(src)
		if(5)
			new /obj/item/gem/bloodstone(src)
		if(6)
			new /obj/item/reagent_containers/glass/bottle/potion/flight(src)
		if(7)
			new /obj/item/pickaxe/diamond(src)
			new /obj/item/t_scanner/adv_mining_scanner(src)
		if(8)
			if(prob(50))
				new /obj/item/disk/design_disk/modkit_disc/resonator_blast(src)
			else
				new /obj/item/disk/design_disk/modkit_disc/rapid_repeater(src)
		if(9)
			new /obj/item/rod_of_asclepius(src)
		if(10)
			new /obj/item/organ/heart/cursed/wizard(src)
		if(11)
			new /obj/item/ship_in_a_bottle(src)
		if(12)
			new /obj/item/clothing/suit/space/hardsuit/berserker(src)
		if(13)
			new /obj/item/borg/upgrade/modkit/lifesteal(src)
			new /obj/item/bedsheet/cult(src)
		if(14)
			new /obj/item/gem/bloodstone(src)
		if(15)
			new /obj/item/book_of_babel(src)
		if(16)
			new /obj/item/melee/cleaving_saw
		if(17)
			if(prob(50))
				new /obj/item/disk/design_disk/modkit_disc/mob_and_turf_aoe(src)
			else
				new /obj/item/disk/design_disk/modkit_disc/bounty(src)
		if(18)
			new /obj/item/warp_cube/red(src)
		if(19)
			new /obj/item/wisp_lantern(src)
		if(20)
			new /obj/item/immortality_talisman(src)
		if(21)
			new /obj/item/organ/cyberimp/arm/katana(src)
		if(22)
			new /obj/item/voodoo(src)
		if(23)
			new /obj/item/book/granter/spell/summonitem(src)
		if(24)
			new /obj/item/book/granter/spell/smoke(src)
			//new /obj/item/clothing/gloves/gauntlets(src) //I'm too lazy to fix them, sorry...
		if(25)
			new /obj/item/toy/plush/blahaj(src)
			new /obj/item/storage/belt/sabre/solgov(src)
		if(26)
			new /obj/item/freeze_cube(src)
		if(27)
			new /obj/item/gun/energy/spur(src)
		if(28)
			new /obj/item/clothing/suit/armor/ascetic(src)
		if(29)
			new /obj/item/clothing/glasses/godeye(src)

/obj/item/organ/cyberimp/arm/katana
	name = "dark shard"
	desc = "An eerie metal shard surrounded by dark energies."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "cursed_katana_organ"
	status = ORGAN_ORGANIC
	organ_flags = ORGAN_FROZEN
	items_list = list(/obj/item/cursed_katana)
	extend_sound = 'sound/items/unsheath.ogg'
	retract_sound = 'sound/items/sheath.ogg'
	contents = newlist(/obj/item/cursed_katana)

/obj/item/organ/cyberimp/arm/katana/attack_self(mob/user, modifiers)
	. = ..()
	to_chat(user, span_userdanger("The mass goes up your arm and goes inside it!"))
	playsound(user, 'sound/magic/demon_consume.ogg', 50, TRUE)
	var/index = user.get_held_index_of_item(src)
	zone = (index == LEFT_HANDS ? BODY_ZONE_L_ARM : BODY_ZONE_R_ARM)
	SetSlotFromZone()
	user.temporarilyRemoveItemFromInventory(src, TRUE)
	Insert(user)

/obj/item/organ/cyberimp/arm/katana/screwdriver_act(mob/living/user, obj/item/screwtool)
	return

/obj/item/organ/cyberimp/arm/katana/Retract()
	var/obj/item/cursed_katana/katana = active_item
	if(!katana || katana.shattered)
		return
	if(!katana.drew_blood)
		to_chat(owner, span_userdanger("[katana] lashes out at you in hunger!"))
		playsound(owner, 'sound/magic/demon_attack1.ogg', 50, TRUE)
		var/obj/item/bodypart/part = owner.get_holding_bodypart_of_item(katana)
		if(part)
			part.receive_damage(brute = 25, wound_bonus = 10, sharpness = SHARP_EDGED)
	katana.drew_blood = FALSE
	katana.wash(CLEAN_TYPE_BLOOD)
	return ..()

#define LEFT_SLASH "Left Slash"
#define RIGHT_SLASH "Right Slash"
#define COMBO_STEPS "steps"
#define COMBO_PROC "proc"
#define ATTACK_STRIKE "Hilt Strike"
#define ATTACK_SLICE "Wide Slice"
#define ATTACK_DASH "Dash Attack"
#define ATTACK_CUT "Tendon Cut"
#define ATTACK_CLOAK "Dark Cloak"
#define ATTACK_SHATTER "Shatter"

/obj/item/cursed_katana
	name = "cursed katana"
	desc = "A katana used to seal something vile away long ago. \
	Even with the weapon destroyed, all the pieces containing the creature have coagulated back together to find a new host."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "cursed_katana"
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/swords_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/swords_righthand.dmi'
	force = 15
	armour_penetration = 30
	block_chance = 30
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_HUGE
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "tore", "lacerated", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/rapierhit.ogg'
	resistance_flags = LAVA_PROOF | FIRE_PROOF | UNACIDABLE | FREEZE_PROOF
	var/shattered = FALSE
	var/drew_blood = FALSE
	var/timerid
	var/list/input_list = list()
	var/list/combo_strings = list()
	var/static/list/combo_list = list(
		ATTACK_STRIKE = list(COMBO_STEPS = list(LEFT_SLASH, LEFT_SLASH, RIGHT_SLASH), COMBO_PROC = PROC_REF(strike)),
		ATTACK_SLICE = list(COMBO_STEPS = list(RIGHT_SLASH, LEFT_SLASH, LEFT_SLASH), COMBO_PROC = PROC_REF(slice)),
		ATTACK_DASH = list(COMBO_STEPS = list(LEFT_SLASH, RIGHT_SLASH, RIGHT_SLASH), COMBO_PROC = PROC_REF(dash)),
		ATTACK_CUT = list(COMBO_STEPS = list(RIGHT_SLASH, RIGHT_SLASH, LEFT_SLASH), COMBO_PROC = PROC_REF(cut)),
		ATTACK_CLOAK = list(COMBO_STEPS = list(LEFT_SLASH, RIGHT_SLASH, LEFT_SLASH, RIGHT_SLASH), COMBO_PROC = PROC_REF(cloak)),
		ATTACK_SHATTER = list(COMBO_STEPS = list(RIGHT_SLASH, LEFT_SLASH, RIGHT_SLASH, LEFT_SLASH), COMBO_PROC = PROC_REF(shatter)),
		)

/obj/item/cursed_katana/Initialize(mapload)
	. = ..()
	for(var/combo in combo_list)
		var/list/combo_specifics = combo_list[combo]
		var/step_string = english_list(combo_specifics[COMBO_STEPS])
		combo_strings += span_notice("<b>[combo]</b> - [step_string]")

/obj/item/cursed_katana/examine(mob/user)
	. = ..()
	. += drew_blood ? span_nicegreen("It's sated... for now.") : span_danger("It will not be sated until it tastes blood.")
	. += span_notice("<i>There seem to be inscriptions on it... you could examine them closer?</i>")

/obj/item/cursed_katana/examine_more(mob/user)
	. = ..()
	. += combo_strings

/obj/item/cursed_katana/dropped(mob/user)
	. = ..()
	reset_inputs(null, TRUE)
	if(isturf(loc))
		qdel(src)

/obj/item/cursed_katana/attack_self(mob/user)
	. = ..()
	reset_inputs(user, TRUE)

/obj/item/cursed_katana/attack(mob/living/target, mob/user, click_parameters)
	if(target.stat == DEAD || target == user)
		return ..()
	if(HAS_TRAIT(user, TRAIT_PACIFISM))
		balloon_alert(user, "you don't want to harm!")
		return
	drew_blood = TRUE
	var/list/modifiers = params2list(click_parameters)
	if(LAZYACCESS(modifiers, RIGHT_CLICK))
		input_list += RIGHT_SLASH
	if(LAZYACCESS(modifiers, LEFT_CLICK))
		input_list += LEFT_SLASH
	if(ishostile(target))
		user.changeNext_move(CLICK_CD_RAPID)
	if(length(input_list) > 4)
		reset_inputs(user, TRUE)
	if(check_input(target, user))
		reset_inputs(null, TRUE)
		return TRUE
	else
		timerid = addtimer(CALLBACK(src, PROC_REF(reset_inputs), user, FALSE), 5 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_STOPPABLE)
		return ..()

/obj/item/cursed_katana/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		final_block_chance = 0 //Don't bring a sword to a gunfight
	return ..()

/obj/item/cursed_katana/proc/check_input(mob/living/target, mob/user)
	for(var/combo in combo_list)
		var/list/combo_specifics = combo_list[combo]
		if(compare_list(input_list,combo_specifics[COMBO_STEPS]))
			INVOKE_ASYNC(src, combo_specifics[COMBO_PROC], target, user)
			return TRUE
	return FALSE

/obj/item/cursed_katana/proc/reset_inputs(mob/user, deltimer)
	input_list.Cut()
	if(user)
		balloon_alert(user, "you return to neutral stance")
	if(deltimer && timerid)
		deltimer(timerid)

/obj/item/cursed_katana/proc/strike(mob/living/target, mob/user)
	user.visible_message(span_warning("[user] strikes [target] with [src]'s hilt!"),
		span_notice("You hilt strike [target]!"))
	to_chat(target, span_userdanger("You've been struck by [user]!"))
	playsound(src, 'sound/weapons/melee/heavyblunt_hit3.ogg', 50, TRUE)
	RegisterSignal(target, COMSIG_MOVABLE_IMPACT, PROC_REF(strike_throw_impact))
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	target.throw_at(throw_target, 5, 3, user, FALSE, gentle = TRUE)
	target.apply_damage(damage = 17, bare_wound_bonus = 10)
	to_chat(target, span_userdanger("You've been struck by [user]!"))
	user.do_attack_animation(target, ATTACK_EFFECT_PUNCH)

/obj/item/cursed_katana/proc/strike_throw_impact(mob/living/source, atom/hit_atom, datum/thrownthing/thrownthing)
	SIGNAL_HANDLER

	UnregisterSignal(source, COMSIG_MOVABLE_IMPACT)
	if(isclosedturf(hit_atom))
		source.apply_damage(damage = 5)
		if(ishostile(source))
			var/mob/living/simple_animal/hostile/target = source
			target.ranged_cooldown += 5 SECONDS
		else if(iscarbon(source))
			var/mob/living/carbon/target = source
			target.confused = max(target.confused, 8)
	return NONE

/obj/item/cursed_katana/proc/slice(mob/living/target, mob/user)
	user.visible_message(span_warning("[user] does a wide slice!"),
		span_notice("You do a wide slice!"))
	playsound(src, 'mod_celadon/_storage_sounds/sound/weapons/sword_kill_slash_02.ogg', 50, TRUE)
	var/turf/user_turf = get_turf(user)
	var/dir_to_target = get_dir(user_turf, get_turf(target))
	var/static/list/cursed_katana_slice_angles = list(0, -45, 45, -90, 90) //so that the animation animates towards the target clicked and not towards a side target
	for(var/iteration in cursed_katana_slice_angles)
		var/turf/turf = get_step(user_turf, turn(dir_to_target, iteration))
		user.do_attack_animation(turf, ATTACK_EFFECT_SLASH)
		for(var/mob/living/additional_target in turf)
			if(user.Adjacent(additional_target) && additional_target.density)
				additional_target.apply_damage(damage = 15, sharpness = SHARP_EDGED, bare_wound_bonus = 10)
				to_chat(additional_target, span_userdanger("You've been sliced by [user]!"))
	target.apply_damage(damage = 5, sharpness = SHARP_EDGED, wound_bonus = 10)

/obj/item/cursed_katana/proc/cloak(mob/living/target, mob/user)
	user.alpha = 150
	user.invisibility = INVISIBILITY_OBSERVER // so hostile mobs cant see us or target us
	user.sight |= SEE_SELF // so we can see us
	user.visible_message(span_warning("[user] vanishes into thin air!"),
		span_notice("You enter the dark cloak."))
	playsound(src, 'sound/magic/smoke.ogg', 50, TRUE)
	if(ishostile(target))
		var/mob/living/simple_animal/hostile/hostile_target = target
		hostile_target.LoseTarget()
	addtimer(CALLBACK(src, PROC_REF(uncloak), user), 5 SECONDS, TIMER_UNIQUE)

/obj/item/cursed_katana/proc/uncloak(mob/user)
	user.alpha = 255
	user.invisibility = 0
	user.update_sight()
	user.sight &= SEE_SELF
	user.visible_message(span_warning("[user] appears from thin air!"),
		span_notice("You exit the dark cloak."))
	playsound(src, 'sound/magic/summonitems_generic.ogg', 50, TRUE)

/obj/item/cursed_katana/proc/cut(mob/living/target, mob/user)
	user.visible_message(span_warning("[user] cuts [target]'s tendons!"),
		span_notice("You tendon cut [target]!"))
	to_chat(target, span_userdanger("Your tendons have been cut by [user]!"))
	target.apply_damage(damage = 15, sharpness = SHARP_EDGED, wound_bonus = 15)
	user.do_attack_animation(target, ATTACK_EFFECT_DISARM)
	playsound(src, 'sound/weapons/rapierhit.ogg', 50, TRUE)
	var/datum/status_effect/stacking/saw_bleed/bloodletting/status = target.has_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting)
	if(!status)
		target.apply_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting, 6)
	else
		status.add_stacks(6)

/obj/item/cursed_katana/proc/dash(mob/living/target, mob/user)
	user.visible_message(span_warning("[user] dashes through [target]!"),
		span_notice("You dash through [target]!"))
	to_chat(target, span_userdanger("[user] dashes through you!"))
	playsound(src, 'sound/magic/blink.ogg', 50, TRUE)
	target.apply_damage(damage = 17, sharpness = SHARP_POINTY, bare_wound_bonus = 10)
	var/turf/dash_target = get_turf(target)
	for(var/distance in 0 to 8)
		var/turf/current_dash_target = dash_target
		current_dash_target = get_step(current_dash_target, user.dir)
		if(!current_dash_target.is_blocked_turf(TRUE))
			dash_target = current_dash_target
		else
			break
	new /obj/effect/temp_visual/mook_dust(get_turf(user))
	do_teleport(user, dash_target, channel = TELEPORT_CHANNEL_MAGIC)

/obj/item/cursed_katana/proc/shatter(mob/living/target, mob/user)
	user.visible_message(span_warning("[user] shatters [src] over [target]!"),
		span_notice("You shatter [src] over [target]!"))
	to_chat(target, span_userdanger("[user] shatters [src] over you!"))
	target.apply_damage(damage = ishostile(target) ? 75 : 35, wound_bonus = 20)
	user.do_attack_animation(target, ATTACK_EFFECT_SMASH)
	playsound(src, 'sound/effects/glassbr3.ogg', 100, TRUE)
	shattered = TRUE
	moveToNullspace()
	balloon_alert(user, "katana shattered")
	addtimer(CALLBACK(src, PROC_REF(coagulate), user), 45 SECONDS)

/obj/item/cursed_katana/proc/coagulate(mob/user)
	to_chat(user, span_userdanger("Katana coagulated"))
	shattered = FALSE
	playsound(src, 'sound/magic/demon_consume.ogg', 50, TRUE)

#undef LEFT_SLASH
#undef RIGHT_SLASH
#undef COMBO_STEPS
#undef COMBO_PROC
#undef ATTACK_STRIKE
#undef ATTACK_SLICE
#undef ATTACK_DASH
#undef ATTACK_CUT
#undef ATTACK_CLOAK
#undef ATTACK_SHATTER

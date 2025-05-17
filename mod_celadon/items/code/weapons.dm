/obj/item/nullrod/tribal_knife
	icon_state = "crysknife"
	item_state = "crysknife"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	name = "arrhythmic knife"
	w_class = WEIGHT_CLASS_HUGE
	desc = "They say fear is the true mind killer, but stabbing them in the head works too. Honour compels you to not sheathe it once drawn."
	sharpness = IS_SHARP
	slot_flags = null
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	item_flags = SLOWS_WHILE_IN_HAND

/obj/item/nullrod/tribal_knife/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	AddComponent(/datum/component/butchering, 50, 100)

/obj/item/nullrod/tribal_knife/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/nullrod/tribal_knife/process()
	slowdown = rand(-2, 2)

/obj/item/melee/baseball_bat/homerun/central_command
	name = "тактическая бита"
	desc = "Выдвижная тактическая бита Центрального Командования. \
	В официальных документах эта бита проходит под элегантным названием \"Высокоскоростная система доставки Наказаний\". \
	Выдаваясь только самым верным и эффективным офицерам, это оружие является одновременно символом статуса \
	и инструментом высшего правосудия."
	icon = 'mod_celadon/_storge_icons/icons/items/obj/centcom.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/overlay/left_hand/left_centcom.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/overlay/right_hand/right_centcom.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/on_bit = FALSE
	force = 40
	var/force_on = 60
	item_state = "centcom_bat_0"
	var/item_state_on = "centcom_bat_1"
	icon_state = "centcom_bat_0"
	var/icon_state_on = "centcom_bat_1"
	var/extend_sound = 'sound/weapons/batonextend.ogg'
	attack_verb = list("hit", "poked")
	var/list/attack_verb_on = list("smacked", "struck", "cracked", "beaten")
	armour_penetration = 100
	throwforce = 35

/obj/item/melee/baseball_bat/homerun/central_command/srt
	name = "тактическая бита"
	desc = "Выдвижная тактическая бита Центрального Командования. Скорее всего, к этому моменту капитаны уже осознали, что их коленные чашечки не переживут эту встречу."
	item_state = "srt_bat_0"
	item_state_on = "srt_bat_1"
	icon_state = "srt_bat_0"
	icon_state_on = "srt_bat_1"

/obj/item/melee/baseball_bat/homerun/central_command/update_icon_state()
	icon_state = on_bit ? icon_state_on : initial(icon_state)
	item_state = on_bit ? item_state_on : initial(item_state)
	return ..()

/obj/item/melee/baseball_bat/homerun/central_command/proc/toggle(mob/living/user)
	on_bit = !on_bit
	slot_flags = on_bit ? NONE : ITEM_SLOT_BELT
	force = on_bit ? force_on : initial(force)
	attack_verb = on_bit ? attack_verb_on : initial(attack_verb)
	w_class = on_bit ? WEIGHT_CLASS_HUGE : WEIGHT_CLASS_SMALL
	homerun_able = on_bit
	homerun_ready = on_bit
	update_icon(UPDATE_ICON_STATE)
	playsound(loc, extend_sound, 50, TRUE)
	add_fingerprint(user)
	if(on_bit)
		to_chat(user, span_userdanger("Вы активировали [name] - время для правосудия!"))
	else
		to_chat(user, span_notice("Вы деактивировали [name]."))


/obj/item/melee/baseball_bat/homerun/central_command/pickup(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_MINDSHIELD))
		to_chat(user, span_cultlarge("\"Это - оружие истинного правосудия. Тебе не дано обуздать его мощь.\""))
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(50, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
			H.apply_damage(50, BRAIN, BODY_ZONE_HEAD)
			H.apply_effect(30, EFFECT_KNOCKDOWN)
			H.apply_effect(100, EFFECT_STUN)
			H.drop_all_held_items()
			H.dropItemToGround(src, TRUE)
		else
			user.adjustBruteLoss(100)
		return FALSE
	return ..()

/obj/item/melee/baseball_bat/homerun/central_command/attack_self(mob/user)
	toggle(user)

/obj/item/melee/baseball_bat/homerun/central_command/attack(mob/living/target, mob/living/user)
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(homerun_ready)
		user.visible_message(span_userdanger("С глаз долой!"))
		target.throw_at(throw_target, rand(10,12), 16, user)
		target.take_bodypart_damage(force_on)
		target.apply_effect(100, EFFECT_STUN)
		SSexplosions.medturf += throw_target
		playsound(get_turf(src), 'sound/weapons/homerun.ogg', 100, TRUE)
		homerun_ready = 0
		return
	else if(!target.anchored)
		target.throw_at(throw_target, rand(1,2), 2, user, gentle = TRUE)
		target.take_bodypart_damage(force)
		target.apply_effect(50, EFFECT_STUN)
	return ..()

/obj/item/melee/baseball_bat/homerun/central_command/attacked_by(mob/living/user)
	var/mob/living/carbon/human/H = user
	H.take_bodypart_damage(force)
	H.apply_effect(100, EFFECT_STUN)
	to_chat(user, span_cultlarge("\"Туда тебя!\""))

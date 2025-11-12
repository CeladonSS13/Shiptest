// MARK: ОДНОРАЗОВЫЙ ЕМАГ

/obj/item/card/emag/disposable
	name = "одноразовый криптографический секвенсор"
	desc = "Дешевая версия ЕМАГ, которая самоуничтожается после использования."

/obj/item/card/emag/disposable/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(. && proximity)
		to_chat(user, span_warning("[src] начинает дымиться и рассыпается в пепел!"))
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		qdel(src)

// MARK: Mjolnir Kiker

/obj/item/mjollnir_kiker
	name = "Mjollnir"
	desc = "Странный молот, который может не только больно ударить током, но и временно изгнать кого-то с этого мира. Используйте с осторожностью! У него три заряда!"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/hammer.dmi'
	icon_state = "mjollnir0"
	base_icon_state = "mjollnir"
	mob_overlay_state = "mjollnir"
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/hammers_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/hammers_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	force = 5
	throwforce = 30
	throw_range = 7
	w_class = WEIGHT_CLASS_HUGE
	var/kick_uses = 0
	var/max_kicks = 3

/obj/item/mjollnir_kiker/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		force_multiplier = 5, \
		icon_wielded = "[base_icon_state]1", \
		attacksound = SFX_SPARKS, \
	)

/obj/item/mjollnir_kiker/update_icon_state()
	icon_state = "[base_icon_state]0"
	return ..()

/obj/item/mjollnir_kiker/proc/shock(mob/living/target, mob/user)
	target.Stun(1.5 SECONDS)
	target.Knockdown(10 SECONDS)
	var/datum/effect_system/lightning_spread/s = new /datum/effect_system/lightning_spread
	s.set_up(5, 1, target.loc)
	s.start()
	target.visible_message(span_danger("[target.name] is shocked by [src]!"), \
		span_userdanger("You feel a powerful shock course through your body sending you flying!"), \
		span_hear("You hear a heavy electrical crack!"))
	var/atom/throw_target = get_edge_target_turf(target, get_dir(src, get_step_away(target, src)))
	target.throw_at(throw_target, 200, 4)

	if(!isliving(target))
		return

	if(target.client)
		visible_message(span_danger("[user] ударяет [target] [src]!"))
		to_chat(target, span_userdanger("Вас изгоняют с этого мира!"))
		message_admins("[ADMIN_LOOKUPFLW(user)] использовал Mjollnir и кикнул [ADMIN_LOOKUPFLW(target)] с сервера в [ADMIN_VERBOSEJMP(src)].")
		qdel(target.client)
		kick_uses++
		if(kick_uses >= max_kicks)
			visible_message(span_boldwarning("[src] начинает светиться и вибрировать!"))
			addtimer(CALLBACK(src, PROC_REF(explode)), 2 SECONDS)
			return
		to_chat(user, span_warning("[src] использован [kick_uses]/[max_kicks] раз."))

/obj/item/mjollnir_kiker/attack(mob/living/target_mob, mob/user)
	..()
	if(QDELETED(target_mob))
		return
	if(HAS_TRAIT(user, TRAIT_PACIFISM))
		return
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		shock(target_mob, user)

/obj/item/mjollnir_kiker/proc/explode()
	var/turf/T = get_turf(src)
	visible_message(span_boldannounce("[src] взрывается с оглушительным грохотом!"))
	playsound(T, 'sound/effects/explosion2.ogg', 100, TRUE)
	for(var/mob/living/L in range(3, T))
		L.Knockdown(5 SECONDS)
		L.adjustBruteLoss(30)
		L.Stun(3 SECONDS)
	qdel(src)

/obj/item/mjollnir_kiker/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!QDELETED(hit_atom) && isliving(hit_atom))
		var/mob/thrown_by = thrownby?.resolve()
		shock(hit_atom, thrown_by)

/obj/item/mjollnir_kiker/infiniti
	name = "Mjollnir Infinity"
	desc = "Легендарный молот с бесконечной силой изгнания. Никогда не взрывается."
	max_kicks = INFINITY

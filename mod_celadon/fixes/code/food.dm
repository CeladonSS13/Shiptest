/obj/item/food/attack(mob/M, mob/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(M != user)
		// Feeding another player - handle manually to avoid edible component issues
		var/datum/component/edible/edible_comp = GetComponent(/datum/component/edible)
		if(!edible_comp)
			return ..()

		if(!edible_comp.CanConsume(M, user))
			return FALSE

		M.visible_message(span_notice("[user] attempts to feed [M] [src]."), \
			span_notice("[user] attempts to feed you [src]."))
		if(!do_after(user, 3 SECONDS, target = M))
			return FALSE
		M.visible_message(span_notice("[user] feeds [M] [src]."), \
			span_notice("[user] feeds you [src]."))
		log_combat(user, M, "fed", src)

		// Take a bite manually
		edible_comp.TakeBite(M, user)
		return TRUE

	// Self-eating - let parent handle
	return ..()

/datum/martial_art/cqc/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(A.a_intent == INTENT_GRAB && A!=D && can_use(A) && !A.resting) // A!=D prevents grabbing yourself
		add_to_streak("G",D)
		if(check_streak(A,D)) //if a combo is made no grab upgrade is done
			return TRUE
		old_grab_state = A.grab_state
		D.grabbedby(A, 1)
		if(old_grab_state == GRAB_PASSIVE)
			D.drop_all_held_items()
			A.setGrabState(GRAB_AGGRESSIVE) //Instant agressive grab if on grab intent
			log_combat(A, D, "grabbed", addition="aggressively")
			D.visible_message(span_warning("[A] violently grabs [D]!"), \
							span_userdanger("You're grabbed violently by [A]!"), span_hear("You hear sounds of aggressive fondling!"), COMBAT_MESSAGE_RANGE, A)
			to_chat(A, span_danger("You violently grab [D]!"))
		return TRUE
	else
		return FALSE

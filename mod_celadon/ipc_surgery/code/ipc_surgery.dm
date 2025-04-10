/datum/surgery/robo_brain_surgery
	name = "Robotic brain surgery"
	requires_bodypart_type = BODYTYPE_ROBOTIC
	steps = list(
		/datum/surgery_step/mechanic_open,
		/datum/surgery_step/open_hatch,
		/datum/surgery_step/prepare_electronics,
		/datum/surgery_step/fix_robo_brain,
		/datum/surgery_step/mechanic_close
	)
	lying_required = TRUE
	possible_locs = list(BODY_ZONE_CHEST) // ipc brain in chest
	self_operable = TRUE
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)

/datum/surgery/robo_brain_surgery/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/brain/mmi_holder/brain = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(!istype(brain))
		return FALSE
	return TRUE

/datum/surgery_step/fix_robo_brain
	name = "recalibrate positronic brain"
	implements = list(
		TOOL_MULTITOOL = 100)
	repeatable = TRUE
	time = 10 SECONDS //long and complicated
	preop_sound = 'sound/items/tape_flip.ogg'
	success_sound = 'sound/items/taperecorder_close.ogg'
	failure_sound = 'sound/machines/defib_zap.ogg'
	experience_given = 0 // per_trauma

/datum/surgery_step/heal/mechanic
	implements = list(TOOL_WELDER = 100,
				TOOL_WIRECUTTER = 100,
				TOOL_CAUTERY = 60,
				TOOL_HEMOSTAT = 60,
				TOOL_RETRACTOR = 60)

/datum/surgery_step/fix_robo_brain/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, span_notice("You begin to fix [target]'s robotic brain..."),
		span_notice("[user] begins to fix [target]'s robotic brain."),
		span_notice("[user] begins to perform surgery on [target]'s robotic brain."))

/datum/surgery_step/fix_robo_brain/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	display_results(user, target, span_notice("You succeed in fixing [target]'s robotic brain."),
		span_notice("[user] successfully fixes [target]'s robotic brain!"),
		span_notice("[user] completes the surgery on [target]'s robotic brain."))
	if(target.mind?.has_antag_datum(/datum/antagonist/brainwashed))
		target.mind.remove_antag_datum(/datum/antagonist/brainwashed)
	target.setOrganLoss(ORGAN_SLOT_BRAIN, target.getOrganLoss(ORGAN_SLOT_BRAIN) - 50)	//we set damage in this case in order to clear the "failing" flag
	var/cured_num = target.cure_all_traumas(TRAUMA_RESILIENCE_SURGERY)
	experience_given = (MEDICAL_SKILL_EASY*2*cured_num)
	if(target.getOrganLoss(ORGAN_SLOT_BRAIN) > 0)
		to_chat(user, "[target]'s robotic brain looks like it could be fixed further.")
	return ..()

/datum/surgery_step/fix_robo_brain/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.getorganslot(ORGAN_SLOT_BRAIN))
		display_results(user, target, span_warning("You screw up, causing more damage!"),
			span_warning("[user] screws up, causing brain damage!"),
			span_notice("[user] completes the surgery on [target]'s robotic brain."))
		target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 60)
		target.gain_trauma_type(BRAIN_TRAUMA_SEVERE, TRAUMA_RESILIENCE_LOBOTOMY)
	else
		user.visible_message(span_warning("[user] suddenly notices that the robotic brain [user.p_they()] [user.p_were()] working on is not there anymore."), span_warning("You suddenly notice that the brain you were working on is not there anymore."))
	return FALSE

/datum/surgery/brain_surgery/can_start(mob/user, mob/living/carbon/target)
	. = ..()
	if (!.)
		return

	if (istype(target.getorganslot(ORGAN_SLOT_BRAIN), /obj/item/organ/brain/mmi_holder/posibrain))
		return FALSE

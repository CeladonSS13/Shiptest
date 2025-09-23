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

/datum/surgery/healing/mechanic
	name = "Repair machinery"
	requires_bodypart_type = BODYTYPE_ROBOTIC
	replaced_by = null
	steps = list(
		/datum/surgery_step/mechanic_open,
		/datum/surgery_step/heal/mechanic,
		/datum/surgery_step/mechanic_close
	)
	lying_required = FALSE
	self_operable = TRUE

/datum/surgery_step/heal/mechanic
	name = "repair components"
	implements = list(TOOL_WELDER = 100,
				TOOL_WIRECUTTER = 100,
				TOOL_CAUTERY = 60,
				TOOL_HEMOSTAT = 60,
				TOOL_RETRACTOR = 60,
				/obj/item/melee/energy = 40,
				/obj/item/gun/energy/laser = 20)
	time = 2 SECONDS
	//missinghpbonus = 10

/datum/surgery_step/heal/mechanic/tool_check(mob/user, obj/item/tool)
	if(istype(tool,/obj/item/weldingtool))
		var/obj/item/weldingtool/W = tool
		if(!W.welding)
			return FALSE
	return TRUE

/datum/surgery_step/heal/mechanic/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/repairtype
	if(tool.tool_behaviour == TOOL_WELDER || tool.tool_behaviour == TOOL_CAUTERY || istype(tool, /obj/item/melee/energy) || istype(tool, /obj/item/gun/energy/laser))
		brutehealing = 5
		burnhealing = 0
		repairtype = "dents"
		success_sound = pick('sound/items/welder2.ogg','sound/items/welder.ogg')
		success_sound = pick('sound/items/welder2.ogg','sound/items/welder.ogg')
	if(tool.tool_behaviour == TOOL_WIRECUTTER || tool.tool_behaviour == TOOL_HEMOSTAT || tool.tool_behaviour == TOOL_RETRACTOR)
		burnhealing = 5
		brutehealing = 0
		repairtype = "wiring"
		success_sound = 'sound/items/wirecutter.ogg'
	if(istype(surgery,/datum/surgery/healing))
		var/datum/surgery/healing/the_surgery = surgery
		if(!the_surgery.antispam)
			display_results(user, target, span_notice("You attempt to fix some of [target]'s [repairtype]."),
		span_notice("[user] attempts to fix some of [target]'s [repairtype]."),
		span_notice("[user] attempts to fix some of [target]'s [repairtype]."))

/datum/surgery_step/heal/mechanic/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/umsg = "You succeed in fixing some of [target]'s damages" //no period, add initial space to "addons"
	var/tmsg = "[user] fixes some of [target]'s damages" //see above
	var/urhealedamt_brute = brutehealing
	var/urhealedamt_burn = burnhealing
	//if(missinghpbonus)
	//	urhealedamt_brute += round((target.getBruteLoss()/ missinghpbonus),0.1)
	//	urhealedamt_burn += round((target.getFireLoss()/ missinghpbonus),0.1)

	if(!get_location_accessible(target, target_zone))
		urhealedamt_brute *= 0.55
		urhealedamt_burn *= 0.55
		umsg += " as best as you can while they have clothing on"
		tmsg += " as best as they can while [target] has clothing on"
	experience_given = CEILING((target.heal_bodypart_damage(urhealedamt_brute,urhealedamt_burn)/5),1)
	display_results(user, target, span_notice("[umsg]."),
		"[tmsg].",
		"[tmsg].")
	if(istype(surgery, /datum/surgery/healing))
		var/datum/surgery/healing/the_surgery = surgery
		the_surgery.antispam = TRUE
	return TRUE

/datum/surgery_step/heal/mechanic/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob)
	display_results(user, target, span_warning("You screwed up!"),
		span_warning("[user] screws up!"),
		span_notice("[user] fixes some of [target]'s damages."), TRUE)
	var/urdamageamt_burn = brutehealing * 0.8
	var/urdamageamt_brute = burnhealing * 0.8
	//Reset heal checks
	burnhealing = 0
	brutehealing = 0
	//if(missinghpbonus)
	//	urdamageamt_brute += round((target.getBruteLoss()/ (missinghpbonus*2)),0.1)
	//	urdamageamt_burn += round((target.getFireLoss()/ (missinghpbonus*2)),0.1)
	if((fail_prob > 50) && (tool.tool_behaviour == TOOL_WIRECUTTER || tool.tool_behaviour == TOOL_HEMOSTAT || tool.tool_behaviour == TOOL_RETRACTOR))
		do_sparks(3, TRUE, target)
		if(isliving(user))
			var/mob/living/L = user
			L.electrocute_act(urdamageamt_burn, target)
	target.take_bodypart_damage(urdamageamt_brute, urdamageamt_burn)
	return FALSE

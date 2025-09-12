/datum/surgery_step/opening_mouth
	name = "force open mouth"
	time = 2.4 SECONDS
	
	implements = list(
		TOOL_RETRACTOR = 100,
		TOOL_SCREWDRIVER = 40,
		/obj/item/stack/rods = 10)

	preop_sound = 'sound/machines/creaking.ogg'

/datum/surgery_step/opening_mouth/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, span_notice("You start to force open [target]'s mouth..."),
		span_notice("[user] starts forcibly opening [target]'s mouth."),
		span_notice("[user] starts forcibly opening [target]'s mouth."))

/datum/surgery_step/drilling_teeth
	name = "drilling teeth"
	implements = list(TOOL_DRILL = 100)
	time = 2 SECONDS

/datum/surgery_step/drilling_teeth/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, span_notice("You start drilling [target]'s teeth..."),
		span_notice("[user] starts drilling [target]'s teeth."),
		span_notice("[user] starts drilling [target]'s teeth."))

/datum/surgery_step/drilling_teeth/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	target.apply_damage(30, BRUTE, "[target_zone]", wound_bonus = CANT_WOUND)
	return ..()

/datum/surgery_step/dental_repair
	name = "dental repair"
	implements = list(TOOL_BONESET = 100)
	time = 2 SECONDS

/datum/surgery_step/dental_repair/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, span_notice("You're starting to rebuild [target]'s teeth..."),
		span_notice("[user] starts to restore teeth [target]'s."),
		span_notice("[user] starts to restore teeth [target]'s."))

/datum/surgery_step/dental_repair/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results)
	REMOVE_TRAIT(target, TRAIT_BROKEN_TEETH, TRAIT_BROKEN_TEETH)
	return ..()

/datum/surgery_step/dental_repair/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	target.apply_damage(30, BRUTE, "[target_zone]", wound_bonus = CANT_WOUND)
	return ..()

/datum/surgery/teeth_repair
	name = "Teeth repair"
	requires_real_bodypart = BODYPART_ORGANIC
	possible_locs = list(BODY_ZONE_PRECISE_MOUTH)
	
	steps = list(
		/datum/surgery_step/opening_mouth,
		/datum/surgery_step/drilling_teeth,
		/datum/surgery_step/dental_repair
	)

/datum/surgery/teeth_repair/can_start(mob/user, mob/living/patient)
	. = ..()
	if(!ishuman(patient))
		return
	var/mob/living/carbon/human/H = patient
	if(!HAS_TRAIT(H, TRAIT_BROKEN_TEETH))
		return FALSE
	return TRUE

// [CELADON-REMOVE] - FIXES_REPAIR_PUNCTURE_SURGERY
/*
/////BURN FIXING SURGERIES//////

//the step numbers of each of these two, we only currently use the first to switch back and forth due to advancing after finishing steps anyway
#define REALIGN_INNARDS 1
#define WELD_VEINS 2

///// Repair puncture wounds
/datum/surgery/repair_puncture
	name = "Repair puncture"
	steps = list(/datum/surgery_step/incise, /datum/surgery_step/repair_innards, /datum/surgery_step/seal_veins, /datum/surgery_step/close) // repeat between steps 2 and 3 until healed
	target_mobtypes = list(/mob/living/carbon)
	possible_locs = list(BODY_ZONE_R_ARM,BODY_ZONE_L_ARM,BODY_ZONE_R_LEG,BODY_ZONE_L_LEG,BODY_ZONE_CHEST,BODY_ZONE_HEAD)
	requires_real_bodypart = TRUE
	targetable_wound = /datum/wound/pierce

/datum/surgery/repair_puncture/can_start(mob/living/user, mob/living/carbon/target)
	. = ..()
	if(.)
		var/obj/item/bodypart/targeted_bodypart = target.get_bodypart(user.zone_selected)
		var/datum/wound/burn/pierce_wound = targeted_bodypart.get_wound_type(targetable_wound)
		return(pierce_wound && pierce_wound.blood_flow > 0)

//SURGERY STEPS

///// realign the blood vessels so we can reweld them
/datum/surgery_step/repair_innards
	name = "realign blood vessels"
	implements = list(TOOL_HEMOSTAT = 100, TOOL_SCALPEL = 85, TOOL_WIRECUTTER = 40)
	time = 3 SECONDS

/datum/surgery_step/repair_innards/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/pierce/pierce_wound = surgery.operated_wound
	if(!pierce_wound)
		user.visible_message("<span class='notice'>[user] looks for [target]'s [parse_zone(user.zone_selected)].</span>", "<span class='notice'>You look for [target]'s [parse_zone(user.zone_selected)]...</span>")
		return

	if(pierce_wound.blood_flow <= 0)
		to_chat(user, "<span class='notice'>[target]'s [parse_zone(user.zone_selected)] has no puncture to repair!</span>")
		surgery.status++
		return

	display_results(user, target, "<span class='notice'>You begin to realign the torn blood vessels in [target]'s [parse_zone(user.zone_selected)]...</span>",
		"<span class='notice'>[user] begins to realign the torn blood vessels in [target]'s [parse_zone(user.zone_selected)] with [tool].</span>",
		"<span class='notice'>[user] begins to realign the torn blood vessels in [target]'s [parse_zone(user.zone_selected)].</span>")

/datum/surgery_step/repair_innards/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/datum/wound/pierce/pierce_wound = surgery.operated_wound
	if(!pierce_wound)
		to_chat(user, "<span class='warning'>[target] has no puncture wound there!</span>")
		return ..()

	display_results(user, target, "<span class='notice'>You successfully realign some of the blood vessels in [target]'s [parse_zone(target_zone)].</span>",
		"<span class='notice'>[user] successfully realigns some of the blood vessels in [target]'s [parse_zone(target_zone)] with [tool]!</span>",
		"<span class='notice'>[user] successfully realigns some of the blood vessels in  [target]'s [parse_zone(target_zone)]!</span>")
	log_combat(user, target, "excised infected flesh in", addition="INTENT: [uppertext(user.a_intent)]")
	surgery.operated_bodypart.receive_damage(brute=3, wound_bonus=CANT_WOUND)
	pierce_wound.blood_flow -= 0.25
	return ..()

/datum/surgery_step/repair_innards/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob = 0)
	. = ..()
	display_results(user, target, "<span class='notice'>You jerk apart some of the blood vessels in [target]'s [parse_zone(target_zone)].</span>",
		"<span class='notice'>[user] jerks apart some of the blood vessels in [target]'s [parse_zone(target_zone)] with [tool]!</span>",
		"<span class='notice'>[user] jerk apart some of the blood vessels in [target]'s [parse_zone(target_zone)]!</span>")
	surgery.operated_bodypart.receive_damage(brute=rand(4,8), sharpness=SHARP_EDGED, wound_bonus = 10)

///// Sealing the vessels back together
/datum/surgery_step/seal_veins
	name = "weld veins" // if your doctor says they're going to weld your blood vessels back together, you're either A) on SS13, or B) in grave mortal peril
	implements = list(TOOL_CAUTERY = 100, /obj/item/gun/energy/laser = 90, TOOL_WELDER = 70, /obj/item = 30)
	time = 4 SECONDS

/datum/surgery_step/seal_veins/tool_check(mob/user, obj/item/tool)
	if(implement_type == TOOL_WELDER || implement_type == /obj/item)
		return tool.get_temperature()

	return TRUE

/datum/surgery_step/seal_veins/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/pierce/pierce_wound = surgery.operated_wound
	if(!pierce_wound)
		user.visible_message("<span class='notice'>[user] looks for [target]'s [parse_zone(user.zone_selected)].</span>", "<span class='notice'>You look for [target]'s [parse_zone(user.zone_selected)]...</span>")
		return
	display_results(user, target, "<span class='notice'>You begin to meld some of the split blood vessels in [target]'s [parse_zone(user.zone_selected)]...</span>",
		"<span class='notice'>[user] begins to meld some of the split blood vessels in [target]'s [parse_zone(user.zone_selected)] with [tool].</span>",
		"<span class='notice'>[user] begins to meld some of the split blood vessels in [target]'s [parse_zone(user.zone_selected)].</span>")

/datum/surgery_step/seal_veins/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/datum/wound/pierce/pierce_wound = surgery.operated_wound
	if(!pierce_wound)
		to_chat(user, "<span class='warning'>[target] has no puncture there!</span>")
		return ..()

	display_results(user, target, "<span class='notice'>You successfully meld some of the split blood vessels in [target]'s [parse_zone(target_zone)] with [tool].</span>",
		"<span class='notice'>[user] successfully melds some of the split blood vessels in [target]'s [parse_zone(target_zone)] with [tool]!</span>",
		"<span class='notice'>[user] successfully melds some of the split blood vessels in [target]'s [parse_zone(target_zone)]!</span>")
	log_combat(user, target, "dressed burns in", addition="INTENT: [uppertext(user.a_intent)]")
	pierce_wound.blood_flow -= 0.5
	if(pierce_wound.blood_flow > 0)
		surgery.status = REALIGN_INNARDS
		to_chat(user, "<span class='notice'><i>There still seems to be misaligned blood vessels to finish...<i></span>")
	else
		to_chat(user, "<span class='green'>You've repaired all the internal damage in [target]'s [parse_zone(target_zone)]!</span>")
	return ..()

#undef REALIGN_INNARDS
#undef WELD_VEINS
*/
// [/CELADON-REMOVE]

// [CELADON-ADD] - FIXES_REPAIR_PUNCTURE_SURGERY
/////PUNCTURE REPAIR SURGERY//////

#define CLAMP_BLEEDERS 2
#define SEAL_VEINS 3

///// Repair puncture wounds
/datum/surgery/repair_puncture
	name = "Repair puncture"
	steps = list(/datum/surgery_step/incise, /datum/surgery_step/clamp_bleeders, /datum/surgery_step/seal_veins, /datum/surgery_step/close)
	target_mobtypes = list(/mob/living/carbon)
	possible_locs = list(BODY_ZONE_R_ARM,BODY_ZONE_L_ARM,BODY_ZONE_R_LEG,BODY_ZONE_L_LEG,BODY_ZONE_CHEST,BODY_ZONE_HEAD)
	requires_real_bodypart = TRUE
	targetable_wound = /datum/wound/pierce

	var/vessels_sealed = 0
	var/vessels_required = 0


/datum/surgery/repair_puncture/can_start(mob/living/user, mob/living/carbon/target)
	. = ..()
	if(.)
		var/obj/item/bodypart/targeted_bodypart = target.get_bodypart(user.zone_selected)
		var/datum/wound/pierce/pierce_wound = targeted_bodypart.get_wound_type(targetable_wound)
		if(pierce_wound && pierce_wound.blood_flow > 0)
			vessels_required = round(pierce_wound.initial_flow) + 1
			vessels_sealed = 0
			return TRUE
	return FALSE

//SURGERY STEPS

/datum/surgery_step/clamp_bleeders
	name = "clamp major bleeders"
	implements = list(TOOL_HEMOSTAT = 100, TOOL_WIRECUTTER = 35)
	time = 3 SECONDS
	preop_sound = 'sound/surgery/hemostat1.ogg'
	success_sound = 'sound/surgery/hemostat1.ogg'
	failure_sound = 'sound/surgery/organ2.ogg'

/datum/surgery_step/clamp_bleeders/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/datum/wound/pierce/pierce_wound = surgery.operated_wound
	if(!pierce_wound)
		user.visible_message("<span class='notice'>[user] looks for the source of bleeding in [target]'s [parse_zone(target_zone)].</span>",
			"<span class='notice'>You look for the source of bleeding in [target]'s [parse_zone(target_zone)]...</span>")
		return

	display_results(user, target,
		"<span class='notice'>You begin clamping the major bleeding vessels in [target]'s [parse_zone(target_zone)]...</span>",
		"<span class='notice'>[user] begins clamping the major bleeding vessels in [target]'s [parse_zone(target_zone)] with [tool].</span>",
		"<span class='notice'>[user] begins clamping the major bleeding vessels in [target]'s [parse_zone(target_zone)].</span>")

/datum/surgery_step/clamp_bleeders/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/datum/wound/pierce/pierce_wound = surgery.operated_wound
	if(!pierce_wound)
		to_chat(user, "<span class='warning'>[target] has no puncture wound there!</span>")
		return ..()

	display_results(user, target,
		"<span class='notice'>You successfully clamp the major bleeding vessels in [target]'s [parse_zone(target_zone)].</span>",
		"<span class='notice'>[user] successfully clamps the major bleeding vessels in [target]'s [parse_zone(target_zone)] with [tool]!</span>",
		"<span class='notice'>[user] successfully clamps the major bleeding vessels in [target]'s [parse_zone(target_zone)]!</span>")
	log_combat(user, target, "clamped major bleeders in", addition="INTENT: [uppertext(user.a_intent)]")

	pierce_wound.blood_flow *= 0.5
	surgery.operated_bodypart.receive_damage(brute=2, wound_bonus=CANT_WOUND)
	return ..()

/datum/surgery_step/clamp_bleeders/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob = 0)
	. = ..()
	display_results(user, target,
		"<span class='warning'>You accidentally tear a major vessel in [target]'s [parse_zone(target_zone)]!</span>",
		"<span class='warning'>[user] accidentally tears a major vessel in [target]'s [parse_zone(target_zone)] with [tool]!</span>",
		"<span class='warning'>[user] accidentally tears a major vessel in [target]'s [parse_zone(target_zone)]!</span>")
	surgery.operated_bodypart.receive_damage(brute=rand(5,10), sharpness=SHARP_EDGED, wound_bonus = 15)

/datum/surgery_step/seal_veins
	name = "seal damaged vessels"
	implements = list(
		TOOL_HEMOSTAT = 100,
		TOOL_WIRECUTTER = 35,
		/obj/item/stack/packageWrap = 15,
		/obj/item/stack/cable_coil = 15)
	time = 4 SECONDS
	repeatable = TRUE
	preop_sound = 'sound/surgery/hemostat1.ogg'
	success_sound = 'sound/surgery/hemostat1.ogg'
	failure_sound = 'sound/surgery/organ2.ogg'

/datum/surgery_step/seal_veins/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(istype(surgery, /datum/surgery/repair_puncture))
		if(!surgery.operated_wound)
			return

	display_results(user, target,
		"<span class='notice'>You begin sealing damaged vessels in [target]'s [parse_zone(target_zone)]...</span>",
		"<span class='notice'>[user] begins sealing damaged vessels in [target]'s [parse_zone(target_zone)] with [tool].</span>",
		"<span class='notice'>[user] begins sealing damaged vessels in [target]'s [parse_zone(target_zone)].</span>")

/datum/surgery_step/seal_veins/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	if(!istype(surgery, /datum/surgery/repair_puncture))
		return ..()

	var/datum/surgery/repair_puncture/repair = surgery
	repair.vessels_sealed++

	var/message
	switch(repair.vessels_sealed)
		if(1)
			message = "You carefully seal the ruptured artery"
		if(2)
			if(repair.vessels_sealed >= repair.vessels_required)
				message = "You seal the last damaged vessels"
			else
				message = "You seal the torn venous vessels"
		if(3)
			if(repair.vessels_sealed >= repair.vessels_required)
				message = "You seal the last damaged capillaries"
			else
				message = "You seal the damaged capillaries"
		else
			if(repair.vessels_sealed >= repair.vessels_required)
				message = "You finish sealing the remaining damaged tissue"
			else
				message = "You continue sealing the damaged vessels"

	display_results(user, target,
		"<span class='notice'>[message] in [target]'s [parse_zone(target_zone)].</span>",
		"<span class='notice'>[user] seals damaged vessels in [target]'s [parse_zone(target_zone)] with [tool].</span>",
		"<span class='notice'>[user] seals damaged vessels in [target]'s [parse_zone(target_zone)].</span>")
	log_combat(user, target, "sealed vessels in", addition="INTENT: [uppertext(user.a_intent)]")

	surgery.operated_bodypart.receive_damage(brute=1, wound_bonus=CANT_WOUND)

	if(repair.vessels_sealed >= repair.vessels_required)
		to_chat(user, "<span class='green'>All major bleeding is now controlled. The wound can be closed.</span>")
		if(surgery.operated_wound)
			surgery.operated_wound.attached_surgery = null
			qdel(surgery.operated_wound)
			surgery.operated_wound = null
		surgery.status++
		return TRUE // Не вызываем parent

	return ..()

/datum/surgery_step/seal_veins/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob = 0)
	. = ..()
	display_results(user, target,
		"<span class='warning'>You accidentally rupture a sealed vessel in [target]'s [parse_zone(target_zone)]!</span>",
		"<span class='warning'>[user] accidentally ruptures a sealed vessel in [target]'s [parse_zone(target_zone)] with [tool]!</span>",
		"<span class='warning'>[user] accidentally ruptures a sealed vessel in [target]'s [parse_zone(target_zone)]!</span>")
	surgery.operated_bodypart.receive_damage(brute=rand(3,6), sharpness=SHARP_EDGED, wound_bonus = 5)
	if(istype(surgery, /datum/surgery/repair_puncture))
		var/datum/surgery/repair_puncture/repair = surgery
		repair.vessels_sealed = max(0, repair.vessels_sealed - 1)

#undef CLAMP_BLEEDERS
#undef SEAL_VEINS
// [/CELADON-ADD]

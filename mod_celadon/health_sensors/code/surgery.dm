/datum/surgery/vital_sensor_implant
	name = "Vital sensor implantation"
	desc = "Implants a vital sensor into the patient's chest."
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/insert_vital_sensor,
		/datum/surgery_step/close,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery/vital_sensor_implant/can_start(mob/user, mob/living/patient)
	. = ..()
	if(!.)
		return
	for(var/obj/item/implant/vital_sensor/existing in patient.implants)
		return FALSE

/datum/surgery/vital_sensor_implant/mechanic
	name = "Vital sensor implantation (cybernetic)"
	requires_bodypart_type = BODYTYPE_ROBOTIC
	lying_required = FALSE
	self_operable = TRUE
	steps = list(
		/datum/surgery_step/mechanic_open,
		/datum/surgery_step/open_hatch,
		/datum/surgery_step/mechanic_unwrench,
		/datum/surgery_step/insert_vital_sensor,
		/datum/surgery_step/mechanic_wrench,
		/datum/surgery_step/close_hatch,
		/datum/surgery_step/mechanic_close,
	)

/datum/surgery_step/insert_vital_sensor
	name = "insert vital sensor"
	implements = list(
		/obj/item/implant/vital_sensor = 100,
		/obj/item/implantcase = 100,
		/obj/item/implanter = 100,
	)
	time = 3.2 SECONDS
	preop_sound = 'sound/surgery/organ1.ogg'
	success_sound = 'sound/surgery/organ2.ogg'
	experience_given = MEDICAL_SKILL_MEDIUM

/datum/surgery_step/insert_vital_sensor/tool_check(mob/user, obj/item/tool)
	return !!get_sensor(tool)

/datum/surgery_step/insert_vital_sensor/proc/get_sensor(obj/item/tool)
	if(istype(tool, /obj/item/implant/vital_sensor))
		return tool
	if(istype(tool, /obj/item/implantcase))
		var/obj/item/implantcase/case = tool
		if(istype(case.imp, /obj/item/implant/vital_sensor))
			return case.imp
	if(istype(tool, /obj/item/implanter))
		var/obj/item/implanter/implanter = tool
		if(istype(implanter.imp, /obj/item/implant/vital_sensor))
			return implanter.imp

/datum/surgery_step/insert_vital_sensor/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/obj/item/implant/vital_sensor/sensor = get_sensor(tool)
	if(!sensor)
		return
	display_results(user, target, span_notice("You begin to implant [sensor] into [target]'s [parse_zone(target_zone)]..."),
		span_notice("[user] begins to implant [sensor] into [target]'s [parse_zone(target_zone)]."),
		span_notice("[user] begins to implant something into [target]'s [parse_zone(target_zone)]."))

/datum/surgery_step/insert_vital_sensor/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/obj/item/implant/vital_sensor/sensor = get_sensor(tool)
	if(!sensor)
		to_chat(user, span_warning("You need a vital sensor to complete this step."))
		return FALSE
	if(istype(tool, /obj/item/implantcase))
		var/obj/item/implantcase/case = tool
		case.imp = null
		case.update_appearance()
	else if(istype(tool, /obj/item/implanter))
		var/obj/item/implanter/implanter = tool
		implanter.imp = null
		implanter.update_appearance()
	if(!sensor.implant(target, user))
		to_chat(user, span_warning("[sensor] fails to implant in [target]."))
		if(istype(tool, /obj/item/implantcase))
			var/obj/item/implantcase/case = tool
			case.imp = sensor
			sensor.forceMove(case)
			case.update_appearance()
		else if(istype(tool, /obj/item/implanter))
			var/obj/item/implanter/implanter = tool
			implanter.imp = sensor
			sensor.forceMove(implanter)
			implanter.update_appearance()
		return FALSE
	display_results(user, target, span_notice("You successfully implant [sensor] into [target]."),
		span_notice("[user] implants [sensor] into [target]!"),
		span_notice("[user] implants something into [target]!"))
	return ..()

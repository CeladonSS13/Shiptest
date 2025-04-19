/obj/item/survey_handheld
	var/blacklist_area = list(
		/area/space,
		/area/outpost,
		/area/hangar,
	)

/obj/item/survey_handheld/attack_self(mob/user)
	if(active)
		return

	var/turf/src_turf = get_turf(src)
	var/area/src_area = get_area(src)

	if((is_type_in_list(src_area, blacklist_area)) || src_turf.virtual_level_trait(ZTRAIT_STATION) || src_turf.virtual_level_trait(ZTRAIT_CENTCOM) || src_turf.virtual_level_trait(ZTRAIT_SCAN_DISRUPT))
		to_chat(user, span_notice("You cannot do this on restricted area!"))
		return

	var/my_z = "[virtual_z()]"
	if(z_active[my_z])
		flick(icon_state + "-corrupted", src)
		playsound(src, 'sound/machines/buzz-sigh.ogg', 20)
		src_turf.visible_message(span_warning("Warning: interference detected in current sector"))
		return

	if(!z_history[my_z])
		z_history[my_z] = 1

	active = TRUE
	z_active[my_z] = TRUE
	while(user.get_active_held_item() == src)
		to_chat(user, span_notice("You begin to scan your surroundings with [src]."))

		var/penalty = 1 - (z_history[my_z] - 1) * 0.05 // You lose five percent of value and are five percent slower
		if(!penalty || penalty < 0.20) // If you are below 20% value, do nothing and abort
			flick(icon_state + "-corrupted", src)
			playsound(src, 'sound/machines/buzz-sigh.ogg', 20)
			src_turf.visible_message(span_warning("Warning: unable to locate valuable information in current sector."))
			break

		if(!do_after(user, survey_delay / penalty, src))
			flick(icon_state + "-corrupted", src)
			playsound(src, 'sound/machines/buzz-sigh.ogg', 20)
			src_turf.visible_message(span_warning("Warning: results corrupted. Please try again."))
			break

		flick(icon_state + "print", src)
		playsound(src, 'sound/machines/whirr_beep.ogg', 20)
		src_turf.visible_message(span_notice("Data recorded and enscribed to research packet."))
		z_history[my_z]++

		var/obj/item/result = new /obj/item/research_notes(null, survey_value * penalty, pick(list("astronomy", "physics", "planets", "space")))

		var/obj/item/research_notes/notes = locate() in get_turf(user)
		if(notes)
			notes.merge(result)
		else if(!user.put_in_hands(result) && istype(user.get_inactive_held_item(), /obj/item/research_notes))
			var/obj/item/research_notes/research = user.get_inactive_held_item()
			research.merge(result)
			continue

	active = FALSE
	z_active[my_z] = FALSE

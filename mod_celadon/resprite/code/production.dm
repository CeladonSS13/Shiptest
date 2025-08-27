/obj/machinery/rnd/production/techfab/department
	icon = 'mod_celadon/_storge_icons/icons/machinery/research.dmi'
	icon_state = "techfab"
	production_animation = "techfab_n"

/obj/machinery/rnd/production/protolathe/department
	icon = 'mod_celadon/_storge_icons/icons/machinery/research.dmi'
	icon_state = "protolathe"
	production_animation = "protolathe_n"

/obj/machinery/rnd/production/proc/add_department_stripe(obj/machinery/rnd/production/M, list/overlays)
	if(M.department_tag)
		var/stripe_icon = "techfab_stripe_[lowertext(M.department_tag)]"
		if(istype(src, /obj/machinery/rnd/production/circuit_imprinter))
			stripe_icon = "circtuit_stripe_[lowertext(M.department_tag)]"

		var/mutable_appearance/stripe_overlay = mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', stripe_icon)
		overlays += stripe_overlay

/obj/machinery/rnd/production/update_overlays()
	. = ..()
	add_department_stripe(src, .)
	return .

/obj/machinery/rnd/AfterMaterialInsert(obj/item/item_inserted, id_inserted, amount_inserted)
	if(skip_next_insert_anim)
		skip_next_insert_anim = FALSE
		return
	var/stack_name
	if(istype(item_inserted, /obj/item/stack/ore/bluespace_crystal))
		stack_name = "bluespace"
		use_power(MINERAL_MATERIAL_AMOUNT / 10)
	else if(istype(item_inserted, /obj/item/stack))
		var/obj/item/stack/S = item_inserted
		if(S.mats_per_unit && length(S.mats_per_unit))
			stack_name = S.mats_per_unit[1]
		var/ai = isnum(amount_inserted) ? amount_inserted : 0
		use_power(min(1000, (ai / 100)))
	else
		return

	if(istype(src, /obj/machinery/rnd/production/protolathe/department))
		flick_overlay_view(mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', "protolathe_[stack_name]"), 1 SECONDS)
		add_overlay("protolathe_[stack_name]")
		addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, cut_overlay), "protolathe_[stack_name]"), 10)
	else if(istype(src, /obj/machinery/rnd/production/techfab/department))
		flick_overlay_view(mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', "techfab_[stack_name]"), 1 SECONDS)
		add_overlay("techfab_[stack_name]")
		addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, cut_overlay), "techfab_[stack_name]"), 10)

/obj/machinery/rnd/production/proc/OnMatInsertAnimationHook(datum/source, obj/item/I, mob/living/user)
	SIGNAL_HANDLER

	if(!istype(I, /obj/item/stack))
		return

	var/datum/component/remote_materials/R = materials
	var/datum/component/material_container/MC = (R ? R.mat_container : null)

	if(!MC || (R && R.on_hold()))
		return

	var/to_insert = MC.get_item_material_amount(I)
	if(!to_insert)
		return

	if(!MC.has_space(to_insert))
		if(istype(src, /obj/machinery/rnd/production/protolathe/department))
			flick_overlay_view(mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', "protolathe_deny"), 1 SECONDS)
		else if(istype(src, /obj/machinery/rnd/production/techfab/department))
			flick_overlay_view(mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', "techfab_deny"), 1 SECONDS)
		return

	var/pre = MC.total_amount

	spawn(1) // Дальше код ещё более проклят, будь на чеку.
		var/datum/component/remote_materials/R2 = materials
		var/datum/component/material_container/MC2 = (R2 ? R2.mat_container : null)
		if(!MC2)
			return
		var/post = MC2.total_amount

		if(post > pre)
			if(R2 && R2.silo)
				var/stack_name
				var/inserted = post - pre
				if(istype(I, /obj/item/stack/ore/bluespace_crystal))
					stack_name = "bluespace"
					use_power(MINERAL_MATERIAL_AMOUNT / 10)
				else
					var/obj/item/stack/S = I
					if(S.mats_per_unit && length(S.mats_per_unit))
						stack_name = S.mats_per_unit[1]
					use_power(min(ACTIVE_DRAW_HIGH, (inserted / 100)))

				if(istype(src, /obj/machinery/rnd/production/protolathe/department))
					flick_overlay_view(mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', "protolathe_[stack_name]"), 1 SECONDS)
					add_overlay("protolathe_[stack_name]")
					addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, cut_overlay), "protolathe_[stack_name]"), 10)
				else if(istype(src, /obj/machinery/rnd/production/techfab/department))
					flick_overlay_view(mutable_appearance('mod_celadon/_storge_icons/icons/machinery/research.dmi', "techfab_[stack_name]"), 1 SECONDS)
					add_overlay("techfab_[stack_name]")
					addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, cut_overlay), "techfab_[stack_name]"), 10)

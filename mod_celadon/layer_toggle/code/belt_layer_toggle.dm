/obj/item/storage/belt
	var/under_clothing = FALSE

/obj/item/storage/belt/examine(mob/user)
	. = ..()
	. += span_notice("<b>Ctrl+Click</b> чтобы переключить слой ношения.")

/obj/item/storage/belt/CtrlClick(mob/user)
	if(..() || !user.canUseTopic(src, BE_CLOSE))
		return
	under_clothing = !under_clothing
	to_chat(user, span_notice("[src] теперь [under_clothing ? "под одеждой" : "поверх одежды"]."))
	var/mob/living/carbon/human/H = user
	if(istype(H) && H.belt == src)
		H.update_inv_belt()
	return TRUE

/obj/item/storage/belt/build_worn_icon(default_layer = 0, default_icon_file = null, isinhands = FALSE, override_state = null, override_file = null, datum/species/mob_species = null, direction = null)
	if(under_clothing && !isinhands)
		default_layer = 24 // Под одеждой (UNIFORM_LAYER = 23)
	return ..(default_layer, default_icon_file, isinhands, override_state, override_file, mob_species, direction)

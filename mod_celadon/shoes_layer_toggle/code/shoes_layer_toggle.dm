/obj/item/clothing/shoes
	var/under_clothing = FALSE

/obj/item/clothing/shoes/CtrlClick(mob/user)
	if(..())
		return TRUE
	if(!user.canUseTopic(src, BE_CLOSE))
		return
	under_clothing = !under_clothing
	to_chat(user, span_notice("[src] теперь [under_clothing ? "под" : "поверх"] одежды."))
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.shoes == src)
			H.update_inv_shoes()
	return TRUE

/obj/item/clothing/shoes/build_worn_icon(default_layer = 0, default_icon_file = null, isinhands = FALSE, override_state = null, override_file = null, datum/species/mob_species = null, direction = null)
	if(under_clothing && !isinhands)
		default_layer = 24 // Под одеждой (UNIFORM_LAYER = 23)
	return ..(default_layer, default_icon_file, isinhands, override_state, override_file, mob_species, direction)
/obj/item/clothing/neck/cloak
	slot_flags = ITEM_SLOT_OCLOTHING | ITEM_SLOT_NECK

/obj/item/clothing/suit/hooded/proc/on_can_insert(datum/source, obj/item/I, mob/M, silent, bypass_access)
	SIGNAL_HANDLER
	if(I == hood)
		return FALSE

/datum/component/storage/concrete/pockets/exo/large/accessible_items(random_access = TRUE)
	. = ..()
	var/obj/item/clothing/suit/hooded/H = parent
	if(istype(H) && H.hood)
		. -= H.hood

/obj/item/clothing/suit/hooded/update_icon()
	var/correct_state = suittoggled ? "[base_icon_state]_t" : base_icon_state
	icon_state = correct_state
	. = ..()
	icon_state = correct_state

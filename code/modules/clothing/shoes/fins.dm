// Ласты для плавания
/obj/item/clothing/shoes/fins
	name = "swimming fins"
	desc = "Rubber fins that help with underwater movement."
	icon_state = "fins"
	item_state = "fins"
	clothing_flags = WATER_FINS
	slowdown = 1 // На суше замедляют
	
/obj/item/clothing/shoes/fins/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_FEET)
		to_chat(user, span_notice("The fins feel awkward on dry land but should help underwater."))

/obj/item/clothing/shoes/fins/dropped(mob/user)
	. = ..()
	to_chat(user, span_notice("You remove the fins."))
/***********************************************
FAN HUDs! For identifying other fans on-sight.
************************************************/

//HOOKS

/mob/living/carbon/human/proc/fan_hud_set_fandom()
	var/image/holder = hud_list[FAN_HUD]
	var/icon/I = icon(icon, icon_state, dir)
	holder.pixel_y = I.Height() - world.icon_size
	holder.icon_state = "hudfan_no"
	var/obj/item/clothing/under/U = get_item_by_slot(ITEM_SLOT_ICLOTHING)
	if(U)
		if(istype(U.attached_accessory, /obj/item/clothing/accessory/fan_mime_pin))
			holder.icon_state = "fan_mime_pin"
		else if(istype(U.attached_accessory, /obj/item/clothing/accessory/fan_clown_pin))
			holder.icon_state = "fan_clown_pin"

/obj/item/clothing/neck/toggle
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'  //icons/mob/clothing/suits/toggle.dmi
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	var/necktoggled = FALSE
	var/togglename = null

/obj/item/clothing/neck/toggle/AltClick(mob/user)
	..()
	if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	else
		neck_toggle(user)

/obj/item/clothing/neck/toggle/ui_action_click()
	neck_toggle()

/obj/item/clothing/neck/toggle/proc/neck_toggle()
	set src in usr

	if(!can_use(usr))
		return 0

	to_chat(usr, span_notice("You toggle [src]'s [togglename]."))
	if(src.necktoggled)
		src.icon_state = "[initial(icon_state)]"
		src.necktoggled = FALSE
	else if(!src.necktoggled)
		src.icon_state = "[initial(icon_state)]_t"
		src.necktoggled = TRUE
	usr.update_inv_neck()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/neck/toggle/examine(mob/user)
	. = ..()
	. += "Alt-click on [src] to toggle the [togglename]."

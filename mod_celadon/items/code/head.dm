// Black Detective
/obj/item/clothing/head/fedora/det_hat/black
	name = "detectives black fedora"
	desc = "A really noir hat if you're a good guy. A really lame hat if you're not."
	icon_state = "fedora"
	item_state = "detective"

/obj/item/clothing/head/costume/tv_head
	name = "television helmet"
	desc = "A mysterious headgear made from the hollowed out remains of a status display. How very retro-retro-futuristic of you."
	icon = 'mod_celadon/_storge_icons/icons/items/obj/head/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/head/costume.dmi'
	icon_state = "IPC_helmet"
	item_state = "syringe_kit"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/mob/inhands/medical_lefthand.dmi' //Grandfathered in from the wallframe for status displays.
	righthand_file = 'mod_celadon/_storge_icons/icons/items/mob/inhands/medical_righthand.dmi'
	clothing_flags = SNUG_FIT
	flash_protect = FLASH_PROTECTION_SENSITIVE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	flags_inv = HIDEMASK | HIDEEARS | HIDEEYES | HIDEFACE | HIDEHAIR | HIDEFACIALHAIR | HIDEHORNS
	var/has_fov = TRUE

/obj/item/clothing/head/costume/tv_head/Initialize(mapload)
	. = ..()
	if(has_fov)
		AddComponent(/datum/component/clothing_fov_visor, FOV_90_DEGREES)

/obj/item/clothing/head/costume/tv_head/fov_less
	desc = "A mysterious headgear made from the hollowed out remains of a status display. How very retro-retro-futuristic of you. It's very easy to see out of this one."
	has_fov = FALSE

/obj/item/clothing/head/archeologist
	name = "archaeologist hat"
	desc = "A well-worn fedora favored by explorers and archaeologists. Not very protective but still very stylish."
	icon_state = "explorerhat"
	item_state = "explorerhat"
	icon = 'mod_celadon/_storge_icons/icons/items/obj/tajara_items.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/overlay/tajara_items_overlay.dmi'
	flags_inv = 0

/obj/item/clothing/head/cap_navyblue
	name = "Navy blue cap"
	desc = "A navy blue cap."
	icon_state = "navyblue_cap"
	icon = 'mod_celadon/_storge_icons/icons/items/obj/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/head.dmi'

/obj/item/clothing/head/beret/navyblue
	name = "Navy blue beret"
	desc = "A navy blue beret."
	icon_state = "navyblue_beret"
	icon = 'mod_celadon/_storge_icons/icons/items/obj/head/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/head.dmi'

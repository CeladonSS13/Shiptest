/obj/item/clothing/glasses/hud/toggle/medicalshield
	name = "advanced HUD scanner"
	desc = "Health and security imaging HUD in the shape of glasses."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/eyes/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/eyes/overlay/eyes.dmi'
	icon_state = "medicalshield"
	item_state = "medicalshield"
	glass_colour_type = /datum/client_colour/glass_colour/red
	var/list/hudlist = list(DATA_HUD_MEDICAL_ADVANCED, DATA_HUD_SECURITY_ADVANCED)

/obj/item/clothing/glasses/hud/toggle/medicalshield/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_EYES || !ishuman(user))
		return
	for(var/hud in hudlist)
		var/datum/atom_hud/H = GLOB.huds[hud]
		H.add_hud_to(user)
	ADD_TRAIT(user, TRAIT_MEDICAL_HUD, GLASSES_TRAIT)
	ADD_TRAIT(user, TRAIT_SECURITY_HUD, GLASSES_TRAIT)

/obj/item/clothing/glasses/hud/toggle/medicalshield/dropped(mob/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_MEDICAL_HUD, GLASSES_TRAIT)
	REMOVE_TRAIT(user, TRAIT_SECURITY_HUD, GLASSES_TRAIT)
	if(!ishuman(user))
		return
	for(var/hud in hudlist)
		var/datum/atom_hud/H = GLOB.huds[hud]
		H.remove_hud_from(user)

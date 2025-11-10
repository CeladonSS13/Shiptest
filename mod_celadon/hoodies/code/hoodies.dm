/obj/item/clothing/suit/hooded/hoodie/oldblack
	name = "black old hoodie"
	desc = "An old hoodie that is black. It has a comfy pocket for keeping your hands warm."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_black"
	item_state = "oldhoodie_black"
	hoodtype = /obj/item/clothing/head/hooded/hood/oldblack

/obj/item/clothing/head/hooded/hood/oldblack
	name = "black hood"
	desc = "An old black hood for your black hoodie."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_black"
	item_state = "oldhoodie_black"

/obj/item/clothing/suit/hooded/hoodie/oldred
	name = "red old hoodie"
	desc = "An old hoodie that is red. It has a comfy pocket for keeping your hands warm."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_red"
	item_state = "oldhoodie_red"
	hoodtype = /obj/item/clothing/head/hooded/hood/oldred

/obj/item/clothing/head/hooded/hood/oldred
	name = "red hood"
	desc = "An old red hood for your red hoodie."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_red"
	item_state = "oldhoodie_red"

/obj/item/clothing/suit/hooded/hoodie/oldblue
	name = "blue old hoodie"
	desc = "An old hoodie that is blue. It has a comfy pocket for keeping your hands warm."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_blue"
	item_state = "oldhoodie_blue"
	hoodtype = /obj/item/clothing/head/hooded/hood/oldblue

/obj/item/clothing/head/hooded/hood/oldblue
	name = "blue old hood"
	desc = "An old blue hood for your blue hoodie."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_blue"
	item_state = "oldhoodie_blue"

/obj/item/clothing/suit/hooded/hoodie/oldgray
	name = "gray hoodie"
	desc = "An old hoodie that is gray. It has a comfy pocket for keeping your hands warm."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_gray"
	item_state = "oldhoodie_gray"
	hoodtype = /obj/item/clothing/head/hooded/hood/oldgray

/obj/item/clothing/head/hooded/hood/oldgray
	name = "gray hood"
	desc = "An old gray hood for your gray hoodie."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_gray"
	item_state = "oldhoodie_gray"

/obj/item/clothing/suit/hooded/hoodie/oldfbp
	name = "\improper FBP kepori old hoodie"
	desc = "An old hoodie themed to look like a kepori in a Full Body Prosthetic. It has a comfy pocket for keeping your hands warm."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_fbp"
	item_state = "oldhoodie_fbp"
	hoodtype = /obj/item/clothing/head/hooded/hood/oldfbp

/obj/item/clothing/head/hooded/hood/oldfbp
	name = "\improper FBP kepori hood"
	desc = "An old hood for your FBP hoodie."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_fbp"
	item_state = "oldhoodie_fbp"

/obj/item/clothing/suit/hooded/hoodie/oldrilena
	name = "K4L1 old hoodie"
	desc = "An old hoodie themed to look like K4L1 from the popular webseries RILENA. It has a comfy pocket for keeping your hands warm."
	icon_state = "oldhoodie_rilena"
	item_state = "oldhoodie_rilena"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	hoodtype = /obj/item/clothing/head/hooded/hood/oldrilena
	unique_reskin = null

/obj/item/clothing/suit/hooded/hoodie/rilena/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_OCLOTHING)
		return
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_RILENA))
		SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "hoodie_rilena", /datum/mood_event/rilena_super_fan)

/obj/item/clothing/suit/hooded/hoodie/rilena/dropped(mob/user)
	. = ..()
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_RILENA))
		SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "hoodie_rilena")

/obj/item/clothing/head/hooded/hood/oldrilena
	name = "RILENA: LMR K4L1 hood"
	desc = "An old hood for your RILENA themed hoodie."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/hooded.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/hooded.dmi'
	icon_state = "oldhoodie_rilena"
	item_state = "oldhoodie_rilena"

////////////////
//REAL BIG FAN//
////////////////

/obj/item/clothing/accessory/fan_clown_pin
	name = "Clown Pin"
	desc = "A pin to show off your appreciation for clowns and clowning"
	icon = 'mod_celadon/_storge_icons/icons/other/clown_mime/accessories.dmi'
	icon_state = "fan_clown_pin"
	above_suit = FALSE
	minimize_when_attached = TRUE
	attachment_slot = CHEST

/obj/item/clothing/accessory/fan_clown_pin/on_uniform_equip(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_CLOWN))
		SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "fan_clown_pin", /datum/mood_event/fan_clown_pin)

/obj/item/clothing/accessory/fan_clown_pin/on_uniform_dropped(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_CLOWN))
		SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "fan_clown_pin")

/obj/item/clothing/accessory/fan_mime_pin
	name = "Mime Pin"
	desc = "A pin to show off your appreciation for mimes and miming"
	icon = 'mod_celadon/_storge_icons/icons/other/clown_mime/accessories.dmi'
	icon_state = "fan_mime_pin"
	above_suit = FALSE
	minimize_when_attached = TRUE
	attachment_slot = CHEST

/obj/item/clothing/accessory/fan_mime_pin/on_uniform_equip(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_MIME))
		SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "fan_mime_pin", /datum/mood_event/fan_mime_pin)

/obj/item/clothing/accessory/fan_mime_pin/on_uniform_dropped(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_MIME))
		SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "fan_mime_pin")

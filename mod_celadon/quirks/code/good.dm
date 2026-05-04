/datum/quirk/fan_clown
	name = "Clown Fan"
	desc = "You enjoy clown antics and get a mood boost from wearing your clown pin."
	value = 1
	mob_traits = list(TRAIT_FAN_CLOWN)
	gain_text = span_notice("You are a big fan of clowns.")
	lose_text = span_danger("The clown doesn't seem so great.")
	medical_record_text = "Patient reports being a big fan of clowns."

/datum/quirk/fan_clown/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/accessory/fan_clown_pin/B = new(get_turf(H))
	var/list/slots = list (
		"backpack" = ITEM_SLOT_BACKPACK,
		"hands" = ITEM_SLOT_HANDS,
	)
	H.equip_in_one_of_slots(B, slots , qdel_on_fail = TRUE)
	var/datum/atom_hud/fan = GLOB.huds[DATA_HUD_FAN]
	fan.add_hud_to(H)

/datum/quirk/fan_mime
	name = "Mime Fan"
	desc = "You enjoy mime antics and get a mood boost from wearing your mime pin."
	value = 1
	mob_traits = list(TRAIT_FAN_MIME)
	gain_text = span_notice("You are a big fan of the Mime.")
	lose_text = span_danger("The mime doesn't seem so great.")
	medical_record_text = "Patient reports being a big fan of mimes."

/datum/quirk/fan_mime/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/accessory/fan_mime_pin/B = new(get_turf(H))
	var/list/slots = list (
		"backpack" = ITEM_SLOT_BACKPACK,
		"hands" = ITEM_SLOT_HANDS,
	)
	H.equip_in_one_of_slots(B, slots , qdel_on_fail = TRUE)
	var/datum/atom_hud/fan = GLOB.huds[DATA_HUD_FAN]
	fan.add_hud_to(H)


// CELADON_QUIRKS_FAST_REMOVE_HANDCUFFS - Прописываем тело квирку\трейту.
/datum/quirk/quick_removal_of_handcuffs
	name = "Quick removal of handcuffs"
	desc = "Reduces the time to remove handcuffs to 20 seconds. Makes the text of removing handcuffs hidden, not showing it in the chat or above the character's head.."
	value = 3
	mob_traits = list(TRAIT_FAST_REMOVE_HANDCUFFS)
	gain_text = span_notice("Your hands have become flexible.")
	lose_text = span_danger("You have regained the rough strength of your hands. They are no longer flexible.")
	medical_record_text = "The patient has very slippery hands."

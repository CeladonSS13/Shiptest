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

// ++++++++++ BEGIN QUIRKS_FAST_REMOVE_HANDCUFFS ++++++++++
/datum/quirk/quick_removal_of_handcuffs
	name = "Quick removal of handcuffs"
	desc = "Reduces the time to remove handcuffs to 17-30 seconds. Makes the text of removing handcuffs hidden, not showing it in the chat or above the character's head."
	value = 3
	gain_text = span_notice("Your hands have become flexible.")
	lose_text = span_danger("You have regained the rough strength of your hands. They are no longer flexible.")
	medical_record_text = "The patient has very slippery hands."

/datum/quirk/quick_removal_of_handcuffs/add()
	quirk_holder.AddSpell(new /obj/effect/proc_holder/spell/removal_of_handcuffs(null))

/obj/effect/proc_holder/spell/removal_of_handcuffs
	name = "Quick removal of handcuffs"
	desc = "Reduces the time to remove handcuffs to 17-30 seconds. Makes the text of removing handcuffs hidden, not showing it in the chat or above the character's head."
	cooldown_min = 0
	charge_max = 1
	level_max = 1
	clothes_req = FALSE
	antimagic_allowed = TRUE
	action_icon = 'mod_celadon/_storage_icons/icons/assets/action_item.dmi'
	action_icon_state = "removal_of_handcuffs"
	/// Залочиваем спел при касте
	var/removing = FALSE

/obj/effect/proc_holder/spell/removal_of_handcuffs/can_cast(mob/user = usr)
	if(removing)
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/removal_of_handcuffs/choose_targets(mob/user = usr)
	perform(user = user)

/obj/effect/proc_holder/spell/removal_of_handcuffs/cast(list/targets, mob/user = usr)
	var/mob/living/carbon/U = usr
	if(!istype(U))
		return

	var/obj/item/cuffs = U.handcuffed || U.legcuffed
	if(!cuffs)
		return

	if(cuffs.item_flags & BEING_REMOVED)
		to_chat(U, span_warning("You're already attempting to remove [cuffs]!")) // Не видно другим
		return

	U.adjustStaminaLoss(50, forced = TRUE) // Минус стамина

	removing = TRUE
	charge_max = 3000
	charge_counter = 0
	recharging = TRUE

	if(action)
		action.UpdateButtonIcon()

	cuffs.item_flags |= BEING_REMOVED
	var/breakouttime = rand(170, 300)
	to_chat(src, span_notice("You attempt to remove [cuffs]... (This will take around [DisplayTimeText(breakouttime)] and you need to stand still.)")) // Не видно другим
	if(do_after(U, breakouttime, target = U, timed_action_flags = IGNORE_HELD_ITEM, show_progress = TRUE, hidden = TRUE))
		U.clear_cuffs(cuffs)
	cuffs.item_flags &= ~BEING_REMOVED

	removing = FALSE
	recharging = FALSE
	charge_max = 1
	charge_counter = 1

	if(action)
		action.UpdateButtonIcon()
// ++++++++++ END QUIRKS_FAST_REMOVE_HANDCUFFS ++++++++++

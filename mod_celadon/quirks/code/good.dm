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

/datum/quirk/drunkhealing
	name = "Drunken Resilience"
	desc = "Nothing like a good drink to make you feel on top of the world. Whenever you're drunk, you slowly recover from injuries."
	value = 2
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_PROCESSES
	mob_traits = list(TRAIT_DRUNK_HEALING)
	gain_text = "<span class='notice'>You feel like a drink would do you good.</span>"
	lose_text = "<span class='danger'>You no longer feel like drinking would ease your pain.</span>"
	medical_record_text = "Patient has unusually efficient liver metabolism and can slowly regenerate wounds by drinking alcoholic beverages."

/datum/quirk/drunkhealing/on_process(seconds_per_tick)
	var/mob/living/carbon/C = quirk_holder
	// Whitesands Start - Prevent Prosthetic healing from liquor
	switch(C.get_drunk_amount())
		if (6 to 40)
			C.adjustBruteLoss(-0.1*seconds_per_tick, FALSE, FALSE, BODYTYPE_ORGANIC)
			C.adjustFireLoss(-0.05*seconds_per_tick, FALSE, FALSE, BODYTYPE_ORGANIC)
		if (41 to 60)
			C.adjustBruteLoss(-0.4*seconds_per_tick, FALSE, FALSE, BODYTYPE_ORGANIC)
			C.adjustFireLoss(-0.2*seconds_per_tick, FALSE, FALSE, BODYTYPE_ORGANIC)
		if (61 to INFINITY)
			C.adjustBruteLoss(-0.8*seconds_per_tick, FALSE, FALSE, BODYTYPE_ORGANIC)
			C.adjustFireLoss(-0.4*seconds_per_tick, FALSE, FALSE, BODYTYPE_ORGANIC)
	// Whitesands End - Prevent Prosthetic healing from liquor

/datum/quirk/jolly
	name = "Jolly"
	desc = "You sometimes just feel happy, for no reason at all."
	value = 1
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_PROCESSES
	mob_traits = list(TRAIT_JOLLY)
	medical_record_text = "Patient demonstrates constant euthymia irregular for environment. It's a bit much, to be honest."

/datum/quirk/jolly/on_process(seconds_per_tick)
	if(SPT_PROB(0.05, seconds_per_tick))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "jolly", /datum/mood_event/jolly)

/datum/quirk/night_vision
	name = "Night Vision"
	desc = "You can see slightly more clearly in full darkness than most people."
	value = 1
	mob_traits = list(TRAIT_NIGHT_VISION)
	gain_text = "<span class='notice'>The shadows seem a little less dark.</span>"
	lose_text = "<span class='danger'>Everything seems a little darker.</span>"
	medical_record_text = "Patient's eyes show above-average acclimation to darkness."

/datum/quirk/night_vision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorgan(/obj/item/organ/eyes)
	if(!eyes || eyes.lighting_alpha)
		return
	eyes.Insert(H) //refresh their eyesight and vision

/datum/quirk/skittish
	name = "Skittish"
	desc = "You can conceal yourself in danger. Ctrl-shift-click a closed locker to jump into it, as long as you have access."
	value = 2
	mob_traits = list(TRAIT_SKITTISH)
	medical_record_text = "Patient demonstrates a high aversion to danger and has described hiding in containers out of fear."

/datum/quirk/voracious
	name = "Voracious"
	desc = "Nothing gets between you and your food. You eat faster and can binge on junk food! Being fat suits you just fine."
	value = 1
	mob_traits = list(TRAIT_VORACIOUS)
	gain_text = "<span class='notice'>You feel HONGRY.</span>"
	lose_text = "<span class='danger'>You no longer feel HONGRY.</span>"

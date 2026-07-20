/datum/quirk/snob
	name = "Snob"
	desc = "You care about the finer things, if a room doesn't look nice its just not really worth it, is it?"
	value = 0
	gain_text = "<span class='notice'>You feel like you understand what things should look like.</span>"
	lose_text = "<span class='notice'>Well who cares about deco anyways?</span>"
	medical_record_text = "Patient seems to be rather stuck up."
	mob_traits = list(TRAIT_SNOB)

/datum/quirk/pineapple_liker
	name = "Ananas Affinity"
	desc = "You find yourself greatly enjoying fruits of the ananas genus. You can't seem to ever get enough of their sweet goodness!"
	value = 0
	gain_text = "<span class='notice'>You feel an intense craving for pineapple.</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient demonstrates a pathological love of pineapple."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ananas Aversion"
	desc = "You find yourself greatly detesting fruits of the ananas genus. Serious, how the hell can anyone say these things are good? And what kind of madman would even dare putting it on a pizza!?"
	value = 0
	gain_text = "<span class='notice'>You find yourself pondering what kind of idiot actually enjoys pineapples...</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient is correct to think that pineapple is disgusting."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/smoker
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_PROCESSES
	var/time_without_nicotine = 0
	var/withdrawal_threshold = 300
	var/in_withdrawal = FALSE

/datum/quirk/smoker/on_process(seconds_per_tick)
	var/mob/living/carbon/human/H = quirk_holder
	if(!H.reagents)
		return

	var/has_nicotine = H.reagents.has_reagent(/datum/reagent/drug/nicotine, needs_metabolizing = TRUE)

	if(has_nicotine)
		time_without_nicotine = 0
		if(in_withdrawal)
			in_withdrawal = FALSE
			SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "nicotine_withdrawal")
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "nicotine_buzz", /datum/mood_event/nicotine_buzz)
	else
		time_without_nicotine += seconds_per_tick
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "nicotine_buzz")
		if(time_without_nicotine >= withdrawal_threshold)
			in_withdrawal = TRUE
			SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "nicotine_withdrawal", /datum/mood_event/nicotine_withdrawal)

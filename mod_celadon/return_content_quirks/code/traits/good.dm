/datum/quirk/drunkhealing
	name = "Drunken Resilience"
	desc = "Nothing like a good drink to make you feel on top of the world. Whenever you're drunk, you slowly recover from injuries."
	value = 2
	mob_traits = list(TRAIT_DRUNK_HEALING)
	gain_text = "<span class='notice'>You feel like a drink would do you good.</span>"
	lose_text = "<span class='danger'>You no longer feel like drinking would ease your pain.</span>"
	medical_record_text = "Patient has unusually efficient liver metabolism and can slowly regenerate wounds by drinking alcoholic beverages."

/datum/quirk/drunkhealing/on_process(seconds_per_tick)
	var/mob/living/carbon/C = quirk_holder
	// Whitesands Start - Prevent Prosthetic healing from liquor
	switch(C.drunkenness)
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
	mob_traits = list(TRAIT_JOLLY)
	mood_quirk = TRUE
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

/datum/reagent/pax/mint
	name = "Mint"
	taste_description = "grass"
	description = "A colourless liquid that makes people more peaceful and felines happier."
	metabolization_rate = 1.75 * REAGENTS_METABOLISM

/datum/reagent/pax/mint/on_mob_life(mob/living/carbon/C)
	if(istajara(C))
		if(prob(20))
			C.emote("nya")
		if(prob(20))
			to_chat(C, span_notice("[pick("Headpats feel nice.", "Backrubs would be nice.", "Mew")]"))
	else
		to_chat(C, span_notice("[pick("I feel oddly calm.", "I feel relaxed.", "Mew?")]"))
	..()


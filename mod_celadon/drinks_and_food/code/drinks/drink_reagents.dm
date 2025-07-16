/datum/reagent/consumable/pinkmilk
	name = "Strawberry Milk"
	description = "A drink of a bygone era of milk and artificial sweetener back on a rock."
	color = "#f76aeb"//rgb(247, 106, 235)
	quality = DRINK_VERYGOOD
	taste_description = "sweet strawberry and milk cream"
	glass_icon_state = "pinkmilk"
	glass_name = "tall glass of strawberry milk"
	glass_desc = "Delicious flavored strawberry syrup mixed with milk."

/datum/reagent/consumable/pinkmilk/on_mob_life(mob/living/carbon/C)
	if(prob(15))
		to_chat(C, span_notice("[pick("You cant help to smile.","You feel nostalgia all of sudden.","You remember to relax.")]"))
	..()
	. = 1

/datum/reagent/consumable/mint_tea
	name = "Mint Tea"
	description = "A sleepy and tasty mint tea!"
	color = "#101000" // rgb: 16, 16, 0
	taste_description = "sugar and mint"
	glass_icon_state = "mint_tea"
	glass_name = "glass of mint tea"
	glass_desc = "A purrfect drink for a cat."

/datum/reagent/consumable/mint_tea/on_mob_life(mob/living/carbon/C)
	C.adjustStaminaLoss(min(50 - C.getStaminaLoss(), 3))
	if(istajara(C))
		if(prob(20))
			C.emote("nya")
		if(prob(20))
			to_chat(C, span_notice("[pick("Headpats feel nice.", "Backrubs would be nice.", "Mew")]"))
	else
		to_chat(C, span_notice("[pick("I feel oddly calm.", "I feel relaxed.", "Mew?")]"))
	..()

/datum/reagent/consumable/condensedcapsaicin/expose_mob(mob/living/M, method=TOUCH, reac_volume)
	if(!ishuman(M) && !ismonkey(M))
		return

	var/mob/living/carbon/victim = M
	// var/mob/living/carbon/human
	if(method == TOUCH || method == SMOKE || method == VAPOR)
		var/pepper_proof = victim.is_pepper_proof()

		//check for protection
		//actually handle the pepperspray effects
		if (!(pepper_proof) && !istype(M, /mob/living/carbon/human/species/ipc)) // you need both eye and mouth protection
			if(prob(5))
				victim.force_scream()
			victim.blur_eyes(5) // 10 seconds
			victim.blind_eyes(3) // 6 seconds
			victim.confused = max(M.confused, 5) // 10 seconds
			victim.Knockdown(3 SECONDS)
			victim.add_movespeed_modifier(/datum/movespeed_modifier/reagent/pepperspray)
			addtimer(CALLBACK(victim, TYPE_PROC_REF(/mob, remove_movespeed_modifier), /datum/movespeed_modifier/reagent/pepperspray), 10 SECONDS)
		victim.update_damage_hud()
	if(method == INGEST)
		if(!M.has_reagent(/datum/reagent/consumable/milk))
			if(prob(15))
				to_chat(M, span_danger("[pick("Your head pounds.", "Your mouth feels like it's on fire.", "You feel dizzy.")]"))
			if(prob(10))
				victim.blur_eyes(1)
			if(prob(10))
				victim.Dizzy(1)
			if(prob(5))
				victim.vomit()

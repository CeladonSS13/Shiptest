/datum/reagent/consumable/sugar
	nutriment_factor = 2
	overdose_threshold = 120
	var/diabetes_buildup = 0

/datum/reagent/consumable/sugar/on_mob_life(mob/living/carbon/M)
	// Check for diabetes development
	if(!M.HasDisease(new /datum/disease/diabetes))
		diabetes_buildup += volume * 0.1
		if(diabetes_buildup >= 50 && prob(5)) // 5% chance when buildup reaches 50
			to_chat(M, span_userdanger("Your body can no longer process sugar properly!"))
			var/datum/disease/diabetes/D = new()
			M.ForceContractDisease(D)
	..()

/datum/species/lizard/spec_life(mob/living/carbon/human/H)
	..()
	if(H.stat == DEAD)
		return

	var/current_health = H.health
	var/max_health = H.maxHealth

	if(current_health < max_health)
		var/nutrition_level = H.nutrition
		var/regen_rate = 0
		var/nutrition_cost = 0

		if(nutrition_level >= 550 && nutrition_level <= 600) // Секретный специальный реген
			regen_rate = 0.1
			nutrition_cost = 0
		elseif(nutrition_level >= NUTRITION_LEVEL_WELL_FED) // Сытый
			regen_rate = 1.5
			nutrition_cost = 15
		elseif(nutrition_level >= NUTRITION_LEVEL_FED) // Хорошо накормлен
			regen_rate = 1
			nutrition_cost = 10
		elseif(nutrition_level >= NUTRITION_LEVEL_HUNGRY) // Накормлен
			regen_rate = 0.5
			nutrition_cost = 5
		else
			return // Нет регенерации если слишком голоден

		H.adjust_nutrition(-nutrition_cost)
		H.adjustBruteLoss(-regen_rate)
		H.adjustFireLoss(-regen_rate)

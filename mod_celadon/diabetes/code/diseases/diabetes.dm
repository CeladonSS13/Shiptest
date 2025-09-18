/datum/disease/diabetes
	name = "Diabetes"
	desc = "A metabolic disorder characterized by high blood sugar levels."
	form = "Condition"
	agent = "metabolic dysfunction"
	visibility_flags = HIDDEN_PANDEMIC
	disease_flags = CAN_CARRY
	spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS
	cure_text = "Insulin injections"
	cures = list(/datum/reagent/medicine/insulin)
	cure_chance = 0
	stage_prob = 0
	max_stages = 1
	severity = DISEASE_SEVERITY_MEDIUM
	bypasses_immunity = TRUE
	var/insulin_timer = 0
	var/sugar_buildup = 0

/datum/disease/diabetes/stage_act()
	if(!affected_mob)
		return

	insulin_timer++

	// Check for insulin in bloodstream
	if(affected_mob.has_reagent(/datum/reagent/medicine/insulin))
		insulin_timer = 0
		sugar_buildup = max(0, sugar_buildup - 10)
		return

	// Check for sugar consumption
	if(affected_mob.has_reagent(/datum/reagent/consumable/sugar))
		sugar_buildup += affected_mob.reagents.get_reagent_amount(/datum/reagent/consumable/sugar) * 2

	// Diabetes effects based on time without insulin
	switch(insulin_timer)
		if(600 to 1199) // 1-2 minutes
			if(prob(10))
				to_chat(affected_mob, span_warning("You feel thirsty."))
		if(1200 to 1799) // 2-3 minutes
			if(prob(15))
				to_chat(affected_mob, span_warning("You feel dizzy and weak."))
				affected_mob.set_timed_status_effect(20 SECONDS, /datum/status_effect/dizziness, only_if_higher = TRUE)
		if(1800 to 2999) // 3-5 minutes
			if(prob(20))
				to_chat(affected_mob, span_danger("Your vision blurs as your blood sugar spikes!"))
				affected_mob.blur_eyes(10)
				affected_mob.adjustStaminaLoss(5)
		if(3000 to INFINITY) // 5+ minutes
			if(prob(25))
				to_chat(affected_mob, span_userdanger("You feel like you're going to pass out!"))
				affected_mob.adjustToxLoss(2)
				affected_mob.adjustStaminaLoss(10)
				if(prob(10))
					affected_mob.Unconscious(100)

/datum/disease/diabetes/cure()
	to_chat(affected_mob, span_notice("Your diabetes symptoms subside temporarily."))
	insulin_timer = 0
	sugar_buildup = 0
	// Don't actually cure the disease, just reset timers
	return FALSE

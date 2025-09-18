/datum/quirk/diabetes
	name = "Diabetes"
	desc = "You have diabetes and require regular insulin injections to survive. You start with a medical kit containing insulin supplies."
	value = -4
	gain_text = span_danger("You feel your blood sugar becoming unstable.")
	lose_text = span_notice("Your blood sugar stabilizes.")
	medical_record_text = "Patient has Type 1 diabetes mellitus and requires regular insulin therapy."

/datum/quirk/diabetes/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/disease/diabetes/D = new()
	H.ForceContractDisease(D)
	
	// Give diabetes medical kit
	var/obj/item/storage/firstaid/diabetes/kit = new(get_turf(H))
	H.put_in_hands(kit)
	if(!H.equip_to_slot_if_possible(kit, ITEM_SLOT_BACKPACK))
		kit.forceMove(get_turf(H))

/datum/quirk/diabetes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	for(var/datum/disease/diabetes/D in H.diseases.Copy())
		qdel(D)
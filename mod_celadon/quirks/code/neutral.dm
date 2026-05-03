/datum/quirk/dwarfism
	name = "Dwarfism"
	desc = "A mutation believed to be the cause of dwarfism."
	value = 4 // [CELADON-ADD] - NO_FUN_ALLOWED_SPECIES
	mob_traits = list(TRAIT_DWARF)
	gain_text = span_notice("Everything around you seems to grow..")
	lose_text = span_danger("Everything around you seems to shrink..")
	medical_record_text = "Patient is a dwarf."

/datum/quirk/dwarfism/add()
	var/mob/living/carbon/human/H = quirk_holder
	if(istype(H))
		H.transform = H.transform.Scale(0.8, 1)
	ADD_TRAIT(quirk_holder, TRAIT_DWARF, GENETIC_MUTATION)
	ADD_TRAIT(quirk_holder, TRAIT_SCOOPABLE, GENETIC_MUTATION)
	passtable_on(quirk_holder, GENETIC_MUTATION)
	quirk_holder.visible_message(span_danger("[quirk_holder] suddenly shrinks!"), span_notice("Everything around you seems to grow.."))

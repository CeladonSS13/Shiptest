/datum/quirk/dwarfism
	name = "Dwarfism"
	desc = "Makes you wiry and shallow."
	value = 0
	mob_traits = list(TRAIT_DWARF, TRAIT_SCOOPABLE)
	gain_text = span_notice("Everything around you seems to grow..")
	lose_text = span_danger("Everything around you seems to shrink..")
	medical_record_text = "Patient is a dwarf."

/datum/quirk/dwarfism/New(mob/living/quirk_mob, spawn_effects)
	quirk_mob.transform = quirk_mob.transform.Scale(0.8, 1.25)
	quirk_mob.pixel_y = -3
	quirk_mob.base_pixel_y = -3
	..()

/datum/quirk/mute
	name = "muteness"
	desc = "Completely shuts down the speech center of the subject's brain."
	value = -1
	mob_traits = list(TRAIT_MUTE)
	gain_text = span_danger("You feel unable to express yourself at all.")
	lose_text = span_notice("You feel able to speak freely again.")
	medical_record_text = "Patient has permanent mute."

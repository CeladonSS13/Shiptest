// FIXES_ELZUOSE_CHARGE_SYNTH
/datum/species/elzuose
	var/full_prosthetic = FALSE //TRUE if elzuose has no organic organs and uses prosthetics
	var/crystal_charge = ELZUOSE_CHARGE_NORMAL //charge storage for full prosthetic elzuose

/datum/species/elzuose/proc/check_prosthetic_status(mob/living/carbon/human/_human)
	var/obj/item/organ/stomach/ethereal/stomach = _human.getorganslot(ORGAN_SLOT_STOMACH)
	full_prosthetic = !istype(stomach)

/datum/species/elzuose/proc/adjust_charge(amount)
	crystal_charge = clamp(crystal_charge + amount, 0, ELZUOSE_CHARGE_DANGEROUS)

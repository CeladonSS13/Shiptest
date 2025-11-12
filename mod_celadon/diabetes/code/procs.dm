/mob/living/proc/HasDiseaseType(disease_type)
	for(var/thing in diseases)
		if(istype(thing, disease_type))
			return TRUE
	return FALSE

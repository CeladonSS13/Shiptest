PROCESSING_SUBSYSTEM_DEF(radiation)
	name = "Radiation"
	flags = SS_BACKGROUND	// [CELADON-EDIT] - CELADON_FIXES_RADIATION // flags = SS_NO_INIT | SS_BACKGROUND	// ORIGINAL
	wait = 1 SECONDS

	var/list/warned_atoms = list()

	// Максимальное значение радиации для предотвращения чрезмерного накопления // [CELADON-ADD]
	var/max_radiation_value = 500000	// [CELADON-ADD] - CELADON_FIXES_RADIATION

/datum/controller/subsystem/processing/radiation/proc/warn(datum/component/radioactive/contamination)
	if(!contamination || !contamination.parent || QDELETED(contamination))
		return
	var/ref = REF(contamination.parent)
	if(warned_atoms[ref])
		return
	warned_atoms[ref] = TRUE
	var/atom/master = contamination.parent
	SSblackbox.record_feedback("tally", "contaminated", 1, master.type)
	var/msg = "has become contaminated with enough radiation to contaminate other objects. || Source: [contamination.source] || Strength: [contamination.strength]"
	master.investigate_log(msg, INVESTIGATE_RADIATION)

// [CELADON-ADD] - CELADON_FIXES_RADIATION
/datum/controller/subsystem/processing/radiation/Initialize()
	. = ..()
	// Проверяем и исправляем существующие высокие значения радиации
	for(var/datum/component/radioactive/R in processing)
		if(R.strength > max_radiation_value)
			R.strength = max_radiation_value
			if(R.parent)
				var/atom/A = R.parent
				A.investigate_log("Radiation value capped from [R.strength] to [max_radiation_value]", INVESTIGATE_RADIATION)

/datum/controller/subsystem/processing/radiation/proc/cap_radiation(value)
	if(value > max_radiation_value)
		return max_radiation_value
	return value
// [/CELADON-ADD]

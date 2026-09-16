/datum/design/vital_sensor_mk2
	name = "Vital Sensor MK2"
	desc = "An advanced chest augment that reports detailed health and, 5 minutes after death, the host's overmap sector and turf coordinates."
	id = "vital_sensor_mk2"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/gold = 250)
	build_path = /obj/item/organ/cyberimp/chest/vital_sensor/advanced
	category = list("Misc", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

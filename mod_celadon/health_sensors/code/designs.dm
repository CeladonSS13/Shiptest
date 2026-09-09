/datum/design/vital_sensor_mk2
	name = "Vital Sensor MK2 Case"
	desc = "An advanced implanted vital sensor that reports detailed health and, 5 minutes after death, the host's overmap sector and coordinates."
	id = "vital_sensor_mk2"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 500, /datum/material/gold = 250, /datum/material/silver = 250)
	build_path = /obj/item/implantcase/vital_sensor/advanced
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/techweb_node/subdermal_implants
	design_ids = list("implanter", "implantcase", "implant_chem", "implant_tracking", "locator", "c38_trac", "vital_sensor_mk2")

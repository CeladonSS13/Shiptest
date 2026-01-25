/////////////////////////MOD Suits/////////////////////////

/datum/techweb_node/mod_suit
	id = "mod_suit"
	display_name = "Modular Suit"
	description = "We have the technology to replace him."
	prereq_ids = list("robotics")
	design_ids = list(
		"ssu",
		"mod_shell",
		"mod_chestplate",
		"mod_helmet",
		"mod_gauntlets",
		"mod_boots",
		"mod_plating_standard",
		"mod_paint_kit",
		"mod_storage",
		"mod_plasma",
		"mod_flashlight",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)

/datum/techweb_node/mod_equip
	id = "mod_equip"
	display_name = "Modular Suit Equipment"
	description = "More advanced modules, to improve modular suits."
	prereq_ids = list("mod_suit")
	design_ids = list(
		"mod_clamp",
		"mod_tether",
		"mod_welding",
		"mod_mouthhole",
		"mod_thermal_regulator",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

// Модули mod_bikehorn и mod_microwave_beam отключены, так как вызывали рантайм. Причина: Отсутствие  design_ids.

// /datum/techweb_node/mod_entertainment
// 	id = "mod_entertainment"
// 	display_name = "Entertainment Suit Equipment"
// 	description = "Modules for protection against low-humor environments."
// 	prereq_ids = list("mod_suit")
// 	design_ids = list(
// 		"mod_bikehorn",
// 		"mod_microwave_beam",
// 	)
// 	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/techweb_node/mod_science
	id = "mod_science"
	display_name = "Scientific Suit Equipment"
	description = "Modules for MODsuits intented for chemical researching and robotics."
	prereq_ids = list("mod_equip")
	design_ids = list(
		"mod_visor_diaghud",
		"mod_reagent_scanner",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/techweb_node/mod_medical
	id = "mod_medical"
	display_name = "Medical Modular Suit"
	description = "Medical MODsuits for quick rescue purposes."
	prereq_ids = list("mod_suit","biotech")
	design_ids = list(
		"mod_plating_medical",
		"mod_quick_carry",
		"mod_injector",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/techweb_node/mod_engi
	id = "mod_engi"
	display_name = "Engineering Modular Suits"
	description = "Engineering suits, for powered engineers."
	prereq_ids = list("mod_equip")
	design_ids = list(
		"mod_plating_engineering",
		"mod_t_ray",
		"mod_magboot",
		"mod_mister_atmos",
		"mod_rad_protection",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/techweb_node/mod_security
	id = "mod_security"
	display_name = "Security Modular Suits"
	description = "Security suits for space crime handling."
	prereq_ids = list("mod_equip")
	design_ids = list(
		"mod_plating_security",
		"mod_stealth",
		"mod_mag_harness",
		"mod_holster",
		"mod_civilian_armor_booster",
		"plate_compression",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)



/datum/techweb_node/mod_medical_adv
	id = "mod_medical_adv"
	display_name = "Field Surgery Modules"
	description = "Medical MODsuit equipment designed for conducting surgical operations in field conditions."
	prereq_ids = list("mod_medical", "adv_surgery")
	design_ids = list(
		"mod_statusreadout",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)

/datum/techweb_node/mod_engi_adv
	id = "mod_engi_adv"
	display_name = "Advanced Engineering Modular Suit"
	description = "Advanced Engineering suits, for advanced powered engineers."
	prereq_ids = list("mod_engi")
	design_ids = list(
		"mod_plating_atmospheric",
		"mod_jetpack",
		"mod_storage_expanded",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)

/datum/techweb_node/mod_anomaly
	id = "mod_anomaly"
	display_name = "Anomalock Modular Suit"
	description = "Modules for MODsuits that require anomaly cores to function."
	prereq_ids = list("mod_science", "mod_engi_adv", "anomaly_research")
	design_ids = list(
		"mod_antigrav",
		"mod_teleporter",
		"mod_kinesis",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)

/datum/techweb_node/mod_armor_components
	id = "mod_military"
	display_name = "MOD military-grade power armor components"
	description = "WARNING: it requires faction-locked unfinished plates to produce anything meaningful. Cutting-Edge military-grade biomimetic modular power armor components right into your protolathe! Core technologies integrated into this component include: Ultra-compact, liquid-cooled, reinforced serial elasticity actuators. Biomimetic Programmable metamaterial mechanics. Electroactive polymers."
	prereq_ids = list("mod_science", "mod_engi_adv", "anomaly_research", "mod_security")
	design_ids = list(
		"mod_armor_components",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 20000)

/datum/techweb_node/mod_emp_shield
	id = "mod_emp_shield"
	display_name = "MOD EMP shield"
	description = "Finally, the main bane of MODsuits has been solved! Somewhat solved..."
	prereq_ids = list("mod_science", "mod_engi_adv", "anomaly_research", "mod_security")
	design_ids = list(
		"mod_emp_shield",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)

/datum/techweb_node/mod_military_stealth
	id = "mod_military_stealth"
	display_name = "MOD military-grade stealth module"
	description = "WARNING: This one requires special military capacitor to be completed. High tech, high trick."
	prereq_ids = list("mod_science", "mod_engi_adv", "anomaly_research", "mod_security")
	design_ids = list(
		"mod_military_stealth",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)

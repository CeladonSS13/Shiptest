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
		"mod_emp_shield",
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
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)

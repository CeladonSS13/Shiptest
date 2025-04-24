//MODsuit construction

/datum/design/mod_shell
	name = "MOD Shell"
	desc = "A 'Nakamura Engineering' designed shell for a Modular Suit."
	id = "mod_shell"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron=10000,
		/datum/material/plasma=5000,
	)
	construction_time = 250
	build_path = /obj/item/mod/construction/shell
	category = list(
		"MOD Suits", "Chassis"
	)

/datum/design/mod_helmet
	name = "MOD Helmet"
	desc = "A 'Nakamura Engineering' designed helmet for a Modular Suit."
	id = "mod_helmet"
	build_type = MECHFAB
	materials = list(/datum/material/iron=5000)
	construction_time = 100
	build_path = /obj/item/mod/construction/helmet
	category = list(
		"MOD Suits", "Chassis"
	)

/datum/design/mod_chestplate
	name = "MOD Chestplate"
	desc = "A 'Nakamura Engineering' designed chestplate for a Modular Suit."
	id = "mod_chestplate"
	build_type = MECHFAB
	materials = list(/datum/material/iron=5000)
	construction_time = 100
	build_path = /obj/item/mod/construction/chestplate
	category = list(
		"MOD Suits", "Chassis"
	)

/datum/design/mod_gauntlets
	name = "MOD Gauntlets"
	desc = "'Nakamura Engineering' designed gauntlets for a Modular Suit."
	id = "mod_gauntlets"
	build_type = MECHFAB
	materials = list(/datum/material/iron=5000)
	construction_time = 100
	build_path = /obj/item/mod/construction/gauntlets
	category = list(
		"MOD Suits", "Chassis"
	)

/datum/design/mod_boots
	name = "MOD Boots"
	desc = "'Nakamura Engineering' designed boots for a Modular Suit."
	id = "mod_boots"
	build_type = MECHFAB
	materials = list(/datum/material/iron=5000)
	construction_time = 100
	build_path = /obj/item/mod/construction/boots
	category = list(
		"MOD Suits", "Chassis"
	)

/datum/design/mod_plating
	name = "MOD External Plating"
	desc = "External plating for a MODsuit."
	id = "mod_plating_standard"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron=6000,
		/datum/material/glass=3000,
		/datum/material/plasma=1000,
	)
	construction_time = 150
	build_path = /obj/item/mod/construction/plating
	category = list(
		"MOD Suits", "Plating"
	)
	research_icon = 'icons/obj/clothing/modsuit/mod_construction.dmi'
	research_icon_state = "standard-plating"

/datum/design/mod_plating/New()
	. = ..()
	var/obj/item/mod/construction/plating/armor_type = build_path
	var/datum/mod_theme/theme = GLOB.mod_themes[initial(armor_type.theme)]
	desc = "External plating for a MODsuit. [theme.desc]"

/datum/design/mod_plating/engineering
	name = "MOD Engineering Plating"
	id = "mod_plating_engineering"
	build_path = /obj/item/mod/construction/plating/engineering
	materials = list(
		/datum/material/iron=6000,
		/datum/material/gold=2000,
		/datum/material/glass=1000,
		/datum/material/plasma=1000,
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	research_icon_state = "engineering-plating"

/datum/design/mod_plating/atmospheric
	name = "MOD Atmospheric Plating"
	id = "mod_plating_atmospheric"
	build_path = /obj/item/mod/construction/plating/atmospheric
	materials = list(
		/datum/material/iron=6000,
		/datum/material/titanium=2000,
		/datum/material/glass=1000,
		/datum/material/plasma=1000,
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	research_icon_state = "atmospheric-plating"

/datum/design/mod_plating/medical
	name = "MOD Medical Plating"
	id = "mod_plating_medical"
	build_path = /obj/item/mod/construction/plating/medical
	materials = list(
		/datum/material/iron=6000,
		/datum/material/silver=2000,
		/datum/material/glass=1000,
		/datum/material/plasma=1000,
	)
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
	research_icon_state = "medical-plating"

/datum/design/mod_plating/security
	name = "MOD Security Plating"
	id = "mod_plating_security"
	build_path = /obj/item/mod/construction/plating/security
	materials = list(
		/datum/material/iron=6000,
		/datum/material/uranium=2000,
		/datum/material/glass=1000,
		/datum/material/plasma=1000,
	)
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	research_icon_state = "security-plating"

/datum/design/mod_paint_kit
	name = "MOD Paint Kit"
	desc = "A paint kit for Modular Suits."
	id = "mod_paint_kit"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron=1000,
		/datum/material/plastic=1000,
	)
	construction_time = 50
	build_path = /obj/item/mod/paint
	category = list(
		"MOD Suits", "Misc"
	)

//MODsuit modules

/datum/design/module
	name = "MOD Module"
	build_type = MECHFAB
	materials = list(
		/datum/material/iron=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module
	construction_time = 10
	category = list(
		"MOD Modules", "General Modules"
	)

/datum/design/module/New()
	. = ..()
	var/obj/item/mod/module/module = build_path
	desc = "[initial(module.desc)] It uses [initial(module.complexity)] complexity."

/datum/design/module/mod_storage
	name = "Storage Module"
	id = "mod_storage"
	materials = list(
		/datum/material/iron=1250,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/storage

/datum/design/module/mod_storage_expanded
	name = "Expanded Storage Module"
	id = "mod_storage_expanded"
	materials = list(
		/datum/material/iron=2500,
		/datum/material/uranium=2000,
	)
	build_path = /obj/item/mod/module/storage/large_capacity

/datum/design/module/mod_visor_medhud
	name = "Medical Visor Module"
	id = "mod_visor_medhud"
	materials = list(
		/datum/material/silver=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/visor/medhud
	category = list(
		"MOD Modules", "Medical Modules"
	)

/datum/design/module/mod_visor_diaghud
	name = "Diagnostic Visor Module"
	id = "mod_visor_diaghud"
	materials = list(
		/datum/material/gold=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/visor/diaghud
	category = list(
		"MOD Modules", "Science Modules"
	)
/datum/design/module/mod_visor_sechud
	name = "Security Visor Module"
	id = "mod_visor_sechud"
	materials = list(
		/datum/material/titanium=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/visor/sechud
	category = list(
		"MOD Modules", "Security Modules"
	)
/datum/design/module/mod_visor_meson
	name = "Meson Visor Module"
	id = "mod_visor_meson"
	materials = list(
		/datum/material/uranium=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/visor/meson
	category = list(
		"MOD Modules", "Supply Modules"
	)
/datum/design/module/mod_visor_welding
	name = "Welding Protection Module"
	id = "mod_welding"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/welding
	category = list(
		"MOD Modules", "Engineering Modules"
	)

/datum/design/module/mod_t_ray
	name = "T-Ray Scanner Module"
	id = "mod_t_ray"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/t_ray
	category = list(
		"MOD Modules", "Engineering Modules"
	)
/datum/design/module/mod_health_analyzer
	name = "Health Analyzer Module"
	id = "mod_health_analyzer"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/health_analyzer
	category = list(
		"MOD Modules", "Medical Modules"
	)

/datum/design/module/mod_stealth
	name = "Cloak Module"
	id = "mod_stealth"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/bluespace=1000,
	)
	build_path = /obj/item/mod/module/stealth
	category = list(
		"MOD Modules", "Security Modules"
	)
/datum/design/module/mod_jetpack
	name = "Ion Jetpack Module"
	id = "mod_jetpack"
	materials = list(/datum/material/iron=1500, /datum/material/plasma=1000)
	build_path = /obj/item/mod/module/jetpack

/datum/design/module/mod_magboot
	name = "Magnetic Stabilizator Module"
	id = "mod_magboot"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/gold=1000,
	)
	build_path = /obj/item/mod/module/magboot
	category = list(
		"MOD Modules", "Engineering Modules"
	)

/datum/design/module/mod_mag_harness
	name = "Magnetic Harness Module"
	id = "mod_mag_harness"
	materials = list(
		/datum/material/iron=1500,
		/datum/material/silver=1000,
	)
	build_path = /obj/item/mod/module/magnetic_harness
	category = list(
		"MOD Modules", "Security Modules"
	)

/datum/design/module/mod_tether
	name = "Emergency Tether Module"
	id = "mod_tether"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/silver=1000,
	)
	build_path = /obj/item/mod/module/tether
	category = list(
		"MOD Modules", "Engineering Modules"
	)

/datum/design/module/mod_mouthhole
	name = "Eating Apparatus Module"
	id = "mod_mouthhole"
	materials = list(/datum/material/iron=1500)
	build_path = /obj/item/mod/module/mouthhole

/datum/design/module/mod_emp_shield
	name = "EMP Shield Module"
	id = "mod_emp_shield"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/plasma=1000,
	)
	build_path = /obj/item/mod/module/emp_shield

/datum/design/module/mod_flashlight
	name = "Flashlight Module"
	id = "mod_flashlight"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/flashlight

/datum/design/module/mod_reagent_scanner
	name = "Reagent Scanner Module"
	id = "mod_reagent_scanner"
	materials = list(/datum/material/glass =1000)
	build_path = /obj/item/mod/module/reagent_scanner
	category = list(
		"MOD Modules", "Science Modules"
	)

/datum/design/module/mod_gps
	name = "Internal GPS Module"
	id = "mod_gps"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/gps
	category = list(
		"MOD Modules", "Supply Modules"
	)

/datum/design/module/mod_quick_carry
	name = "Quick Carry Module"
	id = "mod_quick_carry"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/titanium=1000,
	)
	build_path = /obj/item/mod/module/quick_carry
	category = list(
		"MOD Modules", "Medical Modules"
	)

/datum/design/module/mod_thermal_regulator
	name = "Thermal Regulator Module"
	id = "mod_thermal_regulator"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/thermal_regulator

/datum/design/module/mod_injector
	name = "Injector Module"
	id = "mod_injector"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/diamond=1000,
	)
	build_path = /obj/item/mod/module/injector
	category = list(
		"MOD Modules", "Medical Modules"
	)

// /datum/design/module/mod_bikehorn	// NEEDS_TO_FIX_ALARM!
// 	name = "Bike Horn Module"
// 	id = "mod_bikehorn"
// 	materials = list(
// 		/datum/material/plastic=1000,
// 		/datum/material/iron=1000,
// 	)
// 	build_path = /obj/item/mod/module/bikehorn
// 	category = list(
// 		"MOD Modules", "Service Modules"
// 	)

/datum/design/module/mod_microwave_beam
	name = "Microwave Beam Module"
	id = "mod_microwave_beam"
	materials = list(
		/datum/material/iron=1000,
		/datum/material/uranium=1000,
	)
	build_path = /obj/item/mod/module/microwave_beam
	category = list(
		"MOD Modules", "Service Modules"
	)

/datum/design/module/mod_clamp
	name = "Crate Clamp Module"
	id = "mod_clamp"
	materials = list(/datum/material/iron=2000)
	build_path = /obj/item/mod/module/clamp
	category = list(
		"MOD Modules", "Supply Modules"
	)

/datum/design/module/mod_drill
	name = "Drill Module"
	id = "mod_drill"
	materials = list(
		/datum/material/silver=1000,
		/datum/material/iron=2000,
	)
	build_path = /obj/item/mod/module/drill
	category = list(
		"MOD Modules", "Supply Modules"
	)

/datum/design/module/mod_orebag
	name = "Ore Bag Module"
	id = "mod_orebag"
	materials = list(/datum/material/iron=1500)
	build_path = /obj/item/mod/module/orebag
	category = list(
		"MOD Modules", "Supply Modules"
	)

/datum/design/module/mod_dna_lock
	name = "DNA Lock Module"
	id = "mod_dna_lock"
	materials = list(
		/datum/material/diamond=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/dna_lock

/datum/design/module/mod_plasma_stabilizer
	name = "Plasma Stabilizer Module"
	id = "mod_plasma"
	materials = list(
		/datum/material/plasma=1000,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/plasma_stabilizer

/datum/design/module/mister_atmos
	name = "Resin Mister Module"
	id = "mod_mister_atmos"
	materials = list(
		/datum/material/glass=1000,
		/datum/material/titanium=1500,
	)
	build_path = /obj/item/mod/module/mister/atmos
	category = list(
		"MOD Modules", "Engineering Modules"
	)

/datum/design/module/mod_holster
	name = "Holster Module"
	id = "mod_holster"
	materials = list(
		/datum/material/iron=1500,
		/datum/material/glass=1000,
	)
	build_path = /obj/item/mod/module/holster
	category = list(
		"MOD Modules", "Security Modules"
	)

/datum/design/module/statusreadout
	name = "Status Readout Module"
	id = "mod_statusreadout"
	materials = list(
		/datum/material/iron=3000,
		/datum/material/glass=1000,
		/datum/material/titanium=400,
	)
	build_path = /obj/item/mod/module/status_readout
	category = list(
		"MOD Modules", "Medical Modules"
	)

//MODsuit bepis modules
/datum/design/module/disposal
	name = "Disposal Connector Module"
	id = "mod_disposal"
	materials = list(
		/datum/material/iron=3000,
		/datum/material/titanium=1000,
	)
	build_path = /obj/item/mod/module/disposal_connector
	category = list(
		"MOD Modules", "Supply Modules"
	)

//MODsuit anomalock modules
/datum/design/module/mod_antigrav
	name = "Anti-Gravity Module"
	id = "mod_antigrav"
	materials = list(
		/datum/material/iron=3000,
		/datum/material/glass=2000,
		/datum/material/uranium=2000,
	)
	build_path = /obj/item/mod/module/anomaly_locked/antigrav
	category = list(
		"MOD Modules", "Science Modules"
	)

/datum/design/module/mod_teleporter
	name = "Teleporter Module"
	id = "mod_teleporter"
	materials = list(
		/datum/material/iron=3000,
		/datum/material/glass=2000,
		/datum/material/bluespace=2000,
	)
	build_path = /obj/item/mod/module/anomaly_locked/teleporter
	category = list(
		"MOD Modules", "Science Modules"
	)

/datum/supply_pack/faction/independent/modsuits
	category = "Tech - MODsuits"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/independent/modsuits/science/mod_core
	name = "MOD Core"
	desc = "One MODsuit core used in MOD construction."
	cost = 4000
	contains = list(/obj/item/mod/core/standard)
	crate_name = "MOD core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/modsuits/science/mod_core_plasma
	name = "MOD Plasma Core"
	desc = "One MODsuit core used in MOD construction. This core is designed to be charged from solid plasma."
	cost = 4000
	contains = list(/obj/item/mod/core/plasma)
	crate_name = "MOD core crate"
	crate_type = /obj/structure/closet/crate/secure/science

// [CELADON-EDIT] - Erring modsuits and modules start here.
// MARK: MOD CONTROL
/datum/supply_pack/faction/independent/modsuits/complete
	category = "Tech - fully built MODsuit"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/independent/modsuits/complete/civilian
	name = "Civilian MODsuit"
	desc = "Contains a baseline civilian modsuit with integrated flashlights and welding protection."
	cost = 2000
	contains = list(/obj/item/mod/control/pre_equipped/standard)

/datum/supply_pack/faction/independent/modsuits/complete/engie
	name = "Engineering MODsuit"
	desc = "Contains a protective Engineering modsuit fitted for industrial work."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/engineering)

/datum/supply_pack/faction/independent/modsuits/complete/atmos
	name = "Atmospheric MODsuit"
	desc = "Contains an insulated atmospheric modsuit, capable of enduring absurd temperatures."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/atmospheric)

/datum/supply_pack/faction/independent/modsuits/complete/loader
	name = "Loader MODsuit"
	desc = "Contains a cargo loader modsuit. Features ample carrying space, though not atmospherically sealed."
	cost = 3000 // ripley at home
	contains = list(/obj/item/mod/control/pre_equipped/loader)

/datum/supply_pack/faction/independent/modsuits/complete/mining
	name = "Mining MODsuit"
	desc = "Contains an armored mining modsuit. Features integrated mining tools for convienent carrying in the field."
	cost = 4750
	contains = list(/obj/item/mod/control/pre_equipped/mining)

/datum/supply_pack/faction/independent/modsuits/complete/medical
	name = "Medical MODsuit"
	desc = "Contains a lightweight medical modsuit for paramedic work on the ground, or in EVA."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/medical)

// Не блокирую за фракцию ибо меды индепы это прикольно.
/datum/supply_pack/faction/independent/modsuits/complete/rescue
	name = "Rescue Medical MODsuit"
	desc = "Contains an advanced medical modsuit with next-gen integrated medical systems."
	cost = 4000
	contains = list(/obj/item/mod/control/pre_equipped/rescue)

/datum/supply_pack/faction/independent/modsuits/complete/research
	name = "Research MODsuit"
	desc = "Contains a high tech Research modsuit with onboard scanning systems and protective padding for fieldwork and handling hazardous materials."
	cost = 4000
	contains = list(/obj/item/mod/control/pre_equipped/research)

/datum/supply_pack/faction/independent/modsuits/complete/security
	name = "Security MODsuit"
	desc = "Contains a protective security modsuit with integrated holsters."
	cost = 4500
	contains = list(/obj/item/mod/control/pre_equipped/security)

// MARK: MODULES
/datum/supply_pack/faction/independent/modsuits/modules
	category = "Tech - MOD modules"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "module crate"

// MARK: GENERAL
/datum/supply_pack/faction/independent/modsuits/modules/thermal_regulator
	name = "MOD Thermal Regulator Module"
	desc = "Too hot? Too cold? This thermal regular will make sure you modsuit feels just right."
	cost = 250
	contains = list(/obj/item/mod/module/thermal_regulator)

/datum/supply_pack/faction/independent/modsuits/modules/flashlight
	name = "MOD Flashlight Module"
	desc = "Contains an integrated flashlight to light up your way."
	cost = 100
	contains = list(/obj/item/mod/module/flashlight)

/datum/supply_pack/faction/independent/modsuits/modules/jetpack
	name = "MOD Ion Jetpack Module"
	desc = "Contains an integrated ion jetpack for self propulsion in zero-g."
	cost = 1000
	contains = list(/obj/item/mod/module/jetpack)

/datum/supply_pack/faction/independent/modsuits/modules/gps
	name = "MOD GPS Module"
	desc = "Contains a integrated GPS to help find your way."
	cost = 250
	contains = list(/obj/item/mod/module/gps)

/datum/supply_pack/faction/independent/modsuits/modules/plasma_engine
	name = "MOD plasma engine Module"
	desc = "Contains a module for refining plasma into energy right inside of your MODsuit!"
	cost = 500
	contains = list(/obj/item/mod/module/plasma_engine)

// MARK: ENGINEERING
/datum/supply_pack/faction/independent/modsuits/modules/welding
	name = "MOD Welding Protection Module"
	desc = "Contains a welding protection module to protect your eyes from flashes and sparks."
	cost = 250
	contains = list(/obj/item/mod/module/welding)

/datum/supply_pack/faction/independent/modsuits/modules/rad_protection
	name = "MOD Radiation Protection Module"
	desc = "Contains a radiation protection module."
	cost = 500
	contains = list(/obj/item/mod/module/rad_protection)

/datum/supply_pack/faction/independent/modsuits/modules/magboot
	name = "MOD Magboot Module"
	desc = "Contains a magboot module for stability in zero-g."
	cost = 250
	contains = list(/obj/item/mod/module/magboot)

/datum/supply_pack/faction/independent/modsuits/modules/tether
	name = "MOD Tether Module"
	desc = "Contains a grappling tether module for extra-spicy movement."
	cost = 1500
	contains = list(/obj/item/mod/module/tether)

/datum/supply_pack/faction/independent/modsuits/modules/toolset
	name = "MOD Toolset Module"
	desc = "Contains an integrated toolset module for engineering on the go."
	cost = 1000
	contains = list(/obj/item/mod/module/toolset)

/datum/supply_pack/faction/independent/modsuits/modules/mister
	name = "MOD water mister Module"
	desc = "Contains a water mister, basically a high-tech fire extinguisher."
	cost = 500
	contains = list(/obj/item/mod/module/mister)
/*
// Нет там  нужного реагента, увы
/datum/supply_pack/faction/independent/modsuits/modules/mister_atmos
	name = "MOD resin mister Module"
	desc = "Contains a resin mister, designed for sealing area from cold of a deep space. With a resin. So your soma won't die too early."
	cost = 1000
	contains = list(/obj/item/mod/module/mister/atmos)
*/

// MARK: STORAGE
/datum/supply_pack/faction/independent/modsuits/storage
	name = "MOD storage module"
	desc = "Contains a low-class storage module to put all your valueless shit in."
	contains = list(/obj/item/mod/module/storage)
	cost = 200 // backpack

/datum/supply_pack/faction/independent/modsuits/expanded_storage
	name = "MOD expanded storage module"
	desc = "Contains a high-class storage module to put all of your most precious savings in!"
	contains = list(/obj/item/mod/module/storage/large_capacity)
	cost = 700 // backpack+

/datum/supply_pack/faction/independent/modsuits/plate_compression
	name = "MOD plate compression module"
	desc = "A module that keeps the suit in a very tightly fit state, lowering the overall size as well as increasing its wearing speed. Typical storage modules do not fit with this module."
	contains = list(/obj/item/mod/module/plate_compression)
	cost = 500 // Не очень полезный модуль, но интересно будет если кто-то через него отыгрывать будет

// MARK: MOVEMENT
/datum/supply_pack/faction/independent/modsuits/modules/dash
	name = "MOD D.A.S.H. Module"
	desc = "Contains an advanced movement module that launches MOD operator forward. Is usually used by InteQ elite operatives."
	cost = 3000
	contains = list(/obj/item/mod/module/dash)

/datum/supply_pack/faction/independent/modsuits/modules/armor_assist
	name = "MOD armor assist Module"
	desc = "Contains an advanced overdrive module that significantly increases the user's movement speed while active, at the cost of massive energy consumption. Manufactured by Cybersun Biodynamics for PMCs. \n\
			WARNING: using it with armor assist is extreme for the suit's power grid."
	cost = 3000
	contains = list(/obj/item/mod/module/armor_assist)

// MARK: SECURITY
/datum/supply_pack/faction/independent/modsuits/modules/mag_harness
	name = "MOD Magnetic Harness Module"
	desc = "Drop your gun or crusher? This handy magnetic harness will pick it up for you."
	cost = 750
	contains = list(/obj/item/mod/module/magnetic_harness)

/datum/supply_pack/faction/independent/modsuits/modules/holster
	name = "MOD Holster Module"
	desc = "Contains a holster module for secure carrying of your firearms."
	cost = 1000
	contains = list(/obj/item/mod/module/holster)

/datum/supply_pack/faction/independent/modsuits/modules/shield
	name = "MOD shield Module"
	desc = "Contains a energy-based shield module for protecting you from regular firearms or/and melee attacks. Takes a lot of power to regenerate while holstered. Otherwise it is finite."
	cost = 2000
	contains = list(/obj/item/mod/module/shield)

/datum/supply_pack/faction/independent/modsuits/modules/bola_dispenser
	name = "MOD bola dispenser Module"
	desc = "Contains a module that create energy bolas. Amazing."
	cost = 1500
	contains = list(/obj/item/mod/module/dispenser/bola)

/datum/supply_pack/faction/independent/modsuits/modules/emp_shield
	name = "MOD EMP shield Module"
	desc = "Contains a module that protects your MODsuit from its main bane!"
	cost = 5000
	contains = list(/obj/item/mod/module/emp_shield)

//MARK: Armor boosters
/datum/supply_pack/faction/independent/modsuits/modules/armor_booster_civilian
	name = "MOD civilian armor booster Module"
	desc = "Contains an advanced armor booster module that significantly increases the user's movement speed and suit's protection while active. Manufactured by Cybersun Biodynamics."
	cost = 1500
	contains = list(/obj/item/mod/module/armor_booster/civilian)

/datum/supply_pack/faction/independent/modsuits/modules/armor_booster_light
	name = "MOD light armor booster Module"
	desc = "Contains an advanced armor booster module that lightly increases suit's protection while active. Manufactured by Cybersun Biodynamics."
	cost = 1500
	contains = list(/obj/item/mod/module/armor_booster/light)


// MARK: CARGO
/datum/supply_pack/faction/independent/modsuits/modules/drill
	name = "MOD drill Module"
	desc = "Contains an integrated drill for drilling the heaven up to 1 milion points sacrificed. Spiraling."
	cost = 1200
	contains = list(/obj/item/mod/module/drill)

/datum/supply_pack/faction/independent/modsuits/modules/orebag
	name = "MOD ore bag Module"
	desc = "Contains an integrated ore storage system. Don't forget to refine it later!"
	cost = 2000
	contains = list(/obj/item/mod/module/orebag)

/datum/supply_pack/faction/independent/modsuits/modules/clamp
	name = "MOD clamp Module"
	desc = "Contains mod clamp module, boasting a lifting capacity of almost a ton. However, this design has been locked by Warra to be primarily utilized for lifting various crates."
	cost = 1500
	contains = list(/obj/item/mod/module/clamp)

/datum/supply_pack/faction/independent/modsuits/modules/disposal_connector
	name = "MOD disposal connector Module"
	desc = "Contains a module, that connects to the disposal pipeline, causing the user to go into their config selected disposal."
	cost = 1500
	contains = list(/obj/item/mod/module/disposal_connector)

// MARK: MEDICAL
/datum/supply_pack/faction/independent/modsuits/modules/health_analyzer
	name = "MOD health analyzer Module"
	desc = "Contains a High-Tech Biological Scanning Suite(TM) glove-installed module. \n\
			Just 15% of scans are positively incorrect!"
	cost = 250
	contains = list(/obj/item/mod/module/health_analyzer)

/datum/supply_pack/faction/independent/modsuits/modules/injector
	name = "MOD Injector Module"
	desc = "Contains a highly precise needle capable of injecting through most clothing. Mostly painless."
	cost = 600
	contains = list(/obj/item/mod/module/injector)

/datum/supply_pack/faction/independent/modsuits/modules/opset
	name = "MOD Surgical Toolset Module"
	desc = "Contains an integrated surgical toolset for operating on the go."
	cost = 1000
	contains = list(/obj/item/mod/module/opset)

// MARK: HUDS
/datum/supply_pack/faction/independent/modsuits/modules/med_hud
	name = "MOD Medical Visor Module"
	desc = "Contains a heads-up display installed into the visor of the suit. This one allows to quickly analyze and visualize health of organic lifefoms. \
		Limited blue color version!"
	cost = 250
	contains = list(/obj/item/mod/module/visor/medhud)

/datum/supply_pack/faction/independent/modsuits/modules/diag_hud
	name = "MOD Diagnostic Visor Module"
	desc = "Contains a heads-up display installed into the visor of the suit. This uses a series of advanced sensors to scan and analyze almost any machinery. \
		Ad-free version!"
	cost = 250
	contains = list(/obj/item/mod/module/visor/diaghud)

/datum/supply_pack/faction/independent/modsuits/modules/sec_hud
	name = "MOD Security Visor Module"
	desc = "Contains a heads-up display installed into the visor of the suit. This one allows to know who to shoot and who to yell at. \
		Comes with police brutality guidelines!"
	cost = 250
	contains = list(/obj/item/mod/module/visor/sechud)

/datum/supply_pack/faction/independent/modsuits/modules/meson_hud
	name = "MOD Meson Visor Module"
	desc = "Contains a heads-up display installed into the visor of the suit. This module is based off a popular meson scanner you all know and love. \
		Comes with police brutality guidelines!"
	cost = 250
	contains = list(/obj/item/mod/module/visor/meson)

/datum/supply_pack/faction/independent/modsuits/modules/reagent_hud
	name = "MOD reagent Scanner Module"
	desc = "Contains an integrated reagent scanner for sample analysis."
	cost = 250
	contains = list(/obj/item/mod/module/reagent_scanner)

/datum/supply_pack/faction/independent/modsuits/modules/t_ray
	name = "MOD t-ray scan Module"
	desc = "A module installed into the visor of the suit, allowing the user to use a pulse of terahertz radiation to essentially echolocate things beneath the floor, mostly cables and pipes. A staple of atmospherics work, and counter-smuggling work."
	cost = 250
	contains = list(/obj/item/mod/module/t_ray)

// MARK: MISC
/datum/supply_pack/faction/independent/modsuits/modules/plasma_stabilizer
	name = "MOD plasma stabilizer Module"
	desc = "Contains a module with a plasma-tier special system, helping plasmamen not to burn down on their work."
	cost = 200
	contains = list(/obj/item/mod/module/plasma_stabilizer)

/datum/supply_pack/faction/independent/modsuits/modules/dna_lock
	name = "MOD dna lock Module"
	desc = "Contains a module, that helps you with those nasty thieves. Be the only master of yours MOD destiny!"
	cost = 1000
	contains = list(/obj/item/mod/module/dna_lock)

/datum/supply_pack/faction/independent/modsuits/modules/mouthhole
	name = "MOD Eating Apparatus Module"
	desc = "Want to grab a bite in the field, but the air is full of toxic CO2? This handy eating apparatus creates a semi-permeable layer for food to pass through."
	cost = 100
	contains = list(/obj/item/mod/module/mouthhole)

/datum/supply_pack/faction/independent/modsuits/modules/megaphone
	name = "MOD Megaphone Module"
	desc = "Contains a megaphone module, for getting people's attention and obliterating their ears."
	cost = 250
	contains = list(/obj/item/mod/module/megaphone)

/datum/supply_pack/faction/independent/modsuits/modules/hat_stabilizer
	name = "MOD hat stabliizer"
	desc = "Contains a hat stabilizer module, for getting people's attention and being stylish."
	cost = 250
	contains = list(/obj/item/mod/module/hat_stabilizer)

/datum/supply_pack/faction/independent/modsuits/modules/paper_dispenser
	name = "MOD paper dispenser"
	desc = "Contains a paper dispenser module. Solar Federation approved. Pretty crispy."
	cost = 250
	contains = list(/obj/item/mod/module/paper_dispenser)

/datum/supply_pack/faction/independent/modsuits/modules/balloon
	name = "MOD balloon blower"
	desc = "Contains a strange module invented years ago by some ingenious mimes. It blows balloons."
	cost = 750
	contains = list(/obj/item/mod/module/balloon)

// MARK: Paint

/datum/supply_pack/faction/independent/modsuits/paint
	name = "MOD Paint Kit"
	desc = "Contains a MOD paint kit, especially designed for designing your own unique MODsuit paint (all rights reserved. Any attempt to violate the license agreement and copyright is punishable by law)." // design for designing, it's a feature
	cost = 100
	contains = list(/obj/item/mod/paint)

/datum/supply_pack/faction/independent/modsuits/skin_applier
	name = "MOD skin applier"
	desc = "Contains a MOD skin applier, created to modify your MODsuit to (not) look like one of the any other! (All rights reserved. Any attempt to violate the license agreement and copyright is punishable by law)."
	cost = 100
	contains = list(/obj/item/mod/skin_applier)

// MARK: MILTECH
/datum/supply_pack/faction/independent/modsuits/military_tech
	category = "Tech - MOD military tech"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "millitary tech crate"

/datum/supply_pack/faction/independent/modsuits/military_tech/military_capacitor
	name = "Military Capacitor"
	desc = "Contains a high tech capacitor that is required for military stealth module and other military modules."
	cost = 2000
	contains = list(/obj/item/military_tech/capacitor)


// MARK: Power Cells
/datum/supply_pack/faction/independent/machinery/power/super
	name = "Super Power Cell"
	desc = "Break on through! For when you are having a FLARE UP!"
	cost = 1250
	contains = list(/obj/item/stock_parts/cell/super)

/datum/supply_pack/faction/independent/machinery/power/hyper
	name = "Hyper Power Cell"
	desc = "Merging Complete! Energy never dies."
	cost = 3000
	contains = list(/obj/item/stock_parts/cell/hyper)

// [CELADON-EDIT] - Erring modsuits and modules end here.

// // [CELADON-EDIT] - Depricated?
// /datum/supply_pack/science/mod_core_ethereal		// NEEDS_TO_FIX_ALARM!
// 	name = "MOD Elzous Core"
// 	desc = "One MODsuit core specialized for elzous, used when creating mods."
// 	cost = 6000
// 	contains = list(/obj/item/mod/core/ethereal)
// 	crate_name = "MOD core crate"
// 	crate_type = /obj/structure/closet/crate/secure/science

/*
	MODsuits
*/


/*
/datum/supply_pack/modsuits/civilian
	name = "Civilian MODsuit"
	desc = "Contains a baseline civilian modsuit with integrated flashlights and welding protection."
	cost = 750
	contains = list(/obj/item/mod/control/pre_equipped/standard)

/datum/supply_pack/modsuits/engie
	name = "Engineering MODsuit"
	desc = "Contains a protective Engineering modsuit fitted for industrial work."
	cost = 2500
	contains = list(/obj/item/mod/control/pre_equipped/engineering)

/datum/supply_pack/modsuits/atmos
	name = "Atmospheric MODsuit"
	desc = "Contains an insulated atmospheric modsuit, capable of enduring absurd temperatures."
	cost = 2500
	contains = list(/obj/item/mod/control/pre_equipped/atmospheric)

/datum/supply_pack/modsuits/advanced
	name = "Advanced Engineering MODsuit"
	desc = "Contains an advanced engineering modsuit. We've put it through just about every industrial accident our engineering team could concoct, and the white finish is still untouched."
	cost = 4000
	contains = list(/obj/item/mod/control/pre_equipped/advanced)
	faction = /datum/faction/warra
	faction_locked = TRUE

/datum/supply_pack/modsuits/loader
	name = "Loader MODsuit"
	desc = "Contains a cargo loader modsuit. Features ample carrying space, though not atmospherically sealed."
	cost = 1500 // ripley at home
	contains = list(/obj/item/mod/control/pre_equipped/loader)

/datum/supply_pack/modsuits/mining
	name = "Mining MODsuit"
	desc = "Contains an armored mining modsuit. Features integrated mining tools for convienent carrying in the field."
	cost = 2500
	contains = list(/obj/item/mod/control/pre_equipped/mining)

/datum/supply_pack/modsuits/medical
	name = "Medical MODsuit"
	desc = "Contains a lightweight medical modsuit for paramedic work on the ground, or in EVA."
	cost = 2000
	contains = list(/obj/item/mod/control/pre_equipped/medical)

/datum/supply_pack/modsuits/rescue
	name = "Rescue Medical MODsuit"
	desc = "Contains an advanced medical modsuit with next-gen integrated medical systems."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/rescue)
	faction = /datum/faction/warra
	faction_locked = TRUE

/datum/supply_pack/modsuits/research
	name = "Research MODsuit"
	desc = "Contains a high tech Research modsuit with onboard scanning systems and protective padding for fieldwork and handling hazardous materials."
	cost = 2500
	contains = list(/obj/item/mod/control/pre_equipped/research)

/datum/supply_pack/modsuits/security
	name = "Security MODsuit"
	desc = "Contains a protective security modsuit with integrated holsters."
	cost = 2500
	contains = list(/obj/item/mod/control/pre_equipped/security)

/datum/supply_pack/modsuits/safeguard
	name = "Safeguard MODsuit"
	desc = "Contains a well armored Safeguard modsuit, the premier of protection solutions."
	cost = 5500
	contains = list(/obj/item/mod/control/pre_equipped/safeguard)
	faction = /datum/faction/warra
	faction_locked = TRUE

/datum/supply_pack/modsuits/syndicate
	name = "Blood-Red MODsuit"
	desc = "Contains an experimental Blood-Red modsuit with integrated armor assist. Originally meant to replace the hardsuit model, the ICW ended before anything came of these things."
	cost = 5500
	contains = list(/obj/item/mod/control/pre_equipped/syndicate)
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/*
	Modsuit Mods
*/

/datum/supply_pack/modsuits/welding
	name = "MOD Welding Protection Module"
	desc = "Contains a welding protection module to protect your eyes."
	cost = 500
	contains = list(/obj/item/mod/module/welding)

/datum/supply_pack/modsuits/magboot
	name = "MOD Magboot Module"
	desc = "Contains a magboot module for stability in zero-g."
	cost = 750
	contains = list(/obj/item/mod/module/magboot)

/datum/supply_pack/modsuits/tether
	name = "MOD Tether Module"
	desc = "Contains a grappling tether module for emergency movement in zero-g."
	cost = 250
	contains = list(/obj/item/mod/module/tether)

/datum/supply_pack/modsuits/toolset
	name = "MOD Toolset Module"
	desc = "Contains an integrated toolset module for engineering on the go."
	cost = 1000
	contains = list(/obj/item/mod/module/toolset)

/datum/supply_pack/modsuits/jetpack
	name = "MOD Ion Jetpack Module"
	desc = "Contains an integrated ion jetpack for self propulsion in zero-g."
	cost = 1250
	contains = list(/obj/item/mod/module/jetpack)

/datum/supply_pack/modsuits/mouthhole
	name = "MOD Eating Apparatus Module"
	desc = "Want to grab a bite in the field, but the air is full of toxic CO2? This handy eating apparatus creates a semi-permeable layer for food to pass through."
	cost = 100
	contains = list(/obj/item/mod/module/mouthhole)

/datum/supply_pack/modsuits/flashlight
	name = "MOD Flashlight Module"
	desc = "Contains an integrated flashlight to light up your way."
	cost = 100
	contains = list(/obj/item/mod/module/flashlight)

/datum/supply_pack/modsuits/thermal_regulator
	name = "MOD Thermal Regulator Module"
	desc = "Too hot? Too cold? This thermal regular will make sure you modsuit feels just right."
	cost = 250
	contains = list(/obj/item/mod/module/thermal_regulator)

/datum/supply_pack/modsuits/dna_lock
	name = "MOD DNA Lock Module"
	desc = "Afraid of someone jacking your MODsuit? This DNA lock will key your suit to your unique DNA."
	cost = 500
	contains = list(/obj/item/mod/module/dna_lock)

/datum/supply_pack/modsuits/plasma
	name = "MOD Plasma Stabalizer Module"
	desc = "This module creates a stable oxygen-free environment inside the suit for phorrid usage."
	cost = 100
	contains = list(/obj/item/mod/module/plasma_stabilizer)

/datum/supply_pack/modsuits/health_analyzer
	name = "MOD Health Analyzer Module"
	desc = "An integrated health analyzer that will provide health readouts at the flick of a wrist."
	cost = 500
	contains = list(/obj/item/mod/module/health_analyzer)

/datum/supply_pack/modsuits/injector
	name = "MOD Injector Module"
	desc = "Contains a highly precise needle capable of injecting through most clothing. Mostly painless."
	cost = 600
	contains = list(/obj/item/mod/module/injector)

/datum/supply_pack/modsuits/
	name = "MOD Surgical Toolset Module"
	desc = "Contains an integrated surgical toolset for operating on the go."
	cost = 2500
	contains = list(/obj/item/mod/module/opset)

/datum/supply_pack/modsuits/mag_harness
	name = "MOD Magnetic Harness Module"
	desc = "Drop your gun? This handy magnetic harness will pick it up for you."
	cost = 500
	contains = list(/obj/item/mod/module/magnetic_harness)

/datum/supply_pack/modsuits/holster
	name = "MOD Holster Module"
	desc = "Contains a holster module for secure carrying of your firearms."
	cost = 500
	contains = list(/obj/item/mod/module/holster)

/datum/supply_pack/modsuits/megaphone
	name = "MOD Megaphone Module"
	desc = "Contains a megaphone module, for getting people's attention."
	cost = 250
	contains = list(/obj/item/mod/module/megaphone)

/datum/supply_pack/modsuits/gps
	name = "MOD GPS Module"
	desc = "Contains a integrated GPS to help find your way."
	cost = 250
	contains = list(/obj/item/mod/module/gps)

/datum/supply_pack/modsuits/med_hud
	name = "MOD Medical Visor Module"
	desc = "Contains an integrated medical visor for accurate health readouts."
	cost = 500
	contains = list(/obj/item/mod/module/visor/medhud)

/datum/supply_pack/modsuits/diag_hud
	name = "MOD Diagnostic Visor Module"
	desc = "Contains an integrated diagnostic visor assessing mechanical issues."
	cost = 500
	contains = list(/obj/item/mod/module/visor/diaghud)

/datum/supply_pack/modsuits/sec_hud
	name = "MOD Security Visor Module"
	desc = "Contains an integrated security visor for accurate target assessement."
	cost = 500
	contains = list(/obj/item/mod/module/visor/sechud)

/datum/supply_pack/modsuits/meson
	name = "MOD Meson Visor Module"
	desc = "Contains an integrated meson visor for structural assessment."
	cost = 500
	contains = list(/obj/item/mod/module/visor/meson)

/datum/supply_pack/modsuits/reagent_hud
	name = "MOD reagent Scanner Module"
	desc = "Contains an integrated reagent scanner for sample analysis."
	cost = 500
	contains = list(/obj/item/mod/module/reagent_scanner)

*/

/datum/supply_pack/faction/independent/spacesuit_armor
	group = "Spacesuits & Armor"
	crate_type = /obj/structure/closet/crate/secure


/datum/supply_pack/faction/independent/spacesuit_armor/mining_hardsuits_indie
	name = "Mining Hardsuit Crate"
	desc = "One independent branded mining hardsuit for when explorer suits just dont cut it."
	cost = 1500
	contains = list(/obj/item/clothing/suit/space/hardsuit/mining/independent)
	crate_name = "mining hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/spacesuit_armor/med_hardsuit
	name = "Medical Hardsuit Crate"
	desc = "One medical hardsuit, resistant to diseases and useful for retrieving patients in space."
	cost = 3000
	contains = list(/obj/item/clothing/suit/space/hardsuit/medical)
	crate_name = "medical hardsuit crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/faction/independent/spacesuit_armor/mining_hardsuit_heavy
	name = "Heavy Mining Hardsuit Crate"
	desc = "One deluxe heavy mining hardsuit for dangerous frontier operations. Comes with a pair of EXOCOM jet boots."
	cost = 3500
	contains = list(/obj/item/clothing/suit/space/hardsuit/mining/heavy,
					/obj/item/clothing/shoes/bhop)
	crate_name = "heavy mining hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/spacesuit_armor/sec_hardsuit_bundle
	name = "Security Hardsuit Crate"
	desc = "Contains one security hardsuit for light combat duty."
	cost = 2500
	contains = list(/obj/item/clothing/suit/space/hardsuit/security/independent)
	crate_name = "security hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/independent/spacesuit_armor/sci_hardsuit
	name = "Science Hardsuit Crate"
	desc = "Contains one science hardsuit, designed to provide safety under advanced experimental conditions."
	cost = 7000
	contains = list(/obj/item/clothing/suit/space/hardsuit/rd)
	crate_name = "science hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/spacesuit_armor/atmos_hardsuit
	name = "Atmospherics Hardsuit Crate"
	desc = "The iconic hardsuit of Nanotrasen's Atmosphere Corps, this hardsuit is known across space as a symbol of defiance in the face of sudden decompression. Smells faintly of plasma."
	cost = 2500
	contains = list(/obj/item/clothing/suit/space/hardsuit/engine/atmos)
	crate_name = "atmospherics hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/faction/independent/spacesuit_armor/science/mod_core
	name = "MOD Core Crate"
	desc = "One MODsuit core used in MOD construction."
	cost = 5000
	contains = list(/obj/item/mod/core/standard)
	crate_name = "MOD core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/spacesuit_armor/science/mod_core_plasma
	name = "MOD Plasma Core Crate"
	desc = "One MODsuit core used in MOD construction. This core is designed to be charged from solid plasma."
	cost = 5000
	contains = list(/obj/item/mod/core/plasma)
	crate_name = "MOD core crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/science/mod_core_ethereal
	name = "MOD Elzous Core Crate"
	desc = "One MODsuit core specialized for elzous, used when creating mods."
	cost = 6000
	contains = list(/obj/item/mod/core/ethereal)
	crate_name = "MOD core crate"
	crate_type = /obj/structure/closet/crate/secure/science

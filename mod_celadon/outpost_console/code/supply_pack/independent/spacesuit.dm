/datum/supply_pack/faction/independent/spacesuit
	group = "Spacesuits"
	crate_type = /obj/structure/closet/crate/secure

/*
		Spacesuits (two parts, helm and suit)
*/

/datum/supply_pack/faction/independent/spacesuit/spacesuit
	name = "Space Suit Crate"
	desc = "Contains two basic space suits. Although the technology is centuries old, it should protect you from the vacuum of space."
	cost = 500 //changed the suit type to be the one without pockets, making it more consistent with the rest of the EVA suits available
	contains = list(/obj/item/clothing/suit/space/eva,
					/obj/item/clothing/suit/space/eva,
					/obj/item/clothing/head/helmet/space/eva,
					/obj/item/clothing/head/helmet/space/eva)

/datum/supply_pack/faction/independent/spacesuit/pilot_spacesuit
	name = "Pilot Space Suit Crate"
	desc = "One pilot space suit, for improved mobility in exosuits."
	cost = 500
	contains = list(/obj/item/clothing/suit/space/pilot,
					/obj/item/clothing/head/helmet/space/pilot/random)
	crate_name = "pilot space suit crate"

/datum/supply_pack/faction/independent/spacesuit/engi_spacesuit
	name = "Engineering Space Suit Crate"
	desc = "Need to turn your ship into a safety hazard? Not a problem! This engineering space suit will help get the job done."
	cost = 1500
	contains = list(/obj/item/clothing/suit/space/engineer,
					/obj/item/clothing/head/helmet/space/light/engineer)
	crate_name = "engineering space suit crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

//fucking gezena

// /datum/supply_pack/faction/independent/spacesuit/spacesuit/pgf
// 	name = "Rakalla Crate"
// 	desc = "Contains one Rakalla Suit. It provides robust-enough protection from the elements while being quite flexible."
// 	cost = 600
// 	contains = list(/obj/item/clothing/suit/space/gezena,
// 					/obj/item/clothing/head/helmet/space/gezena)
// 	crate_name = "rakalla suit crate"
// 	faction = /datum/faction/pgf
// 	faction_discount = 0
// 	faction_locked = TRUE


/*
		Hardsuits
*/

/datum/supply_pack/faction/independent/spacesuit/mining_hardsuits_indie
	name = "Mining Hardsuit Crate"
	desc = "One independent-manufactured mining hardsuit, for when explorer suits just dont cut it."
	cost = 1500
	contains = list(/obj/item/clothing/suit/space/hardsuit/mining/independent)
	crate_name = "mining hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/spacesuit/sec_hardsuit_bundle
	name = "Security Hardsuit Crate"
	desc = "Contains one security hardsuit for light combat duty."
	cost = 2000
	contains = list(/obj/item/clothing/suit/space/hardsuit/security/independent)
	crate_name = "security hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

//clip jardsuits

// /datum/supply_pack/faction/independent/spacesuit/patroller_hardsuit
// 	name = "Patroller Hardsuit Crate"
// 	desc = "A lightly armored but highly manueverable suit utilized by the Confederated League. It allows the user to maintain a near full range of motion during usage."
// 	cost = 2000
// 	contains = list(/obj/item/clothing/suit/space/hardsuit/clip_patroller)
// 	crate_name = "patroller hardsuit crate"
// 	crate_type = /obj/structure/closet/crate/secure/gear
// 	faction = /datum/faction/clip
// 	faction_discount = 0
// 	faction_locked = TRUE

// /datum/supply_pack/faction/independent/spacesuit/spotter_hardsuit
// 	name = "Spotter Hardsuit Crate"
// 	desc = "A well armored hardsuit used as the counterpart to the Patroller, the Spotter lacks in mobility and makes up for it with bulky armor capable of protecting the user."
// 	cost = 4000
// 	contains = list(/obj/item/clothing/suit/space/hardsuit/clip_spotter)
// 	crate_name = "patroller hardsuit crate"
// 	crate_type = /obj/structure/closet/crate/secure/gear
// 	faction = /datum/faction/clip
// 	faction_discount = 0
// 	faction_locked = TRUE

//srm

// /datum/supply_pack/faction/independent/spacesuit/roumain_hardsuit
// 	name = "Roumain Hardsuit Crate"
// 	desc = "A hardsuit hand-crafted to resemble plate armor of yore, the Roumain Hardsuit allows the wearer to swiftly move whilst on the hunt, while protecting them from the beasts around them."
// 	cost = 5000
// 	contains = list(/obj/item/clothing/suit/space/hardsuit/solgov/roumain)
// 	crate_name = "roumain hardsuit crate"
// 	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/independent/spacesuit/med_hardsuit
	name = "Medical Hardsuit Crate"
	desc = "One medical hardsuit, resistant to diseases and useful for retrieving patients in space."
	cost = 3000
	contains = list(/obj/item/clothing/suit/space/hardsuit/medical)
	crate_name = "medical hardsuit crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/faction/independent/spacesuit/mining_hardsuit_heavy
	name = "Heavy Mining Hardsuit Crate"
	desc = "One deluxe heavy mining hardsuit for dangerous frontier operations. Comes with a pair of EXOCOM jet boots."
	cost = 3500
	contains = list(/obj/item/clothing/suit/space/hardsuit/mining/heavy,
					/obj/item/clothing/shoes/bhop)
	crate_name = "heavy mining hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/spacesuit/sci_hardsuit
	name = "Science Hardsuit Crate"
	desc = "Contains one science hardsuit, designed to provide safety under advanced experimental conditions."
	cost = 7000
	contains = list(/obj/item/clothing/suit/space/hardsuit/rd)
	crate_name = "science hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/spacesuit/atmos_hardsuit
	name = "Atmospherics Hardsuit Crate"
	desc = "The iconic hardsuit of Nanotrasen's Atmosphere Corps, this hardsuit is known across space as a symbol of defiance in the face of sudden decompression. Smells faintly of plasma."
	cost = 2500
	contains = list(/obj/item/clothing/suit/space/hardsuit/engine/atmos)
	crate_name = "atmospherics hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

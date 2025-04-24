/datum/supply_pack/faction/nanotrasen/spacesuit
	group = "Spacesuits"

/datum/supply_pack/faction/nanotrasen/spacesuit/med_hardsuit
	name = "Medical Hardsuit Crate"
	desc = "One medical hardsuit, resistant to diseases and useful for retrieving patients in space."
	cost = 1500
	contains = list(/obj/item/clothing/suit/space/hardsuit/medical)
	crate_name = "medical hardsuit crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/faction/nanotrasen/spacesuit/engineering_hardsuit
	name = "Engineering Hardsuit Crate"
	desc = "One engineering hardsuit, resistant to fire, radiation, and other engineering hazards. Nanotrasen reminds you that Resistant does not mean Immune."
	cost = 1500
	contains = list(/obj/item/clothing/suit/space/hardsuit/engine)
	crate_name = "engineering hardsuit crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/faction/nanotrasen/spacesuit/mining_hardsuit_heavy
	name = "Heavy Mining Hardsuit Crate"
	desc = "One heavy-duty mining hardsuit for dangerous frontier operations. Comes with a pair of EXOCOM jet boots."
	cost = 2500
	contains = list(/obj/item/clothing/suit/space/hardsuit/mining/heavy,
					/obj/item/clothing/shoes/bhop)
	crate_name = "heavy mining hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/nanotrasen/spacesuit/sci_hardsuit
	name = "Scientific Hardsuit Crate"
	desc = "Contains one science hardsuit, designed to provide safety under advanced experimental conditions, or while handling explosives."
	cost = 2000
	contains = list(/obj/item/clothing/suit/space/hardsuit/rd)
	crate_name = "scientific hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/nanotrasen/spacesuit/atmos_hardsuit
	name = "Atmospherics Hardsuit Crate"
	desc = "The iconic hardsuit of Nanotrasen's Atmosphere Corps, this hardsuit is known across space as a symbol of defiance in the face of sudden decompression. Smells faintly of plasma."
	cost = 2500
	contains = list(/obj/item/clothing/suit/space/hardsuit/engine/atmos)
	crate_name = "atmospherics hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/faction/nanotrasen/spacesuit/advanced_hardsuit
	name = "Advanced Hardsuit Crate"
	desc = "The culimination of research into robust engineering equipment. This hardsuit makes the wearer near immune to the natural hazards the Frontier can throw."
	cost = 4000
	contains = list(/obj/item/clothing/suit/space/hardsuit/engine/elite)
	crate_name = "advanced hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/faction/nanotrasen/spacesuit/heavy_sec_hardsuit
	name = "Heavy Security Hardsuit Crate"
	desc = "Nanotrasen's premier solution to security hazards in low pressure environments, a well armored, highly mobile combat suit. The wearer is advised to have their zero-g training completed before utilizing the jetpack module."
	cost = 5000
	contains = list(/obj/item/clothing/suit/space/hardsuit/security/hos)
	crate_name = "advanced hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/nanotrasen/spacesuit/hardsuitsec
	name = "Nanotrasen Security Hardsuit"
	desc = "A cheap spare security hardsuit used on NT's stations by the sec department. Provides weak protection against most damage types. Using it for combat in the frontier region of space is not recommended"
	contains = list(/obj/item/clothing/suit/space/hardsuit/security)
	cost = 3500

/datum/supply_pack/faction/nanotrasen/spacesuit/hardsuitswat
	name = "Nanotrasen MK2 SWAT hardsuit"
	desc = "Advanced MK2 SWAT hardsuit used by elite corporate assets. While it is bulky, slow and is missing a built in flashlight, it provides excellent protection against almost any weapon and is great for work in hazardous environments"
	contains = list(/obj/item/clothing/suit/space/hardsuit/swat/captain)
	cost = 11500

/datum/supply_pack/faction/solfed/spacesuit
	category = "Spacesuits"

/datum/supply_pack/faction/solfed/spacesuit/spacesuit/solgov
	name = "Solarian Vacsuit Crate"
	desc = "Contains one Tortoise Microlite Armored Suit, the pride and joy of many Solarian explorers."
	cost = 600
	contains = list(/obj/item/clothing/suit/space/solgov,
					/obj/item/clothing/head/helmet/space/solgov)
	crate_name = "space suit crate"

/datum/supply_pack/faction/solfed/spacesuit/solar_hardsuit
	name = "Solarian Hardsuit Crate"
	desc = "A heavy duty hardsuit manufactured for the Solarian Confederation. It provides decent protection while making use of an exoskeleton to stay mobile."
	cost = 5000
	contains = list(/obj/item/clothing/suit/space/hardsuit/solgov)
	crate_name = "solarian hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/solfed/spacesuit/med_hardsuit
	name = "Medical Hardsuit Crate"
	desc = "One medical hardsuit, resistant to diseases and useful for retrieving patients in space."
	cost = 1500
	contains = list(/obj/item/clothing/suit/space/hardsuit/medical)
	crate_name = "medical hardsuit crate"

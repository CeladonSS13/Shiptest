/datum/supply_pack/faction/syndicate/armor
	category = "Armor"

/datum/supply_pack/faction/syndicate/armor/hardliner_armor
	name = "Hardliner Armor Crate"
	desc = "One set of well-rounded hardliner body armor. Well. Rounded aside from the painfully obvious white. Subsidized by Cybersun Biodynamics."
	cost = 500
	contains = list(/obj/item/clothing/suit/armor/hardliners,
					/obj/item/clothing/head/helmet/hardliners)
	crate_name = "armor crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/armor/hardliner_mecha_armor
	name = "Hardliner Pilot Armor Crate"
	desc = "One set of armor manufactured for Hardliner exosuit pilots. The jacket is often sought out by those outside of it as a keepsake."
	cost = 1500
	contains = list(/obj/item/clothing/suit/armor/hardliners/jacket,
					/obj/item/clothing/head/helmet/hardliners/swat)
	crate_name = "armor crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/armor/ngr_armor
	name = "NGR Armor Crate"
	desc = "One fairly durable, well manufactured type-1 armor vest and associated helmet, painted in the proud reds of the New Gorlex Republic."
	cost = 1000
	contains = list(/obj/item/clothing/suit/armor/ngr,
					/obj/item/clothing/head/helmet/ngr)
	crate_name = "armor crate"
	crate_type = /obj/structure/closet/crate/secure/gear

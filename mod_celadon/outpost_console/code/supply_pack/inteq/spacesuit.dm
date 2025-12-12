/datum/supply_pack/faction/inteq/spacesuit
	category = "Spacesuits"

/datum/supply_pack/faction/inteq/spacesuit/pointman_hardsuit
	name = "Pointman Hardsuit Crate"
	desc = "The heaviest armor fielded by Inteq, the Pointman is a modification of surplus Blood-Red hardsuits retrofitted to fit the IRMG's mission profile."
	cost = 5000
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi/inteq)
	crate_name = "pointman hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/inteq/spacesuit/inteq_hardsuit
	name = "Inteq Hardsuit Crate"
	desc = "A bulky Mothership-native design with a monocular viewport. The Inteq Hardsuit provides decent protection and combat manueverability for members of IRMG."
	cost = 3000
	contains = list(/obj/item/clothing/suit/space/hardsuit/security/inteq)
	crate_name = "inteq hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/inteq/spacesuit/inteq
	name = "Inteq Space Suit Crate"
	desc = "Contains one IRMG Space Suit, manufactured aboard the Mothership and widely distributed among Inteq. Most of the cost is logistical in nature."
	cost = 500
	contains = list(/obj/item/clothing/suit/space/inteq,
					/obj/item/clothing/head/helmet/space/inteq)
	crate_name = "space suit crate"

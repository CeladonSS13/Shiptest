/datum/supply_pack/faction/inteq/spacesuit_armor
	group = "Spacesuits & Armor"

/datum/supply_pack/faction/inteq/spacesuit_armor/hardsuit
	name = "IRMG Pointman Hardsuit"
	desc = "A weirdly familiar hardsuit... This one is painted in InteQ brown. Provides great protection from any space threat"
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi/inteq)
	cost = 12200

/datum/supply_pack/faction/inteq/spacesuit_armor/hardsuit_sec
	name = "IRMG security hardsuit"
	desc = "A simple combat hardsuit provided to all IRMG mercenaries. Provides relatively weak protection from most common threats"
	contains = list(/obj/item/clothing/suit/space/hardsuit/security/inteq)
	cost = 4000

/datum/supply_pack/faction/inteq/spacesuit_armor/spacesuit
	name = "IRMG spacesuit"
	desc = "1 slightly armored spacesuit to provide IRMG Mercenaries protection from space"
	contains = list(/obj/item/clothing/suit/space/inteq,
					/obj/item/clothing/head/helmet/space/inteq)
	cost = 1500

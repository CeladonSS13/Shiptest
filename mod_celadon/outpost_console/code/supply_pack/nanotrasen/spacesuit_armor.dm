/datum/supply_pack/faction/nanotrasen/spacesuit_armor
	group = "Spacesuits & Armor"

/datum/supply_pack/faction/nanotrasen/spacesuit_armor/sci_hardsuit
	name = "Science Hardsuit Crate"
	desc = "Contains one science hardsuit, designed to provide safety under advanced experimental conditions."
	cost = 2000
	contains = list(/obj/item/clothing/suit/space/hardsuit/rd)
	crate_name = "science hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/nanotrasen/spacesuit_armor/hardsuitswat
	name = "Nanotrasen MK2 SWAT hardsuit"
	desc = "Advanced MK2 SWAT hardsuit used by elite corporate assets. While it is bulky, slow and is missing a built in flashlight, it provides excellent protection against almost any weapon and is great for work in hazardous environments"
	contains = list(/obj/item/clothing/suit/space/hardsuit/swat/captain)
	cost = 4500

/datum/supply_pack/faction/nanotrasen/spacesuit_armor/hardsuitsec
	name = "Vigilitas Security Hardsuit"
	desc = "A cheap spare security hardsuit used by VI in the central worlds, will provide you decent protection againt common threats"
	contains = list(/obj/item/clothing/suit/space/hardsuit/security)
	cost = 1000

/datum/supply_pack/faction/nanotrasen/spacesuit_armor/armorsec
	name = "Vigilitas Interstellar Vests Kit"
	desc = "Some security armor vests to protect you. Produced by Vigilitas Interstellar"
	contains = list(/obj/item/clothing/suit/armor/nanotrasen,
					/obj/item/clothing/suit/armor/nanotrasen,
					/obj/item/clothing/suit/armor/nanotrasen)
	cost = 1500

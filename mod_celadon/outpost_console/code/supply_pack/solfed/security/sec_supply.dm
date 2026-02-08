/datum/supply_pack/faction/solfed/sec_supply
	category = "Security - Supplies"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/solfed/sec_supply/halberd
	name = "Energy Halberd"
	desc = "Contains one Solarian Energy Halberd, for issue to your local Sonnensoldner battalion."
	cost = 10000
	contains = list(/obj/item/melee/duelenergy/halberd)
	crate_name = "energy halberd crate"

/datum/supply_pack/faction/solfed/sec_supply/saber
	name = "Energy Kampfmesser"
	desc = "Nanotrasen eswords are failing to properly deliver solarian freedom? Try this!"
	contains = list(/obj/item/melee/energy/sword/saber/knife/blue)
	cost = 450

/datum/supply_pack/faction/solfed/sec_supply/radio
	name = "Radio Transceiver Crate"
	desc = "Contains one tactical communications device."
	cost = 300
	contains = list(/obj/item/radio/transceiver/solfed)
	crate_name = "radio transceiver crate"

/datum/supply_pack/medical
	category = "Medical - Medical"

/datum/supply_pack/medical/firstaidbruises_single
	cost = 700

/datum/supply_pack/medical/firstaidburns_single
	cost = 700

/datum/supply_pack/medical/bloodpacks
	name = "Blood Pack Variety"
	cost = 700
	faction_discount = 0

/datum/supply_pack/medical/surplus
	name = "Medical Surplus"
	desc = "Contains an assortment of medical supplies haphazardly pulled from storage. German doctor not included."
	cost = 2000
	contains = list(
		/obj/item/reagent_containers/glass/bottle/charcoal,
		/obj/item/reagent_containers/glass/bottle/epinephrine,
		/obj/item/reagent_containers/glass/bottle/morphine,
		/obj/item/reagent_containers/glass/bottle/toxin,
		/obj/item/reagent_containers/glass/beaker/large,
		/obj/item/reagent_containers/pill/insulin,
		/obj/item/stack/medical/gauze,
		/obj/item/storage/box/beakers,
		/obj/item/storage/box/medigels,
		/obj/item/storage/box/syringes,
		/obj/item/storage/box/bodybags,
		/obj/item/storage/firstaid/regular,
		/obj/item/storage/firstaid/o2,
		/obj/item/storage/firstaid/toxin,
		/obj/item/storage/firstaid/brute,
		/obj/item/storage/firstaid/fire,
		/obj/item/defibrillator/loaded,
		/obj/item/reagent_containers/blood/OMinus,
		/obj/item/reagent_containers/pill/neurine,
		/obj/item/vending_refill/medical,
	)
	crate_name = "medical surplus crate"

/datum/supply_pack/medical/surplus/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to 7)
		var/item = pick(contains)
		new item(C)

/datum/supply_pack/medical/surgery
	cost = 1000
	faction_discount = 0

/datum/supply_pack/medical/herbs
	name = "Medical herbs"
	desc = "Specifically created for severely ill individuals and those struggling with addiction."
	cost = 1000
	contains = list(/obj/item/food/grown/cannabis)
	crate_name = "marijuana crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/medical/mkii_hypo
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/medical/mkii_hypo/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/mkii_hypo/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/medical/vials
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/medical/vials/empty_vial
	cost = 100

/datum/supply_pack/medical/vials/empty_vial/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/medical/vials/empty_vial/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/vials/morb_vial/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/medical/vials/morb_vial/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/vials/atro_vial/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/medical/vials/atro_vial/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/vials/sal_vial/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/medical/vials/sal_vial/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/vials/chit_vial/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/medical/vials/chit_vial/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/painkillers
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/medical/anesthetic
	faction_discount = 0
	faction_locked = TRUE

/datum/supply_pack/medical/vials/dexa_vial/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/vials/stas_vial/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/medical/vials/erp_vial/syndicate
	faction = /datum/faction/syndicate

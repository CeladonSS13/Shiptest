/datum/supply_pack/faction/syndicate/medical
	group = "Medical"

/datum/supply_pack/faction/syndicate/medical/painkillers
	name = "Painkiller Supply Crate"
	desc = "Contains a supply of painkillers. Great for stopping headaches, feeling broken bones, and screaming people!"
	cost = 1000
	contains = list(
		/obj/item/reagent_containers/chem_pack/dimorlin,
		/obj/item/reagent_containers/glass/bottle/morphine,
		/obj/item/reagent_containers/glass/bottle/morphine,
		/obj/item/reagent_containers/glass/bottle/tramal,
		/obj/item/reagent_containers/glass/bottle/tramal,)

/datum/supply_pack/faction/syndicate/medical/surgery
	name = "Surgical Supplies Crate"
	desc = "Do you want to perform surgery, but don't have one of those fancy shmancy degrees? Just get started with this crate containing a medical case, Sterilizine spray and collapsible roller bed."
	cost = 3000
	contains = list(/obj/item/storage/case/surgery,
					/obj/item/reagent_containers/medigel/sterilizine,
					/obj/item/roller)
	crate_name = "surgical supplies crate"

/datum/supply_pack/faction/syndicate/medical/anesthetic
	name = "Anesthetics Crate"
	desc = "Contains a standard anesthetics tank, for standard surgical procedures."
	cost = 500
	contains = list(/obj/item/clothing/mask/breath/medical,
					/obj/item/tank/internals/anesthetic)
	crate_name = "anesthetics crate"

/*
		Bundles and supplies
*/

/datum/supply_pack/faction/syndicate/medical/bloodpacks
	name = "Blood Pack Variety Crate"
	desc = "Contains several different blood packs for reintroducing blood to patients."
	cost = 1000
	contains = list(/obj/item/reagent_containers/blood,
					/obj/item/reagent_containers/blood,
					/obj/item/reagent_containers/blood/APlus,
					/obj/item/reagent_containers/blood/AMinus,
					/obj/item/reagent_containers/blood/BPlus,
					/obj/item/reagent_containers/blood/BMinus,
					/obj/item/reagent_containers/blood/OPlus,
					/obj/item/reagent_containers/blood/OMinus,
					/obj/item/reagent_containers/blood/lizard,
					/obj/item/reagent_containers/blood/elzuose,
					/obj/item/reagent_containers/blood/synthetic)
	crate_name = "blood freezer"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/syndicate/medical/surplus
	name = "Medical Surplus Crate"
	desc = "Contains an assortment of medical supplies haphazardly pulled from storage. German doctor not included."
	cost = 3000
	contains = list(/obj/item/reagent_containers/glass/bottle/charcoal,
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
					/obj/item/storage/pill_bottle/mining,
					/obj/item/reagent_containers/pill/neurine,
					/obj/item/vending_refill/medical)
	crate_name = "medical surplus crate"

/datum/supply_pack/faction/syndicate/medical/surplus/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to 7)
		var/item = pick(contains)
		new item(C)

/datum/supply_pack/faction/syndicate/medical/mkii_hypo
	name = "mk.II Hypospray kit"
	desc = "Contains an Cybersun Hypospray, for on the field medical care. Comes with an assortment of Ready-To-Go Vials"
	cost = 1200
	contains = list(/obj/item/storage/box/hypospray)
	crate_name = "mk.II hypospray crate"

/*	Vial  */

/datum/supply_pack/faction/syndicate/medical/vials
	faction_discount = 50

/datum/supply_pack/faction/syndicate/medical/vials/empty_vial
	name = "Empty Vial Crate"
	desc = "Contains 2 empty hypospray vials, for usage in a Hypospray."
	cost = 200
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small,
		/obj/item/reagent_containers/glass/bottle/vial/small
	)
	crate_name = "empty vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/bica_vial
	name = "Bicardine Vial Crate"
	desc = "Contains a spare bicardine vial, for usage in a Hypospray."
	cost = 400
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/bicaridine,
	)
	crate_name = "bicardine vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/kelo_vial
	name = "Kelotane Vial Crate"
	desc = "Contains a spare kelotane vial, for usage in a Hypospray."
	cost = 400
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/kelotane,
	)
	crate_name = "kelotane vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/dylo_vial
	name = "Dylovene Vial Crate"
	desc = "Contains a spare dylovene vial, for usage in a Hypospray."
	cost = 400
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/antitoxin,
	)
	crate_name = "dylovene vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/dexa_vial
	name = "Dexalin Vial Crate"
	desc = "Contains a spare dexalin vial, for usage in a Hypospray."
	cost = 400
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/dexalin,
	)
	crate_name = "dexalin vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/tric_vial
	name = "Tricordrazine Vial Crate"
	desc = "Contains a spare tricordrazine vial, for usage in a Hypospray."
	cost = 300
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/tricord,
	)
	crate_name = "tricordrazine vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/morb_vial
	name = "Morphine Vial Crate"
	desc = "Contains a spare morphine vial, for usage in a Hypospray."
	cost = 500
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/morphine,
	)
	crate_name = "morphine vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/atro_vial
	name = "Atropine Vial Crate"
	desc = "Contains a spare atropine vial, for usage in a Hypospray."
	cost = 500
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/atropine,
	)
	crate_name = "atropine vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/stas_vial
	name = "Stasis Vial Crate"
	desc = "Contains a spare stasis vial, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/stasis,
	)
	crate_name = "stasis vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/erp_vial
	name = "Radiation Purgant Vial Crate"
	desc = "Contains 2 spare radiation purgant vials, for usage in a Hypospray."
	cost = 600
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/erp,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/erp
	)
	crate_name = "radiation purgant vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/sal_vial
	name = "SalGlu Vial Crate"
	desc = "Contains 2 spare SalGlu Solution vials, for usage in a Hypospray."
	cost = 600
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/salclu,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/salclu
	)
	crate_name = "SalGlu vial crate"

/datum/supply_pack/faction/syndicate/medical/vials/chit_vial
	name = "Chitosan Vial Crate"
	desc = "Contains 2 spare Chitosan vials, for usage in a Hypospray."
	cost = 600
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/chitosan,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/chitosan
	)
	crate_name = "chitosan vial crate"

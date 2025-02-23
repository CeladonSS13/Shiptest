/datum/supply_pack/faction/independent/medical
	group = "Medical"
	crate_type = /obj/structure/closet/crate/medical


/datum/supply_pack/faction/independent/medical/surplus
	name = "Medical Surplus Crate"
	desc = "Contains an assortment of medical supplies haphazardly pulled from storage. German doctor not included."
	cost = 2000
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

/datum/supply_pack/faction/independent/medical/surplus/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to 7)
		var/item = pick(contains)
		new item(C)

// /datum/supply_pack/faction/independent/medical/virus	// Перенести в Блэкмаркет
// 	name = "Virus Crate"
// 	desc = "Contains twelve different bottles, containing several viral samples for virology research. Also includes seven beakers and syringes. Balled-up jeans not included."
// 	cost = 3500
// 	contains = list(/obj/item/reagent_containers/glass/bottle/flu_virion,
// 					/obj/item/reagent_containers/glass/bottle/cold,
// 					/obj/item/reagent_containers/glass/bottle/random_virus,
// 					/obj/item/reagent_containers/glass/bottle/random_virus,
// 					/obj/item/reagent_containers/glass/bottle/random_virus,
// 					/obj/item/reagent_containers/glass/bottle/random_virus,
// 					/obj/item/reagent_containers/glass/bottle/fake_gbs,
// 					/obj/item/reagent_containers/glass/bottle/magnitis,
// 					/obj/item/reagent_containers/glass/bottle/pierrot_throat,
// 					/obj/item/reagent_containers/glass/bottle/brainrot,
// 					/obj/item/reagent_containers/glass/bottle/anxiety,
// 					/obj/item/reagent_containers/glass/bottle/beesease,
// 					/obj/item/storage/box/syringes,
// 					/obj/item/storage/box/beakers,
// 					/obj/item/reagent_containers/glass/bottle/mutagen)
// 	crate_name = "virus crate"
// 	crate_type = /obj/structure/closet/crate/medical

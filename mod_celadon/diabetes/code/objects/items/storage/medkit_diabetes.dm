/obj/item/storage/firstaid/diabetes
	name = "diabetes medical kit"
	desc = "A specialized medical kit for diabetics containing insulin supplies and monitoring equipment."
	icon_state = "firstaid"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'

/obj/item/storage/firstaid/diabetes/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/hypospray/medipen/insulin = 3,
		/obj/item/reagent_containers/syringe = 2,
		/obj/item/reagent_containers/glass/bottle/insulin = 1,
		/obj/item/healthanalyzer = 1)
	generate_items_inside(items_inside,src)

// Insulin medipen
/obj/item/reagent_containers/hypospray/medipen/insulin
	name = "insulin medipen"
	desc = "A rapid-dose insulin injector for diabetic emergencies."
	icon_state = "insulin"
	volume = 15
	amount_per_transfer_from_this = 15

/obj/item/reagent_containers/hypospray/medipen/insulin/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/medicine/insulin, 15)

// Insulin bottle
/obj/item/reagent_containers/glass/bottle/insulin
	name = "insulin bottle"
	desc = "A small bottle containing insulin for diabetic treatment."
	volume = 60

/obj/item/reagent_containers/glass/bottle/insulin/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/medicine/insulin, 60)

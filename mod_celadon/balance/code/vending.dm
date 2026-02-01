/obj/machinery/vending
	///A variable to change on a per instance basis on the map that allows the instance to remove cost and ID requirements
	all_items_free = FALSE
	/// Это нужно для проверки, а был ли автомат разобран с инструментами или нет
	var/valid = FALSE

// MEDWALL - Все же аптечки должны бесплатно продавать вещи
/obj/machinery/vending/wallmed
	all_items_free = TRUE

/obj/machinery/vending/wallmed/ship //специальный вариант валлмеда для шипов и руинок, без бесконечных рестоков и дебаг лута
	name = "\improper wall-mounted NanoMed"
	desc = "Wall-mounted Medical Equipment dispenser."
	product_ads = ""
	armor = list("melee" = 20, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 70)
	restock_hourly = FALSE

	products = list(
		/obj/item/stack/medical/bruise_pack = 2,
		/obj/item/stack/medical/ointment = 2,
		/obj/item/stack/medical/gauze = 4,
		/obj/item/stack/medical/splint = 2,
		/obj/item/stack/medical/bone_gel = 1,
		/obj/item/storage/pill_bottle/charcoal/less = 1,
		/obj/item/reagent_containers/syringe/antiviral = 2,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 2,
		/obj/item/reagent_containers/hypospray/medipen/tramal = 2,
		/obj/item/healthanalyzer = 2,
	)
	contraband = list(
		/obj/item/reagent_containers/pill/tox = 1,
		/obj/item/storage/box/gum/happiness = 1,
	)
	premium = list(
		/obj/item/reagent_containers/pill/patch/indomide = 2,
		/obj/item/reagent_containers/pill/patch/alvitane = 2,
		/obj/item/reagent_containers/medigel/hadrakine = 2,
		/obj/item/reagent_containers/medigel/quardexane = 2,
	)

/obj/machinery/vending/medical/outpost_access
	name = "\improper Elysium Plus"
	all_items_free = TRUE
	req_access = list(ACCESS_OUTPOST_COMMAND,
					ACCESS_OUTPOST_BRIG_SB,
					ACCESS_OUTPOST_DETECTIVE,
					ACCESS_OUTPOST_BRIGADIR,
					ACCESS_OUTPOST_MED_CMO)

/obj/machinery/vending/boozeomat/outpost_access
	name = "\improper Elysium Boozeomat"
	all_items_free = TRUE
	req_access = list(ACCESS_OUTPOST_COMMAND,
					ACCESS_OUTPOST_BRIG_SB,
					ACCESS_OUTPOST_DETECTIVE,
					ACCESS_OUTPOST_BRIGADIR,
					ACCESS_OUTPOST_MED_CMO,
					ACCESS_OUTPOST_SERVICE_COOK,
					ACCESS_OUTPOST_SERVICE_BARTENDER)
	age_restrictions = FALSE

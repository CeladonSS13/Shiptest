/obj/machinery/vending
	///A variable to change on a per instance basis on the map that allows the instance to remove cost and ID requirements
	all_items_free = FALSE
	/// Это нужно для проверки, а был ли автомат разобран с инструментами или нет
	var/valid = FALSE

// MEDWALL - Все же аптечки должны бесплатно продавать вещи
/obj/machinery/vending/wallmed
	all_items_free = TRUE

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

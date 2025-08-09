/// CORONER

/datum/job/outpost/coroner
	name = "Outpost Coroner"
	wiki_page = "Guide_to_Medicine"

	outfit = /datum/outfit/outpost/coroner

	access = list(ACCESS_OUTPOST_MED_CORONER, ACCESS_OUTPOST_MED_MORGUE, ACCESS_OUTPOST_MED_GENERAL, ACCESS_MORGUE, ACCESS_MEDICAL, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_OUTPOST_MED_CORONER, ACCESS_OUTPOST_MED_MORGUE, ACCESS_OUTPOST_MED_GENERAL, ACCESS_MORGUE)

	display_order = JOB_DISPLAY_ORDER_CORONER

/datum/outfit/outpost/coroner
	name = "Outpost Coroner"

	belt = /obj/item/pda/medical
	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/doctor
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit = /obj/item/clothing/suit/toggle/labcoat/paramedic
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	l_hand = /obj/item/bodybag
	suit_store = /obj/item/flashlight/pen
	id = /obj/item/card/id/elysium_coroner

	back = /obj/item/storage/backpack/medic
	// satchel = /obj/item/storage/backpack/satchel/med
	// duffelbag = /obj/item/storage/backpack/duffelbag/med
	// courierbag = /obj/item/storage/backpack/messenger/med
	box = /obj/item/storage/box/survival/medical

	backpack_contents = list(
		/obj/item/paper_bin = 1,
		/obj/item/pen = 2,
		/obj/item/folder = 2,
		/obj/item/stamp/coroner = 1,
		/obj/item/paper_scanner = 1,
		/obj/item/spacecash/bundle/c100 = 3
	)

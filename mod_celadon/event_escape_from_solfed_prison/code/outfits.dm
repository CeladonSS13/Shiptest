#define FACTION_PLAYER_SOLFED_ERT "playerSolFedERT"

/datum/job/event_escape_from_prison
	name = "SolFed ERT Squad"
	access = list(ACCESS_SOLGOV, ACCESS_OUTPOST_FACTION_SOLFED)
	minimal_access = list(ACCESS_SOLGOV, ACCESS_OUTPOST_FACTION_SOLFED)

// MARK: Officer
/datum/job/event_escape_from_prison/ert_solfed_officer
	name = "SolFed ERT Officer"
	outfit = /datum/outfit/event_escape_from_prison/ert_solfed_officer
	display_order = JOB_DISPLAY_ORDER_SOLGOV

/datum/outfit/event_escape_from_prison/ert_solfed_officer
	name = "SolFed ERT Officer"

	head = /obj/item/clothing/head/solfed/beret
	mask = /obj/item/clothing/mask/gas/solfed
	belt = /obj/item/storage/belt/military/solfed
	gloves = /obj/item/clothing/gloves/combat/solfed
	ears = /obj/item/radio/headset/solgov
	glasses = /obj/item/clothing/glasses/sunglasses/ballistic
	uniform = /obj/item/clothing/under/solgov/formal
	shoes = /obj/item/clothing/shoes/jackboots/knife
	suit =  /obj/item/clothing/suit/armor/solfed/formal
	id = /obj/item/card/id/solfed
	back = /obj/item/storage/backpack/satchel/solfed
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1)
	box = /obj/item/storage/box/survival/security

/datum/outfit/event_escape_from_prison/ert_solfed_officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PLAYER_SOLFED_ERT)

// MARK: MEDIC
/datum/job/event_escape_from_prison/ert_solfed_medic
	name = "SolFed ERT Medic"
	outfit = /datum/outfit/event_escape_from_prison/ert_solfed_medic
	display_order = JOB_DISPLAY_ORDER_SOLGOV

/datum/outfit/event_escape_from_prison/ert_solfed_medic
	name = "SolFed ERT Medic"

	head = /obj/item/clothing/head/helmet/solfed/m11
	mask = /obj/item/clothing/mask/gas/solfed
	belt = /obj/item/storage/belt/military/solfed/medical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	ears = /obj/item/radio/headset/solgov
	glasses = /obj/item/clothing/glasses/sunglasses/ballistic
	uniform = /obj/item/clothing/under/solfed/medical
	shoes = /obj/item/clothing/shoes/jackboots/knife
	suit =  /obj/item/clothing/suit/armor/vest/marine
	id = /obj/item/card/id/solfed
	back = /obj/item/storage/backpack/solfed
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1)
	box = /obj/item/storage/box/survival/medical

/datum/outfit/event_escape_from_prison/ert_solfed_medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/obj/item/storage/box/medigels/I = new(src)
	H.equip_to_slot_or_del(I, ITEM_SLOT_BACKPACK)

/datum/outfit/event_escape_from_prison/ert_solfed_medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PLAYER_SOLFED_ERT)

// MARK: Solder
/datum/job/event_escape_from_prison/ert_solfed_solder
	name = "SolFed ERT Solder"
	outfit = /datum/outfit/event_escape_from_prison/ert_solfed_solder
	display_order = JOB_DISPLAY_ORDER_SOLGOV

/datum/outfit/event_escape_from_prison/ert_solfed_solder
	name = "SolFed ERT Solder"

	head = /obj/item/clothing/head/helmet/solfed/m11
	mask = /obj/item/clothing/mask/gas/solfed
	belt = /obj/item/storage/belt/military/solfed
	gloves = /obj/item/clothing/gloves/combat/solfed
	ears = /obj/item/radio/headset/solgov
	glasses = /obj/item/clothing/glasses/sunglasses/ballistic
	uniform = /obj/item/clothing/under/solfed/camo
	shoes = /obj/item/clothing/shoes/jackboots/knife
	suit =  /obj/item/clothing/suit/armor/vest/marine/medium
	id = /obj/item/card/id/solfed
	back = /obj/item/storage/backpack/solfed
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1)
	box = /obj/item/storage/box/survival/security

/datum/outfit/event_escape_from_prison/ert_solfed_solder/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PLAYER_SOLFED_ERT)

// MARK: Prisoner
/datum/job/event_escape_from_prison/prisoner
	name = "Prisoner"
	outfit = /datum/outfit/event_escape_from_prison/prisoner
	display_order = JOB_DISPLAY_ORDER_PRISONER
	access = list()
	minimal_access = list()

/datum/outfit/event_escape_from_prison/prisoner
	uniform = /obj/item/clothing/under/rank/prisoner/protected_custody
	shoes = /obj/item/clothing/shoes/sneakers/orange
	id = /obj/item/card/id/prisoner
	ears = null
	belt = null

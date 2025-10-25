//										//
//MARK:	SOLAR FEDERATION
//										//
/datum/outfit/job/cel/solfed
	name = "SF - Base Outfit"
	faction = FACTION_PLAYER_SOLFED
	job_icon = "hudsf_fieldside"
	faction_icon = "bg_solfed"

	box = /obj/item/storage/box/survival/solfed
	id = /obj/item/card/id/cel/solfed

/datum/outfit/job/cel/solfed/proc/get_solfed_captain_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id))
				I = O
				break
		if (I)
			I.access += list(ACCESS_SOLGOV, ACCESS_CAPTAIN, ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/cel/solfed/proc/get_solfed_head_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id))
				I = O
				break
		if (I)
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/cel/solfed/proc/get_solfed_marine_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id))
				I = O
				break
		if (I)
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/cel/solfed/proc/get_solfed_engineer_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id))
				I = O
				break
		if (I)
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

//MARK:	SolFed outpost access

/datum/outfit/job/cel/solfed/proc/get_solfed_general_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id))
				I = O
				break
		if (I)
			I.access += list(ACCESS_OUTPOST_FACTION_SOLFED)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/cel/solfed/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	H.grant_language(/datum/language/solarian_international)
	get_solfed_general_access(H)

/datum/outfit/job/cel/solfed/bureaucrat
	name = "SF - Bureaucrat"
	id_assignment = "Bureaucrat"
	jobtype = /datum/job/curator
	job_icon = "curator"

	head = /obj/item/clothing/head/beret/solgov
	uniform = /obj/item/clothing/under/solgov/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/solgov/bureaucrat
	l_hand = /obj/item/storage/bag/books
	r_pocket = /obj/item/key/displaycase
	l_pocket = /obj/item/laser_pointer
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	backpack_contents = list(
		/obj/item/barcodescanner = 1
	)

/datum/outfit/job/cel/solfed/sonnensoldner
	name = "SF - Sonnensöldner"
	id_assignment = "Sonnensöldner"
	jobtype = /datum/job/officer
	job_icon = "sonnensoldner"

	id = /obj/item/card/id/solgov
	uniform = /obj/item/clothing/under/solgov
	suit = /obj/item/clothing/suit/armor/vest/solgov
	ears = /obj/item/radio/headset/solgov/alt
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/solgov/sonnensoldner
	r_pocket = null
	l_pocket = null
	shoes = /obj/item/clothing/shoes/workboots
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/crowbar/power)

/datum/outfit/job/cel/solfed/representative
	name = "SF - Solarian Representative"
	jobtype = /datum/job/solgov
	job_icon = "solgovrepresentative"

	id = /obj/item/card/id/solgov
	head = /obj/item/clothing/head/solgov
	uniform = /obj/item/clothing/under/solgov/formal
	accessory = /obj/item/clothing/accessory/waistcoat/solgov
	neck = /obj/item/clothing/neck/cloak/solgov
	suit = /obj/item/clothing/suit/toggle/solgov
	alt_suit = /obj/item/clothing/suit/armor/solgov_trenchcoat
	dcoat = /obj/item/clothing/suit/hooded/wintercoat
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/solgov/captain
	glasses = /obj/item/clothing/glasses/sunglasses

	implants = list(/obj/item/implant/mindshield)

	backpack_contents = list(
		/obj/item/melee/knife/letter_opener = 1
	)

/datum/outfit/job/cel/solfed/overseer
	name = "SF - Overseer"
	id_assignment = "Overseer"
	jobtype = /datum/job/head_of_personnel
	job_icon = "headofpersonnel"

	id = /obj/item/card/id/solgov
	ears = /obj/item/radio/headset/solgov/captain
	uniform = /obj/item/clothing/under/solgov/formal
	head = /obj/item/clothing/head/solgov
	neck = /obj/item/clothing/neck/cloak/overseer
	suit = /obj/item/clothing/suit/armor/vest/solgov/overseer
	shoes = /obj/item/clothing/shoes/laceup

	backpack_contents = list(/obj/item/storage/box/ids = 1,
							/obj/item/modular_computer/tablet/preset/advanced = 1)

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/officer)

/datum/outfit/job/cel/solfed/psychologist
	name = "SF - Psychologist"
	jobtype = /datum/job/psychologist
	job_icon = "psychologist"

	head = /obj/item/clothing/head/fedora/solgov
	suit = /obj/item/clothing/suit/solgov/suit
	ears = /obj/item/radio/headset/headset_srvmed
	uniform = /obj/item/clothing/under/solgov/formal
	shoes = /obj/item/clothing/shoes/laceup
	id = /obj/item/card/id
	l_hand = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med

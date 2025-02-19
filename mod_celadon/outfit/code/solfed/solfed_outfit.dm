//										//
//			SOLAR FEDERATION			//
//										//

/datum/outfit/job/solfed/proc/get_solfed_captain_access(mob/living/carbon/human/H)
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
			I.access = list(ACCESS_SOLGOV, ACCESS_CAPTAIN, ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED, ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/solfed/proc/get_solfed_head_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED, ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/solfed/proc/get_solfed_marine_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED, ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/solfed/proc/get_solfed_engineer_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED, ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/// SolFed outpost access

/datum/outfit/job/solfed/proc/get_solfed_general_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_OUTPOST_FACTION_SOLFED, ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/solfed
	name = "SolFed Base Outfit"

	faction_icon = "bg_solgov"

/datum/outfit/job/solfed/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PLAYER_SOLGOV)
	get_solfed_general_access(H)

	// Даёт всем СФкам брендовый сурвивал бокс
/datum/outfit/job/solgov
	box = /obj/item/storage/box/survival/solfed

/datum/outfit/job/solgov/ert/inspector
	box = /obj/item/storage/box/survival/solfed

/datum/outfit/job/solgov/sonnensoldner
	box = /obj/item/storage/box/survival/solfed

/datum/outfit/job/solgov/engineer
	box = /obj/item/storage/box/survival/solfed

/datum/outfit/job/solgov/doctor
	box = /obj/item/storage/box/survival/solfed

/datum/outfit/job/solgov/miner
	box = /obj/item/storage/box/survival/solfed

// Ученые
/datum/outfit/job/solfed/scientist
	name = "SolFed - Wissenschaftler"
	jobtype = /datum/job/scientist
	job_icon = "scientist"

	id = /obj/item/card/id/solfed
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solgov/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

/datum/outfit/job/solgov/scientist/roboticist
	name = "SolFed - Roboterkonstrukteur"
	job_icon = "roboticist"
	jobtype = /datum/job/roboticist

	uniform = /obj/item/clothing/under/rank/rnd/roboticist
	suit = /obj/item/clothing/suit/longcoat/robowhite

	backpack_contents = list(/obj/item/weldingtool/hugetank)

// Военно-морской флот

/datum/outfit/job/solfed/marine
	name = "SolFed - Marine"
	jobtype = /datum/job/officer
	job_icon = "sonnensoldner"

	id = /obj/item/card/id/solfed
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solfed
	shoes = /obj/item/clothing/shoes/jackboots

/datum/outfit/job/solfed/marine/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_marine_access(H)

/datum/outfit/job/solfed/marine/pilot
	name = "SolFed - Schwerer Roboterpilot"
	jobtype = /datum/job/officer
	job_icon = "sonnensoldner"

	head = /obj/item/clothing/head/solfed/cap
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/jacket/leather

/datum/outfit/job/solfed/captain
	name = "SolFed - Kommandant"
	jobtype = /datum/job/captain
	job_icon = "solgovrepresentative" // idk
	id = /obj/item/card/id/solfed/commander
	gloves = /obj/item/clothing/gloves/combat/solfed/captain
	ears = /obj/item/radio/headset/solgov/alt/captain
	uniform =  /obj/item/clothing/under/solfed/formal
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/solfed/beret
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1)

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

/datum/outfit/job/solfed/captain/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_captain_access(H)

/datum/outfit/job/solfed/captain/admiral
	name = "SolFed - Flottenadmiral"
	jobtype = /datum/job/captain
	job_icon = "solgovrepresentative"

	suit = /obj/item/clothing/suit/armor/solfed/formal

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/solfed/sergeant
	name = "SolFed - Feldwebel"
	jobtype = /datum/job/captain
	job_icon = "solgovrepresentative"

	uniform = /obj/item/clothing/under/solfed/camo
	shoes = /obj/item/clothing/shoes/combat
	backpack = /obj/item/storage/backpack/ert/engineer
	id = /obj/item/card/id/solfed

/datum/outfit/job/solfed/sergeant/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

/datum/outfit/job/solfed/hop
	name = "SolFed - Personalvorgesetzter"
	jobtype = /datum/job/head_of_personnel
	job_icon = "headofpersonnel"

	id = /obj/item/card/id/solfed/commander
	uniform = /obj/item/clothing/under/solfed
	shoes = /obj/item/clothing/shoes/laceup

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed
	courierbag = /obj/item/storage/backpack/messenger/com

/datum/outfit/job/solfed/hop/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

/datum/outfit/job/solfed/doctor
	name = "SolFed - Meeresarzt"
	jobtype = /datum/job/paramedic
	job_icon = "medicaldoctor"

	id = /obj/item/card/id/solfed
	uniform = /obj/item/clothing/under/solfed/medical
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/solfed/surgical

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed

/datum/outfit/job/solfed/doctor/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

/datum/outfit/job/solfed/engineer
	name = "SolFed - Marinemechaniker"
	jobtype = /datum/job/engineer
	job_icon = "stationengineer"

	id = /obj/item/card/id/solfed
	uniform = /obj/item/clothing/under/solfed/industrial
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/solfed
	belt = /obj/item/storage/belt/utility/full/engi

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed

/datum/outfit/job/solfed/engineer/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

/datum/outfit/job/solfed/assistant
	name = "SolFed - Gehilfe"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	id = /obj/item/card/id/solfed
	uniform = /obj/item/clothing/under/solfed/assistant
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/solfed/cap

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed


//							///
//		Elysium Brigade 	///
//							///

//	Капитан	//
/datum/outfit/job/solfed/captain/elysium
	name = "SolFed - Elysium Musharif"

	head = /obj/item/clothing/head/solfed/beret/elysium
	uniform = /obj/item/clothing/under/solfed/formal/elysium
	suit = /obj/item/clothing/suit/armor/solfed/formal/elysium
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/solgov/alt/captain
	id = /obj/item/card/id/solfed/commander
	backpack = /obj/item/storage/backpack/messenger/com
	gloves = null

/datum/outfit/job/solfed/captain/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_captain_access(H)

//	Хос	//
/datum/outfit/job/solfed/sergeant/elysium
	name = "SolFed - Elysium Mulazim"

	head = /obj/item/clothing/head/solfed/beret/elysium
	uniform = /obj/item/clothing/under/solfed/camo/elysium
	suit = /obj/item/clothing/suit/armor/solfed/formal/elysium
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/solgov/alt
	id = /obj/item/card/id/solfed
	neck = null

/datum/outfit/job/solfed/sergeant/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

//	Офицер	//
/datum/outfit/job/solfed/marine/elysium
	name = "SolFed - Elysium Haris"

	id = /obj/item/card/id/solfed
	head = null
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium

/datum/outfit/job/solfed/marine/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_marine_access(H)

//	медик	//
/datum/outfit/job/solfed/doctor/elysium
	name = "SolFed - Elysium Shafi"

	id = /obj/item/card/id/solfed
	head = null
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium

/datum/outfit/job/solfed/doctor/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

//	Инженер	//
/datum/outfit/job/solfed/engineer/elysium
	name = "SolFed - Elysium Khabeer Fanni"

	id = /obj/item/card/id/solfed
	head = null
	suit = null
	gloves = null
	belt = /obj/item/storage/belt/utility/full/engi
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium

/datum/outfit/job/solfed/engineer/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

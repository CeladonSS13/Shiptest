//										//
//MARK:	SOLAR FEDERATION
//										//
/datum/outfit/job/solfed
	name = "SolFed - Base Outfit"
	faction = FACTION_PLAYER_SOLFED
	faction_icon = "bg_solfed"

	box = /obj/item/storage/box/survival/solfed
	id = /obj/item/card/id/cel/solfed

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
			I.access += list(ACCESS_SOLGOV, ACCESS_CAPTAIN, ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
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
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
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
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_BRIG, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
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
			I.access += list(ACCESS_ENGINE, ACCESS_MEDICAL, ACCESS_SECURITY, ACCESS_OUTPOST_FACTION_SOLFED)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

//MARK:	SolFed outpost access

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
			I.access += list(ACCESS_OUTPOST_FACTION_SOLFED)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/solfed/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	get_solfed_general_access(H)

//MARK:	Ученые
/datum/outfit/job/solfed/scientist
	name = "SolFed - Wissenschaftler"
	jobtype = /datum/job/scientist
	job_icon = "scientist"

	id = /obj/item/card/id/cel/solfed/crew
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solgov/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

/datum/outfit/job/solfed/scientist/roboticist
	name = "SolFed - Roboterkonstrukteur"
	job_icon = "roboticist"
	jobtype = /datum/job/roboticist

	uniform = /obj/item/clothing/under/rank/rnd/roboticist
	suit = /obj/item/clothing/suit/longcoat/robowhite

	backpack_contents = list(/obj/item/weldingtool/hugetank)

//MARK:	Военно-морской флот

/datum/outfit/job/solfed/marine
	name = "SolFed - Marine"
	jobtype = /datum/job/officer
	job_icon = "sonnensoldner"

	id = /obj/item/card/id/cel/solfed/crew
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
	id = /obj/item/card/id/cel/solfed/captain
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

	id = /obj/item/card/id/cel/solfed/admiral
	suit = /obj/item/clothing/suit/armor/solfed/formal

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/solfed/sergeant
	name = "SolFed - Feldwebel"
	jobtype = /datum/job/captain
	job_icon = "solgovrepresentative"

	uniform = /obj/item/clothing/under/solfed/camo
	shoes = /obj/item/clothing/shoes/combat
	backpack = /obj/item/storage/backpack/ert/engineer
	id = /obj/item/card/id/cel/solfed/command

/datum/outfit/job/solfed/sergeant/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

/datum/outfit/job/solfed/hop
	name = "SolFed - Personalvorgesetzter"
	jobtype = /datum/job/head_of_personnel
	job_icon = "headofpersonnel"

	id = /obj/item/card/id/cel/solfed/command
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

	id = /obj/item/card/id/cel/solfed/crew
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

	id = /obj/item/card/id/cel/solfed/crew
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

	id = /obj/item/card/id/cel/solfed/assistant
	uniform = /obj/item/clothing/under/solfed/assistant
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/solfed/cap

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed

/datum/outfit/job/solfed/miner
	name = "SolFed - Contract Miner"
	jobtype = /datum/job/mining
	job_icon = "shaftminer"

	id = /obj/item/card/id/cel/solfed/crew
	uniform = /obj/item/clothing/under/solfed/industrial
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/solfed
	belt = /obj/item/storage/belt/mining

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed

/datum/outfit/job/solfed/miner/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_general_access(H)

/datum/outfit/job/solfed/quartermaster
	name = "SolFed - Logistikbeauftragter"
	jobtype = /datum/job/qm
	job_icon = "quartermaster"

	id = /obj/item/card/id/cel/solfed/command
	uniform = /obj/item/clothing/under/solfed
	head = /obj/item/clothing/head/solfed/beret
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/solgov/overcoat

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed
	courierbag = /obj/item/storage/backpack/messenger/com

/datum/outfit/job/solfed/miner/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_general_access(H)

/datum/outfit/job/solfed/patient
	job_icon = "assistant" // todo: bug rye for patient icon // rye. rye. give me 50 gazillion billion dollars paypal
	name = "SolFed - Attentive Care Patient"
	id_assignment = "Attentive Care Patient"
	jobtype = /datum/job/prisoner

	id = /obj/item/card/id/patient
	uniform = /obj/item/clothing/under/rank/medical/gown
	alt_suit = null
	shoes = /obj/item/clothing/shoes/sandal/slippers
//							///
//MARK:	Elysium Brigade
//							///

//	Капитан	//
/datum/outfit/job/solfed/captain/elysium
	job_icon = "assistant"
	name = "SolFed - Elysium Musharif"

	id = /obj/item/card/id/cel/solfed/captain/elysium
	head = /obj/item/clothing/head/solfed/beret/elysium
	uniform = /obj/item/clothing/under/solfed/formal/elysium
	suit = /obj/item/clothing/suit/armor/solfed/formal/elysium
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/solgov/alt/captain
	backpack = /obj/item/storage/backpack/messenger/com
	gloves = null

	faction_icon = "bg_elysium"

/datum/outfit/job/solfed/captain/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_captain_access(H)

//MARK:	Хос
/datum/outfit/job/solfed/sergeant/elysium
	job_icon = "headofsecurity"
	name = "SolFed - Elysium Mulazim"

	id = /obj/item/card/id/cel/solfed/command/elysium
	head = /obj/item/clothing/head/solfed/beret/elysium
	uniform = /obj/item/clothing/under/solfed/camo/elysium
	suit = /obj/item/clothing/suit/armor/solfed/formal/elysium
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/solgov/alt
	neck = null

	faction_icon = "bg_elysium"

/datum/outfit/job/solfed/sergeant/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

//MARK:	Офицер
/datum/outfit/job/solfed/marine/elysium
	job_icon = "securityofficer"
	name = "SolFed - Elysium Haris"

	id = /obj/item/card/id/cel/solfed/crew/elysium
	head = null
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium

	faction_icon = "bg_elysium"

/datum/outfit/job/solfed/marine/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_marine_access(H)

//MARK:	медик
/datum/outfit/job/solfed/doctor/elysium
	job_icon = "assistant"
	name = "SolFed - Elysium Shafi"

	id = /obj/item/card/id/cel/solfed/crew/elysium
	head = null
	suit = null
	gloves = null
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium

	faction_icon = "bg_elysium"

/datum/outfit/job/solfed/doctor/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

//MARK:	Инженер
/datum/outfit/job/solfed/engineer/elysium
	job_icon = "assistant"
	name = "SolFed - Elysium Khabeer Fanni"

	id = /obj/item/card/id/cel/solfed/crew/elysium
	head = null
	suit = null
	gloves = null
	belt = /obj/item/storage/belt/utility/full/engi
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium

	faction_icon = "bg_elysium"

/datum/outfit/job/solfed/engineer/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

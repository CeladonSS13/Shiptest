/datum/outfit/job/cel/solfed
	name = "SF - Base Outfit"
	faction = FACTION_PLAYER_SOLFED
	job_icon = "hudsf_fieldside"
	faction_icon = "bg_solfed"

	box = /obj/item/storage/box/survival/solfed
	id = /obj/item/card/id/cel/solfed

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed
	courierbag = /obj/item/storage/backpack/messenger

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

//////////////////////////////////////////////////////////////////////////////////////////////////////

//MARK:	Ученые

/datum/outfit/job/cel/solfed/scientist
	name = "SF - Wissenschaftler"
	job_icon = "sf_fieldside"

	jobtype = /datum/job/scientist

	id = /obj/item/card/id/cel/solfed/crew/scientist
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solgov/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	courierbag = /obj/item/storage/backpack/messenger/tox

/datum/outfit/job/cel/solfed/scientist/roboticist
	name = "SF - Roboterkonstrukteur"

	jobtype = /datum/job/roboticist

	id = /obj/item/card/id/cel/solfed/crew/roboticist
	uniform = /obj/item/clothing/under/rank/rnd/roboticist
	suit = /obj/item/clothing/suit/longcoat/robowhite

	backpack_contents = list(/obj/item/weldingtool/hugetank)

//MARK:	Военно-морской флот

/datum/outfit/job/cel/solfed/marine
	name = "SF - Marine"
	job_icon = "sf_fieldside"

	jobtype = /datum/job/officer

	id = /obj/item/card/id/cel/solfed/crew/marine
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solfed/camo
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest
	mask = /obj/item/clothing/mask/gas/sechailer
	r_pocket = null
	l_pocket = null
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat/solfed
	head = /obj/item/clothing/head/solfed/beret
	alt_suit = /obj/item/clothing/suit/armor/vest/security/officer
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = null

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)

/datum/outfit/job/cel/solfed/marine/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_marine_access(H)

/datum/outfit/job/cel/solfed/marine/pilot
	name = "SF - Schwerer Roboterpilot"

	jobtype = /datum/job/officer

	id = /obj/item/card/id/cel/solfed/crew/marine/pilot
	head = /obj/item/clothing/head/solfed/cap
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/jacket/leather

/datum/outfit/job/cel/solfed/captain
	name = "SF - Kommandant"
	job_icon = "sf_komandant"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/cel/solfed/captain
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	gloves = /obj/item/clothing/gloves/combat/solfed/captain
	ears = /obj/item/radio/headset/solgov/alt/captain
	uniform =  /obj/item/clothing/under/solfed/formal
	suit = /obj/item/clothing/suit/armor/vest/solgov/captain
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/solgov/captain
	neck = /obj/item/clothing/neck/cloak/solgovcap/solfed

	backpack = /obj/item/storage/backpack/solfed
	satchel = /obj/item/storage/backpack/satchel/solfed
	duffelbag = /obj/item/storage/backpack/duffelbag/solfed
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

/datum/outfit/job/cel/solfed/captain/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_captain_access(H)

/datum/outfit/job/cel/solfed/intelof
	name = "SF - Intellegence Officer"
	job_icon = "sf_komandant"

	jobtype = /datum/job/captain

	id = /obj/item/card/id
	gloves = /obj/item/clothing/gloves/color/white
	uniform = /obj/item/clothing/under/rank/security/detective/grey
	suit = /obj/item/clothing/suit/lawyer/charcoal
	neck = /obj/item/clothing/neck/tie/black
	dcoat = null
	glasses = /obj/item/clothing/glasses/sunglasses
	head = null
	accessory = null

	satchel = /obj/item/storage/backpack/satchel/leather

/datum/outfit/job/cel/solfed/captain/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_captain_access(H)

/datum/outfit/job/cel/solfed/captain/admiral
	name = "SF - Flottenadmiral"
	job_icon = "sf_admiral"

	jobtype = /datum/job/captain

	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	id = /obj/item/card/id/cel/solfed/admiral
	suit = /obj/item/clothing/suit/armor/solfed/formal

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/cel/solfed/sergeant
	name = "SF - Feldwebel"
	job_icon = "sf_command"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/cel/solfed/command/sergeant
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	mask = /obj/item/clothing/mask/gas/sechailer
	uniform = /obj/item/clothing/under/solfed/formal
	shoes = /obj/item/clothing/shoes/combat
	backpack = /obj/item/storage/backpack/solfed
	suit = /obj/item/clothing/suit/armor/solgov_trenchcoat
	ears = /obj/item/radio/headset/solgov/alt
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/solfed/beret
	r_pocket = null
	l_pocket = null
	l_hand = null
	back = /obj/item/storage/backpack/solfed

/datum/outfit/job/cel/solfed/sergeant/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

/datum/outfit/job/cel/solfed/doctor/medical_scientist/overseer
	name = "SF - Scientific Overseer"
	job_icon = "sf_command"

	id = /obj/item/card/id/cel/solfed/command/medical_scientist/overseer
	ears = /obj/item/radio/headset/solgov/alt
	head = /obj/item/clothing/head/solfed/beret
	l_hand = /obj/item/staff/stick
	suit =  /obj/item/clothing/suit/solgov/jacket
	belt = null

/datum/outfit/job/cel/solfed/hop
	name = "SF - Personalvorgesetzter"
	job_icon = "sf_command"

	jobtype = /datum/job/head_of_personnel

	id = /obj/item/card/id/cel/solfed/command/hop
	uniform = /obj/item/clothing/under/solfed
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/solgov/captain
	head = /obj/item/clothing/head/solgov
	neck = /obj/item/clothing/neck/cloak/overseer
	suit = /obj/item/clothing/suit/armor/vest/solgov/overseer
	backpack_contents = list(/obj/item/storage/box/ids=1)

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/officer)

/datum/outfit/job/cel/solfed/hop/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

/datum/outfit/job/cel/solfed/doctor
	name = "SF - Expeditionary Meeresarzt"
	job_icon = "sf_fieldside"

	jobtype = /datum/job/doctor

	id = /obj/item/card/id/cel/solfed/crew/doctor
	uniform = /obj/item/clothing/under/solfed/medical
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/solfed/surgical
	ears = /obj/item/radio/headset/headset_med
	accessory = /obj/item/clothing/accessory/armband/medblue
	l_hand = /obj/item/storage/firstaid
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical
	suit = /obj/item/clothing/suit/toggle/labcoat/paramedic

/datum/outfit/job/cel/solfed/doctor/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

/datum/outfit/job/cel/solfed/doctor/paramedic
	name = "SF - Meeresarzt"

	jobtype = /datum/job/paramedic

/datum/outfit/job/cel/solfed/doctor/medical_scientist
	name = "SF - Medical Scientist"
	job_icon = "sf_command"

	id = /obj/item/card/id/cel/solfed/command/medical_scientist
	ears = /obj/item/radio/headset/solgov/alt
	head = /obj/item/clothing/head/solfed/beret
	l_hand = /obj/item/staff/stick
	suit =  /obj/item/clothing/suit/solgov/jacket
	belt = null

/datum/outfit/job/cel/solfed/engineer
	name = "SF - Marinemechaniker"
	job_icon = "sf_fieldside"

	jobtype = /datum/job/engineer

	id = /obj/item/card/id/cel/solfed/crew/engineer
	uniform = /obj/item/clothing/under/solfed/industrial
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/solfed
	belt = /obj/item/storage/belt/utility/full/engi
	suit = /obj/item/clothing/suit/hazardvest/solgov


/datum/outfit/job/cel/solfed/engineer/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

/datum/outfit/job/cel/solfed/assistant
	name = "SF - Gehilfe"
	job_icon = "sf_shipside"

	jobtype = /datum/job/assistant

	id = /obj/item/card/id/cel/solfed/assistant
	uniform = /obj/item/clothing/under/solfed/assistant
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/solfed/cap


/datum/outfit/job/cel/solfed/miner
	name = "SF - Vertrags-Miner"
	job_icon = "sf_fieldside"

	jobtype = /datum/job/mining

	id = /obj/item/card/id/cel/solfed/crew/miner
	uniform = /obj/item/clothing/under/solfed/industrial
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/solfed
	belt = /obj/item/storage/belt/mining

	backpack_contents = list(
		/obj/item/flashlight/seclite = 1,\
		/obj/item/melee/knife/survival = 1,\
		/obj/item/stack/marker_beacon/ten = 1,\
		/obj/item/radio/weather_monitor = 1)

/datum/outfit/job/cel/solfed/miner/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_general_access(H)

/datum/outfit/job/cel/solfed/quartermaster
	name = "SF - Logistikbeauftragter"
	job_icon = "sf_command"

	jobtype = /datum/job/qm

	id = /obj/item/card/id/cel/solfed/command/quartermaster
	uniform = /obj/item/clothing/under/solfed
	head = /obj/item/clothing/head/solfed/beret
	shoes = /obj/item/clothing/shoes/laceup
	r_pocket = /obj/item/clipboard
	ears = /obj/item/radio/headset/solgov/alt
	neck = /obj/item/clothing/neck/tie/black
	suit = /obj/item/clothing/suit/solgov/overcoat

/datum/outfit/job/cel/solfed/miner/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_general_access(H)

/datum/outfit/job/cel/solfed/patient
	name = "SF - Attentive Care Patient"
	job_icon = "sf_shipside" // todo: bug rye for patient icon // rye. rye. give me 50 gazillion billion dollars paypal
	id_assignment = "Attentive Care Patient"

	jobtype = /datum/job/prisoner

	id = /obj/item/card/id/cel/solfed/patient
	uniform = /obj/item/clothing/under/rank/medical/gown
	alt_suit = null
	shoes = /obj/item/clothing/shoes/sandal/slippers

//							///
//MARK:	Elysium Brigade
//							///

//	Капитан	//
/datum/outfit/job/cel/solfed/captain/elysium
	name = "SF - Elysium Musharif"
	faction_icon = "bg_elysium"

	id = /obj/item/card/id/cel/solfed/captain/elysium
	head = /obj/item/clothing/head/solfed/beret/elysium
	uniform = /obj/item/clothing/under/solfed/formal/elysium
	suit = /obj/item/clothing/suit/armor/solfed/formal/elysium
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/solgov/alt/captain
	gloves = /obj/item/clothing/gloves/combat
	neck = null

/datum/outfit/job/cel/solfed/captain/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_captain_access(H)

//MARK:	Хос
/datum/outfit/job/cel/solfed/sergeant/elysium
	name = "SF - Elysium Mulazim"
	faction_icon = "bg_elysium"

	gloves = null
	id = /obj/item/card/id/cel/solfed/command/sergeant/elysium
	head = /obj/item/clothing/head/solfed/beret/elysium
	uniform = /obj/item/clothing/under/solfed/camo/elysium
	suit = /obj/item/clothing/suit/armor/solfed/formal/elysium
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/solgov/alt
	neck = null
	l_hand = null

/datum/outfit/job/cel/solfed/sergeant/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_head_access(H)

//MARK:	Офицер
/datum/outfit/job/cel/solfed/marine/elysium
	name = "SF - Elysium Haris"
	faction_icon = "bg_elysium"

	id = /obj/item/card/id/cel/solfed/crew/marine/elysium
	head = /obj/item/clothing/head/beret/elysium
	suit = /obj/item/clothing/suit/armor/vest/alt
	gloves = /obj/item/clothing/gloves/combat/solfed
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium

/datum/outfit/job/cel/solfed/marine/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_marine_access(H)

//MARK:	медик
/datum/outfit/job/cel/solfed/doctor/elysium
	name = "SF - Elysium Shafi"
	faction_icon = "bg_elysium"

	id = /obj/item/card/id/cel/solfed/crew/doctor/elysium
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium
	belt = null

/datum/outfit/job/cel/solfed/doctor/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

//MARK:	Инженер
/datum/outfit/job/cel/solfed/engineer/elysium
	name = "SF - Elysium Khabeer Fanni"
	faction_icon = "bg_elysium"

	id = /obj/item/card/id/cel/solfed/crew/engineer/elysium
	head = /obj/item/clothing/head/hardhat/solfed
	belt = /obj/item/storage/belt/utility/full/engi
	shoes = /obj/item/clothing/shoes/combat
	uniform = /obj/item/clothing/under/solfed/camo/elysium


/datum/outfit/job/cel/solfed/engineer/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_solfed_engineer_access(H)

//MARK:	Группа быстрого реагирования (ERT)

/datum/outfit/job/cel/solfed/captain/combat
	gloves = /obj/item/clothing/gloves/combat/solfed
	ears = /obj/item/radio/headset/solgov/alt/captain
	uniform = /obj/item/clothing/under/solfed/formal
	shoes = /obj/item/clothing/shoes/jackboots/knife
	head = /obj/item/clothing/head/solfed/beret
	belt = /obj/item/storage/belt/military/solfed
	suit = /obj/item/clothing/suit/armor/solfed/formal
	mask = /obj/item/clothing/mask/gas/solfed

	accessory = null

/datum/outfit/job/cel/solfed/sergeant/combat

	gloves = /obj/item/clothing/gloves/combat/solfed
	mask = /obj/item/clothing/mask/gas/solfed
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solfed/camo
	shoes = /obj/item/clothing/shoes/jackboots/knife
	head = /obj/item/clothing/head/solfed/beret
	belt = /obj/item/storage/belt/military/solfed
	suit = /obj/item/clothing/suit/armor/vest/marine

/datum/outfit/job/cel/solfed/marine/combat
	gloves = /obj/item/clothing/gloves/combat/solfed
	mask = /obj/item/clothing/mask/gas/solfed
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solfed/camo
	shoes = /obj/item/clothing/shoes/jackboots/knife
	head = /obj/item/clothing/head/helmet/solfed/m11
	belt = /obj/item/storage/belt/military/solfed
	suit = /obj/item/clothing/suit/armor/vest/marine/medium

/datum/outfit/job/cel/solfed/doctor/combat
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	mask = /obj/item/clothing/mask/gas/solfed
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solfed/medical
	shoes = /obj/item/clothing/shoes/jackboots/knife
	head = /obj/item/clothing/head/helmet/solfed/m11
	belt = /obj/item/storage/belt/military/solfed/medical
	suit = /obj/item/clothing/suit/armor/vest/marine

/datum/outfit/job/cel/solfed/engineer/combat
	gloves = /obj/item/clothing/gloves/combat/solfed
	mask = /obj/item/clothing/mask/gas/solfed
	ears = /obj/item/radio/headset/solgov/alt
	uniform = /obj/item/clothing/under/solfed/industrial
	shoes = /obj/item/clothing/shoes/jackboots/knife
	head = /obj/item/clothing/head/helmet/solfed/m11
	belt = /obj/item/storage/belt/utility/full/engi
	suit = /obj/item/clothing/suit/armor/vest/marine

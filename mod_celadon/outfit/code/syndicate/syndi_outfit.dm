// Доступы для Синдикеков

/datum/outfit/job/syndicate/proc/get_syndi_general_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_OUTPOST_FACTION_SYNDICATE, ACCESS_OUTPOST_OTHER_DONCO)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/syndicate/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_syndi_general_access(H)

	// Даёт всем синдешкам брендовый сурвивал бокс
/datum/outfit/job/syndicate
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/atmos
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/chemist
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/ce
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/engineer
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/miner
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/miner/twink
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/paramedic
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/doctor
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/cmo
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/security
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/hos
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/assistant
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/assistant/suns
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/science/cybersun
    name = "Syndicate - Scientist"
    jobtype = /datum/job/scientist
    job_icon = "scientist"

    uniform = /obj/item/clothing/under/syndicate/cybersun/research
    suit = /obj/item/clothing/suit/toggle/labcoat
    head = /obj/item/clothing/head/soft/cybersun

    backpack = /obj/item/storage/backpack/duffelbag/syndie
    satchel = /obj/item/storage/backpack/satchel/tox
    courierbag = /obj/item/storage/backpack/messenger/tox


// MARK: Директор Исследований Киберсан

/datum/outfit/job/syndicate/science/Director
	name = "Syndicate - Research and Development Team Leader (Cybersun)"
	id_assignment = "Research and Development Team Leader"
	jobtype = /datum/job/rd
	job_icon = "headofpersonnel"

	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/cybersun/officer
	suit = /obj/item/clothing/suit/cybersun_suit
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/HoS/cybersun
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/syndicate_command/crew_id
	glasses = /obj/item/clothing/glasses/sunglasses


// MARK: Офицер безопасности Мородеры Горлекса

/datum/outfit/job/syndicate/assistant/gorlex/operative
	name = "Syndicate - Operative"
	id_assignment = "Operative"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	uniform = /obj/item/clothing/under/syndicate/hardliners
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/syndicate
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/card/id/syndicate_command/crew_id

	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/flashlight/seclite

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/syndicate/security/gorlex/commando
	name = "Syndicate - Commando"
	id_assignment = "Commando"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/hardliners
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/breath/facemask
	head = /obj/item/clothing/head/beret/black

	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/flashlight/seclite

/datum/outfit/job/syndicate/hos/gorlex/lieutenant
	name = "Syndicate - First lieutenant"
	id_assignment = "First lieutenant"
	jobtype = /datum/job/hos
	job_icon = "headofsecurity"

	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/hardliners/officer
	suit = null
	mask = /obj/item/clothing/mask/breath/facemask
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/beret/sec/officer

	l_pocket = /obj/item/flashlight/seclite

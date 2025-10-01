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
	job_icon = "shaftminer"
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/paramedic
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/doctor
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/cmo
	job_icon = "chiefmedicalofficer"
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/security
	job_icon = "assistant"
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/hos
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/assistant
	job_icon = "assistant"
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

// Все остальные аутфиты. При надобности расскоментить
// /datum/outfit/job/syndicate/captain/suns
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/cmo/suns
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/doctor/suns
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/engineer/suns
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/botanist/suns
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/psychologist/suns
// 	job_icon = "psychologist"

// /datum/outfit/job/syndicate/patient
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/captain/cybersun
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/head_of_personnel/cybersun
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/engineer/cybersun
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/miner/cybersun
// 	job_icon = "shaftminer"

// /datum/outfit/job/syndicate/paramedic/cybersun
// 	job_icon = "paramedic"

// /datum/outfit/job/syndicate/assistant/cybersun
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/captain/ngr
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/doctor/ngr
// 	job_icon = "paramedic"

// /datum/outfit/job/syndicate/engineer/ngr
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/security/ngr
// 	job_icon = "securityofficer"

// /datum/outfit/job/syndicate/captain/gorlex
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/ce/ngr
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/engineer/gorlex
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/miner/gorlex
// 	job_icon = "shaftminer"

// /datum/outfit/job/syndicate/assistant/gorlex
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/hos/gorlex
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/doctor/gorlex
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/security/gorlex
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/head_of_personnel
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/bartender
// 	job_icon = "bartender"

// /datum/outfit/job/syndicate/ce/gec
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/engineer/gec
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/atmos/gec
// 	job_icon = "atmospherictechnician"

// /datum/outfit/job/syndicate/miner/gec
// 	job_icon = "shaftminer"

// /datum/outfit/job/syndicate/assistant/gec
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/quartermaster/donk
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cargo_tech/donk
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/security/suns
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/doctor/suns
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/engineer/suns
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/psychologist/suns
// 	job_icon = "psychologist"

// /datum/outfit/job/syndicate/bartender/suns
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/patient
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/captain/twink
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/hos/twink
// 	job_icon = "headofsecurity"

// /datum/outfit/job/syndicate/paramedic/twink
// 	job_icon = "chiefmedicalofficer"

// /datum/outfit/job/syndicate/engineer/twink
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/security/twink
// 	job_icon = "securityofficer"

// /datum/outfit/job/syndicate/bartender/twink
// 	job_icon = "bartender"


// Доступы для Синдикеков

/datum/outfit/job/syndicate/cel/proc/get_syndi_general_access(mob/living/carbon/human/H)
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

/datum/outfit/job/syndicate/cel/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_syndi_general_access(H)

// Даёт всем синдешкам брендовый сурвивал бокс
/datum/outfit/job/syndicate/cel
	job_icon = "assistant"
	box = /obj/item/storage/box/survival/syndicate

/datum/outfit/job/syndicate/cel


/datum/outfit/job/syndicate/cel/atmos


/datum/outfit/job/syndicate/cel/chemist


/datum/outfit/job/syndicate/cel/ce


/datum/outfit/job/syndicate/cel/engineer


/datum/outfit/job/syndicate/cel/miner


/datum/outfit/job/syndicate/cel/miner/twink
	job_icon = "shaftminer"


/datum/outfit/job/syndicate/cel/paramedic


/datum/outfit/job/syndicate/cel/doctor


/datum/outfit/job/syndicate/cel/cmo
	job_icon = "chiefmedicalofficer"


/datum/outfit/job/syndicate/cel/security
	job_icon = "assistant"


/datum/outfit/job/syndicate/cel/hos


/datum/outfit/job/syndicate/cel/assistant
	job_icon = "assistant"


/datum/outfit/job/syndicate/cel/assistant/suns


/datum/outfit/job/syndicate/cel/science/cybersun
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

/datum/outfit/job/syndicate/cel/science/Director
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
// /datum/outfit/job/syndicate/cel/captain/suns
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/cel/cmo/suns
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/cel/doctor/suns
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/cel/engineer/suns
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/botanist/suns
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/cel/psychologist/suns
// 	job_icon = "psychologist"

// /datum/outfit/job/syndicate/cel/patient
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/captain/cybersun
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/cel/head_of_personnel/cybersun
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/cel/engineer/cybersun
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/cel/miner/cybersun
// 	job_icon = "shaftminer"

// /datum/outfit/job/syndicate/cel/paramedic/cybersun
// 	job_icon = "paramedic"

// /datum/outfit/job/syndicate/cel/assistant/cybersun
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/captain/ngr
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/doctor/ngr
// 	job_icon = "paramedic"

// /datum/outfit/job/syndicate/cel/engineer/ngr
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/security/ngr
// 	job_icon = "securityofficer"

// /datum/outfit/job/syndicate/cel/captain/gorlex
// 	job_icon = "captain"

// /datum/outfit/job/syndicate/cel/ce/ngr
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/engineer/gorlex
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/cel/miner/gorlex
// 	job_icon = "shaftminer"

// /datum/outfit/job/syndicate/cel/assistant/gorlex
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/hos/gorlex
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/doctor/gorlex
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/cel/security/gorlex
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/head_of_personnel
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/cel/bartender
// 	job_icon = "bartender"

// /datum/outfit/job/syndicate/cel/ce/gec
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/engineer/gec
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/cel/atmos/gec
// 	job_icon = "atmospherictechnician"

// /datum/outfit/job/syndicate/cel/miner/gec
// 	job_icon = "shaftminer"

// /datum/outfit/job/syndicate/cel/assistant/gec
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/cel/quartermaster/donk
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/cargo_tech/donk
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/cel/security/suns
// 	job_icon = "chiefengineer"

// /datum/outfit/job/syndicate/cel/doctor/suns
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/syndicate/cel/engineer/suns
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/psychologist/suns
// 	job_icon = "psychologist"

// /datum/outfit/job/syndicate/cel/bartender/suns
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/patient
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/captain/twink
// 	job_icon = "assistant"

// /datum/outfit/job/syndicate/cel/hos/twink
// 	job_icon = "headofsecurity"

// /datum/outfit/job/syndicate/cel/paramedic/twink
// 	job_icon = "chiefmedicalofficer"

// /datum/outfit/job/syndicate/cel/engineer/twink
// 	job_icon = "stationengineer"

// /datum/outfit/job/syndicate/cel/security/twink
// 	job_icon = "securityofficer"

// /datum/outfit/job/syndicate/cel/bartender/twink
// 	job_icon = "bartender"


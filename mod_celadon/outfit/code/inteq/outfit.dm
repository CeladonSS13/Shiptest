//							///
//			INTEQ			///
//							///

/proc/get_inteq_acces()
	return list(ACCESS_INTEQ_GENERAL, ACCESS_INTEQ_SECURITY, ACCESS_INTEQ_CAPTAIN, ACCESS_OUTPOST_FACTION_INTEQ)

/datum/outfit/job/inteq/proc/get_inteq_g_acces(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_INTEQ_GENERAL, ACCESS_OUTPOST_FACTION_INTEQ)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/inteq/proc/get_inteq_gsec_acces(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_INTEQ_GENERAL, ACCESS_INTEQ_SECURITY, ACCESS_OUTPOST_FACTION_INTEQ)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/inteq/proc/get_inteq_all_acces(mob/living/carbon/human/H)
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
			I.access = get_all_accesses()+get_inteq_acces()
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

// Даём Интекам свой дюфель взятый с Блюмуна, не имеет никаких отличающих стат
/datum/outfit/job/inteq/cel
	jobtype = /datum/job/assistant

	id = /obj/item/card/id/cel/inteq
	duffelbag = /obj/item/storage/backpack/duffelbag/inteq
	box = /obj/item/storage/box/survival/inteq	// Даёт всем интекашкам брендовый сурвивал бокс

/datum/outfit/job/inteq/cel/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_g_acces(H)

//MARK: Рекрут
/datum/outfit/job/inteq/cel/assistant
	job_icon = "assistant"
	name = "IQ - Recruit"

	id = /obj/item/card/id/cel/inteq/recruit

//MARK: Капитан
/datum/outfit/job/inteq/cel/captain
	job_icon = "captain"
	name = "IQ - Vanguard"
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	suit_store = /obj/item/gun/ballistic/revolver/horizonx
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/cel/inteq/vanguard

//MARK: Командир
/datum/outfit/job/inteq/cel/honorable
	job_icon = "assistant"
	name = "IQ - Honorable Vanguard"
	head = /obj/item/clothing/head/beret/sec/hos/inteq/honorable
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	suit = /obj/item/clothing/suit/armor/hos/inteq/honorable
	suit_store = /obj/item/gun/ballistic/revolver/horizonx
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/cel/inteq/vanguard

//MARK: Арьергард. Rearguard
/datum/outfit/job/inteq/cel/rearguard
	job_icon = "captain"
	name = "IQ - Rearguard"
	id_assignment = "Rearguard"
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/cel/inteq/honorable_rearguard

//MARK: Лейтенант первого класса
/datum/outfit/job/inteq/cel/enforcer
	job_icon = "lieutenant"
	name = "IQ - Enforcer class One"
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	mask = /obj/item/clothing/mask/balaclava
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp45
	belt = /obj/item/ammo_box/magazine/usp45_standart
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/cel/inteq/enforcer

//MARK: Парамедик
/datum/outfit/job/inteq/cel/paramedic
	job_icon = "medicaldoctor"
	name = "IQ - Corpsman"
	ears = /obj/item/radio/headset/inteq
	id = /obj/item/card/id/cel/inteq/medic

//MARK: Главный медик
/datum/outfit/job/inteq/cel/cmo
	job_icon = "chiefmedicalofficer"
	id_assignment = "Honorable Corpsman"
	name = "IQ - Honorable Corpsman"

	belt = /obj/item/storage/belt/medical/webbing/paramedic
	ears = /obj/item/radio/headset/inteq/captain
	uniform = /obj/item/clothing/under/syndicate/inteq/corpsman
	alt_uniform = /obj/item/clothing/under/syndicate/inteq/corpsman/skirt
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/hooded/wintercoat/security/inteq/alt
	alt_suit = /obj/item/clothing/suit/armor/inteq/corpsman
	dcoat = /obj/item/clothing/suit/armor/hos/inteq
	r_pocket = /obj/item/pda/medical
	id = /obj/item/card/id/cel/inteq/honorable_medic

	chameleon_extras = null

//MARK: Служба безопасности
/datum/outfit/job/inteq/cel/security
	job_icon = "lieutenant"
	name = "IQ - Enforcer"
	id = /obj/item/card/id/cel/inteq/enforcer

//MARK: Варден
/datum/outfit/job/inteq/cel/warden
	job_icon = "warden"
	name = "IQ - Master At Arms"
	id = /obj/item/card/id/cel/inteq/master_at_arms

//MARK: Главный инженер
/datum/outfit/job/inteq/cel/ce
	job_icon = "chiefengineer"
	name = "IQ - Artificer Class One"
	id = /obj/item/card/id/cel/inteq/honorable_artificer

//MARK: Инженегр
/datum/outfit/job/inteq/cel/engineer
	job_icon = "stationengineer"
	name = "IQ - Artificer"
	id = /obj/item/card/id/cel/inteq/artificer

// Все остальные аутфиты. При надобности расскоментить
// /datum/outfit/job/inteq/security/beluga
// 	job_icon = "chiefengineer"

// /datum/outfit/job/inteq/captain
// 	job_icon = "researchdirector"

// /datum/outfit/job/inteq/security
// 	job_icon = "chiefengineer"

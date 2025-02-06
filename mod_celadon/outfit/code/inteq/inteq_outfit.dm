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
/datum/outfit/job/inteq
	duffelbag = /obj/item/storage/backpack/duffelbag/inteq

//рекрут
/datum/outfit/job/inteq/assistant/celadon
	name = "Recruit (InteQ)"
	id = /obj/item/card/id/inteq/recruit

/datum/outfit/job/inteq/assistant/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_g_acces(H)

	// Даёт всем интекашкам брендовый сурвивал бокс
/datum/outfit/job/inteq
	box = /obj/item/storage/box/survival/inteq

//Капитан

/datum/outfit/job/inteq/captain/celadon
	name = "Vanguard (InteQ)"
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	suit_store = /obj/item/gun/ballistic/revolver/horizonx
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/inteq/vanguard

/datum/outfit/job/inteq/captain/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_all_acces(H)

//Командир

/datum/outfit/job/inteq/captain/honorable/celadon
	name = "Honorable Vanguard (InteQ)"
	head = /obj/item/clothing/head/beret/sec/hos/inteq/honorable
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	suit = /obj/item/clothing/suit/armor/hos/inteq/honorable
	suit_store = /obj/item/gun/ballistic/revolver/horizonx
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/inteq/vanguard

/datum/outfit/job/inteq/captain/honorable/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_all_acces(H)

//Арьергард. Rearguard

/datum/outfit/job/inteq/captain/rearguard/celadon
	name = "Rearguard (InteQ)"
	id_assignment = "Rearguard"
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/inteq/rearguard

/datum/outfit/job/inteq/captain/rearguard/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_all_acces(H)

// Лейтенант первого класса
/datum/outfit/job/inteq/captain/enfco/celadon
	name = "Enforcer class One (InteQ)"
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	mask = /obj/item/clothing/mask/balaclava
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp45
	belt = /obj/item/ammo_box/magazine/usp45_standart
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/inteq/vanguard
	id = /obj/item/card/id/inteq/enfco

/datum/outfit/job/inteq/captain/enfco/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_all_acces(H)

//Парамедик

/datum/outfit/job/inteq/paramedic/celadon
	name = "Corpsman (InteQ)"
	ears = /obj/item/radio/headset/inteq
	id = /obj/item/card/id/inteq/corspman

/datum/outfit/job/inteq/paramedic/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_g_acces(H)

//Главный медик

/datum/outfit/job/inteq/cmo/celadon
	name = "IRMG - Honorable Corpsman"
	id_assignment = "Honorable Corpsman"
	jobtype = /datum/job/cmo
	job_icon = "chiefmedicalofficer"

	belt = /obj/item/storage/belt/medical/webbing/paramedic
	ears = /obj/item/radio/headset/inteq/captain
	uniform = /obj/item/clothing/under/syndicate/inteq/corpsman
	alt_uniform = /obj/item/clothing/under/syndicate/inteq/corpsman/skirt
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/hooded/wintercoat/security/inteq/alt
	alt_suit = /obj/item/clothing/suit/armor/inteq/corpsman
	dcoat = /obj/item/clothing/suit/armor/hos/inteq
	r_pocket = /obj/item/pda/medical

	chameleon_extras = null

/datum/outfit/job/inteq/cmo/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_g_acces(H)

//Служба безопасности

/datum/outfit/job/inteq/security/celadon
	name = "Enforcer (InteQ)"
	id = /obj/item/card/id/inteq/enf

/datum/outfit/job/inteq/security/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_gsec_acces(H)

// Варден

/datum/outfit/job/inteq/warden/celadon
	name = "Master At Arms (InteQ)"
	id = /obj/item/card/id/inteq/maas

/datum/outfit/job/inteq/warden/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_gsec_acces(H)

// Главный инженер

/datum/outfit/job/inteq/ce/celadon
	name = "Artificer Class One (InteQ)"
	id = /obj/item/card/id/inteq/afr/ce

/datum/outfit/job/inteq/ce/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_all_acces(H)

//Инженегр

/datum/outfit/job/inteq/engineer/celadon
	name = "Artificer (InteQ)"
	id = /obj/item/card/id/inteq/afr

/datum/outfit/job/inteq/engineer/celadon/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_g_acces(H)

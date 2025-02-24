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

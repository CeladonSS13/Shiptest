/datum/outfit/job/cel/nanotrasen
	name = "Nanotrasen - Base Outfit"
	faction = FACTION_PLAYER_NANOTRASEN
	faction_icon = "bg_nanotrasen"

	box = /obj/item/storage/box/survival/nanotrasen
	id = /obj/item/card/id

/datum/outfit/job/cel/nanotrasen/proc/get_nt_general_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/cel/nanotrasen/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_nt_general_access(H)

//hopefully дает всему элизиуму коробки для выживания ИСВ(бомжей)
/datum/outfit/job/cel/elysium
	name = "Elysium - Base Outfit"
	faction_icon = "bg_elysium"

	id = /obj/item/card/id/cel/elysium/crew
	head = /obj/item/clothing/head/shemag/green
	uniform = /obj/item/clothing/under/color/darkgreen
	shoes = /obj/item/clothing/shoes/sneakers/black
	box = /obj/item/storage/box/survival/independent
	backpack = null

/datum/outfit/job/cel/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/cel/elysium/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PLAYER_ELYSIUM)
	H.grant_language(/datum/language/elysm)

/datum/outfit/job/cel/elysium/proc/get_elysium_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id/silver))
				I = O
				break
		if (I)
			I.access = list(ACCESS_OUTPOST_FACTION_SEPARATISTS)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

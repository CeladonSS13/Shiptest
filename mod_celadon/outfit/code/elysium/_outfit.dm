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

//////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/outfit/job/cel/elysium/captain
	name = "Elysium - Caid"
	jobtype = /datum/job/captain
	job_icon = "captain"

	id = /obj/item/card/id/cel/elysium/captain
	backpack = /obj/item/storage/backpack/satchel/leather
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/color/darkgreen
	shoes = /obj/item/clothing/shoes/jackboots
	mask = /obj/item/clothing/mask/bandana/green
	ears = /obj/item/radio/headset/heads/captain/alt

/datum/outfit/job/cel/elysium/captain/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/cel/elysium/security
	name = "Elysium - Mukatell"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	id = /obj/item/card/id/cel/elysium/crew/security
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/bandana/green
	backpack = /obj/item/storage/backpack/satchel
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/alt
	backpack_contents = list(/obj/item/melee/knife/switchblade)

/datum/outfit/job/cel/elysium/security/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/cel/elysium/assistant
	name = "Elysium - Ahisa`i"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	id = /obj/item/card/id/cel/elysium/crew
	suit = /obj/item/clothing/suit/apparel/black
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/shemag/black
	backpack = /obj/item/storage/backpack/satchel
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/jackboots

/datum/outfit/job/cel/elysium/assistant/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

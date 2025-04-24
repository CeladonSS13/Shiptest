//hopefully дает всему элизиуму коробки для выживания ИСВ(бомжей)

/datum/outfit/job/elysium
	box = /obj/item/storage/box/survival/independent


/obj/item/card/id/elysium
	desc = "A Elysium ID with no proper access to speak of."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	faction_icon = "bg_pgf"
	icon_state = "elysium"

/obj/item/card/id/elysium/captain
	desc = "A Elysium ID with no proper access to speak of. This one indicates a Caid"
	icon_state = "elysium"
	assignment = "Caid"
	job_icon = "captain"

/obj/item/card/id/elysium/security
	desc = "A Elysium ID with no proper access to speak of. This one indicates a Mukatell"
	icon_state = "elysium"
	assignment = "Mukatell"
	job_icon = "securityofficer"

/obj/item/card/id/elysium/assistant
	desc = "A Elysium ID with no proper access to speak of. This one indicates a Ahisa`i"
	icon_state = "elysium"
	assignment = "Ahisa`i"
	job_icon = "assistant"

/datum/outfit/job/elysium
	name = "Elysium - Base Outfit"

	backpack = null
	head = /obj/item/clothing/head/shemag/green
	uniform = /obj/item/clothing/under/color/darkgreen
	shoes = /obj/item/clothing/shoes/sneakers/black
	id = /obj/item/card/id/elysium/assistant

/datum/outfit/job/elysium/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/elysium/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PLAYER_ELYSIUM)
	H.grant_language(/datum/language/elysm)

/datum/outfit/job/elysium/proc/get_elysium_access(mob/living/carbon/human/H)
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

/datum/outfit/job/elysium/captain
	name = "Elysium - Caid"
	job_icon = "captain"
	jobtype = /datum/job/captain
	backpack = /obj/item/storage/backpack/satchel/leather
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/color/darkgreen
	shoes = /obj/item/clothing/shoes/jackboots
	mask = /obj/item/clothing/mask/bandana/green
	ears = /obj/item/radio/headset/heads/captain/alt
	id = /obj/item/card/id/elysium/captain

/datum/outfit/job/elysium/captain/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/elysium/security
	name = "Elysium - Mukatell"
	job_icon = "securityofficer"
	jobtype = /datum/job/officer
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/bandana/green
	backpack = /obj/item/storage/backpack/satchel
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/alt
	backpack_contents = list(/obj/item/melee/knife/switchblade)
	id = /obj/item/card/id/elysium/security

/datum/outfit/job/elysium/security/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

/datum/outfit/job/elysium/assistant
	name = "Elysium - Ahisa`i"
	job_icon = "assistant"
	jobtype = /datum/job/assistant

	suit = /obj/item/clothing/suit/apparel/black
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/shemag/black
	backpack = /obj/item/storage/backpack/satchel
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/jackboots
	id = /obj/item/card/id/elysium/assistant

/datum/outfit/job/elysium/assistant/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_elysium_access(H)

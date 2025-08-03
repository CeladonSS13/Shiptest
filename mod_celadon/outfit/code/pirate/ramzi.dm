//Ramzi_Clique celadon

/datum/outfit/job/ramzi_clique
	name = "Ramzi Clique Celadon - Base Outfit"

	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/alt
	mask = /obj/item/clothing/mask/gas/syndicate
	neck = /obj/item/clothing/neck/dogtag/ramzi
	id = /obj/item/card/id
	box = /obj/item/storage/box/survival/syndicate

	faction_icon = "bg_syndicate"

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/ramzi_clique/post_equip(mob/living/carbon/human/H, visualsOnly)
	.=..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PIRATES)

/datum/outfit/job/ramzi_clique/battlemaster
	name = "Battle Master"

	id_assignment = "Battle Master"
	job_icon = "captain"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/syndicate_command/captain_id
	head = /obj/item/clothing/head/HoS/beret/syndicate
	suit = /obj/item/clothing/suit/armor/hos/trenchcoat

/datum/outfit/job/ramzi_clique/commando
	name = "Commando"

	id_assignment = "Commando"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	l_pocket = /obj/item/flashlight/seclite

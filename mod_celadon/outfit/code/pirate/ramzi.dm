//Ramzi_Clique celadon - аутфиты которые используются на рондо

/datum/outfit/job/ramzi_clique
	name = "Ramzi Clique Rondo - Base Outfit"

	uniform = /obj/item/clothing/under/syndicate/ramzi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/pirate/alt
	mask = /obj/item/clothing/mask/gas/ramzi
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

/datum/outfit/job/ramzi_clique/captain
	name = "Battle Master"

	id_assignment = "Battle Master"
	job_icon = "captain"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/syndicate_command/captain_id
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer
	ears = /obj/item/radio/headset/pirate/alt/captain
	head = /obj/item/clothing/head/ramzi/beret
	suit = /obj/item/clothing/suit/armor/ramzi/officer

/datum/outfit/job/ramzi_clique/trooper
	name = "Commando"

	id_assignment = "Commando"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	belt = /obj/item/storage/belt/security/webbing/ramzi

	l_pocket = /obj/item/flashlight/seclite

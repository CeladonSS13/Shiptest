//Ramzi_Clique celadon - овверайд задника аутфитов под пиратскую тему-
/datum/outfit/job/ramzi
	faction_icon = "bg_pirate"

//Ramzi_Clique celadon - аутфиты которые используются на рондо
/datum/outfit/job/ramzi_clique
	name = "Ramzi Clique Rondo - Base Outfit"

	uniform = /obj/item/clothing/under/syndicate/ramzi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/pirate/alt
	neck = /obj/item/clothing/neck/dogtag/ramzi
	id = /obj/item/card/id
	box = /obj/item/storage/box/survival/ramzi

	faction_icon = "bg_pirate"

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
	name = "Ramzi Clique Rondo - Battle Master"

	id_assignment = "Battle Master"
	job_icon = "captain"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/syndicate_command/captain_id
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer
	ears = /obj/item/radio/headset/pirate/alt/captain
	head = /obj/item/clothing/head/ramzi/beret
	suit = /obj/item/clothing/suit/armor/ramzi/officer

/datum/outfit/job/ramzi_clique/trooper
	name = "Ramzi Clique Rondo - Commando"

	id_assignment = "Commando"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	id = /obj/item/card/id/syndicate_command/crew_id
	belt = /obj/item/storage/belt/security/webbing/ramzi

	l_pocket = /obj/item/flashlight/seclite

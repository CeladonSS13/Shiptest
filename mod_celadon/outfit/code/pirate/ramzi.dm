// MARK: RAMZI RONDO
//Ramzi_Clique celadon - аутфиты которые используются на рондо
/datum/outfit/job/cel/pirate/ramzi
	name = "Ramzi Clique Rondo - Base Outfit"

	uniform = /obj/item/clothing/under/syndicate/ramzi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/pirate/alt
	neck = /obj/item/clothing/neck/dogtag/ramzi
	id = /obj/item/card/id/cel/ramzi
	box = /obj/item/storage/box/survival/ramzi

	faction_icon = "bg_pirate"
	job_icon = "pirate"

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/pirate/ramzi/post_equip(mob/living/carbon/human/H, visualsOnly)
	.=..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_PIRATES)

/datum/outfit/job/cel/pirate/ramzi/captain
	name = "Ramzi Clique Rondo - Battle Master"

	id_assignment = "Battle Master"
	jobtype = /datum/job/captain
	job_icon = "piratecaptain"

	id = /obj/item/card/id/cel/ramzi/battlemaster
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer
	ears = /obj/item/radio/headset/pirate/alt/captain
	head = /obj/item/clothing/head/ramzi/beret
	suit = /obj/item/clothing/suit/armor/ramzi/officer

/datum/outfit/job/cel/pirate/ramzi/trooper
	job_icon = "assistant"
	name = "Ramzi Clique Rondo - Commando"

	id_assignment = "Commando"
	jobtype = /datum/job/officer

	id = /obj/item/card/id/cel/ramzi/commando
	belt = /obj/item/storage/belt/security/webbing/ramzi

	l_pocket = /obj/item/flashlight/seclite

//MARK: RAMZI PIRATE
//Ramzi_Clique celadon - аутфиты которые используются на пиратах
/datum/outfit/job/cel/pirate/ramzi
	name = "Ramzi Clique - Base Outfit"

	uniform = /obj/item/clothing/under/syndicate/ramzi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/pirate/alt
	box = /obj/item/storage/box/survival
	id = /obj/item/card/id

	faction_icon = "bg_pirate"
	job_icon = "pirate"

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/pirate/ramzi/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_RAMZI)

//Deckhand

/datum/outfit/job/cel/pirate/ramzi/assistant
	name = "Ramzi Clique - Deckhand"

	id_assignment = "Runt"
	jobtype = /datum/job/assistant

	shoes = /obj/item/clothing/shoes/workboots

//Captain

/datum/outfit/job/cel/pirate/ramzi/captain
	name = "Ramzi Clique - Captain"
	job_icon = "piratecaptain"

	jobtype = /datum/job/captain
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer

	ears = /obj/item/radio/headset/pirate/alt/captain
	suit = /obj/item/clothing/suit/armor/ramzi/captain
	head = /obj/item/clothing/head/ramzi/peaked

//Head Of Security

/datum/outfit/job/cel/pirate/ramzi/hos
	name = "Ramzi Clique - Team Leader"

	id_assignment = "Sweeper Lead"
	jobtype = /datum/job/hos
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer
	suit = /obj/item/clothing/suit/armor/ramzi/officer
	head = /obj/item/clothing/head/ramzi/beret
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	backpack_contents = list(/obj/item/clothing/mask/gas/ramzi)

//Security Officer

/datum/outfit/job/cel/pirate/ramzi/operative
	name = "Ramzi Clique - Operative"

	id_assignment = "Sweeper"
	jobtype = /datum/job/officer
	uniform = /obj/item/clothing/under/syndicate/ramzi/overalls
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	backpack_contents = list(/obj/item/clothing/mask/gas/ramzi)

//Pilot

/datum/outfit/job/cel/pirate/ramzi/pilot
	name = "Ramzi Clique - Pilot"
	id_assignment = "Shuttle Chief"
	jobtype = /datum/job/officer
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer
	l_pocket = /obj/item/weldingtool/mini
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

//Medical Doctor

/datum/outfit/job/cel/pirate/ramzi/medic
	name = "Ramzi Clique - Medic"

	id_assignment = "Sawbones"
	jobtype = /datum/job/doctor
	uniform = /obj/item/clothing/under/syndicate/ramzi/overalls
	accessory = /obj/item/clothing/accessory/armband/med
	glasses = /obj/item/clothing/glasses/hud/health
	r_pocket = /obj/item/melee/knife/survival
	suit = /obj/item/clothing/suit/ramzi/smock
	head = /obj/item/clothing/head/ramzi/surgical

//Engineer

/datum/outfit/job/cel/pirate/ramzi/engineer
	name = "Ramzi Clique - Motorman"

	id_assignment = "Motorman"
	jobtype = /datum/job/engineer
	head = /obj/item/clothing/head/hardhat/ramzi
	suit = /obj/item/clothing/suit/ramzi
	accessory = /obj/item/clothing/accessory/armband/engine
	shoes = /obj/item/clothing/shoes/workboots

	r_pocket = /obj/item/analyzer



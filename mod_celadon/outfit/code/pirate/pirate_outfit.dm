// MARK: Survival box
// Меняет обычный бокс на пиратскую тему, и меняем им фоны
/datum/outfit/job/pirate
	job_icon = "assistant"
	name = "Pirate - Base Outfit"
	faction = FACTION_PLAYER_PIRATE
	faction_icon = "bg_pirate"

	box = /obj/item/storage/box/survival/pirate
	id = /obj/item/card/id

// MARK: Captain
/datum/outfit/job/pirate/captain
	job_icon = "captain"
	name = "Captain (Pirate)"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/cel/pirate/captain
	ears = /obj/item/radio/headset/pirate/captain
	uniform = /obj/item/clothing/under/costume/pirate
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/pirate/captain
	suit = /obj/item/clothing/suit/pirate/captain

	gloves = /obj/item/clothing/gloves/color/captain
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/pirate/captain/jupiter
	job_icon = "assistant"
	name = "Independent - Captain (Nodesman)"

	uniform = /obj/item/clothing/under/utility
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/vest/marine/medium
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/combat
	implants = list(/obj/item/implant/radio)
	accessory = null

// MARK: Engineer
/datum/outfit/job/pirate/engineer
	job_icon = "assistant"
	name = "Independent - Engineer (Pirate)"

	jobtype = /datum/job/engineer

	id = /obj/item/card/id/cel/pirate/engineer
	ears = /obj/item/radio/headset/pirate
	uniform = /obj/item/clothing/under/costume/sailor
	head = /obj/item/clothing/head/bandana
	shoes = /obj/item/clothing/shoes/jackboots
	alt_uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	belt = null
	gloves = null

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced = 1)

/datum/outfit/job/pirate/engineer/jupiter
	name = "Independent - Engineer (Nodesman)"

	uniform = /obj/item/clothing/under/utility
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/survival
	gloves = /obj/item/clothing/gloves/color/red/insulated

	implants = list(/obj/item/implant/radio)

// MARK: Security
/datum/outfit/job/pirate/security
	job_icon = "assistant"
	name = "Independent - Security Officer (Pirate)"

	jobtype = /datum/job/officer

	id = /obj/item/card/id/cel/pirate/security
	ears = /obj/item/radio/headset/pirate
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/bandana
	suit = /obj/item/clothing/suit/armor/vest
	gloves = /obj/item/clothing/gloves/color/black
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)

/datum/outfit/job/pirate/security/jupiter
	name = "Independent - Security Officer (Nodesman)"

	uniform = /obj/item/clothing/under/utility
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/combat

	backpack_contents = list(/obj/item/melee/baton/loaded=1)

	implants = list(/obj/item/implant/radio)

// MARK: Medic
/datum/outfit/job/pirate/medic
	job_icon = "paramedic"
	name = "Independent - Medical Doctor (Pirate)"

	jobtype = /datum/job/doctor

	id = /obj/item/card/id/cel/pirate/medic
	ears = /obj/item/radio/headset/pirate
	uniform = /obj/item/clothing/under/costume/sailor
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/apron/surgical
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

	chameleon_extras = /obj/item/gun/syringe

// MARK: Assistant
/datum/outfit/job/pirate/assistant
	job_icon = "assistant"
	name = "Independent - Assistant (Pirate)"

	jobtype = /datum/job/assistant

	id = /obj/item/card/id/cel/pirate/assistant
	uniform = /obj/item/clothing/under/costume/pirate
	suit = /obj/item/clothing/suit/pirate
	head = /obj/item/clothing/head/bandana
	shoes = /obj/item/clothing/shoes/sneakers/black

/datum/outfit/job/pirate/assistant/jupiter
	name = "Independent - Assistant (Nodesman)"

	uniform = /obj/item/clothing/under/utility
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/survival
	gloves = /obj/item/clothing/gloves/combat
	implants = list(/obj/item/implant/radio)

// Pirate: Powder Monkey Outfit ???
/datum/outfit/job/pirate/engineer/celadon
	name = "Powder Monkey (Pirate)"

// MARK: Frontiersmen

/datum/outfit/job/cel/pirate/frontiersmen
	name = "Frontiersmen - Base Outfit"
	faction = FACTION_PLAYER_FRONTIERSMEN
	// faction_icon = "bg_frontiersmen"

	uniform = /obj/item/clothing/under/frontiersmen
	r_pocket = /obj/item/radio
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/pirate
	box = /obj/item/storage/box/survival
	id = /obj/item/card/id

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

// Assistant

/datum/outfit/job/cel/pirate/frontiersmen/assistant
	name = "Frontiersmen - Deckhand"
	id_assignment = "Deckhand"
	job_icon = "assistant"
	jobtype = /datum/job/assistant

	uniform = /obj/item/clothing/under/frontiersmen/deckhand
	head = /obj/item/clothing/head/beret/sec/frontier
	shoes = /obj/item/clothing/shoes/workboots

// Atmospheric Technician

/datum/outfit/job/cel/pirate/frontiersmen/atmos
	name = "Frontiersmen - Atmospheric Specialist"
	job_icon = "atmospherictechnician"
	jobtype = /datum/job/atmos

	accessory = /obj/item/clothing/accessory/armband/engine
	head = /obj/item/clothing/head/hardhat/frontier

// Cargo Technician

/datum/outfit/job/cel/pirate/frontiersmen/cargo_tech
	name = "Frontiersmen - Cargo Tech"
	job_icon = "cargotechnician"
	jobtype = /datum/job/cargo_tech

	accessory = /obj/item/clothing/accessory/armband/cargo
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/soft/frontiersmen
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo)

// Captain

/datum/outfit/job/cel/pirate/frontiersmen/captain
	name = "Frontiersmen - Captain"
	job_icon = "captain"
	jobtype = /datum/job/captain

	ears = /obj/item/radio/headset/pirate/alt/captain
	uniform = /obj/item/clothing/under/frontiersmen/officer
	head = /obj/item/clothing/head/frontier/peaked
	suit = /obj/item/clothing/suit/armor/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/combat

/datum/outfit/job/cel/pirate/frontiersmen/captain/admiral
	name = "Frontiersmen - Admiral"
	id_assignment = "Admiral"

	uniform = /obj/item/clothing/under/frontiersmen/admiral
	head = /obj/item/clothing/head/frontier/peaked/admiral
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/pirate/captain
	gloves = /obj/item/clothing/gloves/combat
	suit = null

// Chief Engineer
/datum/outfit/job/cel/pirate/frontiersmen/ce
	name = "Frontiersmen - Senior Mechanic"
	id_assignment = "Senior Mechanic"
	job_icon = "chiefengineer"
	jobtype = /datum/job/chief_engineer

	accessory = /obj/item/clothing/accessory/armband/engine
	ears = /obj/item/radio/headset/pirate/captain
	uniform = /obj/item/clothing/under/frontiersmen/officer
	head = /obj/item/clothing/head/hardhat/frontier
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/yellow
	belt = /obj/item/storage/belt/utility/full

// Engineer
/datum/outfit/job/cel/pirate/frontiersmen/engineer
	name = "Frontiersmen - Mechanic"
	id_assignment = "Mechanic"
	job_icon = "stationengineer"
	jobtype = /datum/job/engineer

	accessory = /obj/item/clothing/accessory/armband/engine
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/frontier

	r_pocket = /obj/item/analyzer

// Cook

/datum/outfit/job/cel/pirate/frontiersmen/cook
	name = "Frontiersmen - Steward"
	id_assignment = "Steward"
	job_icon = "cook"
	jobtype = /datum/job/cook

	uniform = /obj/item/clothing/under/frontiersmen
	head  = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/suit/apron/chef

// Head of Personnel

/datum/outfit/job/cel/pirate/frontiersmen/hop
	name = "Frontiersmen - Helmsman"
	id_assignment = "Helmsman"
	job_icon = "headofpersonnel"
	jobtype = /datum/job/head_of_personnel

	ears = /obj/item/radio/headset/pirate/alt
	uniform = /obj/item/clothing/under/frontiersmen/officer
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/beret/sec/frontier/officer
	gloves = /obj/item/clothing/gloves/combat
	r_pocket = /obj/item/melee/knife/survival

// Head of Security
/datum/outfit/job/cel/pirate/frontiersmen/hos
	name = "Frontiersmen - Deck Boss"
	id_assignment = "Deck Boss"
	job_icon = "headofsecurity"
	jobtype = /datum/job/hos

	accessory = /obj/item/clothing/accessory/armband
	uniform = /obj/item/clothing/under/frontiersmen/officer
	head = /obj/item/clothing/head/beret/sec/frontier/officer
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/combat
	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen, /obj/item/melee/baton/loaded=1)
	suit_store = null

// Security Officer

/datum/outfit/job/cel/pirate/frontiersmen/security
	name = "Frontiersmen - Boarder"
	id_assignment = "Boarder"
	job_icon = "securityofficer"
	jobtype = /datum/job/officer

	accessory = /obj/item/clothing/accessory/armband
	suit = null
	uniform = /obj/item/clothing/under/frontiersmen
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/pirate/alt

	box = /obj/item/storage/box/survival/frontier

	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen)

// Medical Doctor

/datum/outfit/job/cel/pirate/frontiersmen/doctor
	name = "Frontiersmen - Surgeon"
	id_assignment = "Surgeon"
	job_icon = "medicaldoctor"
	jobtype = /datum/job/doctor

	accessory = /obj/item/clothing/accessory/armband/med
	uniform = /obj/item/clothing/under/frontiersmen
	glasses = /obj/item/clothing/glasses/hud/health
	r_pocket = /obj/item/melee/knife/survival
	suit = /obj/item/clothing/suit/frontiersmen
	head = /obj/item/clothing/head/frontier
	belt = /obj/item/storage/belt/medical/webbing/frontiersmen

// MARK: RAMZI

/datum/outfit/job/cel/ramzi
	name = "Ramzi Clique - Base Outfit"

	uniform = /obj/item/clothing/under/syndicate/ramzi
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/pirate/alt
	box = /obj/item/storage/box/survival
	id = /obj/item/card/id

	faction_icon = "bg_syndicate"

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/ramzi/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(visualsOnly)
		return
	H.faction |= list(FACTION_RAMZI)

//Deckhand

/datum/outfit/job/cel/ramzi/assistant
	name = "Ramzi Clique - Deckhand"

	id_assignment = "Runt"
	job_icon = "assistant"
	jobtype = /datum/job/assistant

	shoes = /obj/item/clothing/shoes/workboots

//Captain

/datum/outfit/job/cel/ramzi/captain
	name = "Ramzi Clique - Captain"

	job_icon = "captain"
	jobtype = /datum/job/captain
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer

	ears = /obj/item/radio/headset/pirate/alt/captain
	suit = /obj/item/clothing/suit/armor/ramzi/captain
	head = /obj/item/clothing/head/ramzi/peaked

//Head Of Security

/datum/outfit/job/cel/ramzi/hos
	name = "Ramzi Clique - Team Leader"

	id_assignment = "Sweeper Lead"
	job_icon = "headofsecurity"
	jobtype = /datum/job/hos
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer
	suit = /obj/item/clothing/suit/armor/ramzi/officer
	head = /obj/item/clothing/head/ramzi/beret
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	backpack_contents = list(/obj/item/clothing/mask/gas/ramzi)

//Security Officer

/datum/outfit/job/cel/ramzi/operative
	name = "Ramzi Clique - Operative"

	id_assignment = "Sweeper"
	job_icon = "securityofficer"
	jobtype = /datum/job/officer
	uniform = /obj/item/clothing/under/syndicate/ramzi/overalls
	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	backpack_contents = list(/obj/item/clothing/mask/gas/ramzi)

//Pilot

/datum/outfit/job/cel/ramzi/pilot
	name = "Ramzi Clique - Pilot"
	id_assignment = "Shuttle Chief"
	job_icon = "securityofficer"
	jobtype = /datum/job/officer
	uniform = /obj/item/clothing/under/syndicate/ramzi/officer
	l_pocket = /obj/item/weldingtool/mini
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

//Medical Doctor

/datum/outfit/job/cel/ramzi/medic
	name = "Ramzi Clique - Medic"

	id_assignment = "Sawbones"
	job_icon = "medicaldoctor"
	jobtype = /datum/job/doctor
	uniform = /obj/item/clothing/under/syndicate/ramzi/overalls
	accessory = /obj/item/clothing/accessory/armband/med
	glasses = /obj/item/clothing/glasses/hud/health
	r_pocket = /obj/item/melee/knife/survival
	suit = /obj/item/clothing/suit/ramzi/smock
	head = /obj/item/clothing/head/ramzi/surgical

//Engineer

/datum/outfit/job/cel/ramzi/engineer
	name = "Ramzi Clique - Motorman"

	id_assignment = "Motorman"
	job_icon = "stationengineer"
	jobtype = /datum/job/engineer
	head = /obj/item/clothing/head/hardhat/ramzi
	suit = /obj/item/clothing/suit/ramzi
	accessory = /obj/item/clothing/accessory/armband/engine
	shoes = /obj/item/clothing/shoes/workboots

	r_pocket = /obj/item/analyzer

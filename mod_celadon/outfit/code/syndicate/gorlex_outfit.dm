//MARK: Captain

/datum/outfit/job/cel/syndicate/captain/gorlex
	name = "Syndi Gorlex - Captain"

	id = /obj/item/card/id/cel/syndicate/captain/gorlex
	uniform = /obj/item/clothing/under/syndicate/hardliners/officer

	head = /obj/item/clothing/head/hardliners/peaked
	suit = /obj/item/clothing/suit/toggle/armor/vest/hardliners
	shoes = /obj/item/clothing/shoes/combat

//MARK: Command

/datum/outfit/job/cel/syndicate/ce/gorlex
	name = "Syndi Gorlex - Chief Engineer"

	id = /obj/item/card/id/cel/syndicate/command_ce/gorlex
	head = /obj/item/clothing/head/hardhat
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/gorlex
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/red/insulated

/datum/outfit/job/cel/syndicate/hos/gorlex
	name = "Syndi Gorlex - Sergeant"
	id_assignment = "Sergeant"

	id = /obj/item/card/id/cel/syndicate/command_hos/gorlex
	uniform = /obj/item/clothing/under/syndicate/hardliners/officer
	head = /obj/item/clothing/head/hardliners/peaked
	suit = /obj/item/clothing/suit/armor/hardliners/sergeant
	shoes = /obj/item/clothing/shoes/combat

/datum/outfit/job/cel/syndicate/hos/gorlex/lieutenant	// Pangolier
	name = "Syndi Gorlex - Lieutenant"
	id_assignment = null

	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/hardliners/officer
	suit = null
	mask = /obj/item/clothing/mask/breath/facemask
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/beret/sec/officer

	l_pocket = /obj/item/flashlight/seclite

//MARK: Crew
/datum/outfit/job/cel/syndicate/doctor/gorlex
	name = "Syndi Gorlex - Medical Doctor"

	id = /obj/item/card/id/cel/syndicate/crew/doctor/gorlex
	uniform = /obj/item/clothing/under/syndicate/hardliners
	head = /obj/item/clothing/head/hardliners
	suit = /obj/item/clothing/suit/hardliners
	glasses = /obj/item/clothing/glasses/hud/health
	shoes = /obj/item/clothing/shoes/combat

/datum/outfit/job/cel/syndicate/paramedic/gorlex	// Не юзается
	name = "Syndi Gorlex - Paramedic"

	id = /obj/item/card/id/cel/syndicate/crew/doctor/paramedic/gorlex

/datum/outfit/job/cel/syndicate/security/gorlex
	name = "Syndi Gorlex - Trooper"
	id_assignment = "Trooper"
	job_icon = "securityofficer"

	id = /obj/item/card/id/cel/syndicate/crew/security/gorlex
	uniform = /obj/item/clothing/under/syndicate/hardliners
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/combat

/datum/outfit/job/cel/syndicate/security/gorlex/commando	// Pangolier
	name = "Syndi Gorlex - Commando"
	id_assignment = null

	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/hardliners
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/breath/facemask
	head = /obj/item/clothing/head/beret/black

	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/flashlight/seclite

/datum/outfit/job/cel/syndicate/security/gorlex/pilot	// Не юзается
	name = "Syndi Gorlex - Pilot"
	id_assignment = "Pilot"
	job_icon = "securityofficer"

	id = /obj/item/card/id/cel/syndicate/crew/security/gorlex/pilot
	head = /obj/item/clothing/head/helmet/hardliners/swat

/datum/outfit/job/cel/syndicate/miner/gorlex
	name = "Syndi Gorlex - Wrecker"
	id_assignment = "Wrecker"

	id = /obj/item/card/id/cel/syndicate/crew/miner/gorlex
	head = /obj/item/clothing/head/hardhat/hardliners
	suit = /obj/item/clothing/suit/hazardvest/hardliners
	uniform = /obj/item/clothing/under/syndicate/hardliners/jumpsuit
	accessory = /obj/item/clothing/accessory/armband/cargo
	shoes = /obj/item/clothing/shoes/workboots
	ears = /obj/item/radio/headset/alt

/datum/outfit/job/cel/syndicate/engineer/gorlex
	name = "Syndi Gorlex - Mechanic"
	id_assignment = "Mechanic"

	id = /obj/item/card/id/cel/syndicate/crew/engineer/gorlex
	head = /obj/item/clothing/head/hardhat/hardliners
	suit = /obj/item/clothing/suit/hazardvest/hardliners
	uniform = /obj/item/clothing/under/syndicate/hardliners
	shoes = /obj/item/clothing/shoes/workboots
	glasses = null

//MARK: Assistant

/datum/outfit/job/cel/syndicate/assistant/gorlex
	name = "Syndi Gorlex - Junior Agent"

	id = /obj/item/card/id/cel/syndicate/assistant/gorlex
	uniform = /obj/item/clothing/under/syndicate/hardliners
	alt_uniform = /obj/item/clothing/under/syndicate/hardliners/jumpsuit

/datum/outfit/job/cel/syndicate/assistant/gorlex/operative	//Pangolier
	name = "Syndi Gorlex - Operative"
	id_assignment = null

	uniform = /obj/item/clothing/under/syndicate/hardliners
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/syndicate
	gloves = /obj/item/clothing/gloves/color/black

	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/flashlight/seclite

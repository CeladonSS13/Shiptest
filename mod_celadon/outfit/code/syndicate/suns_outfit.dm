//MARK: Captain

/datum/outfit/job/cel/syndicate/captain/suns
	name = "Syndi SUNS - Captain"
	faction_icon = "bg_suns"
	job_icon = "suns_cap"

	id = /obj/item/card/id/cel/syndicate/captain/suns
	uniform = /obj/item/clothing/under/syndicate/suns/captain
	shoes = /obj/item/clothing/shoes/combat/suns
	head = /obj/item/clothing/head/suns/captain
	gloves = /obj/item/clothing/gloves/suns/captain
	suit = /obj/item/clothing/suit/armor/vest/suns/captain
	belt = /obj/item/storage/belt/sabre/suns/captain
	mask = /obj/item/clothing/mask/breath/suns
	neck = /obj/item/clothing/neck/cloak/suns/cap

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

//MARK: Command

/datum/outfit/job/cel/syndicate/cmo/suns
	name = "Syndi SUNS - Medical Instructor"
	id_assignment = "Medical Instructor"
	faction_icon = "bg_suns"
	job_icon = "suns_cmo"

	id = /obj/item/card/id/cel/syndicate/command_cmo/suns
	uniform = /obj/item/clothing/under/syndicate/suns/doctorscrubs
	ears = /obj/item/radio/headset/syndicate/alt/captain
	shoes = /obj/item/clothing/shoes/combat/suns
	l_pocket = /obj/item/pinpointer/crew
	suit = /obj/item/clothing/suit/toggle/labcoat/suns/cmo
	l_hand = /obj/item/storage/firstaid/medical
	r_hand = /obj/item/storage/belt/sabre/suns/cmo
	suit_store = /obj/item/flashlight/pen/paramedic
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/suns
	glasses = /obj/item/clothing/glasses/hud/health/suns
	head = /obj/item/clothing/head/suns/cmo

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/head_of_personnel/suns	// Не юзается
	name = "Syndi SUNS - Academic Staff"
	id_assignment = "Academic Staff"
	faction_icon = "bg_suns"
	job_icon = "suns_hop"

	id = /obj/item/card/id/cel/syndicate/command_hop/suns
	uniform = /obj/item/clothing/under/syndicate/suns/xo
	suit = /obj/item/clothing/suit/armor/vest/suns/xo
	belt = /obj/item/storage/belt/sabre/suns
	shoes = /obj/item/clothing/shoes/combat/suns
	head = /obj/item/clothing/head/suns
	gloves = /obj/item/clothing/gloves/suns/xo
	neck = /obj/item/clothing/neck/cloak/suns/xo
	r_pocket = null
	glasses = /obj/item/clothing/glasses/science/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/hos/suns	// Не юзается
	name = "Syndi SUNS - Senior Peacekeeper"
	id_assignment = "Senior Peacekeeper"
	faction_icon = "bg_suns"
	job_icon = "suns_hos"

	id = /obj/item/card/id/cel/syndicate/command_hos/suns
	uniform = /obj/item/clothing/under/syndicate/suns/pkuniform
	suit = /obj/item/clothing/suit/armor/vest/suns/hos
	belt = /obj/item/melee/sword/sabre/suns/telescopic
	gloves = /obj/item/clothing/gloves/tackler/dolphin/suns
	shoes = /obj/item/clothing/shoes/combat/suns
	head = /obj/item/clothing/head/welding/suns/hos
	glasses = /obj/item/clothing/glasses/hud/security/suns
	suit_store = /obj/item/gun/ballistic/automatic/powered/gauss/modelh/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/hos/suns/alt	// Не юзается
	name = "Syndi SUNS - Senior Peacekeeper Alt"

	id = /obj/item/card/id/cel/syndicate/command_hos/suns/alt
	suit = /obj/item/clothing/suit/armor/vest/suns/ehos
	head = /obj/item/clothing/head/HoS/syndicate/suns

//MARK: Crew

/datum/outfit/job/cel/syndicate/bartender/suns
	name = "Syndi SUNS - Student Mixologist"
	id_assignment = "Student Mixologist"
	faction_icon = "bg_suns"
	job_icon = "suns_bartender"

	id = /obj/item/card/id/cel/syndicate/crew/bartender/suns
	uniform = /obj/item/clothing/under/syndicate/suns/uniform2
	alt_uniform = /obj/item/clothing/under/syndicate/suns/alt
	mask = /obj/item/clothing/mask/breath/suns
	suit = null
	belt = null
	head = null
	shoes = /obj/item/clothing/shoes/laceup/suns
	gloves = null
	ears = null
	accessory = /obj/item/clothing/accessory/waistcoat/suns/poof

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

	backpack_contents = null

/datum/outfit/job/cel/syndicate/botanist/suns
	name = "Syndi SUNS - Botanist-Chemist"
	id_assignment = "Botanist-Chemist"
	faction_icon = "bg_suns"
	job_icon = "suns_sci"

	id = /obj/item/card/id/cel/syndicate/crew/botanist/suns
	uniform = /obj/item/clothing/under/syndicate/suns/sciencejumpsuit
	shoes = /obj/item/clothing/shoes/sneakers/suns
	glasses = /obj/item/clothing/glasses/science/suns
	suit =  /obj/item/clothing/suit/hooded/suns
	suit_store = null
	neck = /obj/item/clothing/neck/cloak/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/doctor/suns
	name = "Syndi SUNS - Medical Doctor"
	faction_icon = "bg_suns"
	job_icon = "suns_doctor"

	id = /obj/item/card/id/cel/syndicate/crew/doctor/suns
	uniform = /obj/item/clothing/under/syndicate/suns/doctorscrubs
	shoes = /obj/item/clothing/shoes/sneakers/suns
	suit = /obj/item/clothing/suit/toggle/labcoat/suns/doctorlabcoat
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/suns
	head = /obj/item/clothing/head/suns/surgery
	glasses = /obj/item/clothing/glasses/hud/health/suns
	mask = /obj/item/clothing/mask/surgical/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/psychologist/suns
	name = "Syndi SUNS - Psychologist"
	faction_icon = "bg_suns"

	id = /obj/item/card/id/cel/syndicate/crew/doctor/psychologist/suns
	uniform = /obj/item/clothing/under/syndicate/suns/uniform3
	alt_uniform = /obj/item/clothing/under/syndicate/suns/uniform3/alt
	suit = /obj/item/clothing/suit/toggle/suns
	alt_suit = /obj/item/clothing/suit/toggle/suns/alt
	shoes = /obj/item/clothing/shoes/laceup/suns
	accessory = /obj/item/clothing/accessory/waistcoat/suns/poof

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/security/suns
	name = "Syndi SUNS - Peacekeeper"
	id_assignment = "Peacekeeper"
	faction_icon = "bg_suns"
	job_icon = "suns_peacekeeper"

	id = /obj/item/card/id/cel/syndicate/crew/security/suns
	uniform = /obj/item/clothing/under/syndicate/suns/pkuniform
	suit = /obj/item/clothing/suit/armor/vest/suns
	alt_suit = /obj/item/clothing/suit/toggle/suns/pkcoat
	belt = /obj/item/melee/sword/sabre/suns/telescopic
	gloves = /obj/item/clothing/gloves/tackler/dolphin/suns
	shoes = /obj/item/clothing/shoes/jackboots/suns/long
	head = /obj/item/clothing/head/welding/suns
	glasses = /obj/item/clothing/glasses/hud/security/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/engineer/suns
	name = "Syndi SUNS - Ship Engineer"
	faction_icon = "bg_suns"
	job_icon = "suns_eng"

	id = /obj/item/card/id/cel/syndicate/crew/engineer/suns
	uniform = /obj/item/clothing/under/syndicate/suns/workerjumpsuit
	suit = /obj/item/clothing/suit/toggle/suns/workervest
	gloves = /obj/item/clothing/gloves/suns/yellow
	shoes = /obj/item/clothing/shoes/jackboots/suns
	head = /obj/item/clothing/head/safety_helmet/suns
	accessory = null
	glasses = null

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/science/suns	// Не юзается
	name = "Syndi SUNS - Scientist"
	faction_icon = "bg_suns"
	job_icon = "suns_sci"

	id = /obj/item/card/id/cel/syndicate/crew/scientist/suns
	uniform = /obj/item/clothing/under/syndicate/suns/sciencejumpsuit
	suit = /obj/item/clothing/suit/hooded/suns
	shoes = /obj/item/clothing/shoes/sneakers/suns
	glasses = /obj/item/clothing/glasses/science/suns
	neck = /obj/item/clothing/neck/cloak/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/security/suns/alternate	// Не юзается
	name = "Syndi SUNS - Peacekeeper - Casual"
	id_assignment = "Peacekeeper"

	id = /obj/item/card/id/cel/syndicate/crew/security/suns/alternate
	suit = /obj/item/clothing/suit/toggle/suns/pkcoat
	belt = null
	head = null

/datum/outfit/job/cel/syndicate/miner/suns	// Не юзается
	name = "Syndi SUNS - Miner"
	faction_icon = "bg_suns"
	job_icon = "suns_miner"

	id = /obj/item/card/id/cel/syndicate/crew/miner
	uniform = /obj/item/clothing/under/syndicate/suns/workerjumpsuit
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	shoes = /obj/item/clothing/shoes/jackboots/suns
	glasses = null
	gloves = null
	ears = null
	r_pocket = null
	l_pocket = null
	belt = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	courierbag = /obj/item/storage/backpack/messenger/sec

//MARK: Assistant

/datum/outfit/job/cel/syndicate/assistant/suns
	name = "Syndi SUNS - Freshman"
	id_assignment = "Freshman"
	faction_icon = "bg_suns"

	id = /obj/item/card/id/cel/syndicate/assistant/suns
	uniform = /obj/item/clothing/under/syndicate/suns
	alt_uniform = /obj/item/clothing/under/syndicate/suns/alt
	suit = /obj/item/clothing/suit/toggle/suns/alt
	alt_suit = /obj/item/clothing/suit/toggle/suns
	shoes = /obj/item/clothing/shoes/laceup/suns
	gloves = null
	ears = null

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/syndicate/assistant/suns/halfway	// не юзается нигде
	name = "Syndi SUNS - Junior"
	id_assignment = "Junior"
	job_icon = "suns_janitor"

	id = /obj/item/card/id/cel/syndicate/assistant/suns/janitor
	uniform = /obj/item/clothing/under/syndicate/suns/uniform2
	alt_uniform = /obj/item/clothing/under/syndicate/suns/uniform2/alt

/datum/outfit/job/cel/syndicate/assistant/suns/complete	// не юзается нигде
	name = "Syndi SUNS - Graduate"
	id_assignment = "Graduate"

	id = /obj/item/card/id/cel/syndicate/assistant/suns/graduate
	uniform = /obj/item/clothing/under/syndicate/suns/uniform3
	alt_uniform = /obj/item/clothing/under/syndicate/suns/uniform3/alt

//MARK: Patient

/datum/outfit/job/cel/syndicate/patient/suns
	faction_icon = "bg_suns"
	job_icon = "suns_patient"

	id = /obj/item/card/id/cel/syndicate/patient_suns

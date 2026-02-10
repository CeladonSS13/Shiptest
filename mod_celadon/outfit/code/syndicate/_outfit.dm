/datum/outfit/job/cel/syndicate
	name = "Syndicate - Base Outfit"
	faction = FACTION_PLAYER_SYNDICATE

	uniform = /obj/item/clothing/under/color/black
	box = /obj/item/storage/box/survival/syndicate
	id = /obj/item/card/id/syndicate_command/crew_id

	faction_icon = "bg_syndicate"

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	courierbag = /obj/item/storage/backpack/messenger/sec

//generates a codename and assigns syndicate access, used in the twinkleshine.
/datum/outfit/job/cel/syndicate/proc/assign_codename(mob/living/carbon/human/H)
	var/obj/item/card/id/I = H.get_idcard()
	if(I)
		I.registered_name = pick(GLOB.twinkle_names) + "-" + num2text(rand(1, 12)) // squidquest real
		I.access |= list(ACCESS_SYNDICATE)
		I.update_label()

/datum/outfit/job/cel/syndicate/proc/get_syndi_general_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id))
				I = O
				break
		if (I)
			I.access += list(ACCESS_OUTPOST_FACTION_SYNDICATE, ACCESS_OUTPOST_OTHER_DONCO)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/cel/syndicate/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_syndi_general_access(H)

//////////////////////////////////////////////////////////////////////////////////////////////////////

//MARK: Captain

/datum/outfit/job/cel/syndicate/captain
	name = "Syndi - Captain"
	jobtype = /datum/job/captain

	job_icon = "captain"

	id = /obj/item/card/id/cel/syndicate/captain
	ears = /obj/item/radio/headset/syndicate/alt/captain
	uniform = /obj/item/clothing/under/syndicate/ngr/officer
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/HoS/syndicate
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/syndicate

//MARK: Command

/datum/outfit/job/cel/syndicate/ce	// Не юзается
	name = "Syndi - Chief Engineer"
	jobtype = /datum/job/chief_engineer

	job_icon = "chiefengineer"

	id = /obj/item/card/id/cel/syndicate/command_ce
	ears = /obj/item/radio/headset/syndicate/alt
	glasses = /obj/item/clothing/glasses/sunglasses

	belt = /obj/item/storage/belt/utility/chief/full
	uniform = /obj/item/clothing/under/rank/engineering/chief_engineer
	shoes = /obj/item/clothing/shoes/sneakers/brown
	head = /obj/item/clothing/head/hardhat/white
	gloves = /obj/item/clothing/gloves/color/black

	pda_slot = ITEM_SLOT_LPOCKET
	chameleon_extras = /obj/item/stamp/ce

/datum/outfit/job/cel/syndicate/cmo
	name = "Syndi - Medical Director"
	id_assignment = "Medical Director"
	jobtype = /datum/job/cmo

	job_icon = "chiefmedicalofficer"

	id = /obj/item/card/id/cel/syndicate/command_cmo
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer
	ears = /obj/item/radio/headset/syndicate/alt/captain
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/pinpointer/crew
	head = /obj/item/clothing/head/beret/cmo
	suit = /obj/item/clothing/suit/toggle/labcoat/raincoat
	l_hand = /obj/item/storage/firstaid/medical
	suit_store = /obj/item/flashlight/pen/paramedic

/datum/outfit/job/cel/syndicate/head_of_personnel
	name = "Syndi - Bridge Officer"
	id_assignment = "Bridge Officer"
	jobtype = /datum/job/head_of_personnel

	job_icon = "headofpersonnel"

	id = /obj/item/card/id/cel/syndicate/command_hop
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/HoS/beret/syndicate
	gloves = /obj/item/clothing/gloves/color/white
	r_pocket = /obj/item/melee/knife/survival
	glasses = /obj/item/clothing/glasses/hud/health
	backpack_contents = list(/obj/item/storage/box/ids=1)

/datum/outfit/job/cel/syndicate/hos	// Не юзается
	name = "Syndi - Head Of Security"
	jobtype = /datum/job/hos

	job_icon = "headofsecurity"

	id = /obj/item/card/id/cel/syndicate/command_hop
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/combat
	head = /obj/item/clothing/head/HoS/syndicate
	suit = /obj/item/clothing/suit/armor/vest/syndie
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses

/datum/outfit/job/cel/syndicate/quartermaster	// Не юзается
	name = "Syndi - Quartermaster"
	jobtype = /datum/job/qm

	job_icon = "quartermaster"

	id = /obj/item/card/id/cel/syndicate/command_qm
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/donk/qm
	suit = /obj/item/clothing/suit/hazardvest/donk/qm
	ears = /obj/item/radio/headset/syndicate/alt
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)

//MARK: Crew

/datum/outfit/job/cel/syndicate/bartender
	name = "Syndi - Bartender"
	jobtype = /datum/job/bartender

	job_icon = "bartender"

	id = /obj/item/card/id/cel/syndicate/crew/bartender
	head = /obj/item/clothing/head/HoS/beret/syndicate
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	alt_uniform = /obj/item/clothing/under/rank/civilian/bartender/purple
	alt_suit = /obj/item/clothing/suit/apron/purple_bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup

/datum/outfit/job/cel/syndicate/bartender/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()

	var/obj/item/card/id/W = H.get_idcard()
	if(H.age < AGE_DRINKING)
		W.registered_age = AGE_DRINKING
		to_chat(H, span_notice("You're not technically old enough to access or serve alcohol, but your ID has been discreetly modified to display your age as [AGE_DRINKING]. Try to keep that a secret!"))

/datum/outfit/job/cel/syndicate/botanist	// Не юзается
	name = "Syndi - Botanist"
	jobtype = /datum/job/hydro

	job_icon = "botanist"

	id = /obj/item/card/id/cel/syndicate/crew/botanist
	suit = /obj/item/clothing/suit/apron
	gloves  =/obj/item/clothing/gloves/botanic_leather
	suit_store = /obj/item/plant_analyzer

/datum/outfit/job/cel/syndicate/cargo_tech	// Не юзается
	name = "Syndi - Cargo Tech"
	jobtype = /datum/job/cargo_tech

	job_icon = "cargotechnician"

	id = /obj/item/card/id/cel/syndicate/crew/cargo_tech
	uniform = /obj/item/clothing/under/syndicate/donk
	suit = /obj/item/clothing/suit/hazardvest/donk

	alt_suit = /obj/item/clothing/suit/hazardvest
	l_hand = /obj/item/export_scanner
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)

/datum/outfit/job/cel/syndicate/atmos	// не юзается нигде
	name = "Syndi - Atmospheric Technician"
	jobtype = /datum/job/atmos

	job_icon = "atmospherictechnician"

	id = /obj/item/card/id/cel/syndicate/crew/atmos
	belt = /obj/item/storage/belt/utility/atmostech
	uniform = /obj/item/clothing/under/rank/engineering/atmospheric_technician
	alt_uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	alt_suit = /obj/item/clothing/suit/hazardvest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering

	r_pocket = /obj/item/analyzer

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	pda_slot = ITEM_SLOT_LPOCKET
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

/datum/outfit/job/cel/syndicate/chemist	// Не юзается
	name = "Syndi - Chemist"
	jobtype = /datum/job/chemist

	job_icon = "chemist"

	id = /obj/item/card/id/cel/syndicate/crew/chemist
	uniform = /obj/item/clothing/under/syndicate
	glasses = /obj/item/clothing/glasses/science
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/toggle/labcoat/chemist


/datum/outfit/job/cel/syndicate/doctor
	name = "Syndi - Medical Doctor"
	jobtype = /datum/job/doctor

	job_icon = "medicaldoctor"

	id = /obj/item/card/id/cel/syndicate/crew/doctor
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	alt_suit = /obj/item/clothing/suit/apron/surgical
	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie/med
	courierbag = /obj/item/storage/backpack/messenger/med

/datum/outfit/job/cel/syndicate/paramedic	// Не юзается
	name = "Syndi - Paramedic"
	jobtype = /datum/job/paramedic

	job_icon = "paramedic"

	id = /obj/item/card/id/cel/syndicate/crew/doctor/paramedic
	uniform = /obj/item/clothing/under/syndicate/gorlex
	alt_uniform = null
	shoes = /obj/item/clothing/shoes/jackboots

	head = /obj/item/clothing/head/soft/paramedic
	suit =  /obj/item/clothing/suit/toggle/labcoat/paramedic
	alt_suit = /obj/item/clothing/suit/apron/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/evil
	belt = /obj/item/storage/belt/medical/paramedic
	suit_store = /obj/item/flashlight/pen/paramedic
	backpack_contents = list(/obj/item/roller=1)
	pda_slot = ITEM_SLOT_LPOCKET

/datum/outfit/job/cel/syndicate/psychologist	// Не юзается
	name = "Syndi - Psychologist"
	jobtype = /datum/job/psychologist

	job_icon = "psychologist"

	id = /obj/item/card/id/cel/syndicate/crew/doctor/psychologist
	uniform = /obj/item/clothing/under/rank/medical/psychiatrist
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	alt_uniform = null
	l_hand = /obj/item/clipboard
	pda_slot = ITEM_SLOT_BELT
/datum/outfit/job/cel/syndicate/science	// Не юзается
	name = "Syndi - Scientist"
	jobtype = /datum/job/scientist

	job_icon = "scientist"

	id = /obj/item/card/id/cel/syndicate/crew/scientist
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

/datum/outfit/job/cel/syndicate/security
	name = "Syndi - Operative"
	id_assignment = "Operative"
	jobtype = /datum/job/officer

	job_icon = "securityofficer"

	id = /obj/item/card/id/cel/syndicate/crew/security
	uniform = /obj/item/clothing/under/syndicate
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld

/datum/outfit/job/cel/syndicate/miner	// Не юзается
	name = "Syndi - Miner"
	jobtype = /datum/job/mining

	job_icon = "shaftminer"

	id = /obj/item/card/id/cel/syndicate/crew/miner
	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/explorer
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	r_pocket = /obj/item/storage/bag/ore
	backpack_contents = list(
						/obj/item/flashlight/seclite=1,
						/obj/item/melee/knife/survival=1,
						/obj/item/stack/marker_beacon/ten=1,
						/obj/item/radio/weather_monitor=1,
						)

/datum/outfit/job/cel/syndicate/engineer
	name = "Syndi - Ship Technician"
	id_assignment = "Ship Technician"
	jobtype = /datum/job/engineer

	job_icon = "stationengineer"

	id = /obj/item/card/id/cel/syndicate/crew/engineer
	uniform = /obj/item/clothing/under/syndicate
	alt_uniform = /obj/item/clothing/under/syndicate/gec
	accessory = /obj/item/clothing/accessory/armband/engine
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/jackboots

	belt = /obj/item/storage/belt/utility/full/engi
	head = /obj/item/clothing/head/hardhat/dblue
	r_pocket = /obj/item/t_scanner

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	pda_slot = ITEM_SLOT_LPOCKET
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

//MARK: Assistant

/datum/outfit/job/cel/syndicate/assistant
	name = "Syndi - Junior Agent"
	id_assignment = "Junior Agent"
	jobtype = /datum/job/assistant

	job_icon = "assistant"

	uniform = /obj/item/clothing/under/syndicate/intern
	alt_uniform = null

	shoes = /obj/item/clothing/shoes/jackboots
	gloves = null
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack

	id = /obj/item/card/id/cel/syndicate/assistant
	r_pocket = /obj/item/radio

//MARK: Patient

/datum/outfit/job/cel/syndicate/patient
	name = "Syndi - Long Term Patient"
	id_assignment = "Long Term Patient"
	jobtype = /datum/job/prisoner

	job_icon = "suns_patient"

	id = /obj/item/card/id/cel/syndicate/patient_suns
	uniform = /obj/item/clothing/under/rank/medical/gown
	alt_suit = null
	shoes = /obj/item/clothing/shoes/sandal/slippers

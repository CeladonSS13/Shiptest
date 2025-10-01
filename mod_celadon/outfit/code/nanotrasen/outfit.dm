/// MARK: Доступы для Нанотрахенов

/datum/outfit/job/nanotrasen/cel/proc/get_nt_general_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/nanotrasen/cel/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_nt_general_access(H)

// Даёт всем НТшкам брендовый сурвивал бокс
/datum/outfit/job/nanotrasen/cel
	job_icon = "assistant"
	box = /obj/item/storage/box/survival/nanotrasen

// MARK: Обычные

/datum/outfit/job/nanotrasen/cel/hos
	job_icon = "headofsecurity"
	name = "Nanotrasen - Head of Security"
	jobtype = /datum/job/hos

	id = /obj/item/card/id/silver
	belt = /obj/item/pda/heads/hos
	ears = /obj/item/radio/headset/nanotrasen/alt
	uniform = /obj/item/clothing/under/nanotrasen/security/director
	alt_uniform = null
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/nanotrasen/slim
	alt_suit = /obj/item/clothing/suit/armor/nanotrasen/sec_director
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/nanotrasen/beret/security/command
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	suit_store = null
	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = list(/obj/item/melee/classic_baton=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/e_gun/hos, /obj/item/stamp/hos)

/datum/outfit/job/nanotrasen/cel/engineer
	job_icon = "stationengineer"
	name = "Nanotrasen - Engineer"
	jobtype = /datum/job/engineer

	belt = /obj/item/storage/belt/utility/full/engi
	l_pocket = /obj/item/pda/engineering
	ears = /obj/item/radio/headset/headset_eng
	uniform = /obj/item/clothing/under/nanotrasen/engineering
	head = /obj/item/clothing/head/hardhat/nanotrasen
	suit = /obj/item/clothing/suit/nanotrasen/vest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/workboots
	r_pocket = /obj/item/t_scanner

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

/datum/outfit/job/nanotrasen/cel/security
	job_icon = "securityofficer"
	name = "Nanotrasen - Security Officer"
	jobtype = /datum/job/officer

	ears = /obj/item/radio/headset/alt
	uniform = /obj/item/clothing/under/nanotrasen/security
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/nanotrasen/cap/security
	suit = /obj/item/clothing/suit/armor/nanotrasen
	alt_suit = /obj/item/clothing/suit/armor/nanotrasen/slim
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)

/datum/outfit/job/nanotrasen/cel/paramedic
	job_icon = "paramedic"
	name = "Nanotrasen - Paramedic"
	jobtype = /datum/job/paramedic

	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/nanotrasen/medical/paramedic
	head = /obj/item/clothing/head/nanotrasen/cap/medical
	shoes = /obj/item/clothing/shoes/sneakers/blue
	suit =  /obj/item/clothing/suit/toggle/labcoat/nanotrasen/paramedic
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical/paramedic
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	id = /obj/item/card/id

	backpack_contents = list(/obj/item/roller=1)

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/para

	chameleon_extras = /obj/item/gun/syringe

/datum/outfit/job/nanotrasen/cel/doctor
	job_icon = "medicaldoctor"
	name = "Nanotrasen - Medical Doctor"
	jobtype = /datum/job/doctor

	belt = /obj/item/pda/medical
	ears = /obj/item/radio/headset/headset_med
	head = /obj/item/clothing/head/nanotrasen/surgical
	uniform = /obj/item/clothing/under/nanotrasen/medical
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/nanotrasen/medical_smock
	alt_suit = /obj/item/clothing/suit/toggle/labcoat/nanotrasen
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

/datum/outfit/job/nanotrasen/cel/cmo

/datum/outfit/job/nanotrasen/cel/warden
	job_icon = "warden"
	name = "Nanotrasen - Warden"
	jobtype = /datum/job/warden

	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/rank/security/warden/nt
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest/security/warden/alt/nt
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/warden/red
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	r_pocket = /obj/item/assembly/flash/handheld
	l_pocket = /obj/item/restraints/handcuffs
	suit_store = null
	backpack_contents = list(/obj/item/melee/classic_baton)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	chameleon_extras = /obj/item/gun/ballistic/shotgun/automatic/m11

/datum/outfit/job/nanotrasen/cel/ce
	job_icon = "chiefengineer"
	name = "Nanotrasen - Chief Engineer"
	jobtype = /datum/job/chief_engineer

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/utility/chief/full
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/nanotrasen/engineering/director
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/sneakers/brown
	head = /obj/item/clothing/head/hardhat/nanotrasen/white
	gloves = /obj/item/clothing/gloves/color/black

	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced = 1)

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	chameleon_extras = /obj/item/stamp/ce

/datum/outfit/job/nanotrasen/cel/atmos
	job_icon = "stationengineer"
	name = "Nanotrasen - Atmos Tech"
	jobtype = /datum/job/atmos

	belt = /obj/item/storage/belt/utility/atmostech
	ears = /obj/item/radio/headset/headset_eng
	uniform = /obj/item/clothing/under/nanotrasen/engineering/atmos
	head = /obj/item/clothing/head/hardhat/nanotrasen/blue
	suit = /obj/item/clothing/suit/nanotrasen/vest/blue
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

/datum/outfit/job/nanotrasen/cel/miner
	job_icon = "shaftminer"
	name = "Nanotrasen - Miner"
	jobtype = /datum/job/mining

	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	head = /obj/item/clothing/head/hardhat/nanotrasen
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/nanotrasen/supply/miner
	suit = /obj/item/clothing/suit/nanotrasen/vest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/miner
	r_pocket = /obj/item/storage/bag/ore

	backpack_contents = list(
						/obj/item/flashlight/seclite=1,
						/obj/item/melee/knife/survival=1,
						/obj/item/stack/marker_beacon/ten=1,
						/obj/item/radio/weather_monitor=1,
						)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag

	chameleon_extras = /obj/item/gun/energy/kinetic_accelerator

/datum/outfit/job/nanotrasen/cel/doctor/lp
	job_icon = "assistant"
	name = "Nanotrasen - LP Medical Specialist"
	id_assignment = "Medical Specialist"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
	id = /obj/item/card/id/lpmed
	belt = /obj/item/pda/medical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	uniform = /obj/item/clothing/under/rank/medical/paramedic/lp
	alt_uniform = /obj/item/clothing/under/rank/medical/paramedic/skirt/lp
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical
	shoes = /obj/item/clothing/shoes/sneakers/white
	head = /obj/item/clothing/head/beret/med

	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

/datum/outfit/job/nanotrasen/cel/chemist
	job_icon = "chemist"

// MARK: Научный директор - РД

/datum/outfit/job/nanotrasen/cel/rd
	name = "Nanotrasen - Science Director"
	job_icon = "researchdirector"
	jobtype = /datum/job/rd
	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/nanotrasen
	uniform = /obj/item/clothing/under/nanotrasen/science/director
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/toggle/labcoat/nanotrasen/black
	alt_suit = /obj/item/clothing/suit/toggle/suspenders
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

	chameleon_extras = /obj/item/stamp/rd

// MARK: Медицинский директор - СМО

/datum/outfit/job/nanotrasen/cel/cmo
	name = "Nanotrasen - Medical Director"
	job_icon = "chiefmedicalofficer"
	jobtype = /datum/job/cmo
	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/nanotrasen
	head = /obj/item/clothing/head/beret/cmo
	uniform = /obj/item/clothing/under/nanotrasen/medical/director
	shoes = /obj/item/clothing/shoes/laceup
	suit = /obj/item/clothing/suit/toggle/labcoat/nanotrasen/blue
	alt_suit = /obj/item/clothing/suit/toggle/suspenders
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	courierbag = /obj/item/storage/backpack/messenger/med

	chameleon_extras = /obj/item/stamp/cmo

// MARK: Медицинский Директор - СМО капитан

/datum/outfit/job/nanotrasen/cel/cmo/captain
	name = "Nanotrasen - Medical Director (Captain)"
	job_icon = "chiefmedicalofficer"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	belt = /obj/item/pda/heads/cmo
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	ears = /obj/item/radio/headset/nanotrasen/captain
	uniform = /obj/item/clothing/under/nanotrasen/medical/director
	suit = /obj/item/clothing/suit/toggle/labcoat/nanotrasen/blue
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical
	shoes = /obj/item/clothing/shoes/laceup
	neck = /obj/item/clothing/neck/tie/blue
	head = /obj/item/clothing/head/beret/cmo

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

	accessory = /obj/item/clothing/accessory/medal/silver/valor

	chameleon_extras = /obj/item/stamp/cmo

// MARK: Инженерный Директор - СЕ капитан

/datum/outfit/job/nanotrasen/cel/ce/captain
	name = "Nanotrasen - Engineering Director (Captain)"
	job_icon = "chiefengineer"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	belt = /obj/item/pda/heads/ce
	gloves = /obj/item/clothing/gloves/color/yellow
	ears = /obj/item/radio/headset/nanotrasen/captain
	uniform = /obj/item/clothing/under/nanotrasen/engineering/director
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/laceup
	neck = /obj/item/clothing/neck/tie/orange
	head = /obj/item/clothing/head/hardhat/nanotrasen/white

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	accessory = /obj/item/clothing/accessory/medal/plasma/nobel_science

	chameleon_extras = /obj/item/stamp/ce

// MARK: Химик

/datum/outfit/job/nanotrasen/cel/chemist
	name = "Nanotrasen - Chemist"
	job_icon = "chemist"
	jobtype = /datum/job/chemist

	belt = /obj/item/pda/chemist
	ears = /obj/item/radio/headset/headset_med
	head = /obj/item/clothing/head/beret/chem
	uniform = /obj/item/clothing/under/rank/medical/chemist
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/toggle/labcoat/nanotrasen
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/chemistry
	satchel = /obj/item/storage/backpack/satchel/chem
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/chem

/// MARK: Генетик

/datum/outfit/job/nanotrasen/cel/geneticist
	name = "Nanotrasen - Genetical Researcher"
	job_icon = "geneticist"
	jobtype = /datum/job/geneticist

	belt = /obj/item/pda/geneticist
	ears = /obj/item/radio/headset/headset_medsci
	head = /obj/item/clothing/head/beret/sci
	uniform = /obj/item/clothing/under/rank/medical/geneticist
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/toggle/labcoat/nanotrasen
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	backpack = /obj/item/storage/backpack/genetics
	satchel = /obj/item/storage/backpack/satchel/tox
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/tox
/// MARK: Директор СБ - ХОС капитан

/datum/outfit/job/nanotrasen/cel/hos/captain
	name = "Nanotrasen - Security Director (Captain)"
	job_icon = "headofsecurity"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	belt = /obj/item/pda/heads/hos
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
	uniform = /obj/item/clothing/under/nanotrasen/security/director
	suit = /obj/item/clothing/suit/armor/nanotrasen/sec_director
	alt_suit = /obj/item/clothing/suit/toggle/armor/hos_formal
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	shoes = /obj/item/clothing/shoes/combat
	neck = /obj/item/clothing/neck/scarf/black
	head = /obj/item/clothing/head/nanotrasen/beret/security/command

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	accessory = /obj/item/clothing/accessory/medal/silver/security

	chameleon_extras = /obj/item/stamp/hos

/// MARK: лп уборщик

/datum/outfit/job/nanotrasen/cel/janitor/lp
	name = "Nanotrasen - LP Janitorial Specialist"
	jobtype = /datum/job/janitor
	job_icon = "janitor"

	uniform = /obj/item/clothing/under/nanotrasen/janitor
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit = /obj/item/clothing/suit/nanotrasen/suitjacket
	head = /obj/item/clothing/head/nanotrasen/cap/janitor
	id = /obj/item/card/id/lpjanitor
	ears = /obj/item/radio/headset/nanotrasen
	belt = /obj/item/storage/belt/janitor
	gloves = /obj/item/clothing/gloves/color/purple
	back = /obj/item/storage/backpack/ert/janitor

/// MARK: ЕРТ коммандер

/datum/outfit/job/nanotrasen/cel/security/ert/commander
	job_icon = "assistant"
	name = "Nanotrasen - ERT Сommander"

	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/armor/vest/marine
	head = /obj/item/clothing/head/nanotrasen/beret
	backpack = /obj/item/storage/backpack/ert
	belt = /obj/item/storage/belt/military/assault
	id = /obj/item/card/id/ert
	ears = /obj/item/radio/headset/nanotrasen/alt
	r_pocket = /obj/item/melee/knife/survival
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite, /obj/item/gun_voucher/nanotrasen)
	glasses = /obj/item/clothing/glasses/sunglasses

/// MARK: Nanotrasen Tactical Assault Team лидер

/datum/outfit/job/nanotrasen/cel/ntas/commander
	name = "NTAS Leader"
	jobtype = /datum/job/captain
	job_icon = "captain"
	implants = list(/obj/item/implant/mindshield, /obj/item/organ/cyberimp/eyes/hud/security)
	uniform = /obj/item/clothing/under/rank/centcom/official
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert
	id = /obj/item/card/id/ert
	ears = /obj/item/radio/headset/nanotrasen/alt/captain


/// MARK: Nanotrasen Tactical Assault Team сбуха

/datum/outfit/job/nanotrasen/cel/ntas/operative
	name = "NTAS Security Operative"
	jobtype = /datum/job/hos
	job_icon = "headofsecurity"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/security
	id = /obj/item/card/id/ert/security
	ears = /obj/item/radio/headset/nanotrasen/alt



/// MARK: Nanotrasen Tactical Assault Team медик

/datum/outfit/job/nanotrasen/cel/ntas/medic
	name = "NTAS Medical Operative"
	jobtype = /datum/job/cmo
	job_icon = "chiefmedicalofficer"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/medical
	id = /obj/item/card/id/ert/medical
	ears = /obj/item/radio/headset/nanotrasen/alt
	backpack_contents = list(/obj/item/storage/firstaid/medical)



/// MARK: Nanotrasen Tactical Assault Team инженер

/datum/outfit/job/nanotrasen/cel/ntas/engineer
	name = "NTAS Engineering Operative"
	jobtype = /datum/job/chief_engineer
	job_icon = "chiefengineer"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/engineer
	id = /obj/item/card/id/ert/engineer
	ears = /obj/item/radio/headset/nanotrasen/alt



/// MARK: Nanotrasen Tactical Assault Team уборщичек

/datum/outfit/job/nanotrasen/cel/ntas/janitor
	name = "NTAS Custodial Operative"
	jobtype = /datum/job/janitor
	job_icon = "janitor"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/janitor
	id = /obj/item/card/id/ert/janitor
	ears = /obj/item/radio/headset/nanotrasen/alt



/// MARK: слешер капитан

/datum/outfit/job/nanotrasen/cel/intel/captain
	name = "Intelligence Officer"
	jobtype = /datum/job/captain
	job_icon = "captain"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/nanotrasen/captain
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/satchel/leather
	suit = /obj/item/clothing/suit/armor/nanotrasen/captain/parade
	suit_store = /obj/item/gun/ballistic/revolver/mateba
	head = /obj/item/clothing/head/nanotrasen/captain/peaked
	id = /obj/item/card/id/lplieu
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
	backpack_contents = list(/obj/item/ammo_box/a357, /obj/item/ammo_box/a357)


/// MARK: слешер сбуха

/datum/outfit/job/nanotrasen/cel/intel/operative
	name = "Security Operative"
	jobtype = /datum/job/hos
	job_icon = "headofsecurity"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/security/head_of_security/alt/lp
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/security
	suit = /obj/item/clothing/suit/armor/nanotrasen
	head = /obj/item/clothing/head/nanotrasen/beret/security/command
	id = /obj/item/card/id/lpsec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	ears = /obj/item/radio/headset/nanotrasen/alt



/// MARK: слешер медик

/datum/outfit/job/nanotrasen/cel/intel/medic
	name = "Medical Technician"
	jobtype = /datum/job/cmo
	job_icon = "chiefmedicalofficer"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/medical/paramedic/lp
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/medical
	head = /obj/item/clothing/head/soft/paramedic
	id = /obj/item/card/id/lpmed
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	ears = /obj/item/radio/headset/nanotrasen/alt
	backpack_contents = list(/obj/item/storage/firstaid/medical)



/// MARK: слешер инженер

/datum/outfit/job/nanotrasen/cel/intel/engineer
	name = "Engineering Technician"
	jobtype = /datum/job/chief_engineer
	job_icon = "chiefengineer"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/engineering/engineer/nt/lp
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/beret/eng/hazard
	backpack = /obj/item/storage/backpack/ert/engineer
	glasses = /obj/item/clothing/glasses/meson/engine
	belt = /obj/item/storage/belt/utility/full/engi
	id = /obj/item/card/id/lpengie
	ears = /obj/item/radio/headset/nanotrasen/alt
	backpack_contents = list(/obj/item/construction/rcd/loaded)

// MARK: NT Nakamura
/datum/outfit/job/nanotrasen/cel/nakamura_ce
	job_icon = "chiefengineer"
	name = "Cheif of Engeneer"

	id = /obj/item/card/id/cel/nanotrasen/nakamura_ce

/datum/outfit/job/nanotrasen/cel/nakamura_command
	job_icon = "quartermaster"
	name = "Quartermaster"

	id = /obj/item/card/id/cel/nanotrasen/nakamura_command

/datum/outfit/job/nanotrasen/cel/nakamura_atmostechnic
	job_icon = "atmospherictechnician"
	name = "Atmospheric Technician"

	id = /obj/item/card/id/cel/nanotrasen/nakamura_atmostechnic

/datum/outfit/job/nanotrasen/cel/nakamura_engeneer
	job_icon = "stationengineer"
	name = "Engeneer"

	id = /obj/item/card/id/cel/nanotrasen/nakamura_engeneer

/datum/outfit/job/nanotrasen/cel/nakamura_assistant
	job_icon = "assistant"
	name = "Assistant"

	id = /obj/item/card/id/cel/nanotrasen/nakamura_assistant

// MARK: NT DeForest
/datum/outfit/job/nanotrasen/cel/deforest_cmo
	job_icon = "chiefmedicalofficer"
	name = "Cheif of Medical Officer"

	id = /obj/item/card/id/cel/nanotrasen/deforest_cmo

/datum/outfit/job/nanotrasen/cel/deforest_researcher
	job_icon = "scientist"
	name = "Researcher"

	id = /obj/item/card/id/cel/nanotrasen/deforest_researcher

/datum/outfit/job/nanotrasen/cel/deforest_chemist
	job_icon = "chemist"
	name = "Chemist"

	id = /obj/item/card/id/cel/nanotrasen/deforest_chemist

/datum/outfit/job/nanotrasen/cel/deforest_medic
	job_icon = "medicaldoctor"
	name = "Medical Doctor"

	id = /obj/item/card/id/cel/nanotrasen/deforest_medic

/datum/outfit/job/nanotrasen/cel/deforest_assistant
	job_icon = "assistant"
	name = "Assistant"

	id = /obj/item/card/id/cel/nanotrasen/deforest_assistant

// MARK: NT N+S Logistic
/datum/outfit/job/nanotrasen/cel/nslogistic_captain
	job_icon = "captain"
	name = "Captain"

	id = /obj/item/card/id/cel/nanotrasen/nslogistic_captain

/datum/outfit/job/nanotrasen/cel/nslogistic_rd
	job_icon = "researchdirector"
	name = "Research Director"

	id = /obj/item/card/id/cel/nanotrasen/nslogistic_rd

/datum/outfit/job/nanotrasen/cel/nslogistic_quartermaster
	job_icon = "quartermaster"
	name = "Quartermaster"

	id = /obj/item/card/id/cel/nanotrasen/nslogistic_quartermaster

/datum/outfit/job/nanotrasen/cel/nslogistic_miner
	job_icon = "shaftminer"
	name = "Shaft Miner"

	id = /obj/item/card/id/cel/nanotrasen/nslogistic_miner

/datum/outfit/job/nanotrasen/cel/nslogistic_assistant
	job_icon = "assistant"
	name = "Assistant"

	id = /obj/item/card/id/cel/nanotrasen/nslogistic_assistant

// MARK: NT Vigilitas
/datum/outfit/job/nanotrasen/cel/vigilitas_leutenant
	job_icon = "clip_cmm6"
	name = "Leutenant"

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_leutenant

/datum/outfit/job/nanotrasen/cel/vigilitas_sergeant
	job_icon = "clip_cmm5"
	name = "Sergeant"

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_sergeant

/datum/outfit/job/nanotrasen/cel/vigilitas_engeneer
	job_icon = "stationengineer"
	name = "Engeneer"

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_engeneer

/datum/outfit/job/nanotrasen/cel/vigilitas_medic
	job_icon = "medicaldoctor"
	name = "Medic"

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_medic

/datum/outfit/job/nanotrasen/cel/vigilitas_security
	job_icon = "securityofficer"
	name = "Security"

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_security

// Все остальные аутфиты офов. При надобности расскоментить
// /datum/outfit/job/nanotrasen/captain
// 	job_icon = "captain"

// /datum/outfit/job/nanotrasen/lawyer
// 	job_icon = "lawyer"

// /datum/outfit/job/nanotrasen/assistant
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/hop
// 	job_icon = "chiefengineer"

// /datum/outfit/job/nanotrasen/quartermaster
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/lawyer/corporaterepresentative
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/cargo_tech
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/scientist
// 	job_icon = "scientist"

// /datum/outfit/job/nanotrasen/roboticist
// 	job_icon = "roboticist"

// /datum/outfit/job/nanotrasen/captain/lp
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/engineer/lp
// 	job_icon = "stationengineer"

// /datum/outfit/job/nanotrasen/security/lp
// 	job_icon = "securityofficer"

// /datum/outfit/job/nanotrasen/captain/centcom
// 	job_icon = "captain"

// /datum/outfit/job/nanotrasen/security/ert/med
// 	job_icon = "chiefengineer"

// /datum/outfit/job/nanotrasen/security/ert/engi
// 	job_icon = "chiefengineer"

// /datum/outfit/job/nanotrasen/pilot
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/security/mech_pilot
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/brig_phys
// 	job_icon = "assistant"

// /datum/outfit/job/nanotrasen/captain/ns
// 	job_icon = "captain"

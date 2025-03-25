// Доступы для Нанотрахенов

/datum/outfit/job/nanotrasen/proc/get_nt_general_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_OUTPOST_FACTION_SOLFED, ACCESS_OUTPOST_FACTION_NT)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/nanotrasen/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_nt_general_access(H)
// Даёт всем НТшкам брендовый сурвивал бокс
/datum/outfit/job/nanotrasen
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/hos
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/engineer
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/security
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/paramedic
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/doctor
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/cmo
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/warden
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/ce
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/atmos
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/miner
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/doctor/lp
	box = /obj/item/storage/box/survival/nanotrasen

/datum/outfit/job/nanotrasen/chemist
	box = /obj/item/storage/box/survival/nanotrasen
// Научный директор - РД

/datum/outfit/job/nanotrasen/rd
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

// Медицинский директор - СМО

/datum/outfit/job/nanotrasen/cmo
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

// Медицинский Директор - СМО капитан

/datum/outfit/job/nanotrasen/cmo/captain
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

//Инженерный Директор - СЕ капитан

/datum/outfit/job/nanotrasen/ce/captain
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

// Химик

/datum/outfit/job/nanotrasen/chemist
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
	box = /obj/item/storage/box/survival/medical

// Генетик

/datum/outfit/job/nanotrasen/geneticist
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
	box = /obj/item/storage/box/survival/medical

// Директор СБ - ХОС капитан

/datum/outfit/job/nanotrasen/hos/captain
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

//лп уборщик

/datum/outfit/job/nanotrasen/janitor/lp
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

//ЕРТ коммандер

/datum/outfit/job/nanotrasen/security/ert/commander
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

	//Nanotrasen Tactical Assault Team лидер

/datum/outfit/job/nanotrasen/ntas/commander
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
	box = /obj/item/storage/box/survival/nanotrasen

	//Nanotrasen Tactical Assault Team сбуха

/datum/outfit/job/nanotrasen/ntas/operative
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

	box = /obj/item/storage/box/survival/nanotrasen

	//Nanotrasen Tactical Assault Team медик

/datum/outfit/job/nanotrasen/ntas/medic
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

	box = /obj/item/storage/box/survival/nanotrasen

	//Nanotrasen Tactical Assault Team инженер

/datum/outfit/job/nanotrasen/ntas/engineer
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

	box = /obj/item/storage/box/survival/nanotrasen

	//Nanotrasen Tactical Assault Team уборщичек

/datum/outfit/job/nanotrasen/ntas/janitor
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

	box = /obj/item/storage/box/survival/nanotrasen

	//слешер капитан

/datum/outfit/job/nanotrasen/intel/captain
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
	box = /obj/item/storage/box/survival/nanotrasen

	//слешер сбуха

/datum/outfit/job/nanotrasen/intel/operative
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

	box = /obj/item/storage/box/survival/nanotrasen

	//слешер медик

/datum/outfit/job/nanotrasen/intel/medic
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

	box = /obj/item/storage/box/survival/nanotrasen

	//слешер инженер

/datum/outfit/job/nanotrasen/intel/engineer
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







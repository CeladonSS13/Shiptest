/datum/outfit/job/cel/nanotrasen
	name = "Nanotrasen - Base Outfit"
	faction = FACTION_PLAYER_NANOTRASEN
	faction_icon = "bg_nanotrasen"

	box = /obj/item/storage/box/survival/nanotrasen
	id = /obj/item/card/id

/datum/outfit/job/cel/nanotrasen/proc/get_nt_general_access(mob/living/carbon/human/H)
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

/datum/outfit/job/cel/nanotrasen/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_nt_general_access(H)

//////////////////////////////////////////////////////////////////////////////////////////////////////

// MARK: CENTCOM

/datum/outfit/job/cel/nanotrasen/captain/centcom
	name = "NT - Captain (Central Command)"

	uniform = /obj/item/clothing/under/rank/centcom/officer
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/centhat

// MARK: ERT

/datum/outfit/job/cel/nanotrasen/security/ert
	name = "NT - ERT Officer"

	uniform = /obj/item/clothing/under/rank/security/officer/camo
	head = null
	backpack = /obj/item/storage/backpack/ert/security
	belt = /obj/item/storage/belt/military
	id = /obj/item/card/id/ert/security
	r_pocket = /obj/item/melee/knife/survival
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)

/datum/outfit/job/cel/nanotrasen/security/ert/commander
	job_icon = "assistant"
	name = "NT - ERT Сommander"

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

/datum/outfit/job/cel/nanotrasen/security/ert/engi
	name = "NT - ERT Engineering Officer"

	uniform = /obj/item/clothing/under/rank/security/officer/camo
	head = null
	backpack = /obj/item/storage/backpack/ert/engineer
	belt = /obj/item/storage/belt/utility/full/ert
	id = /obj/item/card/id/ert/security
	r_pocket = /obj/item/melee/knife/survival
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)
	accessory = /obj/item/clothing/accessory/armband/engine
	glasses = /obj/item/clothing/glasses/hud/diagnostic/sunglasses

/datum/outfit/job/cel/nanotrasen/security/ert/med
	name = "NT - ERT Medical Officer"

	uniform = /obj/item/clothing/under/rank/security/officer/camo
	head = /obj/item/clothing/head/beret/med
	backpack = /obj/item/storage/backpack/ert/medical
	belt = /obj/item/storage/belt/medical/webbing/paramedic
	id = /obj/item/card/id/ert/security
	r_pocket = /obj/item/melee/knife/survival
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)
	accessory = /obj/item/clothing/accessory/armband/med
	glasses = /obj/item/clothing/glasses/hud/health/night

// MARK: COMMAND
// Captain
/datum/outfit/job/cel/nanotrasen/captain
	name = "NT - Captain"
	job_icon = "captain"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	belt = /obj/item/pda/captain
	gloves = /obj/item/clothing/gloves/color/captain/nt
	ears = /obj/item/radio/headset/nanotrasen/captain
	uniform = /obj/item/clothing/under/nanotrasen/captain
	alt_uniform = /obj/item/clothing/under/nanotrasen/captain/skirt
	suit = /obj/item/clothing/suit/armor/nanotrasen/captain
	alt_suit = /obj/item/clothing/suit/armor/nanotrasen/captain/parade
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain
	shoes = /obj/item/clothing/shoes/laceup
	neck = /obj/item/clothing/neck/cloak/nanotrasen
	head = /obj/item/clothing/head/nanotrasen/captain/peaked
	backpack_contents = null

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/cel/nanotrasen/hos
	job_icon = "headofsecurity"
	name = "NT - Head of Security"

	jobtype = /datum/job/hos

	id = /obj/item/card/id/silver
	belt = /obj/item/pda/heads/hos
	ears = /obj/item/radio/headset/nanotrasen/alt
	uniform = /obj/item/clothing/under/nanotrasen/security/director
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/nanotrasen/beret/security/command
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/energy/e_gun/hos, /obj/item/stamp/hos)

// Директор СБ - ХОС капитан
/datum/outfit/job/cel/nanotrasen/hos/captain
	name = "NT - Security Director (Captain)"
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

// Head of Personnel
/datum/outfit/job/cel/nanotrasen/hop
	name = "NT - Head of Personnel"
	job_icon = "headofpersonnel"
	jobtype = /datum/job/head_of_personnel

	belt = /obj/item/pda/heads/head_of_personnel
	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/nanotrasen/officer
	alt_uniform = /obj/item/clothing/under/nanotrasen/officer/skirt
	suit = /obj/item/clothing/suit/toggle/nanotrasen
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/nanotrasen/officer

	backpack_contents = list(/obj/item/storage/box/ids = 1)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	chameleon_extras = list(
						/obj/item/gun/energy/e_gun,
						/obj/item/stamp/nanotrasen/officer,
						)

/datum/outfit/job/cel/nanotrasen/ce
	job_icon = "chiefengineer"
	name = "NT - Chief Engineer"

	jobtype = /datum/job/chief_engineer

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/utility/chief/full
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/nanotrasen/engineering/director
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/sneakers/brown
	head = /obj/item/clothing/head/hardhat/nanotrasen/white
	gloves = /obj/item/clothing/gloves/color/black

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	chameleon_extras = /obj/item/stamp/ce

// Инженерный Директор - СЕ капитан
/datum/outfit/job/cel/nanotrasen/ce/captain
	name = "NT - Engineering Director (Captain)"
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

// Научный директор - РД
/datum/outfit/job/cel/nanotrasen/rd
	name = "NT - Science Director"
	job_icon = "researchdirector"

	jobtype = /datum/job/rd

	id = /obj/item/card/id/silver
	head = /obj/item/clothing/head/beret/rd
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
/datum/outfit/job/cel/nanotrasen/cmo
	name = "NT - Medical Director"
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
/datum/outfit/job/cel/nanotrasen/cmo/captain
	name = "NT - Medical Director (Captain)"
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

// Quartermaster
/datum/outfit/job/cel/nanotrasen/quartermaster
	name = "NT - Quartermaster"
	job_icon = "quartermaster"

	jobtype = /datum/job/qm

	id = /obj/item/card/id/gold
	ears = /obj/item/radio/headset/headset_cargo
	head = /obj/item/clothing/head/nanotrasen/cap/supply
	uniform = /obj/item/clothing/under/nanotrasen/supply/qm
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/cargo
	shoes = /obj/item/clothing/shoes/sneakers/brown
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)

	chameleon_extras = /obj/item/stamp/qm

// MARK: ENGINEERING

/datum/outfit/job/cel/nanotrasen/engineer
	job_icon = "stationengineer"
	name = "NT - Engineer"

	jobtype = /datum/job/engineer

	belt = /obj/item/storage/belt/utility/full/engi
	l_pocket = /obj/item/pda/engineering
	ears = /obj/item/radio/headset/headset_eng
	uniform = /obj/item/clothing/under/nanotrasen/engineering
	head = /obj/item/clothing/head/hardhat
	suit = /obj/item/clothing/suit/hazardvest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/workboots

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

/datum/outfit/job/cel/nanotrasen/atmos
	job_icon = "stationengineer"
	name = "NT - Atmos Tech"

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

// MARK: SECURITY

/datum/outfit/job/cel/nanotrasen/security
	job_icon = "securityofficer"
	name = "NT - Security Officer"

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

/datum/outfit/job/cel/nanotrasen/security/mimir
	id = /obj/item/card/id/cel/nanotrasen/vigilitas_security

	implants = list(/obj/item/implant/mindshield)

// Exosuit Pilot
/datum/outfit/job/cel/nanotrasen/security/mech_pilot
	name = "NT - Exosuit Pilot"
	id_assignment = "Exosuit Pilot"

	uniform = /obj/item/clothing/under/rank/security/officer/military/eng
	head = /obj/item/clothing/head/beret/sec/officer
	suit = /obj/item/clothing/suit/armor/vest/bulletproof
	backpack_contents = list(/obj/item/radio, /obj/item/flashlight/seclite)

/datum/outfit/job/cel/nanotrasen/warden
	job_icon = "warden"
	name = "NT - Warden"

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

/datum/outfit/job/cel/nanotrasen/warden/mimir
	job_icon = "wardencaptain"

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_leutenant

	implants = list(/obj/item/implant/mindshield)

// MARK: MEDICAL

/datum/outfit/job/cel/nanotrasen/doctor
	job_icon = "medicaldoctor"
	name = "NT - Medical Doctor"

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

// Brig Physician
/datum/outfit/job/cel/nanotrasen/doctor/brig_phys
	name = "NT - Brig Physician"
	jobtype = /datum/job/brig_phys
	job_icon = "brigphysician"

	ears = /obj/item/radio/headset/headset_medsec/alt
	uniform = /obj/item/clothing/under/rank/security/brig_phys/nt
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	suit = /obj/item/clothing/suit/toggle/labcoat/brig_phys
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	head = /obj/item/clothing/head/soft/sec/brig_phys
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/cel/nanotrasen/doctor/brig_phys/mimir
	id = /obj/item/card/id/cel/nanotrasen/vigilitas_medic

/datum/outfit/job/cel/nanotrasen/paramedic
	job_icon = "paramedic"
	name = "NT - Paramedic"

	jobtype = /datum/job/paramedic

	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/nanotrasen/medical/paramedic
	head = null
	shoes = /obj/item/clothing/shoes/sneakers/blue
	suit =  null
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical/paramedic
	gloves = null
	id = /obj/item/card/id

	backpack_contents = null

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/para

	chameleon_extras = /obj/item/gun/syringe

// Химик
/datum/outfit/job/cel/nanotrasen/chemist
	name = "NT - Chemist"
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

// MARK: RESEARCH

// Генетик
/datum/outfit/job/cel/nanotrasen/geneticist
	name = "NT - Genetical Researcher"
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

/datum/outfit/job/cel/nanotrasen/scientist
	name = "NT - Scientist"
	jobtype = /datum/job/scientist
	job_icon = "scientist"

	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/nanotrasen/science
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit = /obj/item/clothing/suit/toggle/labcoat/nanotrasen
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

// MARK: CIVILIAN

// Janitor
/datum/outfit/job/cel/nanotrasen/janitor
	name = "NT - Janitor"
	jobtype = /datum/job/janitor
	job_icon = "janitor"

	uniform = /obj/item/clothing/under/nanotrasen/janitor
	head = /obj/item/clothing/head/nanotrasen/cap/janitor

// Bartender
/datum/outfit/job/cel/nanotrasen/bartender
	name = "NT - Bartender"
	jobtype = /datum/job/bartender
	job_icon = "bartender"

	belt = /obj/item/pda/bar
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	alt_uniform = /obj/item/clothing/under/rank/civilian/bartender/purple
	alt_suit = /obj/item/clothing/suit/apron/purple_bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup
	accessory = /obj/item/clothing/accessory/waistcoat

// Cook
/datum/outfit/job/cel/nanotrasen/cook
	name = "NT - Cook"
	jobtype = /datum/job/cook
	job_icon = "cook"

	belt = /obj/item/pda/cook
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/chef
	alt_uniform = /obj/item/clothing/under/shorts/cookjorts
	suit = /obj/item/clothing/suit/toggle/chef
	alt_suit = /obj/item/clothing/suit/apron/chef
	head = /obj/item/clothing/head/chefhat
	mask = /obj/item/clothing/mask/fakemoustache/italian
	backpack_contents = list(/obj/item/sharpener = 1)

// Prisoner

/datum/outfit/job/cel/nanotrasen/prisoner
	name = "NT - Prisoner"
	jobtype = /datum/job/prisoner
	job_icon = "assistant"

	id = /obj/item/card/id/prisoner
	uniform = /obj/item/clothing/under/rank/prisoner
	alt_uniform = /obj/item/clothing/under/rank/prisoner
	alt_suit = /obj/item/clothing/suit/jacket/leather
	shoes = /obj/item/clothing/shoes/sneakers/orange
	box = null
	ears = null
	belt = null

// Pilot. idk
/datum/outfit/job/cel/nanotrasen/pilot
	name = "NT - Pilot"
	jobtype = /datum/job/head_of_personnel
	id_assignment = "Pilot"

	uniform = /obj/item/clothing/under/rank/security/officer/military
	suit = /obj/item/clothing/suit/jacket/leather/duster
	glasses = /obj/item/clothing/glasses/hud/spacecop
	accessory = /obj/item/clothing/accessory/holster
	head = /obj/item/clothing/head/beret/command

// Lawyer
/datum/outfit/job/cel/nanotrasen/lawyer
	name = "NT - Lawyer"
	jobtype = /datum/job/lawyer
	job_icon = "lawyer"

	ears = /obj/item/radio/headset/headset_srvsec
	uniform = /obj/item/clothing/under/nanotrasen/affairs
	suit = /obj/item/clothing/suit/nanotrasen/suitjacket
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/storage/briefcase/lawyer
	l_pocket = /obj/item/laser_pointer
	r_pocket = /obj/item/clothing/accessory/lawyers_badge

// Corp. Rep
/datum/outfit/job/cel/nanotrasen/lawyer/corporaterepresentative
	name = "NT - Corporate Representative"
	id_assignment = "Corporate Representative"

	job_icon = "lieutenant"

	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_cent
	l_hand = /obj/item/clipboard
	r_pocket = /obj/item/pen/fountain

// Assistant
/datum/outfit/job/cel/nanotrasen/assistant
	name = "NT - Assistant"
	jobtype = /datum/job/assistant

	job_icon = "assistant"

	uniform = /obj/item/clothing/under/nanotrasen
	shoes = /obj/item/clothing/shoes/sneakers/black
	belt = /obj/item/pda

// MARK: CARGO
// Cargo Tech
/datum/outfit/job/cel/nanotrasen/cargo_tech
	name = "NT - Cargo Tech"
	jobtype = /datum/job/cargo_tech
	job_icon = "cargotechnician"

	belt = /obj/item/pda/cargo
	ears = /obj/item/radio/headset/headset_cargo
	head = /obj/item/clothing/head/nanotrasen/cap/supply
	uniform = /obj/item/clothing/under/nanotrasen/supply
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/cargo
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)

/datum/outfit/job/cel/nanotrasen/miner
	name = "NT - Miner"
	job_icon = "shaftminer"

	jobtype = /datum/job/mining

	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	uniform = /obj/item/clothing/under/nanotrasen/supply/miner
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/miner

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag

	chameleon_extras = /obj/item/gun/energy/kinetic_accelerator

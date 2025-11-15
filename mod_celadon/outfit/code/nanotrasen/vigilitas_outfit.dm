// MARK: Captain

/datum/outfit/job/cel/nanotrasen/captain/vigilitas
	name = "NT Vigilitas - Leutenant"
	job_icon = "clip_cmm6"

	jobtype = /datum/job/hos

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_leutenant

/datum/outfit/job/cel/nanotrasen/captain/vigilitas/darect
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

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = /obj/item/stamp/hos

// MARK: Command

/datum/outfit/job/cel/nanotrasen/hos/vigilitas
	name = "NT Vigilitas - Sergeant"
	job_icon = "clip_cmm5"

	jobtype = /datum/job/warden

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_sergeant
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

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/hos)

// MARK: Crew

/datum/outfit/job/cel/nanotrasen/engineer/vigilitas
	name = "NT Vigilitas - Engineer"
	job_icon = "stationengineer"

	jobtype = /datum/job/engineer

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_engineer
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


/datum/outfit/job/cel/nanotrasen/doctor/vigilitas
	name = "NT Vigilitas - Medical Doctor"
	job_icon = "medicaldoctor"

	jobtype = /datum/job/doctor

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_medic
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
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

// MARK: Assistant

/datum/outfit/job/cel/nanotrasen/security/vigilitas
	name = "NT Vigilitas - Security"
	job_icon = "securityofficer"

	jobtype = /datum/job/officer

	id = /obj/item/card/id/cel/nanotrasen/vigilitas_security

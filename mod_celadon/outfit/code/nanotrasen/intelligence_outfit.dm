/// MARK: слешер капитан

/datum/outfit/job/cel/nanotrasen/intel/captain
	name = "NT Intelligence - Officer"
	job_icon = "captain"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/lplieu
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/nanotrasen/captain
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/nanotrasen/captain/parade
	suit_store = /obj/item/gun/ballistic/revolver/mateba
	head = /obj/item/clothing/head/nanotrasen/captain/peaked
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
	backpack = /obj/item/storage/backpack/ert

	backpack_contents = list(/obj/item/ammo_box/a357, /obj/item/ammo_box/a357)

/// MARK: слешер сбуха

/datum/outfit/job/cel/nanotrasen/intel/operative
	name = "NT Intelligence - Security Operative"
	job_icon = "headofsecurity"

	jobtype = /datum/job/hos

	id = /obj/item/card/id/lpsec
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/security/head_of_security/alt/lp
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/security
	suit = /obj/item/clothing/suit/armor/nanotrasen
	head = /obj/item/clothing/head/nanotrasen/beret/security/command
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	ears = /obj/item/radio/headset/nanotrasen/alt

/// MARK: слешер медик

/datum/outfit/job/cel/nanotrasen/intel/medic
	name = "NT Intelligence - Medical Technician"
	job_icon = "chiefmedicalofficer"

	jobtype = /datum/job/cmo

	id = /obj/item/card/id/lpmed
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/medical/paramedic/lp
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/medical
	head = /obj/item/clothing/head/soft/paramedic
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	ears = /obj/item/radio/headset/nanotrasen/alt
	backpack_contents = list(/obj/item/storage/firstaid/medical)

/// MARK: слешер инженер

/datum/outfit/job/cel/nanotrasen/intel/engineer
	name = "NT Intelligence - Engineering Technician"
	job_icon = "chiefengineer"

	jobtype = /datum/job/chief_engineer

	id = /obj/item/card/id/lpengie
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/engineering/engineer/nt/lp
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/beret/eng/hazard
	backpack = /obj/item/storage/backpack/ert/engineer
	glasses = /obj/item/clothing/glasses/meson/engine
	belt = /obj/item/storage/belt/utility/full/engi
	ears = /obj/item/radio/headset/nanotrasen/alt
	backpack_contents = list(/obj/item/construction/rcd/loaded)

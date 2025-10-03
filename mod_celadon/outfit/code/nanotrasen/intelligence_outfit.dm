/// MARK: слешер капитан

/datum/outfit/job/nanotrasen/cel/intel/captain
	name = "NT Intelligence - Officer"
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
	name = "NT Intelligence - Security Operative"
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
	name = "NT Intelligence - Medical Technician"
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
	name = "NT Intelligence - Engineering Technician"
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

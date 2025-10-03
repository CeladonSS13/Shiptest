/// MARK: Nanotrasen Tactical Assault Team лидер

/datum/outfit/job/nanotrasen/cel/ntas/commander
	name = "Nanotrasen TAS - Leader"
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
	name = "Nanotrasen TAS - Security Operative"
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
	name = "Nanotrasen TAS - Medical Operative"
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
	name = "Nanotrasen TAS - Engineering Operative"
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
	name = "Nanotrasen TAS - Custodial Operative"
	jobtype = /datum/job/janitor
	job_icon = "janitor"
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/janitor
	id = /obj/item/card/id/ert/janitor
	ears = /obj/item/radio/headset/nanotrasen/alt

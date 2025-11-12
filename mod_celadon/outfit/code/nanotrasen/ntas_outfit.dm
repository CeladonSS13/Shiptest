/// Nanotrasen Tactical Assault Team лидер

/datum/outfit/job/cel/nanotrasen/ntas/commander
	name = "NT Assault Team - Leader"
	jobtype = /datum/job/captain
	job_icon = "captain"

	id = /obj/item/card/id/ert
	implants = list(/obj/item/implant/mindshield, /obj/item/organ/cyberimp/eyes/hud/security)
	uniform = /obj/item/clothing/under/rank/centcom/official
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert
	ears = /obj/item/radio/headset/nanotrasen/alt/captain

/datum/outfit/job/cel/nanotrasen/ntas/operative
	name = "NT Assault Team - Security Operative"
	jobtype = /datum/job/hos
	job_icon = "headofsecurity"

	id = /obj/item/card/id/ert/security
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/security
	ears = /obj/item/radio/headset/nanotrasen/alt

/datum/outfit/job/cel/nanotrasen/ntas/medic
	name = "NT Assault Team - Medical Operative"
	jobtype = /datum/job/cmo
	job_icon = "chiefmedicalofficer"

	id = /obj/item/card/id/ert/medical
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/medical
	ears = /obj/item/radio/headset/nanotrasen/alt
	backpack_contents = list(/obj/item/storage/firstaid/medical)

/datum/outfit/job/cel/nanotrasen/ntas/engineer
	name = "NT Assault Team - Engineering Operative"
	jobtype = /datum/job/chief_engineer
	job_icon = "chiefengineer"

	id = /obj/item/card/id/ert/engineer
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/engineer
	ears = /obj/item/radio/headset/nanotrasen/alt

/datum/outfit/job/cel/nanotrasen/ntas/janitor
	name = "NT Assault Team - Custodial Operative"
	jobtype = /datum/job/janitor
	job_icon = "janitor"

	id = /obj/item/card/id/ert/janitor
	implants = list(/obj/item/implant/mindshield)
	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	backpack = /obj/item/storage/backpack/ert/janitor
	ears = /obj/item/radio/headset/nanotrasen/alt

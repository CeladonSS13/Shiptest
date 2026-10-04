//commissioner gorre donn
/datum/outfit/job/cel/nanotrasen/commissioner
	name = "\improper Commissioner Gorre Donn"
	uniform = /obj/item/clothing/under/rank/centcom/commander
	suit = /obj/item/clothing/suit/armor/nanotrasen/sec_director
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
	glasses = /obj/item/clothing/glasses/eyepatch
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	head = /obj/item/clothing/head/nanotrasen/beret/affairs
	gloves = /obj/item/clothing/gloves/tackler/combat
	shoes = /obj/item/clothing/shoes/combat/swat
	r_pocket = /obj/item/lighter
	id = /obj/item/card/id/cel/lplieu

//LP team
/datum/outfit/job/cel/nanotrasen/captain/lp
	name = "NT - VI Loss Prevention Lieutenant"
	id_assignment = "Lieutenant"

	id = /obj/item/card/id/cel/lplieu
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/nanotrasen/alt/captain
	belt = /obj/item/pda/captain
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/nanotrasen/security/director
	suit = /obj/item/clothing/suit/armor/nanotrasen/sec_director
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/nanotrasen/beret/security/command

	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	box = /obj/item/storage/box/survival/nanotrasen/security

/datum/outfit/job/cel/nanotrasen/security/lp
	name = "NT - VI LP Security Specialist"
	id_assignment = "Security Specialist"

	job_icon = "warden"

	id = /obj/item/card/id/cel/lpsec
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/nanotrasen/alt
	belt = /obj/item/pda/security
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/nanotrasen/security
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/nanotrasen/beret/security

	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	box = /obj/item/storage/box/survival/nanotrasen/security

/datum/outfit/job/cel/nanotrasen/engineer/lp
	name = "NT - VI LP Engineering Specialist"

	job_icon = "chiefengineer"

	id = /obj/item/card/id/cel/lpengie
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/nanotrasen/alt
	gloves = /obj/item/clothing/gloves/insulated
	uniform = /obj/item/clothing/under/nanotrasen/engineering/atmos
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/hardhat/nanotrasen/white
	suit = null

	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	box = /obj/item/storage/box/survival/nanotrasen/security

/datum/outfit/job/cel/nanotrasen/doctor/lp
	name = "NT - VI LP Medical Specialist"
	id_assignment = "Medical Specialist"

	job_icon = "chiefmedicalofficer"

	id = /obj/item/card/id/cel/lpmed
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/nanotrasen/alt
	belt = /obj/item/pda/medical
	gloves = /obj/item/clothing/gloves/nitrile
	uniform = /obj/item/clothing/under/nanotrasen/medical
	alt_uniform = /obj/item/clothing/under/rank/medical/paramedic/skirt
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical
	shoes = /obj/item/clothing/shoes/sneakers/white
	head = /obj/item/clothing/head/nanotrasen/cap/medical
	suit =  /obj/item/clothing/suit/toggle/labcoat/nanotrasen/paramedic

	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

	box = /obj/item/storage/box/survival/nanotrasen/security

/datum/outfit/job/cel/nanotrasen/janitor/lp
	name = "NT - VI LP Janitorial Specialist"
	jobtype = /datum/job/janitor

	job_icon = "janitor"

	id = /obj/item/card/id/cel/lpjanitor
	uniform = /obj/item/clothing/under/nanotrasen/janitor
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit = null
	head = /obj/item/clothing/head/nanotrasen/cap/janitor
	ears = /obj/item/radio/headset/nanotrasen/alt
	belt = /obj/item/storage/belt/janitor
	gloves = /obj/item/clothing/gloves/color/lightpurple
	back = /obj/item/storage/backpack/ert/janitor

	implants = list(/obj/item/implant/mindshield)

	box = /obj/item/storage/box/survival/nanotrasen/security

/datum/outfit/job/cel/nanotrasen/miner/lp
	job_icon = "shaftminer"
	name = "NT - N+S Logistics Specialist"
	id_assignment = "Shaft Miner"

	id = /obj/item/card/id/cel/lpminer
	ears = /obj/item/radio/headset/nanotrasen
	shoes = /obj/item/clothing/shoes/workboots/mining
	head = /obj/item/clothing/head/nanotrasen/cap/supply
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/nanotrasen/supply
	suit = null
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/miner
	r_pocket = /obj/item/storage/bag/ore

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag

	box = /obj/item/storage/box/survival/nanotrasen

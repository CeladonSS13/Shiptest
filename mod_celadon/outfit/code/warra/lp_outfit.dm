/datum/outfit/job/cel/warra/captain/lp
	name = "NT - Loss Prevention Lieutenant"
	id_assignment = "Lieutenant"

	id = /obj/item/card/id/cel/lplieu
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/warra/alt/captain
	belt = /obj/item/pda/captain
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/rank/security/head_of_security/alt/lp
	alt_uniform = /obj/item/clothing/under/rank/security/head_of_security/alt/skirt/lp
	dcoat = /obj/item/clothing/suit/armor/warra/sec_director
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/beret/command

	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

/datum/outfit/job/cel/warra/security/lp
	name = "NT - LP Security Specialist"
	id_assignment = "Security Specialist"

	job_icon = "warden"

	id = /obj/item/card/id/cel/lpsec
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/warra/alt/captain
	belt = /obj/item/pda/security
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/rank/security/head_of_security/warra/lp
	alt_uniform = /obj/item/clothing/under/rank/security/head_of_security/warra/skirt/lp
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/beret/sec

	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/warra/engineer/lp
	name = "NT - LP Engineering Specialist"

	job_icon = "chiefengineer"

	id = /obj/item/card/id/cel/lpengie
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/warra/alt/captain
	gloves = /obj/item/clothing/gloves/color/yellow
	uniform = /obj/item/clothing/under/rank/engineering/engineer/warra/lp
	alt_uniform = /obj/item/clothing/under/rank/engineering/engineer/warra/skirt/lp
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/beret/eng

	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

/datum/outfit/job/cel/warra/doctor/lp
	name = "NT - LP Medical Specialist"
	id_assignment = "Medical Specialist"

	job_icon = "chiefmedicalofficer"

	id = /obj/item/card/id/cel/lpmed
	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/warra/alt/captain
	belt = /obj/item/pda/medical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	uniform = /obj/item/clothing/under/rank/medical/paramedic/lp
	alt_uniform = /obj/item/clothing/under/rank/medical/paramedic/skirt/lp
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical
	shoes = /obj/item/clothing/shoes/sneakers/white
	head = /obj/item/clothing/head/beret/med
	suit =  /obj/item/clothing/suit/toggle/labcoat/warra/paramedic

	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

/datum/outfit/job/cel/warra/miner/lp
	name = "NT - LP Shaft Miner"
	id_assignment = "Shaft Miner"

	id = /obj/item/card/id/cel/lpmed
	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	head = /obj/item/clothing/head/hardhat/warra
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/warra/supply/miner
	suit = /obj/item/clothing/suit/warra/vest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/miner
	r_pocket = /obj/item/storage/bag/ore

	backpack_contents = list(
						/obj/item/flashlight/seclite = 1,
						/obj/item/melee/knife/survival = 1,
						/obj/item/stack/marker_beacon/ten = 1,
						/obj/item/radio/weather_monitor = 1,
						)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag
	box = /obj/item/storage/box/survival/mining

	chameleon_extras = /obj/item/gun/energy/kinetic_accelerator

/datum/outfit/job/cel/warra/janitor/lp
	name = "NT - LP Janitorial Specialist"
	jobtype = /datum/job/janitor

	job_icon = "janitor"

	id = /obj/item/card/id/cel/lpjanitor
	uniform = /obj/item/clothing/under/warra/janitor
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit = /obj/item/clothing/suit/warra/suitjacket
	head = /obj/item/clothing/head/warra/cap/janitor
	ears = /obj/item/radio/headset/warra
	belt = /obj/item/storage/belt/janitor
	gloves = /obj/item/clothing/gloves/color/purple
	back = /obj/item/storage/backpack/ert/janitor

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/cel/warra/miner/lp
	job_icon = "shaftminer"
	name = "NT - LP Miner"

	id = /obj/item/card/id/cel/lpminer
	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	head = /obj/item/clothing/head/hardhat/warra
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/warra/supply/miner
	suit = /obj/item/clothing/suit/warra/vest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/miner
	r_pocket = /obj/item/storage/bag/ore

	backpack_contents = list(
						/obj/item/flashlight/seclite = 1,
						/obj/item/melee/knife/survival = 1,
						/obj/item/stack/marker_beacon/ten = 1,
						/obj/item/radio/weather_monitor = 1,
						)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag

	chameleon_extras = /obj/item/gun/energy/kinetic_accelerator

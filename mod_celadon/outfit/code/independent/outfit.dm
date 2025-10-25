/datum/outfit/job/cel/independent/assistant/fancy/lagoon
	name = "Independent - Fancy (Formal Uniform)"

	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/misc/assistantformal
	head = /obj/item/clothing/head/beret/grey
	l_pocket = /obj/item/spacecash/bundle/c500

/datum/outfit/job/cel/independent/captain/lagoon
	name = "Independent - Captain"
	job_icon = "captain"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	gloves = /obj/item/clothing/gloves/color/captain
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/command/captain
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/caphat
	backpack_contents = list(/obj/item/spacecash/bundle/c500 = 1)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

// Head of Personnel

/datum/outfit/job/cel/independent/hop/lagoon
	name = "Independent - Head of Personnel"
	job_icon = "headofpersonnel"
	jobtype = /datum/job/head_of_personnel

	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/command/head_of_personnel
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain
	shoes = /obj/item/clothing/shoes/sneakers/brown

	backpack_contents = list(/obj/item/storage/box/ids = 1,
							/obj/item/spacecash/bundle/c500 = 1)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	chameleon_extras = list(/obj/item/gun/energy/e_gun)

// Head of Security

/datum/outfit/job/cel/independent/security/lagoon
	name = "Independent - Security Officer"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	ears = /obj/item/radio/headset/alt
	uniform = /obj/item/clothing/under/rank/security/officer
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest/alt
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/spacecash/bundle/c100 = 3)

	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)
	//The helmet is necessary because /obj/item/clothing/head/helmet/sec is overwritten in the chameleon list by the standard helmet, which has the same name and icon state

// Engineer

/datum/outfit/job/cel/independent/doctor/lagoon
	name = "Independent - Medical Doctor"
	job_icon = "medicaldoctor"
	jobtype = /datum/job/doctor

	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/doctor/blue
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/apron/surgical
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/medic
	backpack_contents = list(/obj/item/spacecash/bundle/c100 = 3)

	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

	chameleon_extras = /obj/item/gun/syringe

// Atmos Tech

/datum/outfit/job/cel/independent/atmos/lagoon
	name = "Independent - Atmos Tech"
	jobtype = /datum/job/atmos
	job_icon = "atmospherictechnician"

	belt = /obj/item/storage/belt/utility/atmostech
	ears = /obj/item/radio/headset/headset_eng
	uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	l_pocket = /obj/item/analyzer

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	backpack_contents = list(/obj/item/spacecash/bundle/c100 = 3)

// Cook

/datum/outfit/job/cel/independent/cook/lagoon
	name = "Independent - Cook"
	jobtype = /datum/job/cook
	job_icon = "cook"

	ears = /obj/item/radio/headset/headset_srv
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/rank/civilian/chef
	suit = /obj/item/clothing/suit/toggle/chef
	alt_suit = /obj/item/clothing/suit/apron/chef
	head = /obj/item/clothing/head/chefhat
	mask = /obj/item/clothing/mask/fakemoustache/italian
	backpack_contents = list(/obj/item/sharpener = 1)

// Bartender

/datum/outfit/job/cel/independent/bartender/lagoon
	job_icon = "bartender"
	name = "Independent - Bartender"

	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	alt_uniform = /obj/item/clothing/under/rank/civilian/bartender/purple
	alt_suit = /obj/item/clothing/suit/apron/purple_bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup
	accessory = /obj/item/clothing/accessory/waistcoat

// Curator

/datum/outfit/job/cel/independent/curator/lagoon
	name = "Independent - Curator"
	job_icon = "curator"
	jobtype = /datum/job/curator

	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/curator
	l_hand = /obj/item/storage/bag/books
	l_pocket = /obj/item/key/displaycase
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	backpack_contents = list(
		/obj/item/choice_beacon/hero = 1,
		/obj/item/barcodescanner = 1
	)

// Chaplain

/datum/outfit/job/cel/independent/chaplain/lagoon
	name = "Independent - Chaplain"
	job_icon = "chaplain"
	jobtype = /datum/job/chaplain

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/chaplain
	backpack_contents = list(
		/obj/item/camera/spooky = 1
		)

	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack

// Janitor

/datum/outfit/job/cel/independent/janitor/lagoon
	name = "Independent - Janitor"
	job_icon = "janitor"
	jobtype = /datum/job/janitor

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/janitor

// Botanist

/datum/outfit/job/cel/independent/botanist/lagoon
	name = "Independent - Botanist"
	job_icon = "botanist"
	jobtype = /datum/job/hydro

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/color/green
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/hydro
	suit = /obj/item/clothing/under/overalls
	gloves  =/obj/item/clothing/gloves/botanic_leather
	suit_store = /obj/item/plant_analyzer

	backpack = /obj/item/storage/backpack/botany
	satchel = /obj/item/storage/backpack/satchel/hyd
	courierbag = /obj/item/storage/backpack/messenger/hyd

// Janitor - У оффов не был прописан jobtype и это вызывало рантайм. Прописываем его здесь. Увы.

/datum/outfit/job/prisoner
	job_icon = "assistant"
	jobtype = /datum/job/prisoner

/datum/outfit/job/assistant
	r_pocket = null

// Все остальные аутфиты. При надобности расскоментить

/datum/outfit/job/cel/independent/lawyer
	r_pocket = /obj/item/pda
	backpack_contents = list(/obj/item/cane = 1,
							/obj/item/clothing/glasses/monocle = 1,
							/obj/item/clothing/neck/scarf/tajaran/orange = 1,
							/obj/item/passport/solgov = 1)

// /datum/outfit/job/cel/independent/assistant/waiter
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/scientist
// 	job_icon = "scientist"

// /datum/outfit/job/cel/independent/captain/masinyane
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/cargo_tech
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/captain/western
// 	job_icon = "captain"

// /datum/outfit/job/cel/independent/quartermaster/western
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/miner/hazard
// 	job_icon = "shaftminer"

// /datum/outfit/job/cel/independent/cook
// 	job_icon = "cook"

/datum/outfit/job/cel/independent/hop/western
	backpack_contents = list(/obj/item/storage/box/ids=1)
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/roboticist
// 	job_icon = "assistant"

/datum/outfit/job/cel/independent/security/western
	job_icon = "securityofficer"

// /datum/outfit/job/cel/independent/cmo/pharma
// 	job_icon = "assistant"

/datum/outfit/job/cel/independent/chemist/pharma
	job_icon = "medicaldoctor"

	l_pocket = null

// /datum/outfit/job/cel/independent/bartender/pharma
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/botanist/pharma
// 	job_icon = "assistant"

/datum/outfit/job/cel/independent/assistant/pharma
	job_icon = "medicaldoctor"

// /datum/outfit/job/cel/independent/detective
// 	job_icon = "detective"

// /datum/outfit/job/cel/independent/captain/manager
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/bartender/disarmed
// 	job_icon = "bartender"

// /datum/outfit/job/cel/independent/curator/dungeonmaster
// 	job_icon = "headofsecurity"

// /datum/outfit/job/cel/independent/assistant/artist
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/engineer/salvage
// 	job_icon = "assistant"

// /datum/outfit/job/cel/independent/rd
// 	job_icon = "researchdirector"

// /datum/outfit/job/cel/independent/miner/scientist
// 	job_icon = "assistant"

/datum/outfit/job/cel/independent/hop/beluga
	job_icon = "headofpersonnel"
	jobtype = /datum/job/head_of_personnel

	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/command/head_of_personnel
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain
	shoes = /obj/item/clothing/shoes/sneakers/brown
	backpack_contents = list(/obj/item/storage/box/ids = 1)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/officer)

// /datum/outfit/job/cel/independent/hop
// 	head = /obj/item/clothing/head/hopcap

// /datum/outfit/job/cel/independent/quartermaster
// 	head = /obj/item/clothing/head/supply_chief

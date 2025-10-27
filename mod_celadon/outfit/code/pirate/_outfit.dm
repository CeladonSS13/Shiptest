/datum/outfit/job/cel/pirate
	name = "Pirate - Base Outfit"
	job_icon = "assistant"
	faction = FACTION_PLAYER_PIRATE
	faction_icon = "bg_pirate"

	box = /obj/item/storage/box/survival/pirate
	id = /obj/item/card/id

//////////////////////////////////////////////////////////////////////////////////////////////////////

// MARK: Captain
/datum/outfit/job/cel/pirate/captain
	name = "Pirate - Captain"
	job_icon = "captain"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/cel/pirate/captain
	ears = /obj/item/radio/headset/pirate/captain
	uniform = /obj/item/clothing/under/costume/pirate
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/pirate/captain
	suit = /obj/item/clothing/suit/pirate/captain

	gloves = /obj/item/clothing/gloves/color/captain
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/cel/pirate/captain/jupiter
	name = "Pirate - Captain (Nodesman)"

	job_icon = "assistant"

	uniform = /obj/item/clothing/under/utility
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/vest/marine/medium
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/combat
	implants = list(/obj/item/implant/radio)
	accessory = null

/datum/outfit/job/cel/pirate/hop
	name = "Pirate - Bridge Officer"
	id_assignment = "Helmsman"
	job_icon = "headofpersonnel"

	jobtype = /datum/job/head_of_personnel

	id = /obj/item/card/id/cel/pirate/security
	ears = /obj/item/radio/headset/pirate/alt
	uniform = /obj/item/clothing/under/costume/pirate
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/pirate
	gloves = /obj/item/clothing/gloves/combat
	r_pocket = /obj/item/melee/knife/survival

/datum/outfit/job/cel/pirate/hos
	name = "Frontiersmen - Deck Boss"
	id_assignment = "Deck Boss"
	job_icon = "headofsecurity"
	jobtype = /datum/job/hos

	id = /obj/item/card/id/cel/pirate/security
	accessory = /obj/item/clothing/accessory/armband
	uniform = /obj/item/clothing/under/frontiersmen/officer
	head = /obj/item/clothing/head/beret/sec/frontier/officer
	suit = /obj/item/clothing/suit/armor/vest/bulletproof/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/combat
	backpack_contents = list(/obj/item/clothing/mask/gas/frontiersmen, /obj/item/melee/baton/loaded = 1)
	suit_store = null

// MARK: Engineer
/datum/outfit/job/cel/pirate/engineer
	name = "Pirate - Engineer"
	job_icon = "assistant"

	jobtype = /datum/job/engineer

	id = /obj/item/card/id/cel/pirate/engineer
	ears = /obj/item/radio/headset/pirate
	uniform = /obj/item/clothing/under/costume/sailor
	head = /obj/item/clothing/head/bandana
	shoes = /obj/item/clothing/shoes/jackboots
	alt_uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	belt = null
	gloves = null

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

/datum/outfit/job/cel/pirate/engineer/jupiter	// Не юзается
	name = "Pirate - Engineer (Nodesman)"

	uniform = /obj/item/clothing/under/utility
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/survival
	gloves = /obj/item/clothing/gloves/color/red/insulated

	implants = list(/obj/item/implant/radio)

// MARK: Security
/datum/outfit/job/cel/pirate/security
	name = "Pirate - Security Officer"
	job_icon = "assistant"

	jobtype = /datum/job/officer

	id = /obj/item/card/id/cel/pirate/security
	ears = /obj/item/radio/headset/pirate
	uniform = /obj/item/clothing/under/syndicate/camo
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/bandana
	suit = /obj/item/clothing/suit/armor/vest
	gloves = /obj/item/clothing/gloves/color/black
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)

/datum/outfit/job/cel/pirate/security/jupiter
	name = "Pirate - Security Officer (Nodesman)"

	uniform = /obj/item/clothing/under/utility
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/combat

	backpack_contents = list(/obj/item/melee/baton/loaded=1)

	implants = list(/obj/item/implant/radio)

// MARK: Medic
/datum/outfit/job/cel/pirate/medic
	name = "Pirate - Medical Doctor"
	job_icon = "paramedic"

	jobtype = /datum/job/doctor

	id = /obj/item/card/id/cel/pirate/medic
	ears = /obj/item/radio/headset/pirate
	uniform = /obj/item/clothing/under/costume/sailor
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/apron/surgical
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

	chameleon_extras = /obj/item/gun/syringe

/datum/outfit/job/cel/pirate/cook
	name = "Pirate - Cook"
	job_icon = "cook"

	jobtype = /datum/job/cook

	id = /obj/item/card/id/cel/pirate/security
	ears = /obj/item/radio/headset/headset_srv
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/rank/civilian/chef
	suit = /obj/item/clothing/suit/toggle/chef
	alt_suit = /obj/item/clothing/suit/apron/chef
	head = /obj/item/clothing/head/chefhat
	mask = /obj/item/clothing/mask/fakemoustache/italian
	backpack_contents = list(/obj/item/sharpener = 1)

/datum/outfit/job/cel/pirate/cook/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/list/possible_boxes = subtypesof(/obj/item/storage/box/ingredients)
	var/chosen_box = pick(possible_boxes)
	var/obj/item/storage/box/I = new chosen_box(src)
	H.equip_to_slot_or_del(I,ITEM_SLOT_BACKPACK)

// MARK: Assistant
/datum/outfit/job/cel/pirate/assistant
	name = "Pirate - Assistant"
	job_icon = "assistant"

	jobtype = /datum/job/assistant

	id = /obj/item/card/id/cel/pirate/assistant
	uniform = /obj/item/clothing/under/costume/pirate
	suit = /obj/item/clothing/suit/pirate
	head = /obj/item/clothing/head/bandana
	shoes = /obj/item/clothing/shoes/sneakers/black

/datum/outfit/job/cel/pirate/assistant/jupiter	// Не юзается
	name = "Pirate - Assistant (Nodesman)"

	uniform = /obj/item/clothing/under/utility
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/melee/knife/survival
	gloves = /obj/item/clothing/gloves/combat
	implants = list(/obj/item/implant/radio)

// Pirate: Powder Monkey Outfit ???
/datum/outfit/job/cel/pirate/engineer/celadon
	name = "Pirate - Powder Monkey"

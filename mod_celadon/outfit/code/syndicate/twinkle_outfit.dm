//MARK: Admiral

/datum/outfit/job/cel/syndicate/captain/twink
	name = "Syndi Twinkleshine - Flotilla Admiral (ACLF)"
	id_assignment = "Flotilla Admiral"

	id = /obj/item/card/id/cel/syndicate/admiral
	uniform = /obj/item/clothing/under/syndicate/ngr/officer
	head = null
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/syndicate/alt/captain
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	suit = null
	belt = null
	backpack_contents = null
	implants = list(/obj/item/implant/weapons_auth)

/datum/outfit/job/cel/syndicate/captain/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

//MARK: Command

/datum/outfit/job/cel/syndicate/hos/twink
	name = "Syndi Twinkleshine - Lieutenant"
	id_assignment = "Lieutenant"
	job_icon = "lieutenant"

	uniform = /obj/item/clothing/under/syndicate/ngr/officer
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	head = null
	ears = null
	gloves = /obj/item/clothing/gloves/combat
	l_pocket = null
	r_pocket = null
	belt = null
	shoes = /obj/item/clothing/shoes/combat
	suit = null
	suit_store = null
	alt_suit = null
	implants = list(/obj/item/implant/weapons_auth)

	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/syndicate/hos/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/cel/syndicate/hos/suns/twink	// Не юзается ??????
	name = "Syndi Twinkleshine SUNS - Redshield Officer"
	id_assignment = "Redshield Officer"

	id = /obj/item/card/id/cel/syndicate/command_hos/suns/twink
	suit = null
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	ears = null
	head = null
	suit_store = null
	glasses = null

/datum/outfit/job/cel/syndicate/hos/suns/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

//MARK: Crew

/datum/outfit/job/cel/syndicate/bartender/twink
	name = "Syndi Twinkleshine DonkCo - Bartender"

	uniform = /obj/item/clothing/under/syndicate/donk
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	suit = null
	belt = null
	head = null
	shoes = /obj/item/clothing/shoes/laceup
	gloves = null
	ears = null


	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/syndicate/bartender/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/cel/syndicate/paramedic/twink
	name = "Syndi Twinkleshine Cybersun - Medic"

	id = /obj/item/card/id/cel/syndicate/crew/doctor/paramedic
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	uniform = /obj/item/clothing/under/rank/medical/doctor/red
	belt = null
	head = null
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/evil
	shoes = /obj/item/clothing/shoes/combat
	suit = null
	alt_suit = null
	suit_store =  null
	ears = null
	l_pocket = null
	r_pocket = null
	implants = list(/obj/item/implant/weapons_auth)

	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie/med
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/syndicate/paramedic/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/cel/syndicate/security/twink
	name = "Syndi Twinkleshine - Operative"

	id = /obj/item/card/id/cel/syndicate/crew/security
	uniform = /obj/item/clothing/under/syndicate/combat
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	head = null
	ears = null
	suit = null
	belt = null
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = null
	r_pocket = null
	implants = list(/obj/item/implant/weapons_auth)

	backpack_contents = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/syndicate/security/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/cel/syndicate/miner/twink
	name = "Syndi Twinkleshine - Miner"

	id = /obj/item/card/id/cel/syndicate/crew/miner
	uniform = /obj/item/clothing/under/syndicate/suns/workerjumpsuit
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	shoes = /obj/item/clothing/shoes/jackboots/suns
	glasses = null
	gloves = null
	ears = null
	r_pocket = null
	l_pocket = null
	belt = null

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/syndicate/miner/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/cel/syndicate/engineer/twink
	name = "Syndi Twinkleshine GEC - Ship Engineer"

	id = /obj/item/card/id/cel/syndicate/crew/engineer
	uniform = /obj/item/clothing/under/syndicate/gec
	alt_uniform = null
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	ears = null
	accessory = null
	glasses = null
	head = null
	gloves = /obj/item/clothing/gloves/tackler/combat
	belt = null
	shoes = /obj/item/clothing/shoes/combat
	suit = null
	alt_suit = null
	l_pocket = null
	r_pocket = null
	implants = list(/obj/item/implant/weapons_auth)

/datum/outfit/job/cel/syndicate/engineer/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

//MARK: Assistant

/datum/outfit/job/cel/syndicate/assistant/twink
	name = "Syndi Twinkleshine - Deck Assistant"
	id_assignment = "Deck Assistant"

	uniform = /obj/item/clothing/under/syndicate
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	belt = null
	shoes = /obj/item/clothing/shoes/combat
	gloves = null
	ears = null
	implants = list(/obj/item/implant/weapons_auth)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/cel/syndicate/assistant/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

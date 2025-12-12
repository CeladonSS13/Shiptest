/datum/outfit/job/cel/inteq
	name = "IRMG - Base Outfit"
	faction = FACTION_PLAYER_INTEQ
	faction_icon = "bg_inteq"

	id = /obj/item/card/id/cel/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq
	ears = /obj/item/radio/headset/inteq
	shoes = /obj/item/clothing/shoes/combat
	alt_uniform = /obj/item/clothing/under/syndicate/inteq/sneaksuit
	duffelbag = /obj/item/storage/backpack/duffelbag/inteq
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel

	box = /obj/item/storage/box/survival/inteq
	courierbag = /obj/item/storage/backpack/messenger/inteq

/datum/outfit/job/cel/inteq/proc/get_inteq_general_access(mob/living/carbon/human/H)
	var/obj/item/storage/wallet/W = null
	for (var/obj/item/O in H.contents)
		if (istype(O, /obj/item/storage/wallet))
			W = O
			break
	if (W)
		var/obj/item/card/id/I = null
		for (var/obj/item/O in W.contents)
			if (istype(O, /obj/item/card/id))
				I = O
				break
		if (I)
			I.access += list(ACCESS_OUTPOST_FACTION_INTEQ)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/cel/inteq/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_inteq_general_access(H)

//////////////////////////////////////////////////////////////////////////////////////////////////////

//MARK: Рекрут
/datum/outfit/job/cel/inteq/assistant
	name = "IQ - Recruit"
	jobtype = /datum/job/assistant
	job_icon = "assistant"
	id_assignment = "Recruit"

	id = /obj/item/card/id/cel/inteq/recruit
	mask = /obj/item/clothing/mask/balaclava/inteq
	shoes = /obj/item/clothing/shoes/jackboots

//MARK: Капитан
/datum/outfit/job/cel/inteq/captain
	name = "IQ - Vanguard"
	jobtype = /datum/job/captain
	job_icon = "captain"
	id_assignment = "Vanguard"

	id = /obj/item/card/id/cel/inteq/vanguard
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	ears = /obj/item/radio/headset/inteq/alt/captain
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	gloves = /obj/item/clothing/gloves/combat

//MARK: Командир
/datum/outfit/job/cel/inteq/captain/honorable
	name = "IQ - Honorable Vanguard"
	id_assignment = "Honorable Vanguard"

	id = /obj/item/card/id/cel/inteq/honorable_rearguard
	ears = /obj/item/radio/headset/inteq/alt/captain
	head = /obj/item/clothing/head/beret/sec/hos/inteq/honorable
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	suit = /obj/item/clothing/suit/armor/hos/inteq/honorable

//MARK: Арьергард. Rearguard
/datum/outfit/job/cel/inteq/rearguard
	name = "IQ - Rearguard"
	job_icon = "captain"
	id_assignment = "Rearguard"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/cel/inteq/vanguard
	ears = /obj/item/radio/headset/inteq/alt
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable

//MARK: Лейтенант первого класса
/datum/outfit/job/cel/inteq/enforcer
	name = "IQ - Enforcer Class One"
	jobtype = /datum/job/warden
	job_icon = "lieutenant"
	id_assignment = "Enforcer Class One"

	id = /obj/item/card/id/cel/inteq/enforcer
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	ears = /obj/item/radio/headset/inteq/alt
	mask = /obj/item/clothing/mask/balaclava/inteq
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp45
	belt = /obj/item/ammo_box/magazine/usp45_standart
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable

//MARK: Парамедик
/datum/outfit/job/cel/inteq/paramedic
	job_icon = "medicaldoctor"
	jobtype = /datum/job/paramedic
	name = "IQ - Corpsman"
	id_assignment = "Corpsman"

	id = /obj/item/card/id/cel/inteq/medic
	uniform = /obj/item/clothing/under/syndicate/inteq/corpsman
	head = /obj/item/clothing/head/soft/inteq/corpsman
	suit = /obj/item/clothing/suit/armor/inteq/corpsman
	belt = /obj/item/storage/belt/medical/webbing/paramedic
	ears = /obj/item/radio/headset/headset_medsec

	suit_store = /obj/item/flashlight/pen/paramedic
	backpack_contents = list(/obj/item/roller=1)

//MARK: Главный медик
/datum/outfit/job/cel/inteq/cmo
	name = "IQ - Honorable Corpsman"
	jobtype = /datum/job/cmo
	job_icon = "chiefmedicalofficer"
	id_assignment = "Honorable Corpsman"

	id = /obj/item/card/id/cel/inteq/honorable_medic
	head = /obj/item/clothing/head/beret/cmo
	belt = /obj/item/storage/belt/medical/webbing/paramedic
	ears = /obj/item/radio/headset/headset_medsec/alt
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	alt_uniform = /obj/item/clothing/under/syndicate/inteq/corpsman/skirt
	suit = /obj/item/clothing/suit/hooded/wintercoat/security/inteq/alt
	alt_suit = /obj/item/clothing/suit/armor/inteq/corpsman
	dcoat = /obj/item/clothing/suit/armor/hos/inteq

	chameleon_extras = null

//MARK: Служба безопасности
/datum/outfit/job/cel/inteq/security
	name = "IQ - Enforcer"
	jobtype = /datum/job/officer
	job_icon = "lieutenant"
	id_assignment = "Enforcer"

	id = /obj/item/card/id/cel/inteq/enforcer
	head = /obj/item/clothing/head/helmet/m10/inteq
	suit = /obj/item/clothing/suit/armor/vest/alt
	belt = /obj/item/storage/belt/security/webbing/inteq
	mask = /obj/item/clothing/mask/balaclava/inteq
	ears = /obj/item/radio/headset/inteq/alt
	uniform = /obj/item/clothing/under/syndicate/inteq
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security/inteq
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	gloves = /obj/item/clothing/gloves/combat

	backpack = /obj/item/storage/backpack/messenger/inteq
	satchel = /obj/item/storage/backpack/messenger/inteq
	courierbag = /obj/item/storage/backpack/messenger/inteq

/datum/outfit/job/cel/inteq/security/beluga
	name = "IRMG - Enforcer (Beluga)"

	head = /obj/item/clothing/head/beret/sec/inteq
	accessory = /obj/item/clothing/accessory/waistcoat
	suit = null
	belt = null
	mask = null
	shoes = /obj/item/clothing/shoes/laceup
	glasses = null
	gloves = /obj/item/clothing/gloves/color/evening

	backpack = /obj/item/storage/backpack/messenger/inteq
	satchel = /obj/item/storage/backpack/messenger/inteq
	courierbag = /obj/item/storage/backpack/messenger/inteq

//MARK: Варден
/datum/outfit/job/cel/inteq/warden
	name = "IQ - Master At Arms"
	jobtype = /datum/job/warden
	job_icon = "warden"
	id_assignment = "Master At Arms"

	id = /obj/item/card/id/cel/inteq/master_at_arms

	ears = /obj/item/radio/headset/inteq/alt
	head = /obj/item/clothing/head/warden/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	mask = /obj/item/clothing/mask/balaclava/inteq
	belt = /obj/item/storage/belt/military/assault
	suit = /obj/item/clothing/suit/armor/vest/security/warden/inteq
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security/inteq
	gloves = /obj/item/clothing/gloves/combat
	suit_store = null
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld

	courierbag = /obj/item/storage/backpack/messenger/inteq

//MARK: Главный инженер
/datum/outfit/job/cel/inteq/ce
	name = "IQ - Artificer Class One"
	jobtype = /datum/job/chief_engineer
	job_icon = "chiefengineer"
	id_assignment = "Artificer Class One"

	id = /obj/item/card/id/cel/inteq/honorable_artificer
	ears = /obj/item/radio/headset/inteq/alt
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	head = /obj/item/clothing/head/hardhat/white
	mask = /obj/item/clothing/mask/balaclava/inteq
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/security/inteq
	gloves = /obj/item/clothing/gloves/color/yellow
	belt = /obj/item/storage/belt/utility/chief/full
	courierbag = /obj/item/storage/backpack/messenger/inteq
	r_pocket = /obj/item/t_scanner

	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

//MARK: Инженегр
/datum/outfit/job/cel/inteq/engineer
	name = "IQ - Artificer"
	jobtype = /datum/job/engineer
	job_icon = "stationengineer"
	id_assignment = "Artificer"

	id = /obj/item/card/id/cel/inteq/artificer
	uniform = /obj/item/clothing/under/syndicate/inteq/artificer
	head = /obj/item/clothing/head/soft/inteq
	belt = /obj/item/storage/belt/utility/full/engi
	r_pocket = /obj/item/t_scanner

	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cheap=1)

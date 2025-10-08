// Даём Интекам свой дюфель взятый с Блюмуна, не имеет никаких отличающих стат
/datum/outfit/job/inteq/cel
	id = /obj/item/card/id/cel/inteq
	duffelbag = /obj/item/storage/backpack/duffelbag/inteq
	box = /obj/item/storage/box/survival/inteq	// Даёт всем интекашкам брендовый сурвивал бокс

//MARK: Рекрут
/datum/outfit/job/inteq/cel/assistant
	name = "IQ - Recruit"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	id = /obj/item/card/id/cel/inteq/recruit

//MARK: Капитан
/datum/outfit/job/inteq/cel/captain
	name = "IQ - Vanguard"
	jobtype = /datum/job/captain
	job_icon = "captain"

	id = /obj/item/card/id/cel/inteq/vanguard
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	suit_store = /obj/item/gun/ballistic/revolver/horizonx
	gloves = /obj/item/clothing/gloves/combat

//MARK: Командир
/datum/outfit/job/inteq/cel/honorable
	name = "IQ - Honorable Vanguard"
	jobtype = /datum/job/captain
	job_icon = "captain"

	id = /obj/item/card/id/cel/inteq/vanguard
	head = /obj/item/clothing/head/beret/sec/hos/inteq/honorable
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	uniform = /obj/item/clothing/under/syndicate/inteq/honorable
	suit = /obj/item/clothing/suit/armor/hos/inteq/honorable
	suit_store = /obj/item/gun/ballistic/revolver/horizonx
	gloves = /obj/item/clothing/gloves/combat

//MARK: Арьергард. Rearguard
/datum/outfit/job/inteq/cel/rearguard
	name = "IQ - Rearguard"
	job_icon = "captain"
	id_assignment = "Rearguard"

	jobtype = /datum/job/captain

	id = /obj/item/card/id/cel/inteq/vanguard
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	gloves = /obj/item/clothing/gloves/combat

//MARK: Лейтенант первого класса
/datum/outfit/job/inteq/cel/enforcer
	name = "IQ - Enforcer class One"
	jobtype = /datum/job/warden
	job_icon = "lieutenant"

	id = /obj/item/card/id/cel/inteq/enforcer
	head = /obj/item/clothing/head/beret/sec/hos/inteq
	mask = /obj/item/clothing/mask/balaclava
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/inteq
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp45
	belt = /obj/item/ammo_box/magazine/usp45_standart
	gloves = /obj/item/clothing/gloves/combat

//MARK: Парамедик
/datum/outfit/job/inteq/cel/paramedic
	job_icon = "medicaldoctor"
	jobtype = /datum/job/paramedic
	name = "IQ - Corpsman"

	id = /obj/item/card/id/cel/inteq/honorable_medic
	ears = /obj/item/radio/headset/inteq

//MARK: Главный медик
/datum/outfit/job/inteq/cel/cmo
	name = "IQ - Honorable Corpsman"
	jobtype = /datum/job/cmo
	job_icon = "chiefmedicalofficer"
	id_assignment = "Honorable Corpsman"

	id = /obj/item/card/id/cel/inteq/honorable_medic
	belt = /obj/item/storage/belt/medical/webbing/paramedic
	ears = /obj/item/radio/headset/inteq/captain
	uniform = /obj/item/clothing/under/syndicate/inteq/corpsman
	alt_uniform = /obj/item/clothing/under/syndicate/inteq/corpsman/skirt
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/hooded/wintercoat/security/inteq/alt
	alt_suit = /obj/item/clothing/suit/armor/inteq/corpsman
	dcoat = /obj/item/clothing/suit/armor/hos/inteq
	r_pocket = /obj/item/pda/medical

	chameleon_extras = null

//MARK: Служба безопасности
/datum/outfit/job/inteq/cel/security
	name = "IQ - Enforcer"
	jobtype = /datum/job/officer
	job_icon = "lieutenant"

	id = /obj/item/card/id/cel/inteq/enforcer

//MARK: Варден
/datum/outfit/job/inteq/cel/warden
	name = "IQ - Master At Arms"
	jobtype = /datum/job/warden
	job_icon = "warden"

	id = /obj/item/card/id/cel/inteq/master_at_arms

//MARK: Главный инженер
/datum/outfit/job/inteq/cel/ce
	name = "IQ - Artificer Class One"
	jobtype = /datum/job/chief_engineer
	job_icon = "chiefengineer"

	id = /obj/item/card/id/cel/inteq/honorable_artificer

//MARK: Инженегр
/datum/outfit/job/inteq/cel/engineer
	name = "IQ - Artificer"
	jobtype = /datum/job/engineer
	job_icon = "stationengineer"

	id = /obj/item/card/id/cel/inteq/artificer

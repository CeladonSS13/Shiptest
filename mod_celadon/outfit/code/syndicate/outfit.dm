//MARK: Доступы для Синдикеков

/datum/outfit/job/syndicate/cel/proc/get_syndi_general_access(mob/living/carbon/human/H)
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
			I.access += list(ACCESS_OUTPOST_FACTION_SYNDICATE, ACCESS_OUTPOST_OTHER_DONCO)
			I.update_label()
		W.combined_access = list()
		for (var/obj/item/card/id/card in W.contents)
			W.combined_access |= card.access

/datum/outfit/job/syndicate/cel/post_equip(mob/living/carbon/human/H)
	. = ..()
	get_syndi_general_access(H)

/datum/outfit/job/syndicate/cel
	name = "Syndicate - Base Outfit"
	job_icon = "assistant"
	box = /obj/item/storage/box/survival/syndicate

//MARK: Assistants

/datum/outfit/job/syndicate/cel/assistant
	name = "Syndicate - Junior Agent"
	id_assignment = "Junior Agent"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	uniform = /obj/item/clothing/under/syndicate/intern
	alt_uniform = null

	shoes = /obj/item/clothing/shoes/jackboots
	gloves = null
	ears = /obj/item/radio/headset
	back = /obj/item/storage/backpack

	id = /obj/item/card/id/cel/syndicate/assistant
	r_pocket = /obj/item/radio

/datum/outfit/job/syndicate/cel/assistant/gorlex
	name = "Syndicate - Junior Agent (Hardliner)"

	id = /obj/item/card/id/cel/syndicate/assistant/gorlex
	uniform = /obj/item/clothing/under/syndicate/hardliners
	alt_uniform = /obj/item/clothing/under/syndicate/hardliners/jumpsuit

/datum/outfit/job/syndicate/cel/assistant/gec
	name = "Syndicate - Deckhand (GEC)"
	id_assignment = "Deckhand"

	id = /obj/item/card/id/cel/syndicate/assistant/gec
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/toggle/hazard

	head = /obj/item/clothing/head/safety_helmet

/datum/outfit/job/syndicate/cel/assistant/cybersun
	name = "Syndicate - Junior Agent (Cybersun)"

	id = /obj/item/card/id/cel/syndicate/assistant/cybersun
	uniform = /obj/item/clothing/under/syndicate/cybersun
	shoes = /obj/item/clothing/shoes/jackboots
	r_pocket = /obj/item/radio
	head = /obj/item/clothing/head/soft/cybersun

/datum/outfit/job/syndicate/cel/assistant/twink
	name = "Syndicate - Deck Assistant (Twinkleshine)"
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

/datum/outfit/job/syndicate/cel/assistant/twink/post_equip(mob/living/carbon/human/H)
	. = ..()

	assign_codename(H)

/datum/outfit/job/syndicate/cel/assistant/suns
	name = "Syndicate - Freshman (SUNS)"
	id_assignment = "Freshman"

	id = /obj/item/card/id/cel/syndicate/assistant/suns
	uniform = /obj/item/clothing/under/syndicate/suns
	alt_uniform = /obj/item/clothing/under/syndicate/suns/alt
	suit = /obj/item/clothing/suit/toggle/suns/alt
	alt_suit = /obj/item/clothing/suit/toggle/suns
	shoes = /obj/item/clothing/shoes/laceup/suns
	gloves = null
	ears = null

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/syndicate/cel/assistant/suns/halfway	// не юзается нигде
	name = "Syndicate - Junior (SUNS)"
	id_assignment = "Junior"

	uniform = /obj/item/clothing/under/syndicate/suns/uniform2
	alt_uniform = /obj/item/clothing/under/syndicate/suns/uniform2/alt

/datum/outfit/job/syndicate/cel/assistant/suns/complete	// не юзается нигде
	name = "Syndicate - Graduate (SUNS)"
	id_assignment = "Graduate"

	uniform = /obj/item/clothing/under/syndicate/suns/uniform3
	alt_uniform = /obj/item/clothing/under/syndicate/suns/uniform3/alt

//MARK: atmos techs

/datum/outfit/job/syndicate/cel/atmos	// не юзается нигде
	name = "Syndicate - Atmospheric Technician"
	jobtype = /datum/job/atmos
	job_icon = "atmospherictechnician"

	id = /obj/item/card/id/cel/syndicate/crew/atmos
	belt = /obj/item/storage/belt/utility/atmostech
	uniform = /obj/item/clothing/under/rank/engineering/atmospheric_technician
	alt_uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	alt_suit = /obj/item/clothing/suit/hazardvest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering

	r_pocket = /obj/item/analyzer

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	pda_slot = ITEM_SLOT_LPOCKET
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

/datum/outfit/job/syndicate/cel/atmos/gec
	name = "Syndicate - Atmospheric Technician (GEC)"

	id = /obj/item/card/id/cel/syndicate/crew/atmos/gec
	uniform = /obj/item/clothing/under/syndicate/gec/atmos_tech
	suit = /obj/item/clothing/suit/toggle/hazard
	head = /obj/item/clothing/head/hardhat

//MARK: bartenders

/datum/outfit/job/syndicate/cel/bartender
	name = "Syndicate - Bartender"
	jobtype = /datum/job/bartender
	job_icon = "bartender"

	id = /obj/item/card/id/cel/syndicate/crew/bartender
	head = /obj/item/clothing/head/HoS/beret/syndicate
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	alt_uniform = /obj/item/clothing/under/rank/civilian/bartender/purple
	alt_suit = /obj/item/clothing/suit/apron/purple_bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup

/datum/outfit/job/syndicate/cel/bartender/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()

	var/obj/item/card/id/W = H.get_idcard()
	if(H.age < AGE_MINOR)
		W.registered_age = AGE_MINOR
		to_chat(H, span_notice("You're not technically old enough to access or serve alcohol, but your ID has been discreetly modified to display your age as [AGE_MINOR]. Try to keep that a secret!"))

/datum/outfit/job/syndicate/cel/bartender/suns
	name = "Syndicate - Student Mixologist (SUNS)"
	id_assignment = "Student Mixologist"

	id = /obj/item/card/id/cel/syndicate/crew/bartender/suns
	uniform = /obj/item/clothing/under/syndicate/suns/uniform2
	alt_uniform = /obj/item/clothing/under/syndicate/suns/alt
	mask = /obj/item/clothing/mask/breath/suns
	suit = null
	belt = null
	head = null
	shoes = /obj/item/clothing/shoes/laceup/suns
	gloves = null
	ears = null
	accessory = /obj/item/clothing/accessory/waistcoat/suns/poof

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

	backpack_contents = null

/datum/outfit/job/syndicate/cel/bartender/twink
	name = "Syndicate - Bartender (Twinkleshine, Donk)"

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

/datum/outfit/job/syndicate/cel/bartender/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

//MARK: botanist
/datum/outfit/job/syndicate/cel/botanist	// Не юзается
	name = "Syndicate - Botanist"
	jobtype = /datum/job/hydro
	job_icon = "botanist"

	id = /obj/item/card/id/cel/syndicate/crew/botanist
	suit = /obj/item/clothing/suit/apron
	gloves  =/obj/item/clothing/gloves/botanic_leather
	suit_store = /obj/item/plant_analyzer

/datum/outfit/job/syndicate/cel/botanist/suns
	name = "Syndicate - Botanist-Chemist (SUNS)"
	id_assignment = "Botanist-Chemist"

	id = /obj/item/card/id/cel/syndicate/crew/botanist/suns
	uniform = /obj/item/clothing/under/syndicate/suns/sciencejumpsuit
	shoes = /obj/item/clothing/shoes/sneakers/suns
	glasses = /obj/item/clothing/glasses/science/suns
	suit =  /obj/item/clothing/suit/hooded/suns
	suit_store = null
	neck = /obj/item/clothing/neck/cloak/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

//MARK: Captain

/datum/outfit/job/syndicate/cel/captain
	name = "Syndicate - Captain"
	jobtype = /datum/job/captain
	job_icon = "captain"

	id = /obj/item/card/id/cel/syndicate/captain
	ears = /obj/item/radio/headset/syndicate/alt/captain
	uniform = /obj/item/clothing/under/syndicate/ngr/officer
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/HoS/syndicate
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/syndicate

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

/datum/outfit/job/syndicate/cel/captain/twink
	name = "Flotilla Admiral (Twinkleshine, ACLF)"
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


/datum/outfit/job/syndicate/cel/captain/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)


/datum/outfit/job/syndicate/cel/captain/gorlex
	name = "Syndicate - Captain (Hardliner)"

	id = /obj/item/card/id/cel/syndicate/captain/gorlex
	uniform = /obj/item/clothing/under/syndicate/hardliners/officer

	head = /obj/item/clothing/head/hardliners/peaked
	suit = /obj/item/clothing/suit/toggle/armor/vest/hardliners
	shoes = /obj/item/clothing/shoes/combat

/datum/outfit/job/syndicate/cel/captain/cybersun
	name = "Syndicate - Captain (Cybersun)"

	id = /obj/item/card/id/cel/syndicate/captain/cybersun
	uniform = /obj/item/clothing/under/syndicate/cybersun/officer
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/cybersun
	head = /obj/item/clothing/head/HoS/cybersun
	gloves = /obj/item/clothing/gloves/combat

/datum/outfit/job/syndicate/cel/captain/suns
	name = "Syndicate - Captain (SUNS)"

	id = /obj/item/card/id/cel/syndicate/captain/suns
	uniform = /obj/item/clothing/under/syndicate/suns/captain
	shoes = /obj/item/clothing/shoes/combat/suns
	head = /obj/item/clothing/head/suns/captain
	gloves = /obj/item/clothing/gloves/suns/captain
	suit = /obj/item/clothing/suit/armor/vest/suns/captain
	belt = /obj/item/storage/belt/sabre/suns/captain
	mask = /obj/item/clothing/mask/breath/suns
	neck = /obj/item/clothing/neck/cloak/suns/cap

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

//MARK: cargo tech

/datum/outfit/job/syndicate/cel/cargo_tech	// Не юзается
	name = "Syndicate - Cargo Tech"
	jobtype = /datum/job/cargo_tech
	job_icon = "cargotechnician"

	id = /obj/item/card/id/cel/syndicate/crew/cargo_tech
	uniform = /obj/item/clothing/under/syndicate/donk
	suit = /obj/item/clothing/suit/hazardvest/donk

	alt_suit = /obj/item/clothing/suit/hazardvest
	l_hand = /obj/item/export_scanner
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)


/datum/outfit/job/syndicate/cel/cargo_tech/donk
	name = "Syndicate - Customer Associate (Donk)"
	id_assignment = "Customer Associate"

	id = /obj/item/card/id/cel/syndicate/crew/cargo_tech/donkco

//MARK: chemist

/datum/outfit/job/syndicate/cel/chemist	// Не юзается
	name = "Syndicate - Chemist"
	jobtype = /datum/job/chemist
	job_icon = "chemist"

	id = /obj/item/card/id/cel/syndicate/crew/chemist
	uniform = /obj/item/clothing/under/syndicate
	glasses = /obj/item/clothing/glasses/science
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/toggle/labcoat/chemist

/datum/outfit/job/syndicate/cel/chemist/gec	// Не юзается
	name = "Syndicate - Chemist (GEC)"

	id = /obj/item/card/id/cel/syndicate/crew/chemist/gec
	uniform = /obj/item/clothing/under/syndicate/intern
	suit = /obj/item/clothing/suit/toggle/hazard
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full/engi

//MARK: Chief Engineer

/datum/outfit/job/syndicate/cel/ce	// Не юзается
	name = "Syndicate - Chief Engineer"
	jobtype = /datum/job/chief_engineer
	job_icon = "chiefengineer"

	id = /obj/item/card/id/cel/syndicate/command_ce
	ears = /obj/item/radio/headset/syndicate/alt
	glasses = /obj/item/clothing/glasses/sunglasses

	belt = /obj/item/storage/belt/utility/chief/full
	uniform = /obj/item/clothing/under/rank/engineering/chief_engineer
	shoes = /obj/item/clothing/shoes/sneakers/brown
	head = /obj/item/clothing/head/hardhat/white
	gloves = /obj/item/clothing/gloves/color/black
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced = 1)

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi
	pda_slot = ITEM_SLOT_LPOCKET
	chameleon_extras = /obj/item/stamp/ce


/datum/outfit/job/syndicate/cel/ce/gec
	name = "Syndicate - Chief Engineer (GEC)"

	id = /obj/item/card/id/cel/syndicate/command_ce/gec
	uniform = /obj/item/clothing/under/syndicate/gec/chief_engineer
	suit = /obj/item/clothing/suit/toggle/hazard
	head = /obj/item/clothing/head/hardhat/white
	shoes =/obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/syndicate/alt/captain
	gloves = /obj/item/clothing/gloves/color/yellow

/datum/outfit/job/syndicate/cel/ce/gorlex
	name = "Syndicate - Chief Engineer (Gorlex)"

	id = /obj/item/card/id/cel/syndicate/command_ce/gorlex
	head = /obj/item/clothing/head/hardhat/gorlex
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/gorlex
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/red/insulated

//MARK: Chief Medical Officer

/datum/outfit/job/syndicate/cel/cmo
	name = "Syndicate - Medical Director"
	id_assignment = "Medical Director"
	jobtype = /datum/job/cmo
	job_icon = "chiefmedicalofficer"

	id = /obj/item/card/id/cel/syndicate/command_cmo
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer
	ears = /obj/item/radio/headset/syndicate/alt/captain
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/pinpointer/crew
	head = /obj/item/clothing/head/beret/cmo
	suit = /obj/item/clothing/suit/toggle/labcoat/raincoat
	l_hand = /obj/item/storage/firstaid/medical
	suit_store = /obj/item/flashlight/pen/paramedicox/survival/medical

/datum/outfit/job/syndicate/cel/cmo/cybersun
	name = "Syndicate - Medical Director (Cybersun)"

	id = /obj/item/card/id/cel/syndicate/command_cmo/cybersun
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer/cybersun
	head = /obj/item/clothing/head/beret/cmo/cybersun

/datum/outfit/job/syndicate/cel/cmo/suns
	name = "Syndicate - Medical Instructor (SUNS)"
	id_assignment = "Medical Instructor"

	id = /obj/item/card/id/cel/syndicate/command_cmo/suns
	uniform = /obj/item/clothing/under/syndicate/suns/doctorscrubs
	ears = /obj/item/radio/headset/syndicate/alt/captain
	shoes = /obj/item/clothing/shoes/combat/suns
	l_pocket = /obj/item/pinpointer/crew
	suit = /obj/item/clothing/suit/toggle/labcoat/suns/cmo
	l_hand = /obj/item/storage/firstaid/medical
	r_hand = /obj/item/storage/belt/sabre/suns/cmo
	suit_store = /obj/item/flashlight/pen/paramedic
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/suns
	glasses = /obj/item/clothing/glasses/hud/health/suns
	head = /obj/item/clothing/head/suns/cmo

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

//MARK: "Head Of Personnel"

/datum/outfit/job/syndicate/cel/head_of_personnel
	name = "Syndicate - Bridge Officer"
	id_assignment = "Bridge Officer"
	jobtype = /datum/job/head_of_personnel
	job_icon = "headofpersonnel"

	id =
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/HoS/beret/syndicate
	gloves = /obj/item/clothing/gloves/color/white
	r_pocket = /obj/item/melee/knife/survival
	glasses = /obj/item/clothing/glasses/hud/health
	backpack_contents = list(/obj/item/storage/box/ids=1, /obj/item/modular_computer/tablet/preset/advanced = 1)

/datum/outfit/job/syndicate/cel/head_of_personnel/cybersun
	name = "Syndicate - Intelligence Officer (Cybersun)"
	id_assignment = "Intelligence Officer"

	id =
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/cybersun/officer
	suit = /obj/item/clothing/suit/cybersun_suit
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/HoS/cybersun
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/sunglasses

/datum/outfit/job/syndicate/cel/head_of_personnel/suns	// Не юзается
	name = "Syndicate - Academic Staff (SUNS)"
	id_assignment = "Academic Staff"

	id =
	uniform = /obj/item/clothing/under/syndicate/suns/xo
	suit = /obj/item/clothing/suit/armor/vest/suns/xo
	belt = /obj/item/storage/belt/sabre/suns
	shoes = /obj/item/clothing/shoes/combat/suns
	head = /obj/item/clothing/head/suns
	gloves = /obj/item/clothing/gloves/suns/xo
	neck = /obj/item/clothing/neck/cloak/suns/xo
	r_pocket = null
	glasses = /obj/item/clothing/glasses/science/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

//MARK: head of security

/datum/outfit/job/syndicate/cel/hos	// Не юзается
	name = "Syndicate - Head Of Security"
	jobtype = /datum/job/hos
	job_icon = "headofsecurity"

	id =
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/combat
	head = /obj/item/clothing/head/HoS/syndicate
	suit = /obj/item/clothing/suit/armor/vest/syndie
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses

/datum/outfit/job/syndicate/cel/hos/gorlex
	name = "Syndicate - Sergeant (Hardliner)"
	id_assignment = "Sergeant"

	id =
	uniform = /obj/item/clothing/under/syndicate/hardliners/officer
	head = /obj/item/clothing/head/hardliners/peaked
	suit = /obj/item/clothing/suit/armor/hardliners/sergeant
	shoes = /obj/item/clothing/shoes/combat

/datum/outfit/job/syndicate/cel/hos/twink
	name = "Syndicate - Lieutenant (Twinkleshine, NGR)"
	id_assignment = "Lieutenant"
	job_icon = "lieutenant"

	id =
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

/datum/outfit/job/syndicate/cel/hos/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/syndicate/cel/hos/suns	// Не юзается
	name = "Syndicate - Senior Peacekeeper (SUNS)"
	id_assignment = "Senior Peacekeeper"

	id =
	uniform = /obj/item/clothing/under/syndicate/suns/pkuniform
	suit = /obj/item/clothing/suit/armor/vest/suns/hos
	belt = /obj/item/melee/sword/sabre/suns/telescopic
	gloves = /obj/item/clothing/gloves/tackler/dolphin/suns
	shoes = /obj/item/clothing/shoes/combat/suns
	head = /obj/item/clothing/head/welding/suns/hos
	glasses = /obj/item/clothing/glasses/hud/security/suns
	suit_store = /obj/item/gun/ballistic/automatic/powered/gauss/modelh/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/syndicate/cel/hos/suns/alt	// Не юзается
	name = "Syndicate - Senior Peacekeeper Alt (SUNS)"
	suit = /obj/item/clothing/suit/armor/vest/suns/ehos
	head = /obj/item/clothing/head/HoS/syndicate/suns

/datum/outfit/job/syndicate/cel/hos/suns/twink	// Не юзается
	name = "Syndicate - Redshield Officer (Twinkleshine, SUNS)"
	id_assignment = "Redshield Officer"

	id =
	suit = null
	mask = /obj/item/clothing/mask/gas/syndicate/voicechanger
	ears = null
	head = null
	suit_store = null
	glasses = null

/datum/outfit/job/syndicate/cel/hos/suns/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

//MARK: medical doctors (assorted)

/datum/outfit/job/syndicate/cel/doctor
	name = "Syndicate - Medical Doctor"
	jobtype = /datum/job/doctor
	job_icon = "medicaldoctor"

	id =
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	alt_suit = /obj/item/clothing/suit/apron/surgical
	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie/med
	courierbag = /obj/item/storage/backpack/messenger/med

/datum/outfit/job/syndicate/cel/doctor/suns
	name = "Syndicate - Medical Doctor (SUNS)"

	id =
	uniform = /obj/item/clothing/under/syndicate/suns/doctorscrubs
	shoes = /obj/item/clothing/shoes/sneakers/suns
	suit = /obj/item/clothing/suit/toggle/labcoat/suns/doctorlabcoat
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/suns
	head = /obj/item/clothing/head/suns/surgery
	glasses = /obj/item/clothing/glasses/hud/health/suns
	mask = /obj/item/clothing/mask/surgical/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/syndicate/cel/doctor/cybersun
	name = "Syndicate - Medical Doctor (Cybersun)"

	id =
	uniform = /obj/item/clothing/under/syndicate/medic
	accessory = /obj/item/clothing/accessory/armband/medblue
	shoes = /obj/item/clothing/shoes/combat

/datum/outfit/job/syndicate/cel/doctor/gorlex
	name = "Syndicate - Medical Doctor (Hardliner)"

	id =
	uniform = /obj/item/clothing/under/syndicate/hardliners
	head = /obj/item/clothing/head/hardliners
	suit = /obj/item/clothing/suit/hardliners
	glasses = /obj/item/clothing/glasses/hud/health
	shoes = /obj/item/clothing/shoes/combat

//MARK: paramedics

/datum/outfit/job/syndicate/cel/paramedic	// Не юзается
	name = "Syndicate - Paramedic"
	jobtype = /datum/job/paramedic
	job_icon = "paramedic"

	id =
	uniform = /obj/item/clothing/under/syndicate/gorlex
	alt_uniform = null
	shoes = /obj/item/clothing/shoes/jackboots

	head = /obj/item/clothing/head/soft/paramedic
	suit =  /obj/item/clothing/suit/toggle/labcoat/paramedic
	alt_suit = /obj/item/clothing/suit/apron/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/evil
	belt = /obj/item/storage/belt/medical/paramedic
	suit_store = /obj/item/flashlight/pen/paramedic
	backpack_contents = list(/obj/item/roller=1)
	pda_slot = ITEM_SLOT_LPOCKET

/datum/outfit/job/syndicate/cel/paramedic/gorlex	// Не юзается
	name = "Syndicate - Paramedic (Gorlex)"

/datum/outfit/job/syndicate/cel/paramedic/cybersun
	name = "Syndicate - Field Medic (Cybersun Industries)"
	id_assignment = "Field Medic"

	id =
	uniform = /obj/item/clothing/under/syndicate/medic
	head = /obj/item/clothing/head/soft/cybersun/medical
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/toggle/labcoat/raincoat

/datum/outfit/job/syndicate/cel/paramedic/twink
	name = "Syndicate - Medic (Twinkleshine, Cybersun)"

	id =
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

/datum/outfit/job/syndicate/cel/paramedic/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

//MARK: psychologist

/datum/outfit/job/syndicate/cel/psychologist	// Не юзается
	name = "Syndicate - Psychologist"
	jobtype = /datum/job/psychologist
	job_icon = "psychologist"

	id =
	uniform = /obj/item/clothing/under/rank/medical/psychiatrist
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	alt_uniform = null
	l_hand = /obj/item/clipboard
	pda_slot = ITEM_SLOT_BELT

/datum/outfit/job/syndicate/cel/psychologist/suns
	name = "Syndicate - Psychologist (SUNS)"

	id =
	uniform = /obj/item/clothing/under/syndicate/suns/uniform3
	alt_uniform = /obj/item/clothing/under/syndicate/suns/uniform3/alt
	suit = /obj/item/clothing/suit/toggle/suns
	alt_suit = /obj/item/clothing/suit/toggle/suns/alt
	shoes = /obj/item/clothing/shoes/laceup/suns
	accessory = /obj/item/clothing/accessory/waistcoat/suns/poof

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

//MARK: patient (prisoner)

/datum/outfit/job/syndicate/cel/patient
	name = "Syndicate - Long Term Patient"
	id_assignment = "Long Term Patient"
	jobtype = /datum/job/prisoner
	job_icon = "assistant"

	id =
	uniform = /obj/item/clothing/under/rank/medical/gown
	alt_suit = null
	shoes = /obj/item/clothing/shoes/sandal/slippers

//MARK: Quartermaster

/datum/outfit/job/syndicate/cel/quartermaster	// Не юзается
	name = "Syndicate - Quartermaster"
	jobtype = /datum/job/qm
	job_icon = "quartermaster"

	id =
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/donk/qm
	suit = /obj/item/clothing/suit/hazardvest/donk/qm
	ears = /obj/item/radio/headset/syndicate/alt
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/clipboard
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)

/datum/outfit/job/syndicate/cel/quartermaster/donk
	name = "Syndicate - Manager (Donk)"

	id =
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/donk/qm
	suit = /obj/item/clothing/suit/hazardvest/donk/qm
	ears = /obj/item/radio/headset/syndicate/alt
	shoes = /obj/item/clothing/shoes/laceup

//MARK: scientists

/datum/outfit/job/syndicate/cel/science	// Не юзается
	name = "Syndicate - Scientist"
	jobtype = /datum/job/scientist
	job_icon = "scientist"

	id =
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

/datum/outfit/job/syndicate/cel/science/suns	// Не юзается
	name = "Syndicate - Scientist (SUNS)"

	id =
	uniform = /obj/item/clothing/under/syndicate/suns/sciencejumpsuit
	suit = /obj/item/clothing/suit/hooded/suns
	shoes = /obj/item/clothing/shoes/sneakers/suns
	glasses = /obj/item/clothing/glasses/science/suns
	neck = /obj/item/clothing/neck/cloak/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/syndicate/cel/science/cybersun
    name = "Syndicate - Scientist"
    jobtype = /datum/job/scientist
    job_icon = "scientist"

	id =
    uniform = /obj/item/clothing/under/syndicate/cybersun/research
    suit = /obj/item/clothing/suit/toggle/labcoat
    head = /obj/item/clothing/head/soft/cybersun

    backpack = /obj/item/storage/backpack/duffelbag/syndie
    satchel = /obj/item/storage/backpack/satchel/tox
    courierbag = /obj/item/storage/backpack/messenger/tox

// Директор Исследований Киберсан

/datum/outfit/job/syndicate/cel/science/director
	name = "Syndicate - Research and Development Team Leader (Cybersun)"
	id_assignment = "Research and Development Team Leader"
	jobtype = /datum/job/rd
	job_icon = "headofpersonnel"

	id =
	ears = /obj/item/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/syndicate/cybersun/officer
	suit = /obj/item/clothing/suit/cybersun_suit
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/HoS/cybersun
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/sunglasses

//MARK: security officers

/datum/outfit/job/syndicate/cel/security
	name = "Syndicate - Operative"
	id_assignment = "Operative"
	jobtype = /datum/job/officer
	job_icon = "securityofficer"

	id =
	uniform = /obj/item/clothing/under/syndicate
	back = /obj/item/storage/backpack

	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld

/datum/outfit/job/syndicate/cel/security/gorlex
	name = "Syndicate - Trooper (Hardliner)"
	id_assignment = "Trooper"
	job_icon = "securityofficer"

	id =
	uniform = /obj/item/clothing/under/syndicate/hardliners
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/combat

/datum/outfit/job/syndicate/cel/security/gorlex/pilot	// Не юзается
	name = "Syndicate - Pilot (Hardliner)"
	id_assignment = "Pilot"
	job_icon = "securityofficer"

	id =
	head = /obj/item/clothing/head/helmet/hardliners/swat

/datum/outfit/job/syndicate/cel/security/twink
	name = "Syndicate - Operative (Twinkleshine)"

	id =
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

/datum/outfit/job/syndicate/cel/security/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/syndicate/cel/security/suns
	name = "Syndicate - Peacekeeper (SUNS)"
	id_assignment = "Peacekeeper"

	id =
	uniform = /obj/item/clothing/under/syndicate/suns/pkuniform
	suit = /obj/item/clothing/suit/armor/vest/suns
	alt_suit = /obj/item/clothing/suit/toggle/suns/pkcoat
	belt = /obj/item/melee/sword/sabre/suns/telescopic
	gloves = /obj/item/clothing/gloves/tackler/dolphin/suns
	shoes = /obj/item/clothing/shoes/jackboots/suns/long
	head = /obj/item/clothing/head/welding/suns
	glasses = /obj/item/clothing/glasses/hud/security/suns

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/syndicate/cel/security/suns/alternate	// Не юзается
	name = "Syndicate - Peacekeeper - Casual(SUNS)"
	id_assignment = "Peacekeeper"

	suit = /obj/item/clothing/suit/toggle/suns/pkcoat
	belt = null
	head = null

//MARK: Miners

/datum/outfit/job/syndicate/cel/miner	// Не юзается
	name = "Syndicate - Miner"
	jobtype = /datum/job/mining
	job_icon = "shaftminer"

	id =
	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/explorer
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	r_pocket = /obj/item/storage/bag/ore
	backpack_contents = list(
						/obj/item/flashlight/seclite=1,
						/obj/item/melee/knife/survival=1,
						/obj/item/stack/marker_beacon/ten=1,
						/obj/item/radio/weather_monitor=1,
						)

/datum/outfit/job/syndicate/cel/miner/gorlex
	name = "Syndicate - Wrecker (Hardliner)"
	id_assignment = "Wrecker"

	id =
	head = /obj/item/clothing/head/hardhat/hardliners
	suit = /obj/item/clothing/suit/hazardvest/hardliners
	uniform = /obj/item/clothing/under/syndicate/hardliners/jumpsuit
	accessory = /obj/item/clothing/accessory/armband/cargo
	shoes = /obj/item/clothing/shoes/workboots
	ears = /obj/item/radio/headset/alt

/datum/outfit/job/syndicate/cel/miner/twink
	name = "Syndicate - Miner (Twinkleshine, SUNS)"

	id =
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

/datum/outfit/job/syndicate/cel/miner/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/syndicate/cel/miner/cybersun
	name = "Syndicate - Field Agent (Cybersun)"
	id_assignment = "Field Agent"

	id =
	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/syndicate/cybersun
	accessory = /obj/item/clothing/accessory/armband/cargo
	head = /obj/item/clothing/head/soft/cybersun
	r_pocket = /obj/item/radio

/datum/outfit/job/syndicate/cel/miner/gec
	name = "Syndicate - Shaft Miner (GEC)"

	id =
	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/syndicate
	alt_uniform = null
	accessory = /obj/item/clothing/accessory/armband/cargo
	head = /obj/item/clothing/head/soft/black
	r_pocket = /obj/item/radio
	head = /obj/item/clothing/head/hardhat/orange
	suit = /obj/item/clothing/suit/toggle/industrial
	suit_store = /obj/item/tank/internals/emergency_oxygen/double

//MARK: "station" engineers

/datum/outfit/job/syndicate/cel/engineer	// Не юзается
	name = "Syndicate - Ship Technician"
	id_assignment = "Ship Technician"
	jobtype = /datum/job/engineer
	job_icon = "stationengineer"

	id =
	uniform = /obj/item/clothing/under/syndicate
	alt_uniform = /obj/item/clothing/under/syndicate/gec
	accessory = /obj/item/clothing/accessory/armband/engine
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/jackboots

	belt = /obj/item/storage/belt/utility/full/engi
	head = /obj/item/clothing/head/hardhat/dblue
	r_pocket = /obj/item/t_scanner

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	pda_slot = ITEM_SLOT_LPOCKET
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)

/datum/outfit/job/syndicate/cel/engineer/gec
	name = "Syndicate - Ship Engineer (GEC)"
	id_assignment = "Ship Engineer"

	id =
	uniform = /obj/item/clothing/under/syndicate/gec
	alt_uniform = null
	suit = /obj/item/clothing/suit/toggle/hazard
	head = /obj/item/clothing/head/hardhat

/datum/outfit/job/syndicate/cel/engineer/gorlex
	name = "Syndicate - Mechanic (Hardliner)"
	id_assignment = "Mechanic"

	id =
	head = /obj/item/clothing/head/hardhat/hardliners
	suit = /obj/item/clothing/suit/hazardvest/hardliners
	uniform = /obj/item/clothing/under/syndicate/hardliners
	shoes = /obj/item/clothing/shoes/workboots
	glasses = null

/datum/outfit/job/syndicate/cel/engineer/twink
	name = "Syndicate - Ship Engineer (Twinkleshine, GEC)"

	id =
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

/datum/outfit/job/syndicate/cel/engineer/twink/post_equip(mob/living/carbon/human/H)
	. = ..()
	assign_codename(H)

/datum/outfit/job/syndicate/cel/engineer/cybersun
	name = "Syndicate - Engineer (Cybersun)"

	id =
	uniform = /obj/item/clothing/under/syndicate/cybersun/research
	shoes = /obj/item/clothing/shoes/workboots
	r_pocket = /obj/item/radio
	head = /obj/item/clothing/head/soft/cybersun
	accessory = /obj/item/clothing/accessory/armband/engine

/datum/outfit/job/syndicate/cel/engineer/suns
	name = "Syndicate - Ship Engineer (SUNS)"

	id =
	uniform = /obj/item/clothing/under/syndicate/suns/workerjumpsuit
	suit = /obj/item/clothing/suit/toggle/suns/workervest
	gloves = /obj/item/clothing/gloves/suns/yellow
	shoes = /obj/item/clothing/shoes/jackboots/suns
	head = /obj/item/clothing/head/safety_helmet/suns
	accessory = null
	glasses = null

	backpack = /obj/item/storage/backpack
	satchel  = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

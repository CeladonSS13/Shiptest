/datum/outfit/job/cel/independent
	name = "IND - Base Outfit"
	faction_icon = "bg_indie"

	id = /obj/item/card/id

// MARK: Prisoner

/datum/outfit/job/cel/independent/prisoner
	name = "Prisoner"
	job_icon = "assistant"
	jobtype = /datum/job/prisoner

	uniform = /obj/item/clothing/under/rank/prisoner
	alt_uniform = /obj/item/clothing/under/rank/prisoner //WS Edit - Alt Uniforms
	alt_suit = /obj/item/clothing/suit/jacket/leather
	shoes = /obj/item/clothing/shoes/sneakers/orange
	id = /obj/item/card/id/prisoner
	ears = null
	belt = null

// MARK: MIME

/datum/outfit/job/cel/independent/mime
	name = "Mime"
	job_icon = "mime"
	jobtype = /datum/job/mime

	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/mime
	alt_uniform = /obj/item/clothing/under/rank/civilian/mime/sexy //WS Edit - Alt Uniforms
	mask = /obj/item/clothing/mask/gas/mime
	gloves = /obj/item/clothing/gloves/color/white
	head = /obj/item/clothing/head/frenchberet
	belt = /obj/item/pda/mime
	suit = /obj/item/clothing/suit/toggle/suspenders
	backpack_contents = list(
		/obj/item/stamp/mime = 1,
		/obj/item/book/mimery = 1,
		/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing = 1
		)

	backpack = /obj/item/storage/backpack/mime
	satchel = /obj/item/storage/backpack/mime

	chameleon_extras = /obj/item/stamp/mime

/datum/outfit/job/cel/independent/mime/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/mime/speak(null))
		H.mind.miming = TRUE

	var/datum/atom_hud/fan = GLOB.huds[DATA_HUD_FAN]
	fan.add_hud_to(H)

//	Mime for Mimos
/datum/outfit/job/cel/independent/mime/captain
	name = "Master Mime"
	job_icon = "mime"
	jobtype = /datum/job/mime

	id = /obj/item/card/id/gold
	ears = /obj/item/radio/headset/alt
	uniform = /obj/item/clothing/under/rank/civilian/mime
	alt_uniform = /obj/item/clothing/under/rank/civilian/mime/sexy //WS Edit - Alt Uniforms
	mask = /obj/item/clothing/mask/gas/mime
	gloves = /obj/item/clothing/gloves/color/captain
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/beret/command
	suit = /obj/item/clothing/suit/toggle/suspenders

	backpack_contents = list(
		/obj/item/stamp/mime = 1,
		/obj/item/book/mimery = 1,
		/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing = 1
		)

	backpack = /obj/item/storage/backpack/mime
	satchel = /obj/item/storage/backpack/mime

// MARK: CLOWN

/datum/outfit/job/cel/independent/clown
	name = "Clown"
	job_icon = "clown"
	jobtype = /datum/job/clown

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/clown
	alt_uniform = /obj/item/clothing/under/rank/civilian/clown/green
	mask = /obj/item/clothing/mask/gas/clown_hat
	belt = /obj/item/pda/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	l_pocket = /obj/item/bikehorn
	backpack_contents = list(
		/obj/item/stamp/clown = 1,
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/food/grown/banana = 1,
		/obj/item/instrument/bikehorn = 1,
		)

	implants = list(/obj/item/implant/sad_trombone)

	duffelbag = /obj/item/storage/backpack/duffelbag/clown //strangely has a duffel

	box = /obj/item/storage/box/hug/survival

	chameleon_extras = /obj/item/stamp/clown

/datum/outfit/job/cel/independent/clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.fully_replace_character_name(H.real_name, pick(GLOB.clown_names)) //rename the mob AFTER they're equipped so their ID gets updated properly.
	ADD_TRAIT(H, TRAIT_NAIVE, JOB_TRAIT)
	H.dna.add_mutation(CLOWNMUT)
	for(var/datum/mutation/human/clumsy/M in H.dna.mutations)
		M.mutadone_proof = TRUE
	var/datum/atom_hud/fan = GLOB.huds[DATA_HUD_FAN]
	fan.add_hud_to(H)

//	Clown for Mimos
/datum/outfit/job/cel/independent/clown/maintenanceclown
	name = "Maintenance Clown"
	job_icon = "clown"
	jobtype = /datum/job/clown

	belt = /obj/item/storage/belt/utility/full/engi
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/clown
	alt_uniform = /obj/item/clothing/under/rank/civilian/clown/green //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	head = /obj/item/clothing/head/hardhat/dblue
	gloves = /obj/item/clothing/gloves/color/yellow
	suit = /obj/item/clothing/suit/hooded/wintercoat/engineering
	backpack_contents = list(
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/food/grown/banana = 1,
		)

	implants = list(/obj/item/implant/sad_trombone)

	backpack = /obj/item/storage/backpack/clown
	satchel = /obj/item/storage/backpack/clown
	duffelbag = /obj/item/storage/backpack/duffelbag/clown //strangely has a duffel

	box = /obj/item/storage/box/hug/survival

// MARK:Assistant

/datum/outfit/job/cel/independent/assistant
	name = "IND - Assistant"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/sneakers/black

/datum/outfit/job/cel/independent/assistant/waiter
	name = "IND - Assistant (Waiter)"

	uniform = /obj/item/clothing/under/suit/waiter
	alt_uniform = /obj/item/clothing/under/suit/waiter/syndicate
	gloves = /obj/item/clothing/gloves/color/evening
	ears = /obj/item/radio/headset/headset_srv
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/lighter
	r_pocket = /obj/item/reagent_containers/glass/rag

/datum/outfit/job/cel/independent/assistant/waiter/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.get_idcard()
	W.access += list(ACCESS_KITCHEN)

/datum/outfit/job/cel/independent/assistant/artist
	name = "IND - Assistant (Artist)"

	uniform = /obj/item/clothing/under/suit/burgundy
	suit = /obj/item/clothing/suit/toggle/suspenders
	head = /obj/item/clothing/head/beret/black
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/white
	accessory = /obj/item/clothing/neck/scarf/darkblue

/datum/outfit/job/cel/independent/assistant/pharma
	name = "IND - Assistant (Pharmacology Student)"
	job_icon = "medicaldoctor"

	uniform = /obj/item/clothing/under/rank/medical/chemist
	shoes = /obj/item/clothing/shoes/sneakers/white
	accessory = /obj/item/clothing/neck/scarf/orange
	l_pocket = /obj/item/reagent_containers/pill/floorpill
	belt = /obj/item/reagent_scanner
	backpack_contents = list(/obj/item/book/manual/wiki/chemistry=1)

/datum/outfit/job/cel/independent/assistant/fancy
	name = "IND - Assistant (Fancy)"

	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/suit/black_really

/datum/outfit/job/cel/independent/assistant/lagoon
	name = "IND - Fancy (Formal Uniform)"

	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/misc/assistantformal
	head = /obj/item/clothing/head/beret/grey
	l_pocket = /obj/item/spacecash/bundle/c500

// MARK:Captain

/datum/outfit/job/cel/independent/captain
	name = "IND - Captain"
	job_icon = "captain"
	jobtype = /datum/job/captain

	id = /obj/item/card/id/gold
	gloves = /obj/item/clothing/gloves/color/captain
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/command/captain
	suit = /obj/item/clothing/suit/armor/captaincoat
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/caphat

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	accessory = /obj/item/clothing/accessory/medal/gold/captain

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/captain)

/datum/outfit/job/cel/independent/captain/western
	name = "IND - Captain (Western)"
	head = /obj/item/clothing/head/caphat/cowboy
	shoes = /obj/item/clothing/shoes/cowboy/fancy
	glasses = /obj/item/clothing/glasses/sunglasses

/datum/outfit/job/cel/independent/captain/masinyane
	name = "IND - Captain (Masinyane)"
	uniform = /obj/item/clothing/under/suit/black
	head = null
	belt = null
	gloves = null
	shoes = /obj/item/clothing/shoes/laceup

	backpack_contents = list(/obj/item/clothing/accessory/medal/gold/captain=1, /obj/item/spacecash/bundle/c10000=1)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel/
	duffelbag = /obj/item/storage/backpack/duffelbag
	courierbag = /obj/item/storage/backpack/messenger

/datum/outfit/job/cel/independent/captain/manager
	name = "IND - Captain (Manager)"

	id = /obj/item/card/id
	gloves = /obj/item/clothing/gloves/color/white
	uniform = /obj/item/clothing/under/rank/security/detective/grey
	suit = /obj/item/clothing/suit/toggle/lawyer/purple
	neck = /obj/item/clothing/neck/tie/black
	dcoat = null
	glasses = /obj/item/clothing/glasses/sunglasses
	head = null
	accessory = null

/datum/outfit/job/cel/independent/captain/lagoon
	name = "IND - Captain"
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

// MARK:Head of Personnel

/datum/outfit/job/cel/independent/hop
	name = "IND - Head of Personnel"
	job_icon = "headofpersonnel"
	jobtype = /datum/job/head_of_personnel

	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/command/head_of_personnel
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/captain
	shoes = /obj/item/clothing/shoes/sneakers/brown
	backpack_contents = list(/obj/item/storage/box/ids=1)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/officer)

/datum/outfit/job/cel/independent/hop/western
	name = "IND - Head of Personnel (Western)"

	uniform = /obj/item/clothing/under/rank/security/detective/grey
	shoes = /obj/item/clothing/shoes/cowboy/black
	accessory = /obj/item/clothing/accessory/waistcoat
	head = /obj/item/clothing/head/cowboy
	backpack_contents = list(/obj/item/storage/box/ids = 1)

/datum/outfit/job/cel/independent/hop/lagoon
	name = "IND - Head of Personnel"
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

// MARK:Roboticist

/datum/outfit/job/cel/independent/roboticist
	name = "IND - Roboticist"
	job_icon = "roboticist"
	jobtype = /datum/job/roboticist

	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/rnd/roboticist
	suit = /obj/item/clothing/suit/toggle/labcoat
	alt_suit = /obj/item/clothing/suit/toggle/suspenders/gray
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

// MARK:Security Officer

/datum/outfit/job/cel/independent/security
	name = "IND - Security Officer"
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
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	courierbag = /obj/item/storage/backpack/messenger/sec

	chameleon_extras = list(/obj/item/gun/energy/disabler, /obj/item/clothing/glasses/hud/security/sunglasses, /obj/item/clothing/head/helmet)
	//The helmet is necessary because /obj/item/clothing/head/helmet/sec is overwritten in the chameleon list by the standard helmet, which has the same name and icon state

/datum/outfit/job/cel/independent/security/disarmed //No armor, no pocket handcuffs.
	name = "IND - Security Officer (Disarmed)"
	head = null
	suit = null
	l_pocket = null

/datum/outfit/job/cel/independent/security/western
	name = "IND - Security Officer (Western)"
	job_icon = "securityofficer"

	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/cowboy/sec

/datum/outfit/job/cel/independent/security/merc
	name = "IND - Security Officer (Mercenary)"
	id_assignment = "Trooper"

	uniform = /obj/item/clothing/under/syndicate/camo
	gloves = /obj/item/clothing/gloves/fingerless
	head = null
	suit = null
	dcoat = null

/datum/outfit/job/cel/independent/security/lagoon
	name = "IND - Security Officer"
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

// MARK:Engineer

/datum/outfit/job/cel/independent/engineer
	name = "IND - Engineer"
	job_icon = "stationengineer"
	jobtype = /datum/job/engineer

	belt = null
	gloves = null
	ears = /obj/item/radio/headset/headset_eng
	uniform = /obj/item/clothing/under/overalls/olive
	alt_uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/workboots
	head = null

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

/datum/outfit/job/cel/independent/engineer/salvage
	name = "IND - Engineer (Salvager)"

	belt = null
	l_pocket = null

// MARK:Chief Engineer

/datum/outfit/job/cel/independent/ce
	name = "IND - Chief Engineer"
	jobtype = /datum/job/chief_engineer
	job_icon = "chiefengineer"

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/utility/chief/full
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/engineering/chief_engineer
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/engineering
	shoes = /obj/item/clothing/shoes/sneakers/brown
	head = /obj/item/clothing/head/hardhat/white
	gloves = /obj/item/clothing/gloves/color/black

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

	chameleon_extras = /obj/item/stamp/ce

// MARK:Medical Doctor

/datum/outfit/job/cel/independent/doctor
	name = "IND - Medical Doctor"
	job_icon = "medicaldoctor"
	jobtype = /datum/job/doctor

	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/doctor/blue
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/apron/surgical
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

	chameleon_extras = /obj/item/gun/syringe

/datum/outfit/job/cel/independent/doctor/lagoon
	name = "IND - Medical Doctor"
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

// MARK: Virologist

/datum/outfit/job/cel/independent/virologist
	name = "Virologist"
	job_icon = "virologist"
	jobtype = /datum/job/virologist

	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/virologist
	alt_uniform = /obj/item/clothing/under/rank/medical/doctor/green
	mask = /obj/item/clothing/mask/surgical
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/toggle/labcoat/virologist
	alt_suit = /obj/item/clothing/suit/toggle/labcoat/mad
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical
	suit_store =  /obj/item/flashlight/pen

	backpack = /obj/item/storage/backpack/virology
	satchel = /obj/item/storage/backpack/satchel/vir
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/viro
	box = /obj/item/storage/box/survival/medical

// MARK:Cargo Tech

/datum/outfit/job/cel/independent/cargo_tech
	name = "IND - Cargo Tech"
	jobtype = /datum/job/cargo_tech
	job_icon = "cargotechnician"

	ears = /obj/item/radio/headset/headset_cargo
	uniform = /obj/item/clothing/under/color/lightbrown
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/cargo

// MARK:Atmos Tech

/datum/outfit/job/cel/independent/atmos
	name = "IND - Atmos Tech"
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

/datum/outfit/job/cel/independent/atmos/lagoon
	name = "IND - Atmos Tech"
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

// MARK:Scientist

/datum/outfit/job/cel/independent/scientist
	name = "IND - Scientist"
	jobtype = /datum/job/scientist
	job_icon = "scientist"

	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/rnd/scientist
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	alt_suit = /obj/item/clothing/suit/toggle/suspenders/blue
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

// MARK:Paramedic

/datum/outfit/job/cel/independent/paramedic
	name = "IND - Paramedic"
	jobtype = /datum/job/paramedic
	job_icon = "paramedic"

	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/paramedic/emt
	head = /obj/item/clothing/head/soft/paramedic
	shoes = /obj/item/clothing/shoes/sneakers/blue
	suit =  /obj/item/clothing/suit/toggle/labcoat/paramedic
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical/paramedic
	gloves = /obj/item/clothing/gloves/color/latex

	backpack_contents = list(/obj/item/roller=1)

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/para

	chameleon_extras = /obj/item/gun/syringe

// MARK:Quartermaster

/datum/outfit/job/cel/independent/quartermaster
	name = "IND - Quartermaster"
	jobtype = /datum/job/qm
	job_icon = "quartermaster"

	ears = /obj/item/radio/headset/headset_cargo
	uniform = /obj/item/clothing/under/rank/security/detective
	head = /obj/item/clothing/head/hardhat/white
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/cargo
	suit = /obj/item/clothing/suit/hazardvest
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/sunglasses
	r_pocket = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	chameleon_extras = /obj/item/stamp/qm

/datum/outfit/job/cel/independent/quartermaster/western
	name = "IND - Quartermaster (Western)"

	suit = /obj/item/clothing/suit/jacket/leather/duster
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/cowboy/sec

// MARK: Miner

/datum/outfit/job/cel/independent/miner
	name = "IND - Miner"
	jobtype = /datum/job/mining
	job_icon = "shaftminer"

	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/explorer
	uniform = /obj/item/clothing/under/rank/cargo/miner
	suit = /obj/item/clothing/suit/hazardvest
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/miner
	l_pocket = /obj/item/storage/bag/ore
	backpack_contents = list(
		/obj/item/flashlight/seclite=1,\
		/obj/item/melee/knife/survival=1,\
		/obj/item/stack/marker_beacon/ten=1,\
		/obj/item/radio/weather_monitor=1)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag

	chameleon_extras = /obj/item/gun/energy/kinetic_accelerator

/datum/outfit/job/cel/independent/miner/hazard
	name = "IND - Miner (Hazard Uniform)"

	uniform = /obj/item/clothing/under/rank/cargo/miner/hazard
	alt_uniform = null
	alt_suit = /obj/item/clothing/suit/toggle/hazard

/datum/outfit/job/cel/independent/miner/scientist
	name = "IND - Miner (Minerologist)"

	uniform = /obj/item/clothing/under/rank/cargo/miner/hazard
	alt_uniform = /obj/item/clothing/under/rank/rnd/roboticist
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	alt_suit = /obj/item/clothing/suit/toggle/hazard
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

// MARK:Cook

/datum/outfit/job/cel/independent/cook
	name = "IND - Cook"
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

/datum/outfit/job/cel/independent/cook/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/list/possible_boxes = subtypesof(/obj/item/storage/box/ingredients)
	var/chosen_box = pick(possible_boxes)
	var/obj/item/storage/box/I = new chosen_box(src)
	H.equip_to_slot_or_del(I,ITEM_SLOT_BACKPACK)

/datum/outfit/job/cel/independent/cook/lagoon
	name = "IND - Cook"
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

// MARK:Bartender

/datum/outfit/job/cel/independent/bartender
	name = "IND - Bartender"
	job_icon = "bartender"
	jobtype = /datum/job/bartender


	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	alt_uniform = /obj/item/clothing/under/rank/civilian/bartender/purple
	alt_suit = /obj/item/clothing/suit/apron/purple_bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup
	accessory = /obj/item/clothing/accessory/waistcoat

/datum/outfit/job/cel/independent/bartender/disarmed //No armor, no shotgun ammo.
	name = "IND - Bartender (Disarmed)"

	suit = null
	alt_suit = null
	backpack_contents = null

/datum/outfit/job/cel/independent/bartender/pharma
	name = "IND - Bartender (Mixologist)"

	backpack_contents = list(/obj/item/storage/box/syringes=1, /obj/item/storage/box/drinkingglasses = 1)
	ears = /obj/item/radio/headset/headset_med
	suit = /obj/item/clothing/suit/toggle/labcoat
	l_pocket = /obj/item/reagent_containers/food/drinks/shaker
	belt = /obj/item/storage/belt
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	uniform = /obj/item/clothing/under/suit/black
	accessory = null

/datum/outfit/job/cel/independent/bartender/lagoon
	job_icon = "bartender"
	name = "IND - Bartender"

	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	alt_uniform = /obj/item/clothing/under/rank/civilian/bartender/purple
	alt_suit = /obj/item/clothing/suit/apron/purple_bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(/obj/item/storage/box/beanbag=1)
	shoes = /obj/item/clothing/shoes/laceup
	accessory = /obj/item/clothing/accessory/waistcoat

// MARK:Lawyer

/datum/outfit/job/cel/independent/lawyer
	name = "IND - Lawyer"
	job_icon = "lawyer"
	jobtype = /datum/job/lawyer

	ears = /obj/item/radio/headset/headset_srvsec
	uniform = /obj/item/clothing/under/rank/civilian/lawyer/bluesuit
	suit = /obj/item/clothing/suit/toggle/lawyer
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/storage/briefcase/lawyer
	l_pocket = /obj/item/clothing/accessory/lawyers_badge
	r_pocket = /obj/item/pda

	backpack_contents = list(/obj/item/cane = 1,
							/obj/item/clothing/glasses/monocle = 1,
							/obj/item/clothing/neck/scarf/tajaran/orange = 1,
							/obj/item/passport/solgov = 1)

// MARK:Curator

/datum/outfit/job/cel/independent/curator
	name = "IND - Curator"
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

/datum/outfit/job/cel/independent/curator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	H.grant_all_languages(TRUE, TRUE, TRUE, LANGUAGE_CURATOR)

/datum/outfit/job/cel/independent/curator/dungeonmaster
	name = "IND - Curator (Dungeon Master)"
	uniform = /obj/item/clothing/under/misc/pj/red
	suit = /obj/item/clothing/suit/nerdshirt
	backpack_contents = list(
		/obj/item/choice_beacon/hero = 1,
		/obj/item/tape = 1,
		/obj/item/storage/pill_bottle/dice = 1,
		/obj/item/toy/cards/deck/cas = 1,
		/obj/item/toy/cards/deck/cas/black = 1,
		/obj/item/hourglass = 1
	)

/datum/outfit/job/cel/independent/curator/lagoon
	name = "IND - Curator"
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

// MARK:Chaplain

/datum/outfit/job/cel/independent/chaplain
	name = "IND - Chaplain"
	job_icon = "chaplain"
	jobtype = /datum/job/chaplain

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/chaplain
	backpack_contents = list(
		/obj/item/camera/spooky = 1
		)

	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack

/datum/outfit/job/cel/independent/chaplain/lagoon
	name = "IND - Chaplain"
	job_icon = "chaplain"
	jobtype = /datum/job/chaplain

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/chaplain
	backpack_contents = list(
		/obj/item/camera/spooky = 1
		)

	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack

// MARK:Chemist

/datum/outfit/job/cel/independent/chemist
	name = "IND - Chemist"
	job_icon = "chemist"
	jobtype = /datum/job/chemist

	glasses = /obj/item/clothing/glasses/science
	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/chemist
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/toggle/labcoat/chemist
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/chemistry
	satchel = /obj/item/storage/backpack/satchel/chem
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/chem

	chameleon_extras = /obj/item/gun/syringe

/datum/outfit/job/cel/independent/chemist/pharma
	name = "IND - Chemist (Pharmacology Student)"
	job_icon = "medicaldoctor"

	shoes = /obj/item/clothing/shoes/sneakers/white
	accessory = /obj/item/clothing/neck/scarf/orange
	l_pocket = null
	r_pocket = /obj/item/reagent_containers/pill/floorpill
	belt = /obj/item/reagent_scanner
	backpack_contents = list(/obj/item/book/manual/wiki/chemistry = 1)

// MARK:Janitor

/datum/outfit/job/cel/independent/janitor
	name = "IND - Janitor"
	job_icon = "janitor"
	jobtype = /datum/job/janitor

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/janitor

/datum/outfit/job/cel/independent/janitor/lagoon
	name = "IND - Janitor"
	job_icon = "janitor"
	jobtype = /datum/job/janitor

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/janitor

// MARK:Research Director

/datum/outfit/job/cel/independent/rd
	name = "IND - Research Director"
	job_icon = "researchdirector"
	jobtype = /datum/job/rd

	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/rnd/research_director/turtleneck
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/toggle/labcoat
	alt_suit = /obj/item/clothing/suit/toggle/suspenders
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science //WS Edit - Alt Uniforms
	l_hand = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

	chameleon_extras = /obj/item/stamp/rd

// MARK:Chief Medical Officer

/datum/outfit/job/cel/independent/cmo
	name = "IND - Chief Medical Officer"
	job_icon = "chiefmedicalofficer"
	jobtype = /datum/job/cmo

	id = /obj/item/card/id/silver
	l_pocket = /obj/item/pinpointer/crew
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/medical/doctor/blue
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/toggle/labcoat/cmo
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	courierbag = /obj/item/storage/backpack/messenger/med

	chameleon_extras = list(/obj/item/gun/syringe, /obj/item/stamp/cmo)

/datum/outfit/job/cel/independent/cmo/pharma
	name = "IND - Chief Pharmacist"

	glasses = /obj/item/clothing/glasses/science/prescription/fake //chief pharma is this kind of person
	neck = /obj/item/clothing/neck/tie/orange //the Horrible Tie was genuinely too hard to look at
	l_pocket = /obj/item/reagent_containers/glass/filter
	uniform = /obj/item/clothing/under/suit/tan
	alt_uniform = /obj/item/clothing/under/rank/medical/doctor/green
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/toggle/suspenders/gray

	l_hand = /obj/item/reagent_containers/glass/maunamug
	backpack = /obj/item/storage/backpack/chemistry
	satchel = /obj/item/storage/backpack/satchel/chem
	courierbag = /obj/item/storage/backpack/messenger/chem
	backpack_contents = list(/obj/item/storage/bag/chemistry = 1)

// MARK:Detective

/datum/outfit/job/cel/independent/detective
	name = "IND - Detective"
	job_icon = "detective"
	jobtype = /datum/job/detective

	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/rank/security/detective
	neck = /obj/item/clothing/neck/tie/detective
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/det_suit
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/fedora/det_hat
	l_pocket = /obj/item/toy/crayon/white
	backpack_contents = list(/obj/item/storage/box/evidence=1,\
		/obj/item/detective_scanner=1,\
		/obj/item/melee/classic_baton=1)
	mask = /obj/item/clothing/mask/cigarette

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/ballistic/revolver/detective, /obj/item/clothing/glasses/sunglasses)

/datum/outfit/job/cel/independent/detective/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	var/obj/item/clothing/mask/cigarette/cig = H.wear_mask
	if(istype(cig)) //Some species specfic changes can mess this up (plasmamen)
		cig.light("")

	if(visualsOnly)
		return

// MARK:Botanist

/datum/outfit/job/cel/independent/botanist
	name = "IND - Botanist"
	job_icon = "botanist"
	jobtype = /datum/job/hydro

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/overalls
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/hydro
	gloves  =/obj/item/clothing/gloves/botanic_leather
	belt = /obj/item/plant_analyzer

	backpack = /obj/item/storage/backpack/botany
	satchel = /obj/item/storage/backpack/satchel/hyd
	courierbag = /obj/item/storage/backpack/messenger/hyd

/datum/outfit/job/cel/independent/botanist/pharma
	name = "IND - Botanist (Herbalist)"

	ears = /obj/item/radio/headset/headset_med
	belt = /obj/item/storage/bag/plants
	uniform = /obj/item/clothing/under/utility

/datum/outfit/job/cel/independent/botanist/lagoon
	name = "IND - Botanist"
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



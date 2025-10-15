// MARK: STANDART
// Если собираетесь менять вносить что-то, раскомментируйте
// /datum/outfit/job/doctor
// 	job_icon = "medicaldoctor"

// /datum/outfit/job/assistant
// 	job_icon = "assistant"

// /datum/outfit/job/mime/captain
// 	job_icon = "mime"

// /datum/outfit/job/mime
// 	job_icon = "mime"

// /datum/outfit/job/clown/maintenanceclown
// 	job_icon = "chiefengineer"

// /datum/outfit/job/cmo
// 	job_icon = "chiefmedicalofficer"

// /datum/outfit/job/rd
// 	job_icon = "researchdirector"

// /datum/outfit/job/virologist
// 	job_icon = "virologist"

// /datum/outfit/job/roboticist
// 	job_icon = "roboticist"

// /datum/outfit/job/scientist
// 	job_icon = "assistant"

/datum/outfit/job/paramedic
	l_pocket = null

// /datum/outfit/job/chemist
// 	job_icon = "chemist"

// /datum/outfit/job/captain
// 	job_icon = "assistant"

// /datum/outfit/job/cook
// 	job_icon = "cook"

// /datum/outfit/job/prisoner
// 	job_icon = "assistant"

// /datum/outfit/job/bartender
// 	job_icon = "bartender"

// /datum/outfit/job/head_of_personnel
// 	head = /obj/item/clothing/head/hopcap

// MARK: MIME
/datum/outfit/job/mime
	name = "Mime"
	job_icon = "mime"
	jobtype = /datum/job/mime

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

//	Mime for Mimos
/datum/outfit/job/mime/captain
	name = "Master Mime"
	job_icon = "mime"
	jobtype = /datum/job/mime

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
/datum/outfit/job/clown
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

//	Clown for Mimos
/datum/outfit/job/clown/maintenanceclown
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

/datum/outfit/tunnel_clown
	name = "Tunnel Clown"

	uniform = /obj/item/clothing/under/rank/civilian/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas/clown_hat
	ears = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/thermal/monocle
	suit = /obj/item/clothing/suit/hooded/chaplainsuit
	l_pocket = /obj/item/food/grown/banana
	r_pocket = /obj/item/bikehorn
	id = /obj/item/card/id
	r_hand = /obj/item/melee/axe

/datum/outfit/tunnel_clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.access = get_all_accesses()
	W.assignment = "Tunnel Clown!"
	W.registered_name = H.real_name
	W.update_label()

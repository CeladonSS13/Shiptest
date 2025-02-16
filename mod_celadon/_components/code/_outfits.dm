// Transfer <= code\modules\clothing\outfits\factions\inteq.dm

/* List:
1. Independent (Нейтральные)
*/

//								///
//	1.Independent (Нейтральные)	///
//								///

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
		// /obj/item/stamp/mime = 1,
		/obj/item/book/mimery = 1,
		/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing = 1
		)

	backpack = /obj/item/storage/backpack/mime
	satchel = /obj/item/storage/backpack/mime


//	Clown for Mimos
/datum/outfit/job/clown/maintenanceclown
	name = "Maintenance Clown"
	job_icon = "clown"
	jobtype = /datum/job/clown

	belt = /obj/item/storage/belt/utility/full/engi
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/clown
	alt_uniform = /obj/item/clothing/under/rank/civilian/clown/green //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/galoshes // Clown shoes удалены оффами. Отличная замена. Отличная ведь?
	mask = /obj/item/clothing/mask/gas/clown_hat
	head = /obj/item/clothing/head/hardhat/dblue
	gloves = /obj/item/clothing/gloves/color/yellow
	suit = /obj/item/clothing/suit/hooded/wintercoat/engineering
	backpack_contents = list(
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/reagent_containers/food/snacks/grown/banana = 1,
		)

	implants = list(/obj/item/implant/sad_trombone)

	// backpack = /obj/item/storage/backpack/clown - Вырезано оффами.
	// satchel = /obj/item/storage/backpack/clown - Вырезано оффами.
	duffelbag = /obj/item/storage/backpack/duffelbag/clown //strangely has a duffel

	box = /obj/item/storage/box/hug/survival


// DEBUG OUTFIT
/datum/outfit/debug //Даем изолиррованность перчаткам
	gloves = /obj/item/clothing/gloves/combat{siemens_coefficient = 0}

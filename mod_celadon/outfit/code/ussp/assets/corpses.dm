/obj/effect/mob_spawn/human/corpse/ussp
	name = "Ussp soldier"
	id_job = "Soldier"
	outfit = /datum/outfit/ussp

/datum/outfit/ussp
	name = "Ussp soldier Corpse"
	uniform = /obj/item/clothing/under/ussp
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/alt
	mask = /obj/item/clothing/mask/breath/facemask
	head = /obj/item/clothing/head/helmet/bulletproof
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/cel/ussp

/obj/effect/mob_spawn/human/corpse/ranged/ussp_medium_armor
	name = "Ussp soldier with medium armor"
	id_job = "Soldier"
	outfit = /datum/outfit/ranged/ussp_medium_armor

/datum/outfit/ranged/ussp_medium_armor
	name = "Ussp soldier Corpse"
	uniform = /obj/item/clothing/under/ussp
	suit = /obj/item/clothing/suit/armor/vest/marine/medium
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/alt
	mask = /obj/item/clothing/mask/breath/facemask
	head = /obj/item/clothing/head/helmet/bulletproof
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/cel/ussp

/obj/effect/mob_spawn/human/corpse/ussp/ranged/cargo_tech
	name = "Ussp cargo tech corpse"
	id_job = "Cargo tech"
	outfit = /datum/outfit/ranged/ussp_cargo_tech

/datum/outfit/ranged/ussp_cargo_tech
	name = "Ussp cargo tech Corpse"
	uniform = /obj/item/clothing/under/ussp/maika
	suit = /obj/item/clothing/suit/hazardvest
	shoes = /obj/item/clothing/shoes/combat
	gloves = null
	ears = /obj/item/radio/headset/alt
	mask = null
	head = /obj/item/clothing/head/hardhat
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/cel/ussp

/obj/effect/mob_spawn/human/corpse/ussp/cargo_tech_knife
	name = "Ussp cargo tech corpse"
	id_job = "Cargo tech"
	outfit = /datum/outfit/ussp_cargo_tech

/datum/outfit/ussp_cargo_tech
	name = "Ussp cargo tech corpse"
	uniform = /obj/item/clothing/under/ussp/maika
	suit = /obj/item/clothing/suit/hazardvest
	shoes = /obj/item/clothing/shoes/combat
	gloves = null
	ears = /obj/item/radio/headset/alt
	mask = null
	head = /obj/item/clothing/head/hardhat
	back = /obj/item/storage/backpack
	id = /obj/item/card/id/cel/ussp

// Хотел сделать систему дропа что бы как у челиков на солянке когда убиваешь находишь в рюкзаке разные вещи, но когда сделал это, все ссспшные каргонцы спавнились голыми, пока оставлю тут, вдруг пойму как правильно доделать.
/*/obj/effect/mob_spawn/human/corpse/ussp/ranged/cargo_tech/Initialize()
	backpack_contents = list()
	if(prob(70))
		backpack_contents += pick_weight(list(
			/obj/item/soap = 5,
			/obj/item/flashlight/seclite = 50,
			/obj/item/reagent_containers/food/drinks/waterbottle = 10,
			/obj/item/melee/knife/combat = 30,
			/obj/item/storage/ration/shredded_beef = 5
			)
		)
	if (prob(15)) //mayhaps a medkit
		backpack_contents += pick_weight(list(
			/obj/item/storage/firstaid/regular = 50,
			/obj/item/storage/firstaid/brute = 50
			)
		)
	if (prob(1))
		backpack_contents += pick_weight(list(
			/obj/item/ammo_box/a357 = 5,
			/obj/item/ammo_box/a300 = 5,
			/obj/item/ammo_box/magazine/g36 = 1,
			/obj/item/ammo_box/magazine/m12g_bulldog = 1,
			/obj/item/ammo_box/magazine/m12g_bulldog/empty = 20,
			/obj/item/ammo_box/magazine/m9mm_expedition/empty = 20,
			/obj/item/storage/box/donkpockets = 10,
			/obj/item/storage/box/donkpockets/donkpocketberry = 10,
			/obj/item/storage/box/donkpockets/donkpocketpizza = 10,
			/obj/item/storage/box/donkpockets/donkpocketspicy = 10,
			/obj/item/storage/box/donkpockets/donkpocketteriyaki = 8
			)
		)
*/

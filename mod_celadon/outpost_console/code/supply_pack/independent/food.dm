/datum/supply_pack/faction/independent/food
	group = "Food & Agricultural"

/datum/supply_pack/faction/independent/food/ration_mre
	name = "MRE set"
	desc = "6 expanded MRE sets. Spices included!"
	cost = 500
	contains = list(/obj/item/storage/ration/vegan_chili,
					/obj/item/storage/ration/shredded_beef,
					/obj/item/storage/ration/pork_spaghetti,
					/obj/item/storage/ration/fried_fish,
					/obj/item/storage/ration/beef_strips,
					/obj/item/storage/ration/chili_macaroni
	)
	crate_name = "IRP set"
	crate_type = /obj/structure/closet/crate/secure/weapon

/*
MARK:	Ready-to-eat
*/

/datum/supply_pack/faction/independent/food/donkpockets
	name = "Donk Pocket Variety Crate"
	desc = "Featuring a line up of Donk Co.'s most popular pastry!"
	cost = 400
	contains = list(/obj/item/storage/box/donkpockets/donkpocketspicy,
					/obj/item/storage/box/donkpockets/donkpocketteriyaki,
					/obj/item/storage/box/donkpockets/donkpocketpizza,
					/obj/item/storage/box/donkpockets/donkpocketberry,
					/obj/item/storage/box/donkpockets/donkpockethonk)
	crate_name = "donk pocket crate"
	crate_type = /obj/structure/closet/crate/freezer

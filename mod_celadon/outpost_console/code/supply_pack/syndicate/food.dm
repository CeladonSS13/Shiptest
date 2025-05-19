/datum/supply_pack/faction/syndicate/food
	group = "Food & Agricultural"

/datum/supply_pack/faction/syndicate/food/donkpockets
	name = "Donk Pocket Variety Crate"
	desc = "Featuring a line up of Donk Co.'s most popular pastry!"
	cost = 500
	contains = list(/obj/item/storage/box/donkpockets/donkpocketspicy,
					/obj/item/storage/box/donkpockets/donkpocketteriyaki,
					/obj/item/storage/box/donkpockets/donkpocketpizza,
					/obj/item/storage/box/donkpockets/donkpocketberry,
					/obj/item/storage/box/donkpockets/donkpockethonk)
	crate_name = "donk pocket crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/syndicate/food/donkpockets/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to 3)
		var/item = pick(contains)
		new item(C)

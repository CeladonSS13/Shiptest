/datum/supply_pack/faction/syndicate/food
	category = "Misc - Food & Agricultural"
	stable_price = TRUE

/datum/supply_pack/faction/syndicate/food/donkpockets
	name = "Donk Pocket Variety"
	desc = "Featuring a line up of Donk Co.'s most popular pastry!"
	cost = 500
	contains = list(/obj/item/storage/box/shoalpockets/shoalpocketspicy,
					/obj/item/storage/box/shoalpockets/shoalpocketteriyaki,
					/obj/item/storage/box/shoalpockets/shoalpocketpizza,
					/obj/item/storage/box/shoalpockets/shoalpocketberry,
					/obj/item/storage/box/shoalpockets/honk)
	crate_name = "donk pocket crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/syndicate/food/donkpockets/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to 3)
		var/item = pick(contains)
		new item(C)

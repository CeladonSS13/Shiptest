/datum/supply_pack/faction/nanotrasen/magazines
	group = "Magazines"

/datum/supply_pack/faction/nanotrasen/magazines/powercells_mini
	name = "NT Energy weapon miniature weapon power cell supply pack"
	desc = "The crate contains a three miniature batteries for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/mini/empty,
					/obj/item/stock_parts/cell/gun/mini/empty,
					/obj/item/stock_parts/cell/gun/mini/empty)
	cost = 400

/datum/supply_pack/faction/nanotrasen/magazines/powercells_basic
	name = "NT Energy weapon basic power cell supply pack"
	desc = "The crate contains a three basic batteries for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/empty,
					/obj/item/stock_parts/cell/gun/empty,
					/obj/item/stock_parts/cell/gun/empty)
	cost = 800

/datum/supply_pack/faction/nanotrasen/magazines/powercells_large
	name = "NT Energy weapon extra-large weapon power cell supply pack"
	desc = "The crate contains a extra-large battery for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/large/empty)
	cost = 900

/datum/supply_pack/faction/nanotrasen/magazines/gauss
	name = "Gauss Magazine"
	desc = "A 24-round magazine for the prototype gauss rifle. Ferromagnetic pellets do okay damage with significant armor penetration."
	contains = list(/obj/item/ammo_box/magazine/gauss/empty)
	cost = 550

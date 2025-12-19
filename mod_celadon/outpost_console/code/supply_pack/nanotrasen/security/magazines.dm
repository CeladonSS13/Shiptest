/datum/supply_pack/faction/nanotrasen/magazine
	category = "Security - Magazines"

/*
MARK: VI
*/

/datum/supply_pack/faction/nanotrasen/magazine/co9mm_mag
	name = "\"Challenger\" - Magazine (9x18mm)"
	desc = "Contains a 9x18mm magazine for the standard-issue \"Challenger\" pistol, with a capacity of 12 rounds."
	contains = list(/obj/item/ammo_box/magazine/co9mm/empty)
	cost = 150

/datum/supply_pack/faction/nanotrasen/magazine/smgm9mm_mag
	name = "Vector/Saber - Magazine (9x18mm)"
	desc = "Contains a 9x18mm magazine for the Vector and Saber SMGs, with a capacity of 30 rounds."
	contains = list(/obj/item/ammo_box/magazine/m9mm_expedition/empty)
	cost = 250

/datum/supply_pack/faction/nanotrasen/magazine/wt550_mag
	name = "WT-550 - Magazine (4.6x30mm)"
	desc = "Contains a 4.6x30mm magazine for the WT-550 Auto Rifle, with a capacity of 30 rounds."
	cost = 300
	contains = list(/obj/item/ammo_box/magazine/wt550m9/empty)

/*
MARK: Energy weapons
*/

/datum/supply_pack/faction/nanotrasen/magazine/guncell
	name = "Weapon Cell"
	desc = "Contains a weapon cell, compatible with laser guns."
	contains = list(/obj/item/stock_parts/cell/gun)
	cost = 500

/datum/supply_pack/faction/nanotrasen/magazine/upgradedguncell
	name = "Upgraded Weapon Cell"
	desc = "Contains an upgraded weapon cell, compatible with laser guns. For NT use only."
	contains = list(/obj/item/stock_parts/cell/gun/upgraded)
	cost = 1000

/datum/supply_pack/faction/nanotrasen/magazine/powercells_mini
	name = "E-Mini - NT Energy Weapon Miniature Cell"
	desc = "The crate contains a three miniature batteries for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/mini/empty,
					/obj/item/stock_parts/cell/gun/mini/empty,
					/obj/item/stock_parts/cell/gun/mini/empty)
	cost = 200

/datum/supply_pack/faction/nanotrasen/magazine/powercells_basic
	name = "E-Base - NT Energy Weapon Basic Cell Supply Pack"
	desc = "The crate contains a three basic batteries for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/empty,
					/obj/item/stock_parts/cell/gun/empty,
					/obj/item/stock_parts/cell/gun/empty)
	cost = 800

/datum/supply_pack/faction/nanotrasen/magazine/powercells_large
	name = "E-Large - NT Energy Weapon Extra-Large Cell"
	desc = "The crate contains a EXTRA-LARGE battery for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/large/empty)
	cost = 900

/datum/supply_pack/faction/nanotrasen/magazine/gauss
	name = "Gauss - Magazine"
	desc = "Contains a Gauss magazine for the prototype gauss rifle, with a capacity of 24 rounds. Ferromagnetic pellets do okay damage with significant armor penetration."
	contains = list(/obj/item/ammo_box/magazine/gauss/empty)
	cost = 550

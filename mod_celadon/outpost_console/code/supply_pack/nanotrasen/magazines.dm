/datum/supply_pack/faction/nanotrasen/magazine
	category = "Magazines"

/*
MARK: VI
*/

/datum/supply_pack/faction/nanotrasen/magazine/co9mm_mag
	name = "9x18mm  Commander Magazine Crate"
	desc = "Contains a 9x18mm  magazine for the standard-issue Commander pistol, with a capacity of twelve rounds."
	contains = list(/obj/item/ammo_box/magazine/co9mm/empty)
	cost = 150

/datum/supply_pack/faction/nanotrasen/magazine/smgm9mm_mag
	name = "9x18mm  SMG Magazine Crate"
	desc = "Contains a 9x18mm  magazine for the Vector and Saber SMGs, with a capacity of thirty rounds."
	contains = list(/obj/item/ammo_box/magazine/smgm9mm/empty)
	cost = 250

/datum/supply_pack/faction/nanotrasen/magazine/wt550_mag
	name = "WT-550 Auto Rifle Magazine Crate"
	desc = "Contains a 9x18mm magazine for the WT-550 Auto Rifle, with a capacity of 30 rounds Each magazine is designed to facilitate rapid tactical reloads."
	cost = 300
	contains = list(/obj/item/ammo_box/magazine/wt550m9/empty)

/*
MARK: Energy weapons
*/

/datum/supply_pack/faction/nanotrasen/magazine/guncell
	name = "Weapon Cell Crate"
	desc = "Contains a weapon cell, compatible with laser guns."
	contains = list(/obj/item/stock_parts/cell/gun)
	cost = 500

/datum/supply_pack/faction/nanotrasen/magazine/upgradedguncell
	name = "Upgraded Weapon Cell Crate"
	desc = "Contains an upgraded weapon cell, compatible with laser guns. For NT use only."
	contains = list(/obj/item/stock_parts/cell/gun/upgraded)
	cost = 1000

/datum/supply_pack/faction/nanotrasen/magazine/powercells_mini
	name = "NT Energy Weapon Miniature Power Cell Supply Pack"
	desc = "The crate contains a three miniature batteries for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/mini/empty,
					/obj/item/stock_parts/cell/gun/mini/empty,
					/obj/item/stock_parts/cell/gun/mini/empty)
	cost = 400

/datum/supply_pack/faction/nanotrasen/magazine/powercells_basic
	name = "NT Energy Weapon Basic Power Cell Supply Pack"
	desc = "The crate contains a three basic batteries for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/empty,
					/obj/item/stock_parts/cell/gun/empty,
					/obj/item/stock_parts/cell/gun/empty)
	cost = 800

/datum/supply_pack/faction/nanotrasen/magazine/powercells_large
	name = "NT Energy wWeapon Extra-Large Power Cell Crate"
	desc = "The crate contains a extra-large battery for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/large/empty)
	cost = 900

/datum/supply_pack/faction/nanotrasen/magazine/gauss
	name = "Gauss Magazine Crate"
	desc = "A 24-round magazine for the prototype gauss rifle. Ferromagnetic pellets do okay damage with significant armor penetration."
	contains = list(/obj/item/ammo_box/magazine/gauss/empty)
	cost = 550

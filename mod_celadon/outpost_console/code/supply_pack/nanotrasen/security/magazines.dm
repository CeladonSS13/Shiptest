/datum/supply_pack/faction/nanotrasen/magazine
	category = "Security - Magazines"

/*
	MARK: VI
*/

/datum/supply_pack/faction/nanotrasen/magazine/a357_mag
	name = "Revolver - Speedloader (.357)"
	desc = "Contains a .357 speedloader for revolvers, containing 6 rounds."
	contains = list(/obj/item/ammo_box/a357/empty)
	cost = 250

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
	name = "E-Cell - Weapon Cell"
	desc = "Contains a weapon cell, compatible with laser guns."
	contains = list(/obj/item/stock_parts/cell/gun)
	cost = 500

/datum/supply_pack/faction/nanotrasen/magazine/upgradedguncell
	name = "E-Cell - Upgraded Weapon Cell"
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
	name = "E-Cell - NT Energy Weapon Basic Cell Supply Pack"
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

// MARK: Sharplite Ammo

/*
/datum/supply_pack/faction/nanotrasen/magazine/wt550_mag
	name = "Resolution Auto Rifle Magazine"
	desc = "Contains a 20-round magazine for the Resolution Auto Rifle. Each magazine is designed to facilitate rapid tactical reloads."
	cost = 25
	contains = list(/obj/item/ammo_box/magazine/wt550m9/empty)

/datum/supply_pack/faction/nanotrasen/magazine/expedition_mag
	name = "SGL9 Expedition Submachinegun Magazine"
	desc = "Contains a 30-round magazine for the Expedition Submachinegun, chambered in 9mm."
	cost = 25
	contains = list(/obj/item/ammo_box/magazine/m9mm_expedition)
*/

/*
/datum/supply_pack/faction/nanotrasen/magazine/guncell
	name = "E-Cell - Eoehoma-style Power Cell"
	desc = "Contains a weapon power cell built to be compatible with Eoehoma weapons, and systems that still use Eoehoma's style of cell."
	contains = list(/obj/item/stock_parts/cell/gun/empty)
	cost = 500
*/

/datum/supply_pack/faction/nanotrasen/magazine/nt_guncell
	name = "P-Cell - Sharplite Weapon Cell"
	desc = "Contains a proprietary weapon cell, compatible with most Sharplite energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/sharplite/empty)
	cost = 1750
	stable_price = TRUE

/datum/supply_pack/faction/nanotrasen/magazine/nt_gun_plus
	name = "P-Cell - Sharplite Upgraded Weapon Cell"
	desc = "Contains an upgraded weapon cell, compatible with most Nanotrasen models. For NT use only."
	contains = list(/obj/item/stock_parts/cell/gun/sharplite/plus/empty)
	cost = 3500
	stable_price = TRUE

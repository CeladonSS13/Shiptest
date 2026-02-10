/datum/supply_pack/faction/solfed/magazine
	category = "Security - Magazines"

// MARK: CM-Mag

/datum/supply_pack/faction/solfed/magazine/cm357
	name = "CM-357 - Magazine (.357)"
	desc = "A 7-round magazine designed for the CM-357 pistol."
	contains = list(/obj/item/ammo_box/magazine/cm357/empty)
	cost = 350

/datum/supply_pack/faction/solfed/magazine/m9mm_cm70
	name = "CM-70 - Magazine (9x18mm)"
	desc = "A 18-round magazine designed for the CM-70 machine pistol."
	contains = list(/obj/item/ammo_box/magazine/m9mm_cm70/empty)
	cost = 350

/datum/supply_pack/faction/solfed/magazine/cm15
	name = "CM-15 - Magazine (12g)"
	desc = "An almost straight, 8-round magazine designed for the CM-15 shotgun."
	contains = list(/obj/item/ammo_box/magazine/cm15_12g/empty)
	cost = 400

/datum/supply_pack/faction/solfed/magazine/cm5
	name = "CM-5 - Magazine (9x18mm)"
	desc = "A 30-round magazine for the CM-5 submachine gun. These rounds do okay damage, but struggle against armor."
	cost = 350
	contains = list(/obj/item/ammo_box/magazine/cm5_9mm/empty)

/datum/supply_pack/faction/solfed/magazine/cm82
	name = "CM-82 - Magazine (5.56х42mm)" // "Rifle - Model 82 Carbine (5.56х42mm)"
	desc = "A simple, 30-round magazine for 5.56x42mm assault rifles. These rounds do moderate damage with good armor penetration."
	contains = list(/obj/item/ammo_box/magazine/p16/empty)
	cost = 500

/datum/supply_pack/faction/solfed/magazine/cm24
	name = "CM-24 - Magazine (7.62x40mm)"
	desc = "Contains a higher-powered rifle chambered in 7.62x40mm based on the SKM-24 platform, formerly the main service rifle of the CMM."
	cost = 500
	contains = list(/obj/item/ammo_box/magazine/skm_762_40/empty)
	crate_name = "rifle crate"

/datum/supply_pack/faction/solfed/magazine/cm40
	name = "CM-40 - Box Magazine (7.62x40mm)"
	desc = "An 80 round box magazine for CM-40 light machine gun."
	cost = 1000
	contains = list(/obj/item/ammo_box/magazine/cm40_762_40_box/empty)

/datum/supply_pack/faction/solfed/magazine/mf4
	name = "CM-F4 - Magazine (.308)"
	desc = "A standard 10-round magazine for F4 platform DMRs."
	cost = 700
	contains = list(/obj/item/ammo_box/magazine/f4_308/empty)

/datum/supply_pack/faction/solfed/magazine/f90
	name = "CM-F90 - Magazine (6.5x57mm)"
	desc = "A large 5-round box magazine for the CM-F90 sniper rifles. Chambered in the powerful 6.5mm cartridge."
	cost = 700
	contains = list(/obj/item/ammo_box/magazine/f90/empty)

/datum/supply_pack/faction/solfed/magazine/ssg669
	name = "SSG-669C - Stripper Clip (8x58mm)"
	desc = "A 5-round stripper clip for the SSG-669C rifle. These rounds do good damage with significant armor penetration."
	cost = 700
	contains = list(/obj/item/ammo_box/a858/empty)

/* 
	MARK: 5.56x45mm 
*/

/datum/supply_pack/faction/solfed/magazine/g36_sh
	name = "G36 - Short Magazine (5.56x45mm)"
	desc = "Contains two 5.56x45mm magazines for the G36 family rifles, with a capacity of 20 rounds."
	contains = list(/obj/item/ammo_box/magazine/g36/sh/empty)
	cost = 700

/datum/supply_pack/faction/solfed/magazine/g36
	name = "G36 - Standard Magazine (5.56x45mm)"
	desc = "Contains two 5.56x45mm magazines for the G36 family rifles, with a capacity of 30 rounds."
	contains = list(/obj/item/ammo_box/magazine/g36/empty)
	cost = 1000

/datum/supply_pack/faction/solfed/magazine/g36_drum
	name = "G36 - Drum Magazine (5.56x45mm)"
	desc = "Contains 5.56x45mm drum magazine for the G36 family rifles, with a capacity of 75 rounds."
	contains = list(/obj/item/ammo_box/magazine/g36/drum/empty)
	cost = 5000

// MARK: Sol-Mag

/datum/supply_pack/faction/solfed/magazine/mag_556mm
	name = "Solar C - Magazine (5.56mm HITP)"
	desc = "Contains a 5.56mm magazine for the Pistole C, with a capacity of 12 rounds."
	contains = list(/obj/item/ammo_box/magazine/pistol556mm/empty)
	cost = 150

/datum/supply_pack/faction/solfed/magazine/fms_mag
	name = "Model H - Magazine (FE slug)"
	desc = "Contains a ferromagnetic slug magazine for the Model H pistol, with a capacity of 10 rounds."
	contains = list(/obj/item/ammo_box/magazine/modelh/empty)
	cost = 350

/datum/supply_pack/faction/solfed/magazine/gar_ammo
	name = "Solarian 'GAR' - Magazine (FE lance)"
	desc = "Contains a ferromagnetic lance magazine for the GAR rifle, with a capacity of 32 rounds."
	contains = list(/obj/item/ammo_box/magazine/gar/empty)
	cost = 500

/datum/supply_pack/faction/solfed/magazine/claris_ammo
	name = "Claris - Speedloader (FE pellet)"
	desc = "Contains a ferromagnetic pellet speedloader for the Claris rifle, with a capacity of 22 rounds."
	contains = list(/obj/item/ammo_box/amagpellet_claris/empty)
	cost = 400

/datum/supply_pack/faction/solfed/magazine/smgm9mm_mag
	name = "Vector/Saber - SMG Magazine (9x18mm)"
	desc = "Contains a 9x18mm magazine for the Vector and Saber SMGs, with a capacity of 30 rounds."
	contains = list(/obj/item/ammo_box/magazine/m9mm_expedition/empty)
	cost = 250

/datum/supply_pack/faction/solfed/magazine/a858
	name = "SSG-669C - Caseless Clip (8x58mm)"
	desc = "Contains a stripper 8x58mm clip for the SSG-669C rifle, with a capacity of  5 rounds. These rounds do good damage with significant armor penetration"
	contains = list(/obj/item/ammo_box/a858)
	cost = 500

/datum/supply_pack/faction/solfed/magazine/gauss
	name = "Gauss - Magazine (FE pellet)"
	desc = "Contains a Gauss magazine for the prototype gauss rifle, with a capacity of 24 rounds. Ferromagnetic pellets do okay damage with significant armor penetration."
	contains = list(/obj/item/ammo_box/magazine/gauss/empty)
	cost = 550

/datum/supply_pack/faction/solfed/magazine/p16
	name = "Model 82 - Magazine (5.56x42mm)"
	desc = "Contains a 5.56x42mm magazine for the assault rifles, with a capacity of 30 rounds. These rounds do moderate damage with good armor penetration."
	contains = list(/obj/item/ammo_box/magazine/p16/empty)
	cost = 550

/datum/supply_pack/faction/solfed/magazine/solgovcell
	name = "Solar Federation Weapon Cell"
	desc = "Contains a Solar Federation weapon cell, compatible with gauss weaponry."
	contains = list(/obj/item/stock_parts/cell/gun/solgov)
	cost = 500

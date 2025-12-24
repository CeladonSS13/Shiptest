/datum/supply_pack/faction/independent/magazine
	category = "Security - Magazines"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "magazine crate"

/**
	MARK:	Спидлоадеры
*/

/datum/supply_pack/faction/independent/magazine/c38_mag
	name = "Revolver - Speedloader (.38)"
	desc = "Contains a .38 speedloader for revolvers, containing 6 rounds."
	contains = list(/obj/item/ammo_box/c38/empty)
	cost = 100

/datum/supply_pack/faction/independent/magazine/a357_mag_independent
	name = "Revolver - Speedloader (.357)"
	desc = "Contains a .357 speedloader for revolvers, containing 6 rounds."
	contains = list(/obj/item/ammo_box/a357/empty)
	cost = 275

/datum/supply_pack/faction/independent/magazine/a44roum_speedloader
	name = "HP Montagne - Speedloader (.44)"
	desc = "Contains a .44 Roumain speedloader for the HP Montagne, with a capacity of 6 rounds."
	contains = list(/obj/item/ammo_box/a44roum_speedloader/empty)
	cost = 250

/**
	MARK:	Пистолеты
 */

/datum/supply_pack/faction/independent/magazine/m45_mag
	name = "Candor - Magazine (.45)"
	desc = "Contains a .45 ACP magazine for the Candor pistol, with a capacity of 8 rounds."
	contains = list(/obj/item/ammo_box/magazine/m45/empty)
	cost = 100

/* // Нахуй он вообще нужен в карго, калибр нужно бафнуть и на черный рынок
/datum/supply_pack/faction/independent/magazine/m17_mag
	name = "Micro Target Magazine"
	desc = "Contains a .22lr magazine for the Micro Target pistol, with a capacity of 10 rounds."
	contains = list(/obj/item/ammo_box/magazine/m17/empty)
	cost = 100
*/

/datum/supply_pack/faction/independent/magazine/m20_auto_elite
	name = "Auto Elite - Magazine (.44)"
	desc = "Contains a .44 Roumain magazine for the Auto Elite pistol, with a capacity of 9 rounds."
	contains = list(/obj/item/ammo_box/magazine/m20_auto_elite/empty)
	cost = 250

/datum/supply_pack/faction/independent/magazine/m10mm_mag
	name = "Ringneck - Magazine (10x22mm)"
	desc = "Contains a 10x22mm magazine for the Ringneck pistol, with a capacity of 8 rounds."
	contains = list(/obj/item/ammo_box/magazine/m10mm_ringneck/empty)
	cost = 350

/datum/supply_pack/faction/independent/magazine/glock_magazine
	name = "Glock - Magazine (9x18mm)"
	desc = "Contains 9x18mm magazine for the Glock pistol family, containing 17 rounds."
	contains = list(/obj/item/ammo_box/magazine/glock_standart/empty)
	cost = 500

/datum/supply_pack/faction/independent/magazine/usp_magazine
	name = "USP - Magazine (.45)"
	desc = "Contains .45 caliber magazine for the USP pistol, containing 12 rounds."
	contains = list(/obj/item/ammo_box/magazine/usp45_standart/empty)
	cost = 650

/**
	MARK:	Магазины
 */

/* // Нахуй он вообще нужен в карго, калибр нужно бафнуть и на черный рынок
/datum/supply_pack/faction/independent/magazine/m12_mag
	name = ".22lr Sporter Magazine"
	desc = "Contains a .22lr magazine for the Sporter Rifle, with a capacity of 25 rounds."
	contains = list(/obj/item/ammo_box/magazine/m12_sporter/empty)
	cost = 200
*/

/datum/supply_pack/faction/independent/magazine/woodsman_mag
	name = "Woodsman - Magazine (8x50mmR)"
	desc = "Contains an 8x50mmR magazine for the Woodsman Rifle, with a capacity of 5 rounds."
	contains = list(/obj/item/ammo_box/magazine/m23/empty)
	cost = 200

/datum/supply_pack/faction/independent/magazine/firestorm_mag

	name = "Firestorm Stick - Magazine (.44)"
	desc = "Contains a .44 magazine for the Hunter's Pride Firestorm SMG, with a capacity of 24 rounds."
	contains = list(/obj/item/ammo_box/magazine/c44_firestorm_mag/empty)
	cost = 300


/datum/supply_pack/faction/independent/magazine/m15_mag
	name = "Super Sporter - Magazine (7.62x40mm)"
	desc = "Contains a 7.62x40mm magazine for the Super Sporter Rifle, with a capacity of 20 rounds."
	contains = list(/obj/item/ammo_box/magazine/m15/empty)
	cost = 300

/datum/supply_pack/faction/independent/magazine/c45_cobra_mag
	name = "Cobra - Magazine (.45)"
	desc = "Contains a .45 magazine for the Cobra-20, with a capacity of 24 rounds."
	cost = 400
	contains = list(/obj/item/ammo_box/magazine/m45_cobra/empty)

/datum/supply_pack/faction/independent/magazine/skm_46_30
	name = "SKM-24v - Magazine (4.6x30mm)"
	desc = "Contains a 4.6x30mm for the SKM-24v, with a capacity of 30 rounds. These rounds do okay damage with average performance against armor."
	cost = 450
	contains = list(/obj/item/ammo_box/magazine/skm_46_30/empty)

/datum/supply_pack/faction/independent/magazine/boomslang_mag
	name = "Boomslang-90 - Magazine (6.5mm)"
	desc = "Contains a 6.5mm magazine for the Boomslang rifle platform, with a capacity of 5 rounds."
	contains = list(/obj/item/ammo_box/magazine/boomslang/short/empty)
	cost = 750

/datum/supply_pack/faction/independent/magazine/firestorm_40_mag
	name = "Firestorm - Pan Magazine (.44)"
	desc = "Contains a .44 pan magazine for the Hunter's Pride Firestorm SMG, with a capacity of 40 rounds."
	contains = list(/obj/item/ammo_box/magazine/c44_firestorm_mag/pan/empty)
	cost = 1000

/datum/supply_pack/faction/independent/magazine/skm_ammo
	name = "SKM - Magazine (7.62x40mm)"
	desc = "Contains a 7.62x40mm magazine for the SKM rifles, with a capacity of 20 rounds."
	contains = list(/obj/item/ammo_box/magazine/skm_762_40/empty)
	cost = 500

/datum/supply_pack/faction/independent/magazine/skm762_40_extended
	name = "SKM - Extended Magazine (7.62x40mm)"
	desc = "Contains a 7.62x40mm magazine for the SKM rifles, containing 40 rounds."
	contains = list(/obj/item/ammo_box/magazine/skm_762_40/extended/empty)
	cost = 1000

/**
	MARK:	Обоймы
 */

/datum/supply_pack/faction/independent/magazine/a300_clip
	name = "Scout Rifle - Clip (.300)"
	desc = "Contains a .300 clip for the Scout Sniper Rifle, with a capacity of 5 rounds."
	cost = 550
	contains = list(/obj/item/ammo_box/a300/empty)

/datum/supply_pack/faction/independent/magazine/a850r_clip
	name = "llestren - Clip (8x50mmR)"
	desc = "Contains a 8x50mmR clip for the HP-Illestren, with a capacity of 5 rounds."
	cost = 550
	contains = list(/obj/item/ammo_box/magazine/illestren_a850r/empty)

/**
	MARK:	Батареи
 */

/datum/supply_pack/faction/independent/magazine/kalixcell
	name = "Enegry - Etherbor Cell"
	desc = "Contains an Etherbor weapon cell, compatible with Etherbor armaments with a slightly higher capacity."
	contains = list(/obj/item/stock_parts/cell/gun/kalix)
	cost = 600

/datum/supply_pack/faction/independent/magazine/guncell
	name = "Enegry - Weapon Cell"
	desc = "Contains a weapon cell, compatible with laser guns."
	contains = list(/obj/item/stock_parts/cell/gun)
	cost = 650

// ===========================================================

// /datum/supply_pack/faction/independent/magazine/skm762_40_drum - [Balance?]
// 	name = "SKM Drum Magazine"
// 	desc = "Contains a 7.62x40mm magazine for the SKM rifles, with a capacity of 75 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/skm_762_40/drum/empty)
// 	cost = 5000


///datum/supply_pack/faction/independent/magazine/p16_ammo
	//name = "Набор магазинов для P-16 5.56mm"
	//desc = "Содержит два магазина калибра 5,56 мм для винтовки P-16, каждый из которых содержит по 30 патронов."
	//contains = list(/obj/item/ammo_box/magazine/p16,
					///obj/item/ammo_box/magazine/p16)
	//cost = 1950
	//Удаляем до возврата П16 в игру

// [Balance? No Lore.]

// /datum/supply_pack/faction/independent/magazine/g36_sh
// 	name = "G36 Short Magazine Double Pack"
// 	desc = "Contains two 5.56x45mm magazines for the G36 family rifles, with a capacity of 20 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/g36/sh/empty,
// 					/obj/item/ammo_box/magazine/g36/sh/empty)
// 	cost = 1400

// /datum/supply_pack/faction/independent/magazine/g36
// 	name = "G36 Standard Magazine Double Pack"
// 	desc = "Contains two 5.56x45mm magazines for the G36 family rifles, with a capacity of 30 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/g36/empty,
// 					/obj/item/ammo_box/magazine/g36/empty)
// 	cost = 1950

// /datum/supply_pack/faction/independent/magazine/g36_drum
// 	name = "G36 Drum Magazine"
// 	desc = "Contains 5.56x45mm drum magazine for the G36 family rifles, with a capacity of 75 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/g36/drum/empty)
// 	cost = 5000

/datum/supply_pack/faction/independent/magazine/morita_ammo_small
	name = "Morita MK1 - Short Magazine (.308)"
	desc = "Contains one .308 caliber magazines for the Morita family rifles, with a capacity of 10 rounds."
	contains = list(/obj/item/ammo_box/magazine/morita1/small/empty)
	cost = 500

/datum/supply_pack/faction/independent/magazine/morita_ammo
	name = "Morita MK1 - Standard Magazine (.308)"
	desc = "Contains one .308 caliber magazines for the Morita family rifles, with a capacity of 25 rounds."
	contains = list(/obj/item/ammo_box/magazine/morita1/empty)
	cost = 1000

/datum/supply_pack/faction/independent/magazine/morita_ammo_drum
	name = "Morita - MK1 Drum Magazine (.308)"
	desc = "Contains .308 caliber drum magazine for the Morita family rifles, with a capacity of 50 rounds."
	contains = list(/obj/item/ammo_box/magazine/morita1/drum/empty)
	cost = 2000

// //Магазины для оружия

/datum/supply_pack/faction/independent/magazine/a410_saiga
	name = "Saiga - Short Magazine (.410)"
	desc = "Contains two .410 caliber short magazines for the Saiga-410 shotgun, containing 6 rounds."
	contains = list(/obj/item/ammo_box/magazine/saiga/empty,
					/obj/item/ammo_box/magazine/saiga/empty)
	cost = 500

/datum/supply_pack/faction/independent/magazine/a410_saiga_medium
	name = "Saiga - Standard Magazine (.410)"
	desc = "Contains .410 caliber magazine for the Saiga-410 shotgun, containing 9 rounds."
	contains = list(/obj/item/ammo_box/magazine/saiga/medium/empty)
	cost = 1250

/datum/supply_pack/faction/independent/magazine/a410_saiga_drum
	name = "Saiga - Drum Magazine (.410)"
	desc = "Contains .410 caliber drum magazine for the Saiga-410 shotgun, containing 14 rounds."
	contains = list (/obj/item/ammo_box/magazine/saiga/drum/empty)
	cost = 2000

// ===========================================================

/* CM Lancaster */

// /datum/supply_pack/faction/independent/magazine/cm23_mag
// 	name = "10x22mm CM-23 Magazine"
// 	desc = "Contains a 10x22mm magazine for the CM-23 handgun, with a capacity of 10 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/cm23/empty)
// 	cost = 150

// /datum/supply_pack/faction/independent/magazine/cm70_mag
// 	name = "9x18mm CM-70 Magazine"
// 	desc = "Contains a 9x18mm magazine for the CM-70 machinepistol, with a capacity of 18 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/m9mm_cm70/empty)
// 	cost = 350

// /datum/supply_pack/faction/independent/magazine/cm357_mag
// 	name = ".357 CM-357 Magazine"
// 	desc = "Contains a .357 magazine for the CM-357 automag pistol, with a capacity of 7 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/cm357/empty)
// 	cost = 250

// /datum/supply_pack/faction/independent/magazine/cm5_mag
// 	name = "9x18mm CM-5 Magazine"
// 	desc = "Contains a 9x18mm magazine for the CM-5 SMG, with a capacity of 30 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/cm5_9mm/empty)
// 	cost = 300

// /datum/supply_pack/faction/independent/magazine/cm82_mag
// 	name = "5.56mm CM-82 Magazine"
// 	desc = "Contains a 5.56mm magazine for the CM-82 rifle, with a capacity of 30 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/p16/empty)
// 	cost = 500

// /datum/supply_pack/faction/independent/magazine/f4_mag
// 	name = ".308 F4 Magazine"
// 	desc = "Contains a .308 magazine for SsG-04 and CM-F4 platform rifles, with a capacity of 10 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/f4_308/empty)
// 	cost = 500

// /datum/supply_pack/faction/independent/magazine/f90
// 	name = "CM-F90 Magazine"
// 	desc = "Contains a 6.5mm magazine for use with the CM-F90 sniper rifle, with a capacity of 5 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/f90/empty)
// 	cost = 750

// /datum/supply_pack/faction/independent/magazine/cm15
// 	name = "12ga CM-15 Magazine"
// 	desc = "Contains an 8-round 12ga magazine for the CM-15 Automatic Shotgun."
// 	contains = list(/obj/item/ammo_box/magazine/cm15_12g/empty)
// 	cost = 750

// /datum/supply_pack/faction/independent/magazine/cm40
// 	name = "7.62x40mm CM-40 Magazine"
// 	desc = "Contains a 7.62x40mm CLIP box for the CM-40 Squad Automatic Weapon. Consider designating an ammo bearer, with a capacity of 80 rounds."
// 	contains = list(/obj/item/ammo_box/magazine/cm40_762_40_box/empty)
// 	cost = 1000

/* etherbor */

// /datum/supply_pack/faction/independent/magazine/pgfcell
// 	name = "Military-Grade Etherbor Cell"
// 	desc = "Contains a military-grade Etherbor weapon cell produced for the PGFMC, compatible with Etherbor armaments with a significantly higher capacity."
// 	contains = list(/obj/item/stock_parts/cell/gun/pgf)
// 	cost = 1000

/* Expand once the energy weapons have been actually expanded upon */

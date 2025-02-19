/datum/supply_pack/faction/independent/magazine
	group = "Magazines"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "magazine crate"
	faction_discount = 0

/**
	MARK:	Спидлоадеры
*/
/datum/supply_pack/faction/independent/magazine/c38_speedloader
	name = ".38 Speedloader Crate"
	desc = "Contains a .38 speedloader for revolvers, containing six rounds."
	contains = list(/obj/item/ammo_box/c38/empty)
	cost = 250

/datum/supply_pack/faction/independent/magazine/a44roum_speedloader
	name = ".44 Roumain Speedloader Crate"
	desc = "Contains a .44 Roumain speedloader for the HP Montagne, with a capacity of six rounds."
	contains = list(/obj/item/ammo_box/a44roum_speedloader/empty)
	cost = 400

/datum/supply_pack/faction/independent/magazine/a357_speedloader
	name = ".357 Speedloader Crate"
	desc = "Contains a .357 speedloader for revolvers, with a capacity of six rounds."
	contains = list(/obj/item/ammo_box/a357/empty)
	cost = 250

/**
	MARK:	Пистолетные магазины
 */
/datum/supply_pack/faction/independent/magazine/m45_mag
	name = ".45 ACP Candor Magazine Crate"
	desc = "Contains a .45 ACP magazine for the Candor pistol, with a capacity of eight rounds."
	contains = list(/obj/item/ammo_box/magazine/m45/empty)
	cost = 350

/datum/supply_pack/faction/independent/magazine/m10mm_mag
	name = "10mm Ringneck Magazine Crate"
	desc = "Contains a 10mm magazine for the Ringneck pistol, with a capacity of eight rounds."
	contains = list(/obj/item/ammo_box/magazine/m10mm_ringneck/empty)
	cost = 350


/**
	MARK:	Магазины
 */
/datum/supply_pack/faction/independent/magazine/skm_mag
	name = "7.62x40mm SKM Magazine Crate"
	desc = "Contains a 7.62x40mm magazine for the SKM rifles, with a capacity of twenty rounds."
	contains = list(/obj/item/ammo_box/magazine/skm_762_40/empty)
	cost = 650


/datum/supply_pack/faction/independent/magazine/boomslang_mag
	name = "6.5x57 Boomslang-90 Magazine Crate"
	desc = "Contains a 6.5x57 CLIP magazine for the Boomslang rifle platform, with a capacity of five rounds."
	contains = list(/obj/item/ammo_box/magazine/boomslang/short/empty)
	cost = 750

/datum/supply_pack/faction/independent/magazine/c45_cobra_mag
	name = ".45 Cobra Magazine Crate"
	desc = "Contains a .45 magazine for the Cobra-20, with a capacity of 24 rounds."
	cost = 400
	contains = list(/obj/item/ammo_box/magazine/m45_cobra/empty)


/**
	MARK:	Обоймы
 */
/datum/supply_pack/faction/independent/magazine/a300_clip
	name = ".300 Scout Rifle Clip Crate"
	desc = "Contains a .300 clip for the Scout Sniper Rifle, with a capacity of five rounds."
	cost = 550
	contains = list(/obj/item/ammo_box/a300/empty)

/datum/supply_pack/faction/independent/magazine/a850r_clip
	name = "8x50mmR Illestren Clip Crate"
	desc = "Contains a 8x50mmR clip for the HP-Illestren, with a capacity of five rounds."
	cost = 550
	contains = list(/obj/item/ammo_box/magazine/illestren_a850r/empty)

/**
	MARK:	Батареи
 */
/datum/supply_pack/faction/independent/magazine/guncell
	name = "Weapon Cell Crate"
	desc = "Contains a weapon cell, compatible with laser guns."
	contains = list(/obj/item/stock_parts/cell/gun)
	cost = 650

/datum/supply_pack/faction/independent/magazine/kalixcell
	name = "Etherbor Cell Crate"
	desc = "Contains an Etherbor weapon cell, compatible with Etherbor armaments with a slightly higher capacity."
	contains = list(/obj/item/stock_parts/cell/gun/kalix)
	cost = 600

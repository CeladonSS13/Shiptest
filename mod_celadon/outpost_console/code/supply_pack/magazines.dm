/datum/supply_pack/magazine
	category = "Security - Magazines"

/datum/supply_pack/magazine/co9mm_mag
	name = "\"Challenger\" - Magazine (9x18mm)"
	desc = "Contains a 9x18mm magazine for the standard-issue \"Challenger\" pistol, with a capacity of 12 rounds."
	faction_locked = TRUE

/datum/supply_pack/magazine/co9mm_mag/inteq
	name = "\"Commisioner\" - Magazine (9x18mm)"
	desc = "Contains a 9x18mm magazine for \"Commisioner\" pistols, with a capacity of 12 rounds. These rounds do okay damage, but struggle against armor."
	faction = /datum/faction/inteq

/datum/supply_pack/magazine/c38_mag
	name = "Revolver - Speedloader (.38)"
	desc = "Contains a .38 speedloader for revolvers, containing 6 rounds."

/datum/supply_pack/magazine/a357_mag
	name = "Revolver - Speedloader (.357)"
	desc = "Contains a .357 speedloader for revolvers, containing 6 rounds."
	contains = list(/obj/item/ammo_box/a357/empty)
	cost = 275
	faction = null

/datum/supply_pack/magazine/a44roum_speedloader
	name = "HP Montagne - Speedloader (.44)"
	desc = "Contains a .44 Roumain speedloader for the HP Montagne, with a capacity of 6 rounds."
	cost = 250

/datum/supply_pack/magazine/m45_mag
	name = "Candor - Magazine (.45)"
	desc = "Contains a .45 ACP magazine for the Candor pistol, with a capacity of 8 rounds."

/datum/supply_pack/magazine/m17_mag
	name = "Micro Target Magazine"
	desc = "Contains a .22lr magazine for the Micro Target pistol, with a capacity of 10 rounds."
	available = FALSE // Нахуй он вообще нужен в карго, калибр нужно бафнуть и на черный рынок

/datum/supply_pack/magazine/m20_auto_elite
	name = "Auto Elite - Magazine (.44)"
	desc = "Contains a .44 Roumain magazine for the Auto Elite pistol, with a capacity of 9 rounds."

/datum/supply_pack/magazine/m10mm_mag
	name = "Ringneck - Magazine (10x22mm)"
	desc = "Contains a 10x22mm magazine for the Ringneck pistol, with a capacity of 8 rounds."
	cost = 350
	faction_discount = 50

/datum/supply_pack/magazine/glock
	name = "Glock - Magazine (9x18mm)"
	desc = "Contains 9x18mm magazine for the Glock pistol family, containing 17 rounds."
	contains = list(/obj/item/ammo_box/magazine/glock_standart/empty)
	cost = 500

/datum/supply_pack/magazine/usp_magazine
	name = "USP - Magazine (.45)"
	desc = "Contains .45 caliber magazine for the USP pistol, containing 12 rounds."
	contains = list(/obj/item/ammo_box/magazine/usp45_standart/empty)
	cost = 650

/datum/supply_pack/magazine/m12_mag
	available = FALSE // Нахуй он вообще нужен в карго, калибр нужно бафнуть и на черный рынок

/datum/supply_pack/magazine/woodsman_mag
	name = "Woodsman - Magazine (8x50mmR)"
	desc = "Contains an 8x50mmR magazine for the Woodsman Rifle, with a capacity of 5 rounds."

/datum/supply_pack/magazine/firestorm_mag

	name = "Firestorm Stick - Magazine (.44)"
	desc = "Contains a .44 magazine for the Hunter's Pride Firestorm SMG, with a capacity of 24 rounds."

/datum/supply_pack/magazine/m15_mag
	name = "Super Sporter - Magazine (7.62x40mm)"
	desc = "Contains a 7.62x40mm magazine for the Super Sporter Rifle, with a capacity of 20 rounds."

/datum/supply_pack/magazine/c45_cobra_mag
	name = "Cobra - Magazine (.45)"
	desc = "Contains a .45 magazine for the Cobra-20, with a capacity of 24 rounds."
	cost = 400
	faction_discount = 25

/datum/supply_pack/magazine/skm_46_30
	name = "SKM-24v - Magazine (4.6x30mm)"
	desc = "Contains a 4.6x30mm for the SKM-24v, with a capacity of 30 rounds. These rounds do okay damage with average performance against armor."
	cost = 450
	contains = list(/obj/item/ammo_box/magazine/skm_46_30/empty)

/datum/supply_pack/magazine/boomslang_mag
	name = "Boomslang-90 - Magazine (6.5mm)"
	desc = "Contains a 6.5mm magazine for the Boomslang rifle platform, with a capacity of 5 rounds."
	cost = 750

/datum/supply_pack/magazine/firestorm_pan_mag
	name = "Firestorm - Pan Magazine (.44)"
	desc = "Contains a .44 pan magazine for the Hunter's Pride Firestorm SMG, with a capacity of 40 rounds."
	cost = 1000

/datum/supply_pack/magazine/skm_ammo
	name = "SKM - Magazine (7.62x40mm)"
	desc = "Contains a 7.62x40mm magazine for the SKM rifles, with a capacity of 20 rounds."
	cost = 500

/datum/supply_pack/magazine/skm_ammo_extended
	name = "SKM - Extended Magazine (7.62x40mm)"
	desc = "Contains a 7.62x40mm magazine for the SKM rifles, containing 40 rounds."
	cost = 1000
	faction_locked = FALSE

/datum/supply_pack/magazine/a300_clip
	name = "Scout Rifle - Clip (.300)"
	desc = "Contains a .300 clip for the Scout Sniper Rifle, with a capacity of 5 rounds."
	cost = 550
	contains = list(/obj/item/ammo_box/a300/empty)

/datum/supply_pack/magazine/a850r_clip
	name = "llestren - Clip (8x50mmR)"
	desc = "Contains a 8x50mmR clip for the HP-Illestren, with a capacity of 5 rounds."
	cost = 550
	contains = list(/obj/item/ammo_box/magazine/illestren_a850r/empty)

/datum/supply_pack/magazine/kalixcell
	name = "Enegry - Etherbor Cell"

/datum/supply_pack/magazine/guncell
	name = "Enegry - Weapon Cell"
	desc = "Contains a weapon cell, compatible with laser guns."
	cost = 650
	faction = /datum/faction/nt
	faction_discount = 20

/datum/supply_pack/magazine/morita_small
	name = "Morita MK1 - Short Magazine (.308)"
	desc = "Contains one .308 caliber magazines for the Morita family rifles, with a capacity of 10 rounds."
	contains = list(/obj/item/ammo_box/magazine/morita1/small/empty)
	cost = 500

/datum/supply_pack/magazine/morita
	name = "Morita MK1 - Standard Magazine (.308)"
	desc = "Contains one .308 caliber magazines for the Morita family rifles, with a capacity of 25 rounds."
	contains = list(/obj/item/ammo_box/magazine/morita1/empty)
	cost = 1000

/datum/supply_pack/magazine/morita_drum
	name = "Morita - MK1 Drum Magazine (.308)"
	desc = "Contains .308 caliber drum magazine for the Morita family rifles, with a capacity of 50 rounds."
	contains = list(/obj/item/ammo_box/magazine/morita1/drum/empty)
	cost = 2000

/datum/supply_pack/magazine/saiga
	name = "Saiga - Short Magazine (.410)"
	desc = "Contains .410 caliber short magazine for the Saiga-410 shotgun, containing 6 rounds."
	contains = list(/obj/item/ammo_box/magazine/saiga/empty)
	cost = 250

/datum/supply_pack/magazine/saiga_medium
	name = "Saiga - Standard Magazine (.410)"
	desc = "Contains .410 caliber magazine for the Saiga-410 shotgun, containing 9 rounds."
	contains = list(/obj/item/ammo_box/magazine/saiga/medium/empty)
	cost = 1250

/datum/supply_pack/magazine/saiga_drum
	name = "Saiga - Drum Magazine (.410)"
	desc = "Contains .410 caliber drum magazine for the Saiga-410 shotgun, containing 14 rounds."
	contains = list (/obj/item/ammo_box/magazine/saiga/drum/empty)
	cost = 2000

/datum/supply_pack/magazine/cm357_mag
	name = "CM-357 - Magazine (.357)"
	desc = "A 7-round magazine designed for the CM-357 pistol."
	cost = 350
	faction_locked = TRUE

/datum/supply_pack/magazine/cm70_mag
	name = "CM-70 - Magazine (9x18mm)"
	desc = "A 18-round magazine designed for the CM-70 machine pistol."
	cost = 350
	faction_locked = TRUE

/datum/supply_pack/magazine/cm15
	name = "CM-15 - Magazine (12g)"
	desc = "An almost straight, 8-round magazine designed for the CM-15 shotgun."
	faction_locked = TRUE

/datum/supply_pack/magazine/cm5_mag
	name = "CM-5 - Magazine (9x18mm)"
	cost = 350
	faction_locked = TRUE

/datum/supply_pack/magazine/cm82_mag
	name = "CM-82 - Magazine (5.56x42mm)"
	desc = "A simple, 30-round magazine for 5.56x42mm assault rifles."
	cost = 500
	faction_locked = TRUE

/datum/supply_pack/magazine/cm40
	name = "CM-40 - Box Magazine (7.62x40mm)"
	desc = "An 80 round box magazine for CM-40 light machine gun."
	faction_locked = TRUE

/datum/supply_pack/magazine/f4_mag
	name = "CM-F4 - Magazine (.308)"
	desc = "A standard 10-round magazine for CM-F4 and SsG-04 platform DMRs."
	cost = 700
	faction_locked = TRUE

/datum/supply_pack/magazine/f4_mag/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/magazine/f90
	name = "CM-F90 - Magazine (6.5x57mm)"
	desc = "A large 5-round box magazine for the CM-F90 and SSG-08 Saluki sniper rifles."
	cost = 700
	faction_locked = TRUE

/datum/supply_pack/magazine/f90/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/magazine/ssg669
	name = "SSG-669C - Stripper Clip (8x58mm)"
	desc = "A 5-round stripper clip for the SSG-669C rifle."
	cost = 700
	contains = list(/obj/item/ammo_box/a858/empty)

/datum/supply_pack/magazine/g36_short
	name = "G36 - Short Magazine (5.56x45mm)"
	desc = "Contains magazine for the G36 family rifles, with a capacity of 20 rounds."
	contains = list(/obj/item/ammo_box/magazine/g36/sh/empty)
	cost = 500
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/magazine/g36_short/solfed
	cost = 700
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/g36
	name = "G36 - Standard Magazine (5.56x45mm)"
	desc = "Contains magazine for the G36 family rifles, with a capacity of 30 rounds."
	contains = list(/obj/item/ammo_box/magazine/g36/empty)
	cost = 1000
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/magazine/g36/solfed
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/g36_drum
	name = "G36 - Drum Magazine (5.56x45mm)"
	desc = "Contains drum magazine for the G36 family rifles, with a capacity of 75 rounds."
	contains = list(/obj/item/ammo_box/magazine/g36/drum/empty)
	cost = 3000
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/magazine/g36_drum/solfed
	cost = 5000
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/mag_556mm
	name = "Solar C - Magazine (5.56mm HITP)"
	desc = "Contains a 5.56mm magazine for the Pistole C, with a capacity of 12 rounds."
	faction_locked = TRUE
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/fms_mag
	name = "Model H - Magazine (FE slug)"
	desc = "Contains a ferromagnetic slug magazine for the Model H pistol, with a capacity of 10 rounds."
	faction_locked = TRUE
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/gar_ammo
	name = "Solarian 'GAR' - Magazine (FE lance)"
	desc = "Contains a ferromagnetic lance magazine for the GAR rifle, with a capacity of 32 rounds."
	faction_locked = TRUE
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/claris_ammo
	name = "Claris - Speedloader (FE pellet)"
	desc = "Contains a ferromagnetic pellet speedloader for the Claris rifle, with a capacity of 22 rounds."
	faction_locked = TRUE
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/expedition_mag
	available = FALSE

/datum/supply_pack/magazine/smgm9mm_mag
	name = "Vector/Saber - SMG Magazine (9x18mm)"
	desc = "Contains a 9x18mm magazine for the Vector and Saber SMGs, with a capacity of 30 rounds."
	faction_locked = TRUE

/datum/supply_pack/magazine/smgm9mm_mag/solfed
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/gauss
	name = "Gauss - Magazine"
	desc = "Contains a Gauss magazine for the prototype gauss rifle, with a capacity of 24 rounds."
	contains = list(/obj/item/ammo_box/magazine/gauss/empty)
	cost = 550
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/magazine/gauss/solfed
	faction = /datum/faction/solgov

/datum/supply_pack/magazine/solgovcell
	name = "Solar Federation Weapon Cell"
	desc = "Contains a Solar Federation weapon cell, compatible with gauss weaponry."

/datum/supply_pack/magazine/wt550_mag
	name = "WT-550 - Magazine (4.6x30mm)"
	desc = "Contains a 4.6x30mm magazine for the WT-550 Auto Rifle, with a capacity of 30 rounds."
	faction_locked = TRUE

/datum/supply_pack/magazine/wt550_mag/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/magazine/gun_cell_upgraded
	name = "E-Cell - Upgraded Weapon Cell"
	desc = "Contains an upgraded weapon cell, compatible with laser guns. For NT use only."
	contains = list(/obj/item/stock_parts/cell/gun/upgraded)
	cost = 1000
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/magazine/gun_cell_mini
	name = "E-Mini - NT Energy Weapon Miniature Cell"
	desc = "The crate contains a miniature battery for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/mini)
	cost = 50
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/magazine/gun_cell_large
	name = "E-Large - NT Energy Weapon Extra-Large Cell"
	desc = "The crate contains a EXTRA-LARGE battery for energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/large)
	cost = 900
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/magazine/nt_guncell
	name = "P-Cell - Sharplite Weapon Cell"
	desc = "Contains a proprietary weapon cell, compatible with most Sharplite energy weapons."
	contains = list(/obj/item/stock_parts/cell/gun/sharplite)
	cost = 1750
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/magazine/upgradedguncell
	name = "P-Cell - Sharplite Upgraded Weapon Cell"
	contains = list(/obj/item/stock_parts/cell/gun/sharplite/plus)
	cost = 3500

/datum/supply_pack/magazine/upgradedguncellinteq
	available = FALSE

/datum/supply_pack/magazine/himehabu_mag
	name = "Himehabu Magazine"
	desc = "Contains a .22lr magazine for the Himehabu pistol, with a capacity of 10 rounds."
	available = FALSE

/datum/supply_pack/magazine/asp_mag
	name = "Asp - Magazine (5.7x39mm)"
	faction_locked = TRUE

/datum/supply_pack/magazine/sidewinder_mag
	name = "Sidewinder - Magazine (5.7x39mm)"
	desc = "Contains a 5.7x39mm magazine for the Sidewinder SMG, with a capacity of 30 rounds."
	faction_locked = TRUE

/datum/supply_pack/magazine/short_hydra_mag
	name = "SBR-80 DMR - Short Magazine (5.56x42mm)"
	desc = "Contains a 5.56x42mm made specially for the SBR-80 Designated Marksman Rifle, with a capacity of 20 rounds."
	cost = 400
	faction_locked = TRUE

/datum/supply_pack/magazine/hydra_mag
	name = "SMR-80 - Rifle Magazine (5.56x42mm)"
	desc = "Contains a 5.56x42mm for the SMR-80 assault rifle, with a capacity of 30 rounds."
	cost = 500
	faction_locked = TRUE

/datum/supply_pack/magazine/saw_mag
	name = "SAW-80 - Magazine (5.56x42mm)"
	desc = "Contains a 5.56x42mm magazine for the SAW-80 Squad Automatic Weapon, with a capacity of 60 rounds. Count your shots, they run out fast."
	faction_locked = TRUE

/datum/supply_pack/magazine/boomslang_mag_extended
	name = "MSR-90 'Boomslang' - Magazine (6.5mm)"
	desc = "Contains a 6.5mm magazine for the Boomslang rifle platform, with a capacity of 10 rounds."
	cost = 1500
	faction_locked = TRUE

/datum/supply_pack/magazine/bulldog
	name = "Bulldog - Magazine (12g)"
	desc = "Contains a 12ga box magazine for the Bulldog weapons platform, with a capacity of 8 rounds."
	cost = 750
	faction_locked = TRUE

/datum/supply_pack/magazine/bulldog/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/magazine/bulldog_12
	name = "Bulldog - Drum Magazine (12g)"
	desc = "Contains a 12ga drum magazine for the Bulldog weapons platform, with a capacity of 12 rounds."
	cost = 1500
	faction_locked = TRUE

/datum/supply_pack/magazine/bulldog_12/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/magazine/m9mm_rattlesnake
	name = "Kingsnake - Magazine (9x18mm)"
	desc = "Contains a 9x18mm magazine for the Kingsnake machine pistol, with a capacity of 18 rounds."
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/magazine/mongrel_mag
	name = "Mongrel - Magazine (10x22mm)"
	desc = "Contains a 10x22mm magazine for the SKM-44v 'Mongrel' SMG, with a capacity of 24 rounds."
	cost = 300
	faction_locked = TRUE

/datum/supply_pack/magazine/podium_mag
	name = "P46 Schnauzer - Magazine (4.6x30mm)"
	desc = "Contains a 4.6x30mm magazine for the Podium and Schnauzer pistols, with a capacity of 12 rounds."
	cost = 300
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/magazine/rottweiler_mag
	name = "Rottweiler - Box Magazine (.308)"
	desc = "Contains a .308 box magazine for the KM-05 'Rottweiler' LMG, with a capacity of 50 rounds."
	faction_locked = TRUE

/datum/supply_pack/magazine/skm_drum
	name = "SKM - Drum Magazine (7.62x40mm)"
	desc = "Contains a 7.62x40mm magazine for the SKM rifles, with a capacity of 75 rounds."
	contains = list(/obj/item/ammo_box/magazine/skm_762_40/drum/empty)
	cost = 5000
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/magazine/cm23_mag
	available = FALSE

/datum/supply_pack/magazine/invictus_mag
	available = FALSE

/datum/supply_pack/magazine/tinyguncell
	available = FALSE

/datum/supply_pack/magazine/slammer
	available = FALSE

/datum/supply_pack/faction/independent/ammo
	group = "Bulk Ammunition"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "ammo crate"

/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> Misc
> .22lr
> .38
> 9x18
> 10x22
> .44
> .45
> .357
> 4.6x30
> 5.7x39
> 5.56 caseless
> [*] .410
> 12 Gauge
> 5.56x42 (Hydra)
> [-] 5.56x45 (G36)
> 7.62
> .45-70
> .300
> .308
> 7.5x64
> 8x50
> 8x58
> .50 BMG
> ferro pellets
> ferroslugs
> ferro lances

Некоторые хорошие патроны были закомментированы и перенесены в отдельные фракционные карго.

MARK: Misc
*/

/datum/supply_pack/faction/independent/ammo/ammoblank_ammo_disk
	name = "Blank Ammo Design Disk Crate"
	desc = "Run your own training drills!"
	cost = 1000
	contains = list(/obj/item/disk/design_disk/blanks)

/*
MARK: .22lr
*/

/datum/supply_pack/faction/independent/ammo/ammoc22lr
	name = ".22 LR Ammo Box Crate"
	desc = "Contains a 100-round ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc22lr_hp
	name = ".22 LR HP Ammo Box Crate"
	desc = "Contains a 100-round hollow point ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/hp)
	cost = 310

/datum/supply_pack/faction/independent/ammo/ammoc22lr_ap
	name = ".22 LR AP Ammo Box Crate"
	desc = "Contains a 100-round armour piercing ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/ap)
	cost = 310

/*
MARK: .38
*/

/datum/supply_pack/faction/independent/ammo/ammoc38
	name = ".38 Ammo Boxes Crate"
	desc = "Contains two 45-round ammo boxes for refilling .38 weapons."
	cost = 250
	contains = list(/obj/item/storage/box/ammo/c38,
					/obj/item/storage/box/ammo/c38)
	crate_name = "ammo crate"

/*
MARK: 9x18
*/

/datum/supply_pack/faction/independent/ammo/ammoc9mm_ammo_box
	name = "9x18mm Ammo Box Crate"
	desc = "Contains a 45-round 9x18mm box for pistols and SMGs such as the Commander or Saber."
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/independent/ammo/ammoc9mmap_ammo_box
	name = "9x18mm AP Ammo Box Crate"
	desc = "Contains a 45-round 9x18mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc9mmhp_ammo_box
	name = "9x18mm HP Ammo Box Crate"
	desc = "Contains a 45-round 9x18mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc9mmrubber_ammo_box
	name = "9x18mm Rubber Ammo Box Crate"
	desc = "Contains a 45-round 9x18mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/*
MARK: 10x22
*/

/datum/supply_pack/faction/independent/ammo/ammoc10mm_ammo_box
	name = "10x22mm Ammo Box Crate"
	desc = "Contains a 36-round 10x22mm box for pistols and SMGs like the Ringneck or the SkM-44(k)."
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 210

// /datum/supply_pack/faction/independent/ammo/ammoc10mmap_ammo_box
// 	name = "10x22mm AP Ammo Box Crate"
// 	desc = "Contains a 36-round 10x22mm box loaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/c10mm_ap)
// 	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc10mmhp_ammo_box
	name = "10x22mm HP Ammo Box Crate"
	desc = "Contains a 36-round 10x22mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c10mm_hp)
	cost = 260

// /datum/supply_pack/faction/independent/ammo/ammoc10mmrubber_ammo_box
// 	name = "10x22mm Rubber Ammo Box Crate"
// 	desc = "Contains a 36-round 10mm box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/c10mm_rubber)
// 	cost = 210

/*
MARK: .44
*/

/datum/supply_pack/faction/independent/ammo/ammoa44roum
	name = ".44 Roumain Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo for revolvers such as the Shadow and Montagne."
	contains = list(/obj/item/storage/box/ammo/a44roum)
	cost = 210

/datum/supply_pack/faction/independent/ammo/ammoa44roum_rubber
	name = ".44 Roumain Rubber Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/a44roum_rubber)
	cost = 210

/datum/supply_pack/faction/independent/ammo/ammoa44roum_hp
	name = ".44 Roumain HP Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a44roum_hp)
	cost = 265

/*
MARK: .45
*/

/datum/supply_pack/faction/independent/ammo/ammoc45_ammo_box
	name = ".45 Ammo Box Crate"
	desc = "Contains a 36-round .45 box for pistols and SMGs like the Candor or the C-20r."
	contains = list(/obj/item/storage/box/ammo/c45)
	cost = 210

// /datum/supply_pack/faction/independent/ammo/ammoc45ap_ammo_box
// 	name = ".45 AP Ammo Box Crate"
// 	desc = "Contains a 36-round .45 box loaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/c45_ap)
// 	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc45hp_ammo_box
	name = ".45 HP Ammo Box Crate"
	desc = "Contains a 36-round .45 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c45_hp)
	cost = 260

// /datum/supply_pack/faction/independent/ammo/ammoc45mmrubber_ammo_box
// 	name = ".45 Rubber Ammo Box Crate"
// 	desc = "Contains a 36-round .45 box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/c45_rubber)
// 	cost = 210

/*
MARK: .357
*/

/datum/supply_pack/faction/independent/ammo/ammoa357_ammo_box
	name = ".357 Ammo Box Crate"
	desc = "Contains a 36-round .357 box for revolvers such as the Scarborough Revolver and the HP Firebrand."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 255

/datum/supply_pack/faction/independent/ammo/ammoa357hp_ammo_box
	name = ".357 HP Ammo Box Crate"
	desc = "Contains a 36-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 320

/datum/supply_pack/faction/independent/ammo/ammoa357match_ammo_box
	name = ".357 Match Ammo Box Crate"
	desc = "Contains a 36-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 320

/*
MARK: 4.6x30
*/

/datum/supply_pack/faction/independent/ammo/ammoc46x30mm_boxcrate
	name = "4.6x30mm Ammo Box Crate"
	desc = "Contains an 80-round 4.6x30mm box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm)
	cost = 295

// /datum/supply_pack/faction/independent/ammo/ammoc46x30mm_ap
// 	name = "4.6x30mm AP Ammo Box Crate"
// 	desc = "Contains a 80-round 4.6x30mm armour piercing box for PDWs such as the WT-550."
// 	contains = list(/obj/item/storage/box/ammo/c46x30mm/ap)
// 	cost = 370

/datum/supply_pack/faction/independent/ammo/ammoc46x30mm_hp
	name = "4.6x30mm HP Ammo Box Crate"
	desc = "Contains a 80-round 4.6x30mm hollow point box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm/hp)
	cost = 370

/*
MARK: 5.7x39
*/

/datum/supply_pack/faction/independent/ammo/ammoc57x39mm_boxcrate
	name = "5.7x39mm Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39)
	cost = 395

// /datum/supply_pack/faction/independent/ammo/ammoc57x39mm_ap
// 	name = "5.7x39mm AP Ammo Box Crate"
// 	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
// 	contains = list(/obj/item/storage/box/ammo/c57x39/ap)
// 	cost = 370

/datum/supply_pack/faction/independent/ammo/ammoc57x39mm_hp
	name = "5.7x39mm HP Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm Hollow Point box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/hp)
	cost = 470

/*
MARK: 5.56 caseless
*/

/datum/supply_pack/faction/independent/ammo/ammoc556mmHITP_ammo_box
	name = "5.56 Caseless Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless box for SolGov sidearms like the Pistole C."
	contains = list(/obj/item/storage/box/ammo/c556mm)
	cost = 250

// /datum/supply_pack/faction/independent/ammo/ammoc556mmHITPap_ammo_box
// 	name = "5.56 caseless AP Ammo Box Crate"
// 	desc = "Contains a 48-round 5.56mm caseless boxloaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/c556mm_ap)
// 	cost = 205

/datum/supply_pack/faction/independent/ammo/ammoc556mmhitphp_ammo_box
	name = "5.56 Caseless HP Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c556mm_hp)
	cost = 300

// /datum/supply_pack/faction/independent/ammo/ammoc556HITPrubber_ammo_box
// 	name = "5.56 Caseless Rubber Ammo Box Crate"
// 	desc = "Contains a 48-round 5.56 caseless box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/c556mm_rubber)
// 	cost = 165

/*
MARK: 12 Gauge
*/

/datum/supply_pack/faction/independent/ammo/ammobuckshot
	name = "12g Buckshot Crate"
	desc = "Contains a box of 32 buckshot shells for use in lethal persuasion."
	cost = 520
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/independent/ammo/ammoslugs
	name = "12g Shotgun Slug Crate"
	desc = "Contains a box of 32 slug shells for use in lethal persuasion."
	cost = 225
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/independent/ammo/ammoblank_shells
	name = "12g Blank Shell Crate"
	desc = "Contains a box of blank shells."
	cost = 220
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/independent/ammo/ammorubbershot
	name = "12g Rubbershot Crate"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 520
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/independent/ammo/ammotechshells
	name = "12g Unloaded Shotgun Technological Shells Crate"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 210
	contains = list(/obj/item/storage/box/techshot)

/*
MARK: 5.56x42
*/

/datum/supply_pack/faction/independent/ammo/ammoa556_ammo_box
	name = "5.56x42mm Ammo Box Crate"
	desc = "Contains one 60-round 5.56x42mm box for most newer rifles."
	contains = list(/obj/item/storage/box/ammo/a556_42)
	cost = 300

// /datum/supply_pack/faction/independent/ammo/ammoa556_ap
// 	name = "5.56x42mm AP Ammo Box Crate"
// 	desc = "Contains one 60-round 5.56x42mm CLIP Armour Piercing box for most newer rifles."
// 	contains = list(/obj/item/storage/box/ammo/a556_42/ap)
// 	cost = 375

/datum/supply_pack/faction/independent/ammo/ammoa556_hp
	name = "5.56x42mm HP Ammo Box Crate"
	desc = "Contains one 60-round 5.56x42mm Hollow Point box for most newer rifles."
	contains = list(/obj/item/storage/box/ammo/a556_42/hp)
	cost = 375

/*
MARK: 5.56x45
*/

// /datum/supply_pack/faction/independent/ammo/box556_box
// 	name = "5.56mm Ammo Box Crate"
// 	desc = "A box of standard 5.56x45mm ammo."
// 	contains = list(/obj/item/storage/box/ammo/a556_box)
// 	cost = 500

// /datum/supply_pack/faction/independent/ammo/box556/a856_box
// 	name = "5.56mm EP Ammo Box Crate"
// 	desc = "A box of enhanced performance 5.56x45mm ammo."
// 	contains = list(/obj/item/storage/box/ammo/a556_box/a856)
// 	cost = 650

/*
MARK: 7.62
*/

/datum/supply_pack/faction/independent/ammo/ammoa762_ammo_box
	name = "7.62x40mm Ammo Box Crate"
	desc = "Contains one 60-round 7.62x40mm box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40)
	cost = 360

// /datum/supply_pack/faction/independent/ammo/ammoa762_ap
// 	name = "7.62x40mm AP Ammo Box Crate"
// 	desc = "Contains one 60-round 7.62x40mm Armour Piercing box for the SKM rifles."
// 	contains = list(/obj/item/storage/box/ammo/a762_40/ap)
// 	cost = 450

/datum/supply_pack/faction/independent/ammo/ammoa762_hp
	name = "7.62x40mm HP Ammo Box Crate"
	desc = "Contains one 60-round 7.62x40mm Hollow Point box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/hp)
	cost = 450

/*
MARK: .45-70
*/

/datum/supply_pack/faction/independent/ammo/ammoa4570_box
	name = ".45-70 Ammo Box Crate"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition."
	contains = list(/obj/item/storage/box/ammo/a4570)
	cost = 190

/datum/supply_pack/faction/independent/ammo/ammoa4570_box/match
	name = ".45-70 Match Crate"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition, that travels faster, pierces armour better, and ricochets off targets."
	contains = list(/obj/item/storage/box/ammo/a4570_match)
	cost = 235

/*
MARK: .300
*/

/datum/supply_pack/faction/independent/ammo/ammoa300_box
	name = ".300 Ammo Box Crate"
	desc = "Contains a twenty-round .300 Magnum ammo box for sniper rifles such as the HP Scout."
	contains = list(/obj/item/storage/box/ammo/a300)
	cost = 200

/datum/supply_pack/faction/independent/ammo/ammoa300_trac
	name = ".300 Trac Ammo Box Crate"
	desc = "Contains a ten-round .300 TRAC ammo box for sniper rifles such as the HP Scout."
	contains = list(/obj/item/storage/box/ammo/a300/trac)
	cost = 250 //TTD 310

/*
MARK: .308
*/

/datum/supply_pack/faction/independent/ammo/a308_box
	name = ".308 Ammo Box Crate"
	desc = "Contains a 40-round .308 box."
	contains = list(/obj/item/storage/box/ammo/a308)
	cost = 650

// /datum/supply_pack/faction/independent/ammo/a308_rubber_box
// 	name = ".308 Rubber Ammo Box Crate"
// 	desc = "Contains a 40-round .308 box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/a308/a308_rub)
// 	cost = 300

/datum/supply_pack/faction/independent/ammo/a308_sp_box
	name = ".308 SP Ammo Box Crate"
	desc = "Contains a 40-round .308 box loaded with soft point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a308/a308_sp)
	cost = 800

// /datum/supply_pack/faction/independent/ammo/a308_ap_box
// 	name = ".308 AP Ammo Box Crate"
// 	desc = "Contains a 40-round .308 box loaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/a308/a308_ap)
// 	cost = 1300

/*
MARK: 7.5x64
*/

/datum/supply_pack/faction/independent/ammo/a75clip_box
	name = "7.5x64mm Ammo Box Crate"
	desc = "Contains a twenty-round 7.5x64mm ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a75clip)
	cost = 400

/datum/supply_pack/faction/independent/ammo/ammoa65clip_trackers
	name = "6.5x57mm Tracker Shell Crate"
	desc = "Contains a 10-round 6.5x57mm tracker box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a75clip/trac)
	cost = 300

/*
MARK: 8x50
*/

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_boxcrate
	name = "8x50mm Ammo Box Crate"
	desc = "Contains a 40-round 8x50mm ammo box for rifles such as the Illestren."
	contains = list(/obj/item/storage/box/ammo/a8_50r)
	cost = 290

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_boxhp_boxcrate
	name = "8x50mm Hollow Point Crate"
	desc = "Contains a 40-round 8x50mm ammo box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a8_50r/hp)
	cost = 360

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_tracbox
	name = "8x50mm Tracker Crate"
	desc = "Contains a 30-round 8x50mm ammo box loaded with tracker ammo, great for sustained hunts."
	contains = list(/obj/item/storage/box/ammo/a8_50r/trac)
	cost = 360

/*
MARK: 8x58
*/

/datum/supply_pack/faction/independent/ammo/ammoa858
	name = "8x58mm Ammo Box Crate"
	desc = "Contains a 20-round 8x58 ammo box for Solarian-manufactured sniper rifles, such as the SSG-69."
	contains = list(/obj/item/storage/box/ammo/a858)
	cost = 450

/*
MARK: .50 BMG
*/

/datum/supply_pack/faction/independent/ammo/ammoa50
	name = ".50 BMG Ammo Box Crate"
	desc = "Contains a 20-round .50 BMG ammo box for the Taipan Anti-Material Rifle. Make them count, they aren't cheap."
	contains = list(/obj/item/storage/box/ammo/a50box)
	cost = 1500


/*
MARK: ferro pellets
*/

/datum/supply_pack/faction/independent/ammo/ammoferropelletboxcrate
	name = "Ferromagnetic Pellet Box Crate"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 360

/*
MARK: ferroslugs
*/

/datum/supply_pack/faction/independent/ammo/ammoferroslugboxcrate
	name = "Ferromagnetic Slug Box Crate"
	desc = "Contains a twenty-round ferromagnetic slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug)
	cost = 300

/*
MARK: ferro lances
*/

/datum/supply_pack/faction/independent/ammo/ammoferrolanceboxcrate
	name = "Ferromagnetic Lance Box Crate"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance)
	cost = 400

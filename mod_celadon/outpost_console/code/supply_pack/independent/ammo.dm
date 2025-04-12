/datum/supply_pack/faction/independent/ammo
	group = "Bulk Ammunition"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "ammo crate"

/* Misc */

/datum/supply_pack/faction/independent/ammo/ammoblank_ammo_disk
	name = "Blank Ammo Design Disk Crate"
	desc = "Run your own training drills!"
	cost = 1000
	contains = list(/obj/item/disk/design_disk/blanks)

/* .22lr */

/datum/supply_pack/faction/independent/ammo/ammoc22lr
	name = ".22 LR Ammo Box Crate"
	desc = "Contains a 100-round ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr)
	cost = 250 //8 ammo efficiency at 20 damage

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


/* 9mm */

/datum/supply_pack/faction/independent/ammo/ammoc9mm_ammo_box
	name = "9mm Ammo Box Crate"
	desc = "Contains a 60-round 9mm box for pistols and SMGs such as the Commander or Saber."
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200 //6 ammo efficiency at 20 damage

/datum/supply_pack/faction/independent/ammo/ammoc9mmap_ammo_box
	name = "9mm AP Ammo Box Crate"
	desc = "Contains a 60-round 9mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc9mmhp_ammo_box
	name = "9mm HP Ammo Box Crate"
	desc = "Contains a 60-round 9mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc9mmrubber_ammo_box
	name = "9mm Rubber Ammo Box Crate"
	desc = "Contains a 60-round 9mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/* .38 */

/datum/supply_pack/faction/independent/ammo/ammoc38
	name = ".38 Ammo Boxes Crate"
	desc = "Contains two 50 round ammo boxes for refilling .38 weapons."
	cost = 250 //8 ammo efficiency at 20 damage
	contains = list(/obj/item/storage/box/ammo/c38,
					/obj/item/storage/box/ammo/c38)
	crate_name = "ammo crate"

/* 10mm */

/datum/supply_pack/faction/independent/ammo/ammoc10mm_ammo_box
	name = "10mm Ammo Box Crate"
	desc = "Contains a 48-round 10mm box for pistols and SMGs like the Ringneck or the SkM-44(k)."
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 210 //5.7 ammo efficiency at 25 damage

/datum/supply_pack/faction/independent/ammo/ammoc10mmap_ammo_box
	name = "10mm AP Ammo Box Crate"
	desc = "Contains a 48-round 10mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c10mm_ap)
	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc10mmhp_ammo_box
	name = "10mm HP Ammo Box Crate"
	desc = "Contains a 48-round 10mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c10mm_hp)
	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc10mmrubber_ammo_box
	name = "10mm Rubber Ammo Box Crate"
	desc = "Contains a 48-round 10mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c10mm_rubber)
	cost = 210

/* .45 */

/datum/supply_pack/faction/independent/ammo/ammoc45_ammo_box
	name = ".45 Ammo Box Crate"
	desc = "Contains a 48-round .45 box for pistols and SMGs like the Candor or the C-20r."
	contains = list(/obj/item/storage/box/ammo/c45)
	cost = 210 //5.7 ammo efficiency at 25 damage

/datum/supply_pack/faction/independent/ammo/ammoc45ap_ammo_box
	name = ".45 AP Ammo Box Crate"
	desc = "Contains a 48-round .45 box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c45_ap)
	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc45hp_ammo_box
	name = ".45 HP Ammo Box Crate"
	desc = "Contains a 48-round .45 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c45_hp)
	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc45mmrubber_ammo_box
	name = ".45 Rubber Ammo Box Crate"
	desc = "Contains a 48-round .45 box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c45_rubber)
	cost = 210

/* .357 */

/datum/supply_pack/faction/independent/ammo/ammoa357_ammo_box
	name = ".357 Ammo Box Crate"
	desc = "Contains a 48-round .357 box for revolvers such as the Scarborough Revolver and the HP Firebrand."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 255 //5.6 ammo efficiency at 30 damage //TTD: boost this to 300 if revolvers get 35 damage

/datum/supply_pack/faction/independent/ammo/ammoa357hp_ammo_box
	name = ".357 HP Ammo Box Crate"
	desc = "Contains a 48-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 320 //375 at 35 base

/datum/supply_pack/faction/independent/ammo/ammoa357match_ammo_box
	name = ".357 Match Ammo Box Crate"
	desc = "Contains a 48-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 320 // 375 at 35 base

/* .44 */

/datum/supply_pack/faction/independent/ammo/ammoa44roum
	name = ".44 Roumain Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo for revolvers such as the Shadow and Montagne."
	contains = list(/obj/item/storage/box/ammo/a44roum)
	cost = 210 //5.6 ammo efficiency at 25 damage

/datum/supply_pack/faction/independent/ammo/ammoa44roum_rubber
	name = ".44 Roumain Rubber Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/a44roum_rubber)
	cost = 210

/datum/supply_pack/faction/independent/ammo/ammoa44roum_hp
	name = ".44 Roumain Hollow Point Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a44roum_hp)
	cost = 265

/* 4.6x30 */

/datum/supply_pack/faction/independent/ammo/ammoc46x30mm_boxcrate
	name = "4.6x30mm Ammo Box Crate"
	desc = "Contains an 80-round 4.6x30mm box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm)
	cost = 295 //5.4 ammo efficiency at 20 damage

/datum/supply_pack/faction/independent/ammo/ammoc46x30mm_ap
	name = "4.6x30mm Armour Piercing Ammo Box Crate"
	desc = "Contains a 80-round 4.6x30mm armour piercing box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm/ap)
	cost = 370

/datum/supply_pack/faction/independent/ammo/ammoc46x30mm_hp
	name = "4.6x30mm Hollow Point Ammo Box Crate"
	desc = "Contains a 80-round 4.6x30mm hollow point box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm/hp)
	cost = 370


/* 5.7x39 */

/datum/supply_pack/faction/independent/ammo/ammoc57x39mm_boxcrate
	name = "5.7x39mm Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39)
	cost = 295 //5.4 ammo efficiency at 20 damage

/datum/supply_pack/faction/independent/ammo/ammoc57x39mm_ap
	name = "5.7x39mm Armour Piercing Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/ap)
	cost = 370

/datum/supply_pack/faction/independent/ammo/ammoc57x39mm_hp
	name = "5.7x39mm Hollow Point Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm Hollow Point box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/hp)
	cost = 370

/* 12 Gauge */

/datum/supply_pack/faction/independent/ammo/ammobuckshot
	name = "Buckshot Crate"
	desc = "Contains a box of 32 buckshot shells for use in lethal persuasion."
	cost = 520 //6.4 ammo efficiency at 104 damage. Yes we are counting point blank.
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/independent/ammo/ammoslugs
	name = "Shotgun Slug Crate"
	desc = "Contains a box of 32 slug shells for use in lethal persuasion."
	cost = 225 //5.6 ammo efficiency at 40 damage
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/independent/ammo/ammoblank_shells
	name = "Blank Shell Crate"
	desc = "Contains a box of blank shells."
	cost = 220
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/independent/ammo/ammorubbershot
	name = "Rubbershot Crate"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 520
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/independent/ammo/ammotechshells
	name = "Unloaded Shotgun Technological Shells Crate"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 210
	contains = list(/obj/item/storage/box/techshot)

/* .45-70 */

/datum/supply_pack/faction/independent/ammo/ammoa4570_box
	name = ".45-70 Ammo Box Crate"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition."
	contains = list(/obj/item/storage/box/ammo/a4570)
	cost = 190 //5.6 ammo efficiency at 45 damage

/datum/supply_pack/faction/independent/ammo/ammoa4570_box/match
	name = ".45-70 Match Crate"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition, that travels faster, pierces armour better, and ricochets off targets."
	contains = list(/obj/item/storage/box/ammo/a4570_match)
	cost = 235

/* 7.62 */

/datum/supply_pack/faction/independent/ammo/ammoa762_ammo_box
	name = "7.62x40mm CLIP Ammo Box Crate"
	desc = "Contains one 60-round 7.62x40mm CLIP box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40)
	cost = 360 //5 ammo efficiency at 30 damage

/datum/supply_pack/faction/independent/ammo/ammoa762_ap
	name = "7.62x40mm CLIP Armour Piercing Ammo Box Crate"
	desc = "Contains one 60-round 7.62x40mm CLIP Armour Piercing box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/ap)
	cost = 450

/datum/supply_pack/faction/independent/ammo/ammoa762_hp
	name = "7.62x40mm CLIP Hollow Point Ammo Box Crate"
	desc = "Contains one 60-round 7.62x40mm CLIP Hollow Point box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/hp)
	cost = 450

/* 5.56 */

/datum/supply_pack/faction/independent/ammo/ammoa556_ammo_box
	name = "5.56x42mm CLIP Ammo Box Crate"
	desc = "Contains one 60-round 5.56x42mm CLIP box for most newer rifles."
	contains = list(/obj/item/storage/box/ammo/a556_42)
	cost = 300 //5 ammo efficiency at 25 damage

/datum/supply_pack/faction/independent/ammo/ammoa556_ap
	name = "5.56x42mm CLIP Armour Piercing Ammo Box Crate"
	desc = "Contains one 60-round 5.56x42mm CLIP Armour Piercing box for most newer rifles."
	contains = list(/obj/item/storage/box/ammo/a556_42/ap)
	cost = 375

/datum/supply_pack/faction/independent/ammo/ammoa556_hp
	name = "5.56x42mm CLIP Hollow Point Ammo Box Crate"
	desc = "Contains one 60-round 5.56x42mm CLIP Hollow Point box for most newer rifles."
	contains = list(/obj/item/storage/box/ammo/a556_42/hp)
	cost = 375

/* 5.56 caseless */

/datum/supply_pack/faction/independent/ammo/ammoc556mmHITP_ammo_box
	name = "5.56 Caseless Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless box for SolGov sidearms like the Pistole C."
	contains = list(/obj/item/storage/box/ammo/c556mm)
	cost = 165 //5.7 ammo efficiency at 20 damage

/datum/supply_pack/faction/independent/ammo/ammoc556mmHITPap_ammo_box
	name = "5.56 caseless AP Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless boxloaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c556mm_ap)
	cost = 205

/datum/supply_pack/faction/independent/ammo/ammoc556mmhitphp_ammo_box
	name = "5.56 Caseless HP Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c556mm_hp)
	cost = 205

/datum/supply_pack/faction/independent/ammo/ammoc556HITPrubber_ammo_box
	name = "5.56 Caseless Rubber Ammo Box Crate"
	desc = "Contains a 48-round 5.56 caseless box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c556mm_rubber)
	cost = 165

/* .299 */

/datum/supply_pack/faction/independent/ammo/ammoc299
	name = ".299 Eoehoma Caseless Ammo Box Crate"
	desc = "Contains one 60-round box of .299 Caseless ammo from the defunct Eoehoma. Used for the E-40 Hybrid Rifle."
	contains = list(/obj/item/storage/box/ammo/c299)
	cost = 220 //5.4 ammo efficiency at 20 damage

/* 8x50 */

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_boxcrate
	name = "8x50mm Ammo Box Crate"
	desc = "Contains a 40-round 8x50mm ammo box for rifles such as the Illestren."
	contains = list(/obj/item/storage/box/ammo/a8_50r)
	cost = 290 //4.8 ammo efficiency at 35 damage //TTD 37 damage 308 cr DMR buff

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_boxhp_boxcrate
	name = "8x50mm Hollow Point Crate"
	desc = "Contains a 40-round 8x50mm ammo box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a8_50r/hp)
	cost = 360 //TTD 385

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_tracbox
	name = "8x50mm Tracker Crate"
	desc = "Contains a 30-round 8x50mm ammo box loaded with tracker ammo, great for sustained hunts."
	contains = list(/obj/item/storage/box/ammo/a8_50r/trac)
	cost = 360 //TTD 385


/* .300 */

/datum/supply_pack/faction/independent/ammo/ammoa300_box
	name = ".300 Ammo Box Crate"
	desc = "Contains a twenty-round .300 Magnum ammo box for sniper rifles such as the HP Scout."
	contains = list(/obj/item/storage/box/ammo/a300)
	cost = 200 //4 ammo efficiency at 40 damage //TTD 50 damage 250 cr DMR buff

/datum/supply_pack/faction/independent/ammo/ammoa300_trac
	name = ".300 Trac Ammo Box Crate"
	desc = "Contains a ten-round .300 TRAC ammo box for sniper rifles such as the HP Scout."
	contains = list(/obj/item/storage/box/ammo/a300/trac)
	cost = 250 //TTD 310


/* .308 */
/datum/supply_pack/faction/independent/ammo/ammoa308_ammo_box
	name = "308 Ammo Box Crate"
	desc = "Contains a thirty-round .308 box for DMRs such as the SsG-04 and CM-GAL-S."
	contains = list(/obj/item/storage/box/ammo/a308)
	cost = 185 //4.8 ammo efficiency at 30 damage //TTD 35 damage 215 cr DMR buff

// [CELADON-DELETE] - cargo ammo fix - CELADON_WEAPONS
// /datum/supply_pack/faction/independent/ammo/ammoa308_ap
// 	name = "308 Armour Piercing Ammo Box Crate"
// 	desc = "Contains a thirty-round .308 armour piercing box for DMRs such as the SsG-04 and CM-GAL-S."
// 	contains = list(/obj/item/storage/box/ammo/a308/ap)
// 	cost = 230 //TTD 270

// /datum/supply_pack/faction/independent/ammo/ammoa308_hp
// 	name = "308 Hollow Point Ammo Box Crate"
// 	desc = "Contains a thirty-round .308 hollow point box for DMRs such as the SsG-04 and CM-GAL-S."
// 	contains = list(/obj/item/storage/box/ammo/a308/hp)
// 	cost = 230 //TTD 270

///datum/supply_pack/faction/independent/ammo/ammoa308_hp
	//name = "308 Hollow Point Ammo Box Crate"
	//desc = "Contains a thirty-round .308 hollow point box for DMRs such as the SsG-04 and CM-GAL-S."
	//contains = list(/obj/item/storage/box/ammo/a308/hp)
	//cost = 500
// [/CELADON-DELETE] - cargo ammo fix
/* 6.5 */

/datum/supply_pack/faction/independent/ammo/ammoa65clip_box
	name = "6.5x57mm CLIP Ammo Box Crate"
	desc = "Contains a twenty-round 6.5x57mm CLIP ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip)
	cost = 200 //4 ammo efficiency at 40 damage

/datum/supply_pack/faction/independent/ammo/ammoa65clip_trackers
	name = "6.5x57mm CLIP Tracker Shell Crate"
	desc = "Contains a 10-round 6.5x57mm CLIP tracker box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip/trac)
	cost = 250

/* 8x58 */

/datum/supply_pack/faction/independent/ammo/ammoa858
	name = "8x58mm Ammo Box Crate"
	desc = "Contains a twenty-round 8x58 ammo box for Solarian-manufactured sniper rifles, such as the SSG-69."
	contains = list(/obj/item/storage/box/ammo/a858)
	cost = 200 //4 ammo efficiency at 40 damage //TTD 225

/* .50 BMG */

/datum/supply_pack/faction/independent/ammo/ammoa50
	name = ".50 BMG Ammo Box Crate"
	desc = "Contains a twenty-round .50 BMG ammo box for the Taipan Anti-Material Rifle. Make them count, they aren't cheap."
	contains = list(/obj/item/storage/box/ammo/a50box)
	cost = 1000 //1.4 ammo efficiency at 70 damage. Yes, 70.


/* ferro pellets */

/datum/supply_pack/faction/independent/ammo/ammoferropelletboxcrate
	name = "Ferromagnetic Pellet Box Crate"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 210 //5.7 ammo efficiency at 25 damage

/datum/supply_pack/faction/independent/ammo/ammohcpellets
	name = "High Conductivity Pellet Box Crate"
	desc = "Contains a 48-round high conductivity pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet/hc)
	cost = 260

/* ferroslugs */

/datum/supply_pack/faction/independent/ammo/ammoferroslugboxcrate
	name = "Ferromagnetic Slug Box Crate"
	desc = "Contains a twenty-round ferromagnetic slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug)
	cost = 175 //5.7 ammo efficiency at 50 damage

/datum/supply_pack/faction/independent/ammo/ammohcslugs
	name = "High Conductivity Slug Box Crate"
	desc = "Contains a twenty-round high conductivity slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug/hc)
	cost = 215

/* ferro lances */

/datum/supply_pack/faction/independent/ammo/ammoferrolanceboxcrate
	name = "Ferromagnetic Lance Box Crate"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance)
	cost = 285 //5 ammo efficiency at 30 damage

/datum/supply_pack/faction/independent/ammo/ammoferrolanceboxcrate
	name = "High Conductivity Lance Box Crate"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance/hc)
	cost = 360

/* Прочее */

/datum/supply_pack/faction/independent/ammo/blank_ammo_disk
	name = "Blank Ammo Design Disk Crate"
	desc = "Run your own training drills!"
	cost = 1000
	contains = list(/obj/item/disk/design_disk/blanks)

/* 9mm */

/datum/supply_pack/faction/independent/ammo/c9mm_ammo_box
	name = "9mm Ammo Box Crate"
	desc = "Contains a 60-round 9mm box for pistols and SMGs such as the Commander or Saber."
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 300

/datum/supply_pack/faction/independent/ammo/c9mmrubber_ammo_box
	name = "9mm Rubber Ammo Box Crate"
	desc = "Contains a 60-round 9mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/* 5.56 */

/datum/supply_pack/faction/independent/ammo/box556_box
	name = "5.56mm Ammo Box Crate"
	desc = "A box of standard 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box)
	cost = 500

/datum/supply_pack/faction/independent/ammo/box556/a856_box
	name = "5.56mm EP Ammo Box Crate"
	desc = "A box of enhanced performance 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/a856)
	cost = 650

//.308

/datum/supply_pack/faction/independent/ammo/a308_box
	name = ".308 Ammo Box Crate"
	desc = "Contains a 40-round .308 box."
	contains = list(/obj/item/storage/box/ammo/a308)
	cost = 650

/datum/supply_pack/faction/independent/ammo/a308_rubber_box
	name = ".308 Rubber Ammo Box Crate"
	desc = "Contains a 40-round .308 box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/a308/a308_rub)
	cost = 300

/datum/supply_pack/faction/independent/ammo/a308_sp_box
	name = ".308 SP Ammo Box Crate"
	desc = "Contains a 40-round .308 box loaded with soft point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a308/a308_sp)
	cost = 800

/datum/supply_pack/faction/independent/ammo/a308_ap_box
	name = ".308 AP Ammo Box Crate"
	desc = "Contains a 40-round .308 box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/a308/a308_ap)
	cost = 1300

// 8x58mm

// /datum/supply_pack/faction/independent/ammo/a858_box
// 	name = "8x58mm Caseless Ammo box"
// 	desc = "Contains a 8x58mm Caseless Ammo box for the standard-issue SSG-669C, containing fifty rounds."
// 	contains = list(/obj/item/storage/box/ammo/a858_ammo_box)
// 	cost = 750

// .410
/datum/supply_pack/faction/independent/ammo/a410_buckshot
	name = ".410 Buckshot Box"
	desc = "Contains a box with 60 buckshot cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box)
	cost = 1000

/datum/supply_pack/faction/independent/ammo/a410_slug
	name = ".410 Slug Box"
	desc = "Contains a box with 60 slug cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/slug)
	cost = 1500

/datum/supply_pack/faction/independent/ammo/a410_flechette
	name = ".410 Flechette Box"
	desc = "Contains a box with 60 flechette rounds of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/flechette)
	cost = 1500

/datum/supply_pack/faction/independent/ammo
	category = "Security - Ammunition"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "ammo crate"
	stable_price = TRUE

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
> .410

// Пистолеты

/* MARK: 9x18mm
bullet
	damage = 20
	armour_penetration = -20
ap
	damage = 18
	armour_penetration = 10
hp
	damage = 30
	armour_penetration = -30
*/
- Используют:
- Пистолеты: Challenger / Challenger (NT) / Glock / Commissioner (IQ)
- Авто-пистолеты: Kingsnake (IQ) / CM-70 (SF) / ~Rattlesnake (S)~
- SMG: Saber (NT) / Vector (NT) / CM-5 (SF)


/* MARK: 10x22mm
bullet
	damage = 25
	armour_penetration = -20
ap
	damage = 23
	armour_penetration = 10
hp
	damage = 35
	armour_penetration = -30
*/
- Почти как .45 калибр
- Используют:
- Пистолеты: Ringneck / PC-76 'Ringneck' (S)
- SMG: SKM-44v Mongrel (IQ)

/* MARK: .45
bullet
	damage = 25
	armour_penetration = -20
ap
	damage = 22
	armour_penetration = 10
hp
	damage = 37
	armour_penetration = -30
*/
- Почти как 10x22mm
- Используют:
- Пистолеты: Candor / USP
- SMG: Cobra-20 / C-20r 'Cobra' (S)

// Револьверы

/* MARK: .38
bullet
	damage = 20
	armour_penetration = 20
match
	damage = 20
	armour_penetration = -10
*/
- Используют: 
- Револьверы: HP Detective
- Винтовки: Flaming Arrow Lever Action

/* MARK: .357
bullet
	damage = 45
	armour_penetration = 10
match
	damage = 45
	armour_penetration = 10
hp
	damage = 50
	armour_penetration = -20
*/
- Используют: 
- Авто-пистолеты: CM-357 (SF)
- Револьверы: Firebrand / Viper-23 /  Horizon-X (IQ) / Rhino (NT) / R-23 'Viper' (S)
- Винтовки: Absolution Lever Action

/* MARK: .44
bullet
	damage = 35
	armour_penetration = 0
hp
	damage = 50
	armour_penetration = 0
*/
- Используют: 
- Револьверы: Shadow / Montagne 
- Пистолеты: M20 Auto Elite / Pinscher Heavy Pistol (IQ)
- SMG: Firestorm

/* MARK: .45-70
bullet
	damage = 50
	armour_penetration = 20
match
	damage = 45
	armour_penetration = 30
hp
	damage = 70
	armour_penetration = -10
*/
- Используют: 
- Револьвер: Ashhand Hunting
- Винтовки: Beacon Break Action


// Ружейные
/* MARK: 5.56x42mm
bullet
	damage = 20
	armour_penetration = 20
ap
	damage = 22
	armour_penetration = 40
hp
	damage = 35
	armour_penetration = 10
*/
- Используют: 
- Штурмовые: CM-82 / SMR-80 (S) / SAW-80 (S)
- Снапер-DMR: SBR-80 (S)

/* MARK: 8x50mmR
bullet
	damage = 37
	armour_penetration = 30
match
	damage = 40
	armour_penetration = 27
hp
	damage = 50
	armour_penetration = 10
*/
- Используют: 
- Винтовки: Illestren / Model 23 'Woodsman' / 


/* MARK: 7.62x40mm
bullet
	damage = 30
	armour_penetration = 20
ap
	damage = 27
	armour_penetration = 40
hp
	damage = 40
	armour_penetration = 10
*/
- Используют: 
- Винтовки: Super Sporter
- Штурмовые: SKM-24 / SKM-44 (IQ) / CM-24 (SF)
- LMG: CM-40 (SF)

/* MARK: .308
bullet
	damage = 30
	armour_penetration = 40
ap
	damage = 28
	armour_penetration = 60
hp
	damage = 60
	armour_penetration = -10
*/
- Используют: 
- Винтовки:
- Штурмовые: Morita Mk.I
- LMG: KM-05 Rottweiler (IQ)
- Снайпер: SsG-04 (IQ) / CM-F4 (SF)

/* MARK: 5.56x45mm
bullet
	damage = 25
	armour_penetration = 20
a856
	damage = 30
	armour_penetration = 25
m903
	damage = 20
	armour_penetration = 40
*/
- Используют:
- Штурмовые: G36M (IQ)

// SMG

/* MARK: 5.7x39mm
bullet
	damage = 20
	armour_penetration = 10
ap
	damage = 19
	armour_penetration = 30
hp
	damage = 30
	armour_penetration = -10
*/
- Пистолет: BC-81 'Asp' (S)
- SMG: Sidewinder (S)

/* MARK: 4.6x30mm
bullet
	damage = 20
	armour_penetration = 10
ap
	damage = 18
	armour_penetration = 40
hp
	damage = 30
	armour_penetration = -10
*/
- Используют:
- Пистолеты: P46 Schnauzer (IQ)
- SMG: SKM-24v / BDM-50 'Akita' (IQ) / WT-550 (NT)

/* MARK: 5.56mm HITP
bullet
	damage = 20
	armour_penetration = 0
ap
	damage = 19
	armour_penetration = 20
hp
	damage = 30
	armour_penetration = -10
*/
- Используют:
- Пистолеты: Solar C (SF)

// Снайперские

/* MARK: 8x58mm
bullet
	damage = 45
	armour_penetration = 50
*/
- Используют:
- Снайпер: SSG-669C (SF)

/* MARK: 6.5mm / 6.5x57mm
bullet
	damage = 40
	armour_penetration = 50
*/
- Используют: 
- Снайпер: Boomslang-90 / SSG-08 Saluki (IQ) / CM-F90 (SF) / MSR-90 'Boomslang' (S)

/* MARK: 7.62x54mm
bullet
	damage = 37
	armour_penetration = 17
*/

/* MARK: .300
bullet
	damage = 50
	armour_penetration = 40
*/
- Используют: 
- Снайпер: Scout Sniper

// Гаусс

// MARK: ferromagnetic
bullet
	damage = 25
	armour_penetration = 0
ap
	damage = 18
	armour_penetration = 40
hp
	damage = 30
	armour_penetration = -10


// Дробовики (12g)

bullet
	damage = 40
	armour_penetration = 0
beanbag
	damage = 10
	armour_penetration = -45
frag12
	damage = 25
	armour_penetration = 0
buckshot
	damage = 14
	armour_penetration = 0
rubbershot
	damage = 2
	armour_penetration = 25
scattershot
	damage = 24
	armour_penetration = -20
blank
	damage = 	30
	armour_penetration = -70


.410
	damage = 	17
	armour_penetration = -15

	damage = 	70
	armour_penetration = 	-20

	damage = 50
	armour_penetration = 25



Некоторые хорошие патроны были закомментированы и перенесены в отдельные фракционные карго.

MARK: .22lr
*/

/* // Нахуй он вообще нужен в карго, калибр нужно бафнуть и на черный рынок
/datum/supply_pack/faction/independent/ammo/ammoc22lr
	name = ".22 LR Ammo Box"
	desc = "Contains a 100-round ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc22lr_hp
	name = ".22 LR HP Ammo Box"
	desc = "Contains a 100-round hollow point ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/hp)
	cost = 300

/datum/supply_pack/faction/independent/ammo/ammoc22lr_ap
	name = ".22 LR AP Ammo Box"
	desc = "Contains a 100-round armour piercing ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/ap)
	cost = 300
*/

/*
	MARK: .38
*/

/datum/supply_pack/faction/independent/ammo/ammoc38
	name = ".38 Ammo Boxes"
	desc = "Contains two 45-round ammo boxes for refilling .38 weapons."
	cost = 250
	contains = list(/obj/item/storage/box/ammo/c38,
					/obj/item/storage/box/ammo/c38)
	crate_name = "ammo crate"

/*
	MARK: 9x18
*/

/datum/supply_pack/faction/independent/ammo/ammoc9mm_ammo_box
	name = "9x18mm Ammo Box"
	desc = "Contains a 45-round 9x18mm box for pistols and SMGs such as the Commander or Saber."
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/independent/ammo/ammoc9mmap_ammo_box
	name = "9x18mm AP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc9mmhp_ammo_box
	name = "9x18mm HP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoc9mmrubber_ammo_box
	name = "9x18mm Rubber Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/*
	MARK: 10x22
*/

/datum/supply_pack/faction/independent/ammo/ammoc10mm_ammo_box
	name = "10x22mm Ammo Box"
	desc = "Contains a 36-round 10x22mm box for pistols and SMGs like the Ringneck or the SkM-44(k)."
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 200

// /datum/supply_pack/faction/independent/ammo/ammoc10mmap_ammo_box
// 	name = "10x22mm AP Ammo Box"
// 	desc = "Contains a 36-round 10x22mm box loaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/c10mm_ap)
// 	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc10mmhp_ammo_box
	name = "10x22mm HP Ammo Box"
	desc = "Contains a 36-round 10x22mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c10mm_hp)
	cost = 250

// /datum/supply_pack/faction/independent/ammo/ammoc10mmrubber_ammo_box
// 	name = "10x22mm Rubber Ammo Box"
// 	desc = "Contains a 36-round 10x22mm box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/c10mm_rubber)
// 	cost = 200

/*
	MARK: .44
*/

/datum/supply_pack/faction/independent/ammo/ammoa44roum
	name = ".44 Roumain Ammo Box"
	desc = "Contains a 48-round box of .44 roumain ammo for revolvers such as the Shadow and Montagne."
	contains = list(/obj/item/storage/box/ammo/a44roum)
	cost = 200

/datum/supply_pack/faction/independent/ammo/ammoa44roum_rubber
	name = ".44 Roumain Rubber Ammo Box"
	desc = "Contains a 48-round box of .44 roumain ammo loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/a44roum_rubber)
	cost = 200

/datum/supply_pack/faction/independent/ammo/ammoa44roum_hp
	name = ".44 Roumain HP Ammo Box"
	desc = "Contains a 48-round box of .44 roumain hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a44roum_hp)
	cost = 250

/*
	MARK: .45
*/

/datum/supply_pack/faction/independent/ammo/ammoc45_ammo_box
	name = ".45 Ammo Box"
	desc = "Contains a 36-round .45 box for pistols and SMGs like the Candor or the C-20r."
	contains = list(/obj/item/storage/box/ammo/c45)
	cost = 200

// /datum/supply_pack/faction/independent/ammo/ammoc45ap_ammo_box
// 	name = ".45 AP Ammo Box"
// 	desc = "Contains a 36-round .45 box loaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/c45_ap)
// 	cost = 260

/datum/supply_pack/faction/independent/ammo/ammoc45hp_ammo_box
	name = ".45 HP Ammo Box"
	desc = "Contains a 36-round .45 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c45_hp)
	cost = 250

// /datum/supply_pack/faction/independent/ammo/ammoc45mmrubber_ammo_box
// 	name = ".45 Rubber Ammo Box"
// 	desc = "Contains a 36-round .45 box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/c45_rubber)
// 	cost = 200

/*
	MARK: .357
*/

/datum/supply_pack/faction/independent/ammo/ammoa357_ammo_box
	name = ".357 Ammo Box"
	desc = "Contains a 36-round .357 box for revolvers such as the Scarborough Revolver and the HP Firebrand."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 250

/datum/supply_pack/faction/independent/ammo/ammoa357hp_ammo_box
	name = ".357 HP Ammo Box"
	desc = "Contains a 36-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 325

/datum/supply_pack/faction/independent/ammo/ammoa357match_ammo_box
	name = ".357 Match Ammo Box"
	desc = "Contains a 36-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 325

/*
	MARK: 4.6x30
*/

/datum/supply_pack/faction/independent/ammo/ammoc46x30mm_boxcrate
	name = "4.6x30mm Ammo Box"
	desc = "Contains an 80-round 4.6x30mm box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm)
	cost = 300

// /datum/supply_pack/faction/independent/ammo/ammoc46x30mm_ap
// 	name = "4.6x30mm AP Ammo Box"
// 	desc = "Contains a 80-round 4.6x30mm armour piercing box for PDWs such as the WT-550."
// 	contains = list(/obj/item/storage/box/ammo/c46x30mm/ap)
// 	cost = 370

/datum/supply_pack/faction/independent/ammo/ammoc46x30mm_hp
	name = "4.6x30mm HP Ammo Box"
	desc = "Contains a 80-round 4.6x30mm hollow point box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm/hp)
	cost = 375

/*
	MARK: 5.7x39
*/

/datum/supply_pack/faction/independent/ammo/ammoc57x39mm_boxcrate
	name = "5.7x39mm Ammo Box"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39)
	cost = 400

// /datum/supply_pack/faction/independent/ammo/ammoc57x39mm_ap
// 	name = "5.7x39mm AP Ammo Box"
// 	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
// 	contains = list(/obj/item/storage/box/ammo/c57x39/ap)
// 	cost = 370

/datum/supply_pack/faction/independent/ammo/ammoc57x39mm_hp
	name = "5.7x39mm HP Ammo Box"
	desc = "Contains one 80-round 5.7x39mm Hollow Point box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/hp)
	cost = 475

/*
	MARK: 5.56 HITP caseless
*/

/datum/supply_pack/faction/independent/ammo/ammoc556mmHITP_ammo_box
	name = "5.56mm HITP Caseless Ammo Box"
	desc = "Contains a 48-round 5.56mm HITP caseless box for SolGov sidearms like the Pistole C."
	contains = list(/obj/item/storage/box/ammo/c556mm)
	cost = 250

// /datum/supply_pack/faction/independent/ammo/ammoc556mmHITPap_ammo_box
// 	name = "5.56mm HITP caseless AP Ammo Box"
// 	desc = "Contains a 48-round 5.56mm HITP caseless boxloaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/c556mm_ap)
// 	cost = 205

/datum/supply_pack/faction/independent/ammo/ammoc556mmhitphp_ammo_box
	name = "5.56mm HITP Caseless HP Ammo Box"
	desc = "Contains a 48-round 5.56mm HITP caseless box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c556mm_hp)
	cost = 300

// /datum/supply_pack/faction/independent/ammo/ammoc556HITPrubber_ammo_box
// 	name = "5.56mm HITP Caseless Rubber Ammo Box"
// 	desc = "Contains a 48-round 5.56 HITP caseless box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/c556mm_rubber)
// 	cost = 165

/*
	MARK: 12 Gauge
*/

/datum/supply_pack/faction/independent/ammo/ammobuckshot
	name = "12g Buckshot"
	desc = "Contains a box of 32 buckshot shells for use in lethal persuasion."
	cost = 525
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/independent/ammo/ammoslugs
	name = "12g Shotgun Slug"
	desc = "Contains a box of 32 slug shells for use in lethal persuasion."
	cost = 225
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/independent/ammo/ammoblank_shells
	name = "12g Blank Shell"
	desc = "Contains a box of blank shells."
	cost = 220
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/independent/ammo/ammorubbershot
	name = "12g Rubbershot"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 525
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/independent/ammo/ammotechshells
	name = "12g Unloaded Shotgun Technological Shells"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 200
	contains = list(/obj/item/storage/box/techshot)

/*
	MARK: .410
*/

/datum/supply_pack/faction/independent/ammo/a410_buckshot
	name = ".410 Buckshot Box"
	desc = "Contains a box with 60 buckshot cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box)
	cost = 1000

/datum/supply_pack/faction/independent/ammo/a410_flechette
	name = ".410 Flechette Box"
	desc = "Contains a box with 60 flechette rounds of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/flechette)
	cost = 1500

/datum/supply_pack/faction/independent/ammo/a410_slug
	name = ".410 Slug Box"
	desc = "Contains a box with 60 slug cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/slug)
	cost = 2000

/*
	MARK: 5.56x42
*/

/* Inclusive Syndicate
/datum/supply_pack/faction/independent/ammo/ammoa556_ammo_box
	name = "5.56x42mm Ammo Box"
	desc = "Contains one 60-round 5.56x42mm box for most newer rifles."
	contains = list(/obj/item/storage/box/ammo/a556_42)
	cost = 700

// /datum/supply_pack/faction/independent/ammo/ammoa556_ap
// 	name = "5.56x42mm AP Ammo Box"
// 	desc = "Contains one 60-round 5.56x42mm CLIP Armour Piercing box for most newer rifles."
// 	contains = list(/obj/item/storage/box/ammo/a556_42/ap)
// 	cost = 1000

/datum/supply_pack/faction/independent/ammo/ammoa556_hp
	name = "5.56x42mm HP Ammo Box"
	desc = "Contains one 60-round 5.56x42mm Hollow Point box for most newer rifles."
	contains = list(/obj/item/storage/box/ammo/a556_42/hp)
	cost = 1000
*/

/*
	MARK: 5.56x45
*/

// /datum/supply_pack/faction/independent/ammo/box556_box
// 	name = "5.56x45mm Ammo Box"
// 	desc = "A box of standard 5.56x45mm ammo."
// 	contains = list(/obj/item/storage/box/ammo/a556_box)
// 	cost = 500

// /datum/supply_pack/faction/independent/ammo/box556/a856_box
// 	name = "5.56x45mm EP Ammo Box"
// 	desc = "A box of enhanced performance 5.56x45mm ammo."
// 	contains = list(/obj/item/storage/box/ammo/a556_box/a856)
// 	cost = 650

/*
	MARK: 7.62x40
*/

/datum/supply_pack/faction/independent/ammo/ammoa762_ammo_box
	name = "7.62x40mm Ammo Box"
	desc = "Contains one 60-round 7.62x40mm box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40)
	cost = 350

/datum/supply_pack/faction/independent/ammo/ammoa762_ap
	name = "7.62x40mm AP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Armour Piercing box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/ap)
	cost = 600

/datum/supply_pack/faction/independent/ammo/ammoa762_hp
	name = "7.62x40mm HP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Hollow Point box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/hp)
	cost = 600

/*
	MARK: .45-70
*/

/datum/supply_pack/faction/independent/ammo/ammoa4570_box
	name = ".45-70 Ammo Box"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition."
	contains = list(/obj/item/storage/box/ammo/a4570)
	cost = 200

/datum/supply_pack/faction/independent/ammo/ammoa4570_box/match
	name = ".45-70 Match"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition, that travels faster, pierces armour better, and ricochets off targets."
	contains = list(/obj/item/storage/box/ammo/a4570_match)
	cost = 250

/*
	MARK: .300
*/

/datum/supply_pack/faction/independent/ammo/ammoa300_box
	name = ".300 Ammo Box"
	desc = "Contains a twenty-round .300 Magnum ammo box for sniper rifles such as the HP Scout."
	contains = list(/obj/item/storage/box/ammo/a300)
	cost = 200

/datum/supply_pack/faction/independent/ammo/ammoa300_trac
	name = ".300 Trac Ammo Box"
	desc = "Contains a ten-round .300 TRAC ammo box for sniper rifles such as the HP Scout."
	contains = list(/obj/item/storage/box/ammo/a300/trac)
	cost = 250 //TTD 310

/*
	MARK: .308
*/

/datum/supply_pack/faction/independent/ammo/a308_box
	name = ".308 Ammo Box"
	desc = "Contains a 40-round .308 box."
	contains = list(/obj/item/storage/box/ammo/a308)
	cost = 650

// /datum/supply_pack/faction/independent/ammo/a308_rubber_box
// 	name = ".308 Rubber Ammo Box"
// 	desc = "Contains a 40-round .308 box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/a308/a308_rub)
// 	cost = 300

/datum/supply_pack/faction/independent/ammo/a308_sp_box
	name = ".308 SP Ammo Box"
	desc = "Contains a 40-round .308 box loaded with soft point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a308/hp)
	cost = 800

// /datum/supply_pack/faction/independent/ammo/a308_ap_box
// 	name = ".308 AP Ammo Box"
// 	desc = "Contains a 40-round .308 box loaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/a308/ap)
// 	cost = 1300

/*
	MARK: 6.5x57mm
*/

/datum/supply_pack/faction/independent/ammo/a65clip_box
	name = "6.5x57mm Ammo Box"
	desc = "Contains a twenty-round 6.5x57mm ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip)
	cost = 500

/datum/supply_pack/faction/independent/ammo/ammoa65clip_trackers
	name = "6.5x57mm Tracker Shell"
	desc = "Contains a 10-round 6.5x57mm tracker box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip/trac)
	cost = 600

/*
	MARK: 8x50mm
*/

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_boxcrate
	name = "8x50mm Ammo Box"
	desc = "Contains a 40-round 8x50mm ammo box for rifles such as the Illestren."
	contains = list(/obj/item/storage/box/ammo/a8_50r)
	cost = 300

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_boxhp_boxcrate
	name = "8x50mm Hollow Point"
	desc = "Contains a 40-round 8x50mm ammo box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a8_50r/hp)
	cost = 350

/datum/supply_pack/faction/independent/ammo/ammoc8x50mm_tracbox
	name = "8x50mm Tracker"
	desc = "Contains a 30-round 8x50mm ammo box loaded with tracker ammo, great for sustained hunts."
	contains = list(/obj/item/storage/box/ammo/a8_50r/trac)
	cost = 350

/*
	MARK: 8x58mm
*/
/datum/supply_pack/faction/independent/ammo/ammoa858
	name = "8x58mm Ammo Box"
	desc = "Contains a 20-round 8x58 ammo box for Solarian-manufactured sniper rifles, such as the SSG-69."
	contains = list(/obj/item/storage/box/ammo/a858)
	cost = 450

/*
	MARK: .50 BMG
*/

/datum/supply_pack/faction/independent/ammo/ammoa50
	name = ".50 BMG Ammo Box"
	desc = "Contains a 20-round .50 BMG ammo box for the Taipan Anti-Material Rifle. Make them count, they aren't cheap."
	contains = list(/obj/item/storage/box/ammo/a50box)
	cost = 1500


/*
	MARK: ferro pellets
*/

/datum/supply_pack/faction/independent/ammo/ammoferropelletboxcrate
	name = "Ferromagnetic Pellet (FE pellet) Box"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 350

/*
	MARK: ferroslugs
*/

/datum/supply_pack/faction/independent/ammo/ammoferroslugboxcrate
	name = "Ferromagnetic Slug Box"
	desc = "Contains a twenty-round ferromagnetic slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug)
	cost = 300

/*
	MARK: ferro lances
*/

/datum/supply_pack/faction/independent/ammo/ammoferrolanceboxcrate
	name = "Ferromagnetic Lance Box"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance)
	cost = 400

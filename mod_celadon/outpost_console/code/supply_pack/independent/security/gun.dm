/datum/supply_pack/faction/independent/gun
	category = "Security - Guns"
	crate_type = /obj/structure/closet/crate/secure/weapon

/* mark: = Gun List =

> Pistols
> SMGs
> Energy
> Shotguns
> Rifles
> Auto Rifles

Morita & G36 & Saiga убраны. Почему подобное оружие в обычном карго? Следует перенести в другие карго.

===== Товары SRM & CLIP & PGF от офов. =====

	MARK:		Revolver
*/

/* // Нахуй он вообще нужен в карго, калибр нужно бафнуть и на черный рынок
/datum/supply_pack/faction/independent/gun/m17
	name = "M17 Micro Target Pistol"
	desc = "A cheap target shooting pistol manufactured by Serene Outdoors. Chambered in .22 LR."
	cost = 400
	contains = list(/obj/item/storage/guncase/pistol/m17)
	crate_name = "pistol crate"
*/

/* mark: .38
bullet
	damage = 20
	armour_penetration = 20
match
	damage = 20
	armour_penetration = -10
*/

/datum/supply_pack/faction/independent/gun/detrevolver
	name = "Revolver - HP Detective (.38)"
	desc = "Contains a concealable revolver favored by police departments around the sector, chambered in .38."
	cost = 600
	contains = list(/obj/item/storage/guncase/pistol/detective)

/* mark: .44
bullet
	damage = 35
	armour_penetration = 0
hp
	damage = 50
	armour_penetration = 0
*/

/datum/supply_pack/faction/independent/gun/shadowrevolver
	name = "Revolver - Shadow (.44)"
	desc = "Contains a concealable Shadow revolver, chambered in .44 Roumain."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/shadow)
	//	max_ammo = 6
	// no_speedloader

/datum/supply_pack/faction/independent/gun/montagne
	name = "Revolver - HP Montagne (.44)"
	desc = "Contains a revolver issued to high-ranking members of the Saint-Roumain Militia. Chambered in .44."
	cost = 1300 // [IND]
	contains = list(/obj/item/storage/guncase/pistol/montagne)
	//	max_ammo = 6

/* mark: .357
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

/datum/supply_pack/faction/independent/gun/pepperbox
	name = "Revolver - HP Firebrand (.357)"
	desc = "Contains a concealable pepperbox revolver manufactured by the Saint Roumain Militia, chambered in .357."
	cost = 1250
	contains = list(/obj/item/storage/guncase/pistol/firebrand)
	//	max_ammo = 5

/datum/supply_pack/faction/independent/gun/viperrevolver
	name = "Revolver - Viper-23 (.357)"
	desc = "Contains a civilian variant of the Viper revolver, chambered in .357 magnum."
	cost = 2000
	contains = list(/obj/item/storage/guncase/pistol/viper)
	//	max_ammo = 6

/datum/supply_pack/faction/independent/gun/ashhand
	name = "Revolver - Ashhand Hunting (.45-70)"
	desc = "Contains a single-action .45-70 hunting revolver manufactured by Hunter's Pride for use against the biggest game."
	cost = 4000
	contains = list(/obj/item/storage/guncase/pistol/ashhand)
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

/*
	MARK:		Pistols
*/

/* mark: 9x18mm
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

/datum/supply_pack/faction/independent/gun/challenger
	name = "Pistol - VI 'Challenger' (9x18mm)"
	desc = "Contains a double stacked Challenger pistol, produced by Nanotrasen along with Vigilitas Interstellar and is chambered in 9x18mm."
	cost = 1100
	contains = list(/obj/item/storage/guncase/pistol/commander)
	//spread = 3
	//max_ammo = 12

/datum/supply_pack/faction/independent/gun/glock
	name = "Pistol - Glock (9x18mm)"
	desc = "Contains a 9x18mm Glock pistol and two additional magazines for it."
	cost = 1650
	contains = list(/obj/item/storage/guncase/glock)
	crate_name = "auto rifle crate"
	//spread = 5
	//max_ammo = 17

/* mark: 10x22mm
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

/datum/supply_pack/faction/independent/gun/ringneck
	name = "Pistol - Ringneck (10x22mm)"
	desc = "Contains a civilian variant of the Ringneck pistol, produced by Scarborough Arms and chambered in 10x22mm."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/ringneck)
	//spread = 5
	//max_ammo = 8

/* mark: .44
bullet
	damage = 35
	armour_penetration = 0
hp
	damage = 50
	armour_penetration = 0
*/

/datum/supply_pack/faction/independent/gun/m20_auto_elite
	name = "Pistol - M20 Auto Elite (.44)"
	desc = "Contains a heavy pistol manufactured by Serene Outdoors. Chambered in .44 Roumain."
	cost = 1250
	contains = list(/obj/item/storage/guncase/pistol/m20_auto_elite)
	crate_name = "pistol crate"
	//max_ammo = 9

/* mark: .45
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

/datum/supply_pack/faction/independent/gun/candors
	name = "Pistol - Candor (.45)"
	desc = "Contains a Candor pistol, the trusty sidearm of any spacer, produced by Hunter's Pride and chambered in .45 ACP."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/candor)
	//max_ammo = 8

/datum/supply_pack/faction/independent/gun/usp
	name = "Pistol - USP (.45)"
	desc = "Contains a .45 caliber USP pistol and two additional magazines for it."
	cost = 1350
	contains = list(/obj/item/storage/guncase/usp)
	crate_name = "auto rifle crate"
	//max_ammo = 12

/*
	MARK: SMGs
*/

/* mark: .44
bullet
	damage = 35
	armour_penetration = 0
hp
	damage = 50
	armour_penetration = 0
*/

/datum/supply_pack/faction/independent/gun/firestorm
	name = "SMG - Firestorm (.44)"
	desc = "Contains a Hunter's Pride SMG, intended for internal use by hunters and chambered in .44 Roumain."
	cost = 4000
	contains = list(/obj/item/storage/guncase/firestorm)
	crate_name = "SMG crate"
	//max_ammo = 24

/* mark: .45
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

/datum/supply_pack/faction/independent/gun/cobra20
	name = "SMG - Cobra-20 (.45)"
	desc = "Contains a civilian variant of the Cobra SMG, manufactured by Scaraborough Arms and chambered in .45"
	cost = 3000
	contains = list(/obj/item/storage/guncase/cobra)
	crate_name = "SMG crate"
	//max_ammo = 24

/* mark: 4.6x30mm
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

/datum/supply_pack/faction/independent/gun/skm_carbine
	name = "SMG - SKM-24v (4.6x30mm)"
	desc = "Contains a SKM-24v was a carbine modification of the SKM-24 during the Frontiersmen War. This, however, is just a shoddy imitation of that carbine, effectively an SKM-24 with a sawed down barrel and a folding wire stock. Can be fired with the stock folded, though accuracy suffers. Chambered in 4.6x30mm."
	cost = 4000
	contains = list(/obj/item/storage/guncase/skm_carbine)
	//max_ammo = 30

/*
	MARK:	Energy
*/

/datum/supply_pack/faction/independent/gun/retro
	name = "Energy - SL L-104 Retro Laser Gun"
	desc = "An antiquated model of the basic lasergun, no longer used or sold by Sharplite. Nevertheless, the sheer popularity of this model makes it a somewhat common sight to this day."
	cost = 1000
	contains = list(/obj/item/storage/guncase/retro)
	crate_name = "laser crate"

/datum/supply_pack/faction/independent/gun/laser
	name = "Energy - SL L-204 Laser Gun"
	desc = "Contains a NT-SL mass-produced lethal, high-energy laser gun."
	cost = 1000
	contains = list(/obj/item/storage/guncase/energy/laser)
	crate_name = "laser crate"

/datum/supply_pack/faction/independent/gun/scatterlaser
	name = "Energy - Scatter Laser"
	desc = "Contains a multi-function scatter energy gun, capable of firing armour penetrating slugs, and devastating scattered laser bolts."
	cost = 1250
	contains = list(/obj/item/gun/energy/laser/scatter)
	crate_name = "scatter laser crate"

/datum/supply_pack/faction/independent/gun/laser/kalix/pistol
	name = "Energy - Etherbor SG-8 Beam Pistol"
	desc = "Contains a single SG-8 Beam Pistol, a civilian-grade sidearm developed in the PGF, manufactured by Etherbor Industries."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/kalixpistol)
	crate_name = "beam pistol crate"

/datum/supply_pack/faction/independent/gun/laser/kalix
	name = "Energy - Etherbor BG-12 Beam"
	desc = "Contains a single BG-12 Beam Rifle, a civilian-grade semi-automatic developed in the PGF, manufactured by Etherbor Industries."
	cost = 3000
	contains = list(/obj/item/storage/guncase/energy/kalixrifle)
	crate_name = "beam rifle crate"

/datum/supply_pack/faction/independent/gun/ion
	name = "Energy - SL Ion"
	desc = "Contains a single Mk.I Ion Projector, a special anti-tank rifle designed to disable electronic threats at range."
	cost = 10000
	contains = list(/obj/item/storage/guncase/energy/iongun)
	crate_name = "ion rifle crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/*
	MARK:		Shotguns
*/

/datum/supply_pack/faction/independent/gun/doublebarrel_shotgun
	name = "Shotgun - Double Barrel (12g)"
	desc = "For when you need to deal with 2 drunkards the old-fashioned way. Contains a double-barreled shotgun, favored by Bartenders. Warranty voided if sawed off."
	cost = 1000
	contains = list(/obj/item/storage/guncase/doublebarrel)
	crate_name = "shotgun crate"

/datum/supply_pack/faction/independent/gun/conflagration
	name = "Shotgun - Conflagration Lever Action (12g)"
	desc = "For when you need to deal with 6 hooligans and look good doing it. Contains one lever-action shotgun, with a 6 round capacity."
	cost = 1500
	contains = list(/obj/item/storage/guncase/conflagration)
	crate_name = "shotgun crate"

/datum/supply_pack/faction/independent/gun/hellfire_shotgun
	name = "Shotgun - Hellfire (12g)"
	desc = "For when you need to deal with 8 hooligans. Contains a pump shotgun, with a 8-round capacity."
	cost = 2000
	contains = list(/obj/item/storage/guncase/hellfire)
	crate_name = "shotgun crate"

/datum/supply_pack/faction/independent/gun/brimstone_shotgun
	name = "Shotgun - Brimstone (12g)"
	desc = "For when you need to deal with 5 hooligans, and QUICKLY. Contains a slamfire shotgun, with a 5-round capacity. Warranty voided if sawed off."
	cost = 2000
	contains = list(/obj/item/storage/guncase/brimstone)
	crate_name = "shotgun crate"

/datum/supply_pack/faction/independent/gun/buckmaster
	name = "Shotgun - Buckmaster (12g)"
	desc = "For when you need to deal with 7 hooligans and can't be arsed to pump. Contains a semi-auto shotgun with a 7-round capacity."
	contains = list(/obj/item/storage/guncase/buckmaster)
	cost = 3000
	crate_name = "shotgun crate"

/datum/supply_pack/faction/independent/gun/saiga
	name = "Shotgun - Saiga (410x76mm)"
	desc = "Contains a Saiga-410 assault shotgun and additional empty medium-sized magazines."
	cost = 5500
	contains = list(/obj/item/storage/guncase/saiga)
	crate_name = "auto shotgun crate"

/*
	MARK:		Rifles
*/

/*
/datum/supply_pack/faction/independent/gun/m12
	name = "Rifle - Sporter (.22lr)"
	desc = "Contains a recently manufactured Model 12 \"Sporter\", Serene Outdoors' premier small game rifle. Chambered in .22lr"
	contains = list(/obj/item/storage/guncase/m12)
	cost = 500
	crate_name = "rifle crate"
*/

/* mark: .38
bullet
	damage = 20
	armour_penetration = 20
match
	damage = 20
	armour_penetration = -10
*/

/datum/supply_pack/faction/independent/gun/winchester
	name = "Rifle - Flaming Arrow Lever Action (.38)"
	desc = "Contains an antiquated lever action rifle intended for hunting wildlife. Chambered in .38 rounds."
	cost = 750
	contains = list(/obj/item/storage/guncase/winchester)
	crate_name = "rifle crate"

/* mark: 8x50mmR
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

/datum/supply_pack/faction/independent/gun/illestren
	name = "Rifle - Illestren (8x50mmR)"
	desc = "Contains an expertly made bolt action rifle intended for hunting wildlife. Chambered in 8x50mmR rounds."
	cost = 1250
	contains = list(/obj/item/storage/guncase/illestren)
	crate_name = "rifle crate"

/* mark: .357
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
/datum/supply_pack/faction/independent/gun/absolution
	name = "Rifle - Absolution Lever Action (.357)"
	desc = "Contains a powerful lever-action rifle for hunting larger wildlife. Chambered in .357."
	cost = 2000
	contains = list(/obj/item/storage/guncase/absolution)
	crate_name = "shotguns crate"

/* mark: .45-70
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
/datum/supply_pack/faction/independent/gun/beacon
	name = "Rifle - Beacon Break Action (.45-70)"
	desc = "Contains a single shot break action rifle to hunt wildlife that annoys you in particular. Chambered in devastating .45-70 rounds. Warranty voided if sawed off."
	cost = 2250
	contains = list(/obj/item/storage/guncase/beacon)
	crate_name = "rifle crate"

/* mark: 7.62x40mm
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
/datum/supply_pack/faction/independent/gun/m15
	name = "Rifle - Super Sporter (7.62x40mm)"
	desc = "Contains a recently manufactured Model 15 \"Super Sporter\", Serene Outdoors' premier hunting rifle. Chambered in 7.62x40mm"
	contains = list(/obj/item/storage/guncase/m15)
	cost = 2500
	crate_name = "rifle crate"

/* mark: 8x50mmR
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
/datum/supply_pack/faction/independent/gun/woodsman
	name = "Rifle - Model 23 'Woodsman' Hunting (8x50mmR)"
	desc = "Contains a semi-automatic hunting rifle chambered in 8x50mmR and produced by Serene Outdoors. Come with three magazines with a 5-round capacity."
	cost = 3500
	contains = list(/obj/item/storage/guncase/woodsman)
	crate_name = "hunting rifle crate"

/*
	MARK:		Auto Rifles
*/

/* mark: 7.62x40mm
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
/datum/supply_pack/faction/independent/gun/skm
	name = "Assault-Rifle - SKM-24 (7.62x40mm)"
	desc = "Contains a high-powered, automatic rifle chambered in 7.62x40mm."
	cost = 5000
	contains = list(/obj/item/storage/guncase/skm)
	crate_name = "auto rifle crate"

// [Balance? No Lore.]
// /datum/supply_pack/faction/independent/gun/g36
// 	name = "Assault-Rifle - G36"
// 	desc = "Contains a G36 automatic rifle and two standard-sized magazines."
// 	cost = 12000
// 	contains = list(/obj/item/storage/guncase/g36)
// 	crate_name = "auto rifle crate"

// /datum/supply_pack/faction/independent/gun/g36sh
// 	name = "Assault-Rifle - G36-SH"
// 	desc = "Contains a G36-SH automatic rifle and two small-sized magazines."
// 	cost = 12000
// 	contains = list(/obj/item/storage/guncase/g36sh)
// 	crate_name = "auto rifle crate"

/* mark: .308
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
/datum/supply_pack/faction/independent/gun/morita1
	name = "Assault-Rifle - Morita Mk.I (.308)"
	desc = "Contains a Morita Mk.I and two standard-sized magazines .308."
	cost = 17000
	contains = list(/obj/item/storage/guncase/morita1)
	crate_name = "auto rifle crate"

/* mark: .300
bullet
	damage = 50
	armour_penetration = 40
*/
/datum/supply_pack/faction/independent/gun/scout
	name = "Marksman - Scout Sniper (.300)"
	desc = "Contains a traditional scoped rifle to hunt wildlife and big game from a respectful distance. Chambered in powerful .300 Magnum."
	cost = 4000
	contains = list(/obj/item/storage/guncase/scout)
	crate_name = "rifle crate"

/* mark: 6.5x57mm
bullet
	damage = 40
	armour_penetration = 50
*/
/datum/supply_pack/faction/independent/gun/boomslang90
	name = "Marksman - Boomslang-90 (6.5x57mm)"
	desc = "Contains a civilian variant of the Boomslang Sniper rifle- modified with a 2x scope, rather than a sniper scope. Chambered in the powerful 6.5x57mm."
	cost = 5000
	contains = list(/obj/item/storage/guncase/boomslang)
	crate_name = "rifle crate"

/*
===== Товары SRM & CLIP & PGF от офов. =====
*/

/*
MARK: Pistols
*/


// /datum/supply_pack/faction/independent/gun/cm23
// 	name = "CM-23 Pistol"
// 	desc = "Contains a 10x22mm CM-23 Pistol, standard issue of the Colonial Minutemen."
// 	cost = 1000
// 	contains = list(/obj/item/storage/guncase/pistol/cm23)

// /datum/supply_pack/faction/independent/gun/cm70
// 	name = "CM-70 Machinepistol"
// 	desc = "Contains a 9x18mm machinepistol produced proudly within Lanchester City. Colonial Minuteman issue only."
// 	cost = 2500
// 	contains = list(/obj/item/storage/guncase/pistol/cm70)

// /datum/supply_pack/faction/independent/gun/ashhand
// 	name = "Ashhand Hunting Revolver"
// 	desc = "Contains a single-action .45-70 hunting revolver manufactured by Hunter's Pride for use against the biggest game."
// 	cost = 3500
// 	contains = list(/obj/item/storage/guncase/pistol/ashhand)

// /datum/supply_pack/faction/independent/gun/cm357
// 	name = "CM-357 Automag Pistol"
// 	desc = "Contains a magazine-fed .357 handgun, produced for the CMM-BARD division and available for requisition in small numbers to the Minutemen."
// 	cost = 3000
// 	contains = list(/obj/item/storage/guncase/pistol/cm357)

/*
MARK: SMGs
*/

// /datum/supply_pack/faction/independent/gun/cm5
// 	name = "CM-5 SMG"
// 	desc = "Contains a CM-5 automatic SMG, produced proudly within Lanchester City. Colonial Minuteman issue only."
// 	cost = 2500
// 	contains = list(/obj/item/storage/guncase/cm5)
// 	crate_name = "SMG crate"

/*
MARK: Energy
*/

// /datum/supply_pack/faction/independent/gun/laser/bg16
// 	name = "Etherbor BG-16 Beam Gun"
// 	desc = "Contains a single BG-16 Beam Gun, a military-grade automatic developed in the PGF and manufactured by Etherbor Industries for use within the Marine Corps."
// 	cost = 3000
// 	contains = list(/obj/item/storage/guncase/energy/bg16)
// 	crate_name = "beam gun crate"

// /datum/supply_pack/faction/independent/gun/laser/bgc10
// 	name = "Etherbor BGC-10 Beam Carbine"
// 	desc = "Contains a single BGC-10 Beam Carbine, an intermediate military-grade automatic developed in the PGF and manufactured by Etherbor Industries for use within the Marine Corps."
// 	cost = 5000
// 	contains = list(/obj/item/storage/guncase/energy/bgc10)
// 	crate_name = "beam carbine crate"

/*
MARK: Shotguns
*/

// /datum/supply_pack/faction/independent/gun/cm15
// 	name = "CM-15 Shotgun"
// 	desc = "A combat shotgun produced by Lanchester Arms Co. for the Colonial Minuteman and CMM-BARD for use in CQC operations. Chambered in 12ga and equipped with 8-round box magazines."
// 	contains = list(/obj/item/storage/guncase/cm15)
// 	cost = 4000
// 	crate_name = "shotgun crate"

/*
MARK: Rifles
*/

// /datum/supply_pack/faction/independent/gun/cm82
// 	name = "CM-82 Standard Issue"
// 	desc = "Contains a high-powered rifle chambered in 5.56 CLIP, standard issue of the Colonial Minutemen."
// 	cost = 5000
// 	contains = list(/obj/item/storage/guncase/cm82)
// 	crate_name = "rifle crate"

// /datum/supply_pack/faction/independent/gun/cm24
// 	name = "CM-24 Surplus Stockpile"
// 	desc = "Contains a higher-powered rifle chambered in 7.62x40 CLIP based on the SKM-24 platform, formerly the main service rifle of the CMM. This one has been pulled from reservist stockpiles."
// 	cost = 5000
// 	contains = list(/obj/item/storage/guncase/cm24)
// 	crate_name = "rifle crate"

/* Heavy */

// /datum/supply_pack/faction/independent/gun/cm40
// 	name = "CM-40 Squad Automatic Weapon"
// 	desc = "Contains a CM-40 Squad Automatic Weapon, a CLIP-produced LMG for Minuteman usage in situations that require heavy firepower. For Minuteman use only."
// 	cost = 6000
// 	contains = list(/obj/item/storage/guncase/cm40)
// 	crate_name = "LMG crate"

/* Marksman Rifles */

// /datum/supply_pack/faction/independent/gun/cmf4
// 	name = "CM-F4 Designated Marksman"
// 	desc = "Contains a high-powered marksman rifle chambered in .308. For Colonial Minuteman issue only."
// 	cost = 3500
// 	contains = list(/obj/item/storage/guncase/cmf4)
// 	crate_name = "dmr crate"

// /datum/supply_pack/faction/independent/gun/vickland
// 	name = "Vickland Battle"
// 	desc = "Contains a high-powered semi-automatic battle rifle chambered in 8x50mmR and produced by Hunter's Pride. Fed via stripper clips with an 8 round capacity."
// 	cost = 3500
// 	contains = list(/obj/item/storage/guncase/vickland)
// 	crate_name = "dmr crate"

// /datum/supply_pack/faction/independent/gun/f90
// 	name = "CM-F90 Sniper"
// 	desc = "Contains a military sniper rifle equipped with an 8x sniper scope, for Minuteman use only. Chambered in the powerful 6.5x57mm CLIP."
// 	cost = 4500
// 	contains = list(/obj/item/storage/guncase/cmf90)
// 	crate_name = "marksman rifle crate"

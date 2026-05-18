// Логика расчета прожажи:
// Оружие:		Цена карго / 10
// Патроны не продаются
// Магазины не продаются

// MARK: Weapon

/datum/export/weapon

/datum/export/weapon/baton
	unit_name = "Stun baton"
	desc = "Security with a stun baton."
	export_types = list(/obj/item/melee/baton)
	exclude_types = list(/obj/item/melee/baton/cattleprod)
	cost = 250
	include_subtypes = TRUE

/datum/export/weapon/taser
	unit_name = "Advanced taser"
	desc = "Disabler-taser hybrid weapon."
	export_types = list(/obj/item/gun/energy/e_gun/advtaser)
	cost = 125

/datum/export/weapon/laser
	unit_name = "Laser gun"
	desc = "Scatter Laser a multi-function scatter energy gun."
	export_types = list(/obj/item/gun/energy/laser)
	cost = 125

/datum/export/weapon/disabler
	unit_name = "Disabler"
	desc = "One of the most basic energy weapons in the universe."
	export_types = list(/obj/item/gun/energy/disabler)
	cost = 100

/datum/export/weapon/energy_gun
	unit_name = "Energy gun"
	export_types = list(/obj/item/gun/energy/e_gun)
	cost = 150

// MARK: INTQ

/datum/export/weapon/rottweiler
	unit_name = "KM-05 Rottweiler Squad Automatic Weapon"
	desc = "Contains an extensively modified belt fed machine gun, built for special IRMG operations."
	export_types = list(/obj/item/gun/ballistic/automatic/hmg/rottweiler)
	cost = 600

/datum/export/weapon/ssg04
	unit_name = "SsG-04 Designated Marksman Rifle"
	desc = "high-powered marksman rifle chambered in .308. Painted in the brown-and-gold of Inteq."
	export_types = list(/obj/item/gun/ballistic/automatic/marksman/f4)
	cost = 350

/datum/export/weapon/horizonx
	unit_name = "The Horizon-X revolver"
	desc = "A high-powered revolver modified and used by professional IRMG mercenaries. Uses .357 ammo."
	export_types = list(/obj/item/gun/ballistic/revolver/horizonx)
	cost = 175

/datum/export/weapon/g36
	unit_name = "G36M Rifle"
	desc = "An extremely powerful modified G36 to satisfy every gun need a pro mercenary can have. Chambered in 5.56x45"
	export_types = list(/obj/item/gun/ballistic/automatic/assault/g36/inteq)
	cost = 800

// MARK: Nanotrasen

/datum/export/weapon/mini_energy
	unit_name = "NT-SL X26 Miniature energy pistol"
	desc = "One of the most basic energy weapons in the universe. Compact but low capacity. Shoots lethal and disabler lasers. A simple, yet an inefficient PDW. Power in a pocket! Produced by Nanotrasen-Sharplite"
	export_types = list(/obj/item/gun/energy/e_gun/e_old/mini)
	cost = 50

/datum/export/weapon/energy
	unit_name = "NT-SL E-Rifle"
	desc = "One of the most basic energy weapons in the universe. Shoots lethal and disabler lasers. A simple, yet an efficient PDW. It is the egun. Produced by Nanotrasen-Sharplite"
	export_types = list(/obj/item/gun/energy/e_gun/e_old)
	cost = 125
	include_subtypes = FALSE

/datum/export/weapon/etar
	unit_name = "NT-SL 'E-TAR' SMG energy rifle"
	desc = "compact energy-based PDW platform, ideal for suppressing threats at mid-range. For NT employee use only."
	export_types = list(/obj/item/gun/energy/e_gun/e_old/smg)
	cost = 200

/datum/export/weapon/ultima
	unit_name = "NT-SL 'E-SG 500 Second Edition' energy shotgun"
	desc = "Contains an energy-based shotgun equipped with dual kill/disable modes, ideal for short range. The on-board computer is notoriously unreliable. For NT employee use only."
	export_types = list(/obj/item/gun/energy/e_gun/e_old/iot)
	cost = 300

/datum/export/weapon/heavylaser
	unit_name = "NT-SL Laser Accelerator Cannon"
	desc = "A sniper-like Nanotrasen laser gun that deals more damage if the target is far away. You can't attach a scope to it, though"
	export_types = list(/obj/item/gun/energy/lasercannon)
	cost = 350

/datum/export/weapon/hades
	unit_name = "NT-SL AL-655 'Hades' energy rifle"
	desc = "Nanotrasen's pride in energy weapon development. This premium assault rifle is the most reliable Nanotrasen-Sharplite energy weapon."
	export_types = list(/obj/item/gun/energy/e_gun/e_old/hades)
	cost = 600

/datum/export/weapon/cryogelida
	unit_name = "NT-SL PPD-142 'Cryogelida' plasma pistol"
	desc = "A fresh-new experimental plasma pistol developed by Nanotrasen-Sharplite, it has 2 firemodes. Freeze firemode is perfect for cooling syndicate terrorists' heat, and frostbite firemode allows for sending them back into ice age. It synergizes well with Pyrogelida plasma pistol."
	export_types = list(/obj/item/gun/energy/e_gun/plasmapistol_cryo)
	cost = 800

/datum/export/weapon/pyrogelida
	unit_name = "NT-SL PPD-238 'Pyrogelida' plasma pistol"
	desc = "A fresh-new experimental plasma pistol developed by Nanotrasen-Sharplite, it has 2 firemodes. Burn firemode is perfect for non-Geneva-convention-violating combat, and IMMOLATE mode lets you commit warcrimes at the rate of 50 per minute. It synergizes well with Cryogelida plasma pistol."
	export_types = list(/obj/item/gun/energy/e_gun/plasmapistol_fire)
	cost = 900

/*
/datum/export/weapon/ion
	unit_name = "Ion rifle"
	desc = "Mk.I Ion Projector anti-armor weapon designed to disable mechanical threats at range."
	export_types = list(/obj/item/gun/energy/ionrifle)
	cost = 1000

/datum/export/weapon/ion_carbine
	unit_name = "MK2 Ion carbine"
	desc = "An improved model on the ion projector, built to be more compact and ergonomic, while keeping the same max charge. Developed by Nanotrasen-Sharplite"
	export_types = list(/obj/item/gun/energy/ionrifle/carbine)
	cost = 1100
*/

/datum/export/weapon/challenger
	unit_name = "VI 'Challenger' handgun"
	desc = "Challenger pistol, produced by Nanotrasen along with Vigilitas Interstellar."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/challenger)
	cost = 75

/datum/export/weapon/vector
	unit_name = "VI Vector SMG"
	desc = "Vector PDW produced by Sharplite Defense and chambered in 9x18mm."
	export_types = list(/obj/item/gun/ballistic/automatic/smg/vector)
	cost = 300

/datum/export/weapon/wt550
	unit_name = "WT-550 automatic rifle"
	desc = "A ballistic PDW produced by Vigilitas Interstellar."
	export_types = list(/obj/item/gun/ballistic/automatic/smg/wt550)
	cost = 350

/datum/export/weapon/shotgun
	unit_name = "Combat shotgun"
	desc = "For when the enemy absolutely needs to be replaced with lead."
	export_types = list(/obj/item/gun/ballistic/shotgun/automatic/combat)
	cost = 350

// MARK: SolFed

/datum/export/weapon/gauss
	unit_name = "Prototype Gauss Rifle"
	desc = "high-powered prototype armor-piercing gauss rifle."
	export_types = list(/obj/item/gun/ballistic/automatic/powered/gauss)
	cost = 300

/datum/export/weapon/pistole_c
	unit_name = "Solar Pistole C"
	desc = "A powerful solarian 5.56mm pistol, looks classic, is ballistic. Produced by Solar Federation."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/solgov)
	cost = 110

/datum/export/weapon/ssg669
	unit_name = "SSG-669C Sniper Rifle"
	desc = "traditional solarian marksman rifle chambered in 8x58mm Caseless."
	export_types = list(/obj/item/gun/ballistic/rifle/solgov)
	cost = 400

/datum/export/weapon/vector
	unit_name = "Vector Carbine"
	desc = "classic automatic carbine from earth, solar system. Chambered in 9x18mm."
	export_types = list(/obj/item/gun/ballistic/automatic/smg/expedition)
	cost = 350

/datum/export/weapon/cm82_solfed
	unit_name = "Model 82 Carbine"
	desc = "The standard Solarian assault rifle, somewhat outdated, but still accurate, reliable and easy to use. This version was manufactured in the Elysium Republic under license from the Solar Federation for the Elysium Brigade. Chambered in 5.56х42 mm."
	export_types = list(/obj/item/gun/ballistic/automatic/assault/cm82)
	cost = 500

// MARK: Independent

/datum/export/weapon/disposable
	unit_name = "Disposable Gun"
	desc = "In some sectors, these disposable pistols are the only firearms that can be legally sold for less than 200cr. That price is still far too high."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/disposable)
	cost = 30

/datum/export/weapon/m17
	unit_name = "M17 Micro Target Pistol"
	desc = "A cheap target shooting pistol manufactured by Serene Outdoors. Chambered in .22 LR."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/m17)
	cost = 40

/datum/export/weapon/derringer
	unit_name = ".38 Derringer"
	desc = "A cheap, concealable pistol manufactured by the reputable Hunter's Pride. At least it's better than a disposable pistol. Chambered in .38 rounds."
	export_types = list(/obj/item/gun/ballistic/derringer)
	cost = 45

/datum/export/weapon/detrevolver
	unit_name = "HP Detective Revolver"
	desc = "concealable revolver favored by police departments around the sector, chambered in .38."
	export_types = list(/obj/item/gun/ballistic/revolver/detective)
	cost = 60

/datum/export/weapon/shadowrevolver
	unit_name = "Shadow Revolver"
	desc = "concealable Shadow revolver, chambered in .44 Roumain."
	export_types = list(/obj/item/gun/ballistic/revolver/shadow)
	cost = 100

/datum/export/weapon/montagne
	unit_name = "HP Montagne Reveolver"
	desc = "revolver issued to high-ranking members of the Saint-Roumain Militia. Chambered in .44."
	export_types = list(/obj/item/gun/ballistic/revolver/montagne)
	cost = 110

/datum/export/weapon/candors
	unit_name = "Candor Pistol"
	desc = "Candor pistol, the trusty sidearm of any spacer, produced by Hunter's Pride and chambered in .45 ACP."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/candor)
	cost = 100

/datum/export/weapon/m20_auto_elite
	unit_name = "M20 Auto Elite Pistol"
	desc = "heavy pistol manufactured by Serene Outdoors. Chambered in .44 Roumain."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/m20_auto_elite)
	cost = 125

/datum/export/weapon/pepperbox
	unit_name = "HP Firebrand Pepperbox Revolver"
	desc = "concealable pepperbox revolver manufactured by the Saint Roumain Militia, chambered in .357."
	export_types = list(/obj/item/gun/ballistic/revolver/firebrand)
	cost = 125

/datum/export/weapon/glock
	unit_name = "Glock Pistol"
	desc = "9x18mm Glock pistol."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/glock)
	cost = 130

/datum/export/weapon/usp
	unit_name = "USP Pistol"
	desc = ".45 caliber USP pistol."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/usp45)
	cost = 135

/datum/export/weapon/firestorm
	unit_name = "Firestorm SMG"
	desc = "Hunter's Pride SMG, intended for internal use by hunters and chambered in .44 Roumain."
	export_types = list(/obj/item/gun/ballistic/automatic/smg/firestorm)
	cost = 400

/datum/export/weapon/skm_carbine
	unit_name = "SKM-24v Gun"
	desc = "SKM-24v was a carbine modification of the SKM-24 during the Frontiersmen War. This, however, is just a shoddy imitation of that carbine, effectively an SKM-24 with a sawed down barrel and a folding wire stock. Can be fired with the stock folded, though accuracy suffers. Chambered in 4.6x30mm."
	export_types = list(/obj/item/gun/ballistic/automatic/smg/skm_carbine)
	cost = 400

/datum/export/weapon/retro
	unit_name = "SL L-104 Retro Laser Gun"
	desc = "An antiquated model of the basic lasergun, no longer used or sold by Sharplite. Nevertheless, the sheer popularity of this model makes it a somewhat common sight to this day."
	export_types = list(/obj/item/gun/energy/laser/retro)
	cost = 100

/datum/export/weapon/laser
	unit_name = "SL L-204 Laser Gun"
	desc = "NT-SL mass-produced lethal, high-energy laser gun."
	export_types = list(/obj/item/gun/energy/sharplite/l201/l204)
	cost = 100

/datum/export/weapon/scatterlaser
	unit_name = "Scatter Laser"
	desc = "multi-function scatter energy gun, capable of firing armour penetrating slugs, and devastating scattered laser bolts."
	export_types = list(/obj/item/gun/energy/laser/scatter)
	cost = 125

/datum/export/weapon/laser/kalix/pistol
	unit_name = "Etherbor SG-8 Beam Pistol"
	desc = "single SG-8 Beam Pistol, a civilian-grade sidearm developed in the PGF, manufactured by Etherbor Industries."
	export_types = list(/obj/item/gun/energy/kalix/pistol)
	cost = 100

/datum/export/weapon/laser/kalix
	unit_name = "Etherbor BG-12 Beam Rifle"
	desc = "single BG-12 Beam Rifle, a civilian-grade semi-automatic developed in the PGF, manufactured by Etherbor Industries."
	export_types = list(/obj/item/gun/energy/kalix)
	cost = 300

/datum/export/weapon/doublebarrel_shotgun
	unit_name = "Double Barrel Shotgun"
	desc = "For when you need to deal with 2 drunkards the old-fashioned way. double-barreled shotgun, favored by Bartenders. Warranty voided if sawed off."
	export_types = list(/obj/item/gun/ballistic/shotgun/doublebarrel)
	cost = 100

/datum/export/weapon/conflagration
	unit_name = "Conflagration Lever Action Shotgun"
	desc = "For when you need to deal with 6 hooligans and look good doing it. Contains one lever-action shotgun, with a 6 round capacity."
	export_types = list(/obj/item/gun/ballistic/shotgun/flamingarrow/conflagration)
	cost = 150

/datum/export/weapon/hellfire_shotgun
	unit_name = "Hellfire Shotgun"
	desc = "For when you need to deal with 8 hooligans. pump shotgun, with a 8-round capacity."
	export_types = list(/obj/item/gun/ballistic/shotgun/hellfire)
	cost = 200

/datum/export/weapon/brimstone_shotgun
	unit_name = "Brimstone Shotgun"
	desc = "For when you need to deal with 5 hooligans, and QUICKLY. slamfire shotgun, with a 5-round capacity. Warranty voided if sawed off."
	export_types = list(/obj/item/gun/ballistic/shotgun/brimstone)
	cost = 200

/datum/export/weapon/buckmaster
	unit_name = "Buckmaster Shotgun"
	desc = "For when you need to deal with 7 hooligans and can't be arsed to pump. semi-auto shotgun with a 7-round capacity."
	export_types = list(/obj/item/gun/ballistic/shotgun/automatic/m11)
	cost = 300

/datum/export/weapon/saiga
	unit_name = "Saiga-410 \"Saiga\" shotgun assault"
	desc = "Saiga-410 assault shotgun and additional empty medium-sized magazines."
	export_types = list(/obj/item/gun/ballistic/automatic/assault/saiga)
	cost = 550

/datum/export/weapon/m12
	unit_name = "Sporter Rifle"
	desc = "recently manufactured Model 12 \"Sporter\", Serene Outdoors' premier small game rifle. Chambered in .22lr"
	export_types = list(/obj/item/gun/ballistic/automatic/m12_sporter)
	cost = 50

/datum/export/weapon/winchester
	unit_name = "Flaming Arrow Lever Action Rifle"
	desc = "Contains an antiquated lever action rifle intended for hunting wildlife. Chambered in .38 rounds."
	export_types = list(/obj/item/gun/ballistic/shotgun/flamingarrow)
	cost = 75

/datum/export/weapon/illestren
	unit_name = "Illestren Rifle"
	desc = "Contains an expertly made bolt action rifle intended for hunting wildlife. Chambered in 8x50mmR rounds."
	export_types = list(/obj/item/gun/ballistic/rifle/illestren)
	cost = 125

/datum/export/weapon/absolution
	unit_name = "Absolution Lever Action Rifle"
	desc = "powerful lever-action rifle for hunting larger wildlife. Chambered in .357."
	export_types = list(/obj/item/gun/ballistic/shotgun/flamingarrow/absolution)
	cost = 200

/datum/export/weapon/beacon
	unit_name = "Beacon Break Action Rifle"
	desc = "single shot break action rifle to hunt wildlife that annoys you in particular. Chambered in devastating .45-70 rounds. Warranty voided if sawed off."
	export_types = list(/obj/item/gun/ballistic/shotgun/doublebarrel/beacon)
	cost = 225

/datum/export/weapon/m15
	unit_name = "Super Sporter Rifle"
	desc = "recently manufactured Model 15 \"Super Sporter\", Serene Outdoors' premier hunting rifle. Chambered in 5.56 CLIP"
	export_types = list(/obj/item/gun/ballistic/automatic/m15)
	cost = 250

/datum/export/weapon/woodsman
	unit_name = "Model 23 'Woodsman' Hunting Rifle"
	desc = "semi-automatic hunting rifle chambered in 8x50mmR and produced by Serene Outdoors. Come with three magazines with a 5-round capacity."
	export_types = list(/obj/item/gun/ballistic/automatic/marksman/woodsman)
	cost = 350

/datum/export/weapon/scout
	unit_name = "Scout Sniper Rifle"
	desc = "traditional scoped rifle to hunt wildlife and big game from a respectful distance. Chambered in powerful .300 Magnum."
	export_types = list(/obj/item/gun/ballistic/rifle/scout)
	cost = 400

/datum/export/weapon/skm
	unit_name = "SKM-24 Rifle"
	desc = "high-powered, automatic rifle chambered in 7.62x40mm CLIP."
	export_types = list(/obj/item/gun/ballistic/automatic/assault/skm)
	cost = 500

/datum/export/weapon/morita1
	unit_name = "Morita Mk.I Rifle"
	desc = "Morita Mk.I and two standard-sized magazines."
	export_types = list(/obj/item/gun/ballistic/automatic/assault/morita1)
	cost = 1700

// MARK: Syndicate

/datum/export/weapon/pc76
	unit_name = "PC-76 'Ringneck' Pistol"
	desc = "noticably smaller military variant of the Ringneck pistol, chambered in 10x22mm."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/ringneck)
	cost = 125

/datum/export/weapon/asp
	unit_name = "BC-81 'Asp'"
	desc = "compact armor-piercing sidearm, chambered in 5.7x39mm"
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/asp)
	cost = 125

/datum/export/weapon/a357
	unit_name = "R-23 'Viper' Revolver"
	desc = "double-action military variant of the Viper revolver, chambered in .357 magnum."
	export_types = list(/obj/item/gun/ballistic/revolver/viper)
	cost = 175

/datum/export/weapon/bulldog
	unit_name = "Bulldog Shotgun"
	desc = "An automatic shotgun chambered in 12ga produced by Scarborough Arms for exclusive use by licensed buyers. Comes with 8-round box magazines."
	export_types = list(/obj/item/gun/ballistic/shotgun/automatic/bulldog)
	cost = 400

/datum/export/weapon/c20r
	unit_name = "C-20r 'Cobra' SMG"
	desc = "military variant of the Cobra SMG, chambered in .45"
	export_types = list(/obj/item/gun/ballistic/automatic/smg/cobra)
	cost = 280

/datum/export/weapon/rattlesnake
	unit_name = "Rattlesnake Machinepistol"
	desc = "Contains an automatic machinepistol produced by Scarborough Arms, chambered in 9x18mm."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/rattlesnake)
	cost = 250

/datum/export/weapon/sidewinder
	unit_name = "Sidewinder SMG"
	desc = "Sidewinder PDW produced by Scarborough Arms and chambered in 5.7x39mm for armor-piercing capabilities."
	export_types = list(/obj/item/gun/ballistic/automatic/smg/sidewinder)
	cost = 300

/datum/export/weapon/hydra
	unit_name = "SMR-80 'Hydra' Automatic Rifle"
	desc = "high-powered automatic rifle produced by Scarborough Arms and chambered in 5.56 CLIP. This one is a standard variant."
	export_types = list(/obj/item/gun/ballistic/automatic/assault/hydra)
	cost = 500

/datum/export/weapon/boomslang10
	unit_name = "MSR-90 'Boomslang' Sniper Rifle"
	desc = "military variant of the Boomslang Sniper rifle equipped with an 8x sniper scope, for licenesed buyers only. Chambered in the powerful 6.5x57mm CLIP."
	export_types = list(/obj/item/gun/ballistic/automatic/marksman/boomslang)
	cost = 450

/datum/export/weapon/himehabu
	unit_name = "PC-81 'Himehabu' Pistol"
	desc = "An astonishingly compact machine pistol firing ultra-light projectiles, designed to be as small and concealable as possible while remaining a credible threat at very close range. Armor penetration is practically non-existent. Chambered in .22."
	export_types = list(/obj/item/gun/ballistic/automatic/pistol/himehabu)
	cost = 80

// MARK: Grenade
/datum/export/weapon/flashbang
	unit_name = "flashbang grenade"
	export_types = list(/obj/item/grenade/flashbang)
	cost = 5

/datum/export/weapon/teargas
	unit_name = "tear gas grenade"
	export_types = list(/obj/item/grenade/chem_grenade/teargas)
	cost = 5

/datum/export/weapon/flash
	unit_name = "handheld flash"
	export_types = list(/obj/item/assembly/flash)
	cost = 5
	include_subtypes = TRUE

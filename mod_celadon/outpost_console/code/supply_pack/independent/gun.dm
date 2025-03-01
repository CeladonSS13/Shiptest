/datum/supply_pack/faction/independent/gun
	group = "Guns"
	crate_type = /obj/structure/closet/crate/secure/weapon

/*
MARK:		Pistols
*/

/datum/supply_pack/faction/independent/gun/disposable
	name = "Disposable Gun Crate"
	desc = "In some sectors, these disposable pistols are the only firearms that can be legally sold for less than 300cr. That price is still far too high."
	cost = 350
	contains = list(/obj/item/storage/guncase/pistol/disposable)
	crate_name = "disposable gun crate"

/datum/supply_pack/faction/independent/gun/derringer
	name = ".38 Derringer Crate"
	desc = "A cheap, concealable pistol manufactured by the reputable Hunter's Pride. At least it's better than a disposable pistol. Chambered in .38 rounds."
	cost = 450
	contains = list(/obj/item/storage/guncase/pistol/derringer)
	crate_name = "derringer crate"

/datum/supply_pack/faction/independent/gun/ringneck
	name = "Ringneck Pistol Crate"
	desc = "Contains a civillian variant of the Ringneck pistol, produced by Scarborough Arms and chambered in 10mm."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/ringneck)

/datum/supply_pack/faction/independent/gun/candors
	name = "Candor Pistol Crate"
	desc = "Contains a Candor pistol, the trusty sidearm of any spacer, produced by Hunter's Pride and chambered in .45 ACP."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/candor)

/datum/supply_pack/faction/independent/gun/pepperbox
	name = "HP Firebrand Pepperbox Revolver Crate"
	desc = "Contains a concealable pepperbox revolver manufactured by the Saint Roumain Militia, chambered in .357."
	cost = 1250
	contains = list(/obj/item/storage/guncase/pistol/firebrand)

/datum/supply_pack/faction/independent/gun/detrevolver
	name = "Hunter's Pride Detective Revolver Crate"
	desc = "Contains a concealable revolver favored by police departments around the sector, chambered in .38."
	cost = 600
	contains = list(/obj/item/storage/guncase/pistol/detective)

/datum/supply_pack/faction/independent/gun/shadowrevolver
	name = "Shadow Revolver Crate"
	desc = "Contains a concealable Shadow revolver, chambered in .44 Roumain."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/shadow)

/datum/supply_pack/faction/independent/gun/viperrevolver
	name = "Viper-23 Revolver Crate"
	desc = "Contains a a civillian variant of the Viper revolver, chambered in .357 magnum."
	cost = 2500
	contains = list(/obj/item/storage/guncase/pistol/viper)

/*
MARK:	Энергетическое
*/

/datum/supply_pack/faction/independent/gun/laser
	name = "Laser Gun Crate"
	desc = "Contains a NT-SL mass-produced lethal, high-energy laser gun."
	cost = 1000
	contains = list(/obj/item/storage/guncase/energy/laser)
	crate_name = "laser crate"

/datum/supply_pack/faction/independent/gun/ion
	name = "Ion Rifle Crate"
	desc = "Contains a single Mk.I Ion Projector, a special anti-tank rifle designed to disable electronic threats at range."
	cost = 10000
	contains = list(/obj/item/storage/guncase/energy/iongun)
	crate_name = "ion rifle crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/gun/laser/kalix/pistol
	name = "Etherbor SG-8 Beam Pistol Crate"
	desc = "Contains a single SG-8 Beam Pistol, a civilian-grade sidearm developed in the PGF, manufactured by Etherbor Industries."
	cost = 1000
	contains = list(/obj/item/storage/guncase/pistol/kalixpistol)
	crate_name = "beam pistol crate"

/datum/supply_pack/faction/independent/gun/laser/kalix
	name = "Etherbor BG-12 Beam Rifle Crate"
	desc = "Contains a single BG-12 Beam Rifle, a civilian-grade semi-automatic developed in the PGF, manufactured by Etherbor Industries."
	cost = 3000
	contains = list(/obj/item/storage/guncase/energy/kalixrifle)
	crate_name = "beam rifle crate"

/*
MARK:		Shotguns
*/

/datum/supply_pack/faction/independent/gun/doublebarrel_shotgun
	name = "Double Barrel Shotgun Crate"
	desc = "For when you need to deal with 2 drunkards the old-fashioned way. Contains a double-barreled shotgun, favored by Bartenders. Warranty voided if sawed off."
	cost = 1000
	contains = list(/obj/item/storage/guncase/doublebarrel)
	crate_name = "shotguns crate"

/datum/supply_pack/faction/independent/gun/conflagration
	name = "Conflagration Lever Action Shotgun Crate"
	desc = "For when you need to deal with 6 hooligans and look good doing it. Contains one lever-action shotgun, with a 6 round capacity."
	cost = 1500
	contains = list(/obj/item/storage/guncase/conflagration)
	crate_name = "shotguns crate"

/datum/supply_pack/faction/independent/gun/hellfire_shotgun
	name = "Hellfire Shotgun Crate"
	desc = "For when you need to deal with 8 hooligans. Contains a pump shotgun, with a 8-round capacity."
	cost = 2000
	contains = list(/obj/item/storage/guncase/hellfire)
	crate_name = "shotgun crate"

/datum/supply_pack/faction/independent/gun/brimstone_shotgun
	name = "Brimstone Shotgun Crate"
	desc = "For when you need to deal with 5 hooligans, and QUICKLY. Contains a slamfire shotgun, with a 5-round capacity. Warranty voided if sawed off."
	cost = 2000
	contains = list(/obj/item/storage/guncase/brimstone)
	crate_name = "shotgun crate"

/*
MARK:		Rifles
*/

/datum/supply_pack/faction/independent/gun/winchester
	name = "Flaming Arrow Lever Action Rifle Crate"
	desc = "Contains an antiquated lever action rifle intended for hunting wildlife. Chambered in .38 rounds."
	cost = 750
	contains = list(/obj/item/storage/guncase/winchester)
	crate_name = "rifle crate"

/datum/supply_pack/faction/independent/gun/absolution
	name = "Absolution Lever Action Rifle Crate"
	desc = "Contains a powerful lever-action rifle for hunting larger wildlife. Chambered in .357."
	cost = 2000
	contains = list(/obj/item/storage/guncase/absolution)
	crate_name = "shotguns crate"

/datum/supply_pack/faction/independent/gun/illestren
	name = "Illestren Rifle Crate"
	desc = "Contains an expertly made bolt action rifle intended for hunting wildlife. Chambered in 8x50mmR rounds."
	cost = 1250
	contains = list(/obj/item/storage/guncase/illestren)
	crate_name = "rifle crate"

/datum/supply_pack/faction/independent/gun/beacon
	name = "Beacon Break Action Rifle Crate"
	desc = "Contains a single shot break action rifle to hunt wildlife that annoys you in particular. Chambered in devastating .45-70 rounds. Warranty voided if sawed off."
	cost = 2250
	contains = list(/obj/item/storage/guncase/beacon)
	crate_name = "rifle crate"

/datum/supply_pack/faction/independent/gun/scout
	name = "Scout Sniper Rifle Crate"
	desc = "Contains a traditional scoped rifle to hunt wildlife and big game from a respectful distance. Chambered in powerful .300 Magnum."
	cost = 4000
	contains = list(/obj/item/storage/guncase/scout)
	crate_name = "rifle crate"

/datum/supply_pack/faction/independent/gun/boomslang90
	name = "Boomslang-90 Rifle Crate"
	desc = "Contains a civillian variant of the Boomslang Sniper rifle- modified with a 2x scope, rather than a sniper scope. Chambered in the powerful 6.5x57mm CLIP."
	cost = 5000
	contains = list(/obj/item/storage/guncase/boomslang)
	crate_name = "rifle crate"

/datum/supply_pack/faction/independent/gun/cobra20
	name = "Cobra-20 SMG Crate"
	desc = "Contains a civillian variant of the Cobra SMG, manufactured by Scaraborough Arms and chambered in .45"
	cost = 3000
	contains = list(/obj/item/storage/guncase/cobra)
	crate_name = "SMG crate"

/datum/supply_pack/faction/independent/gun/skm
	name = "SKM-24 Rifle Crate"
	desc = "Contains a high-powered, automatic rifle chambered in 7.62x40mm CLIP."
	cost = 5000
	contains = list(/obj/item/storage/guncase/skm)
	crate_name = "auto rifle crate"

/datum/supply_pack/faction/independent/gun/attachment/rail_light
	name = "Tactical Rail Light Crate"
	desc = "Contains a single rail light to be mounted on a firearm."
	cost = 250
	contains = list(/obj/item/attachment/rail_light)
	crate_name = "rail light crate"

/datum/supply_pack/faction/independent/gun/attachment/laser_sight
	name = "Laser Sight Crate"
	desc = "Contains a single rail light to be mounted on a firearm."
	cost = 250
	contains = list(/obj/item/attachment/laser_sight)
	crate_name = "laser sight crate"

/datum/supply_pack/faction/independent/gun/attachment/bayonet
	name = "Bayonet Crate"
	desc = "Contains a single bayonet to be mounted on a firearm."
	cost = 250
	contains = list(/obj/item/attachment/bayonet)
	crate_name = "bayonet crate"

/datum/supply_pack/faction/independent/gun/attachment/silencer
	name = "Suppressor Crate"
	desc = "Contains a single suppressor to be mounted on a firearm."
	cost = 250
	contains = list(/obj/item/attachment/silencer)
	crate_name = "silencer crate"

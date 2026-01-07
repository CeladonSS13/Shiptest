/datum/supply_pack/faction/syndicate/gun
	category = "Security - Guns"

/*
/datum/supply_pack/faction/syndicate/gun/himehabu
	name = "Pistol - PC-81 'Himehabu' (.22)"
	desc = "An astonishingly compact machine pistol firing ultra-light projectiles, designed to be as small and concealable as possible while remaining a credible threat at very close range. Armor penetration is practically non-existent. Chambered in .22."
	contains = list(/obj/item/storage/guncase/syndicate/himehabu)
	cost = 800
*/

/datum/supply_pack/faction/syndicate/gun/a357
	name = "Revolver - R-23 'Viper' (.357)"
	desc = "Contains a double-action military variant of the Viper revolver, chambered in .357 magnum."
	cost = 1750
	contains = list(/obj/item/storage/guncase/pistol/a357)
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

/datum/supply_pack/faction/syndicate/gun/pc76
	name = "Pistol - PC-76 'Ringneck' (10x22mm)"
	desc = "Contains a noticably smaller military variant of the Ringneck pistol, chambered in 10x22mm."
	cost = 1250
	contains = list(/obj/item/storage/guncase/pistol/pc76)
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

/datum/supply_pack/faction/syndicate/gun/asp
	name = "Pistol - BC-81 'Asp' (5.7x39mm)"
	desc = "Contains a compact armor-piercing sidearm, chambered in 5.7x39mm"
	cost = 1250
	contains = list(/obj/item/storage/guncase/pistol/asp)
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

/* 9x18mm - Do not like Syndicate
/datum/supply_pack/faction/syndicate/gun/rattlesnake
	name = "Machinepistol - Rattlesnake (9x18mm)"
	desc = "Contains an automatic machinepistol produced by Scarborough Arms, chambered in 9x18mm."
	cost = 2500
	contains = list(/obj/item/storage/guncase/rattlesnake)
	crate_name = "Machinepistol crate"
*/
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

/datum/supply_pack/faction/syndicate/gun/bulldog
	name = "Auto-Shotgun - Bulldog (12g)"
	desc = "An automatic shotgun chambered in 12ga produced by Scarborough Arms for exclusive use by licensed buyers. Comes with 8-round box magazines."
	contains = list(/obj/item/storage/guncase/bulldog)
	cost = 4000
	crate_name = "shotgun crate"

/datum/supply_pack/faction/syndicate/gun/c20r
	name = "SMG - C-20r 'Cobra' (.45)"
	desc = "Contains a military variant of the Cobra SMG, chambered in .45"
	cost = 2800
	contains = list(/obj/item/storage/guncase/c20r)
	crate_name = "SMG crate"
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

/datum/supply_pack/faction/syndicate/gun/sidewinder
	name = "SMG - Sidewinder (5.7x39mm)"
	desc = "Contains a Sidewinder PDW produced by Scarborough Arms and chambered in 5.7x39mm for armor-piercing capabilities."
	cost = 3000
	contains = list(/obj/item/storage/guncase/sidewinder)
	crate_name = "SMG crate"
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

/datum/supply_pack/faction/syndicate/gun/hydra
	name = "Assault-Rifle - SMR-80 'Hydra' (5.56x42mm)"
	desc = "Contains a high-powered automatic rifle produced by Scarborough Arms and chambered in 5.56x42mm. This one is a standard variant."
	cost = 5000
	contains = list(/obj/item/storage/guncase/hydra)
	crate_name = "rifle crate"

/datum/supply_pack/faction/syndicate/gun/saw80
	name = "LMG - SAW-80 'Hydra' (5.56x42mm)"
	desc = "Contains one of the rarely-produced SAW-80 Squad Automatic Weapon platforms, exclusively for licensed buyers. Remember, short controlled bursts!"
	cost = 7000
	contains = list(/obj/item/storage/guncase/saw80)
	crate_name = "LMG crate"

/datum/supply_pack/faction/syndicate/gun/sbr80
	name = "Marksman - SBR-80 'Hydra' (5.56x42mm)"
	desc = "Contains a high-powered marksman rifle chambered in 5.56x42mm and produced by Scarborough Arms. A modification of the ever-popular SMR-80 platform."
	cost = 3500
	contains = list(/obj/item/storage/guncase/sbr80)
	crate_name = "dmr crate"
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

/datum/supply_pack/faction/syndicate/gun/boomslang10
	name = "Marksman - MSR-90 'Boomslang' (6.5x57mm)"
	desc = "Contains a military variant of the Boomslang Sniper rifle equipped with an 8x sniper scope, for licenesed buyers only. Chambered in the powerful 6.5x57mm."
	cost = 4500
	contains = list(/obj/item/storage/guncase/boomslangmilitary)
	crate_name = "marksman rifle crate"
/* MARK: 6.5mm / 6.5x57mm
bullet
	damage = 40
	armour_penetration = 50
*/

/datum/supply_pack/faction/syndicate/gun/taipan
	name = "Marksman - AMR-83 \"Taipan\" (.50 BMG)"
	desc = "Contains a  monstrous semi-automatic anti-materiel rifle, surprisingly short for its class. Designed to destroy mechs, light vehicles, and equipment, but more than capable of obliterating regular personnel. Chambered in .50 BMG."
	cost = 18000
	contains = list(/obj/item/storage/guncase/taipan)
	crate_name = "marksman rifle crate"
/* MARK: .50 BMG
bullet
	damage = 70
	knockdown = 50
	armour_penetration = 60
*/

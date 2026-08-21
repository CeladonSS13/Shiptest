/datum/supply_pack/faction/solfed/gun
	category = "Security - Sol-Guns"

// MARK: SolFed Desing

/datum/supply_pack/faction/solfed/gun/pistole_c
	name = "Pistol - Solar C (5.56mm HITP)"
	desc = "A powerful solarian 5.56mm pistol, looks classic, is ballistic. Produced by Solar Federation."
	contains = list(/obj/item/storage/guncase/pistole_c)
	cost = 1100
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

/datum/supply_pack/faction/solfed/gun/modelh
	name = "Pistol - Model 'H' Gauss (FE slug)"
	desc = "Contains a compact solarian-produced gauss pistol, chambered in ferromagnetic slugs. Remember to sign your necessary forms upon arrival."
	cost = 2000
	contains = list(/obj/item/storage/guncase/pistol/modelh)

/datum/supply_pack/faction/solfed/gun/gauss/prototype
	name = "Rifle - Prototype Gauss (FE pellet)"
	desc = "A high capacity experimental rifle developed by Nanotrasen. Sold to solar federation as a weapon for effective crowd control. Chambered in ferromagnetic pellets."
	contains = list(/obj/item/storage/guncase/gauss)
	cost = 3500

/datum/supply_pack/faction/solfed/gun/claris
	name = "Rifle - Claris Gauss (FE pellet)"
	desc = "Contains a high-powered armor-piercing gauss rifle, loaded directly via ferromagnetic pellet speedloaders."
	cost = 2500
	contains = list(/obj/item/storage/guncase/claris)
	crate_name = "dmr crate"

/datum/supply_pack/faction/solfed/gun/gar
	name = "Assault-Rifle - Solarian 'GAR' (FE lance)"
	desc = "A modern solarian military rifle, chambered in ferromagnetic lances. Not for export."
	cost = 5000
	contains = list(/obj/item/storage/guncase/gar)
	crate_name = "auto rifle crate"

// MARK: CM Ballistic

/datum/supply_pack/faction/solfed/gun/ballistic
	category = "Security - CM-Guns"

/datum/supply_pack/faction/solfed/gun/ballistic/cm357
	name = "Automag Pistol - CM-357 (.357)"
	desc = "Contains a magazine-fed .357 handgun, produced for the CLIP-BARD division and available for requisition in small numbers to the Minutemen."
	cost = 2000
	contains = list(/obj/item/storage/guncase/pistol/cm357)
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

/datum/supply_pack/faction/solfed/gun/ballistic/cm70
	name = "Machinepistol - CM-70 (9x18mm)"
	desc = "Contains a 9x18mm machinepistol produced proudly within Lanchester City. Confederated Minuteman issue only."
	cost = 2000
	contains = list(/obj/item/storage/guncase/pistol/cm70)
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

/datum/supply_pack/faction/solfed/gun/ballistic/cm15
	name = "Shotgun - CM-15 (12g)"
	desc = "A combat shotgun produced by Lanchester Arms Co. for the Colonial Minuteman and CMM-BARD for use in CQC operations. Chambered in 12ga and equipped with 8-round box magazines."
	contains = list(/obj/item/storage/guncase/cm15)
	cost = 4000
	crate_name = "shotgun crate"

/datum/supply_pack/faction/solfed/gun/ballistic/cm5
	name = "SMG - CM-5 (9x18mm)"
	desc = "Contains a CM-5 automatic SMG, produced proudly within Lanchester City. Confederated Minutemen issue only."
	cost = 3500
	contains = list(/obj/item/storage/guncase/cm5)
	crate_name = "SMG crate"
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

///obj/item/gun/ballistic/automatic/smg/cm5/compact

/datum/supply_pack/faction/solfed/gun/ballistic/cm82
	name = "Assault-Rifle - CM-82 (5.56x42mm)" // "Rifle - Model 82 Carbine (5.56x42mm)"
	desc = "The standard Solarian assault rifle, somewhat outdated, but still accurate, reliable and easy to use. This version was manufactured in the Elysium Republic under license from the Solar Federation for the Elysium Brigade. Chambered in 5.56х42mm."
	contains = list(/obj/item/storage/guncase/cm82)
	cost = 5000
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

/datum/supply_pack/faction/solfed/gun/ballistic/cm24
	name = "Assault-Rifle - CM-24 (7.62x40mm)"
	desc = "Contains a higher-powered rifle chambered in 7.62x40mm based on the SKM-24 platform, formerly the main service rifle of the CMM. This one has been pulled from reservist stockpiles."
	cost = 5000
	contains = list(/obj/item/storage/guncase/cm24)
	crate_name = "rifle crate"

/datum/supply_pack/faction/solfed/gun/ballistic/cm40
	name = "HMG - CM-40 (7.62x40mm)"
	desc = "Contains a CM-40 Squad Automatic Weapon, LMG for Solar Federation usage in situations that require heavy firepower."
	cost = 6000
	contains = list(/obj/item/storage/guncase/cm40)
	crate_name = "LMG crate"
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

/datum/supply_pack/faction/solfed/gun/ballistic/mf4
	name = "Marksman - CM-F4 (.308)"
	desc = "Contains a high-powered marksman rifle chambered in .308. For Solar Federation issue only."
	cost = 3500
	contains = list(/obj/item/storage/guncase/cmf4)
	crate_name = "dmr crate"
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

/datum/supply_pack/faction/solfed/gun/ballistic/f90
	name = "Marksman - CM-F90 (6.5x57mm)"
	desc = "Contains a military sniper rifle equipped with an 8x sniper scope, for Solar Federation use only. Chambered in the powerful 6.5mm cartridge."
	cost = 4000
	contains = list(/obj/item/storage/guncase/cmf90)
	crate_name = "marksman rifle crate"
/* MARK: 6.5mm / 6.5x57mm
bullet
	damage = 40
	armour_penetration = 50
*/

/datum/supply_pack/faction/solfed/gun/ballistic/ssg669
	name = "Marksman - SSG-669C (8x58mm)"
	desc = "Contains a traditional solarian marksman rifle chambered in 8x58mm Caseless."
	cost = 4000
	contains = list(/obj/item/storage/guncase/ssg669)
	crate_name = "sniper rifle crate"
/* MARK: 8x58mm
bullet
	damage = 45
	armour_penetration = 50
*/

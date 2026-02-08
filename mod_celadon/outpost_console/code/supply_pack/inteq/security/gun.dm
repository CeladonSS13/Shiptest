/datum/supply_pack/faction/inteq/gun
	category = "Security - Guns"

/datum/supply_pack/faction/inteq/gun/horizonx
	name = "Revolver - Horizon-X (.357)"
	desc = "A high-powered revolver modified and used by professional IRMG mercenaries. Uses .357 ammo."
	contains = list(/obj/item/storage/guncase/horizonx/inteq)
	cost = 1750
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

/datum/supply_pack/faction/inteq/gun/commissioner
	name = "Pistol - Commissioner (9x18mm)"
	desc = "Contains a modified Commander pistol, adjusted to fit the IRMG's standards and painted in the brown and gold of all IRMG firearms."
	cost = 750
	contains = list(/obj/item/storage/guncase/commissioner)
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

/datum/supply_pack/faction/inteq/gun/podium_inteq
	name = "Pistol - P46 Schnauzer (4.6x30mm)"
	desc = "Contains a compact armor-piercing sidearm, chambered in 4.6x30mm."
	cost = 1250
	contains = list(/obj/item/storage/guncase/pistol/podium_inteq)
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

/datum/supply_pack/faction/inteq/gun/pinscher
	name = "Heavy-Pistol - Pinscher (.44)"
	desc = "Contains a heavy pistol manufactured by Serene Outdoors and modified to fit IRMG's standards. Chambered in .44 Roumain."
	cost = 1500
	contains = list(/obj/item/storage/guncase/pistol/pinscher)
	crate_name = "pistol crate"
/* MARK: .44
bullet
	damage = 35
	armour_penetration = 0
hp
	damage = 50
	armour_penetration = 0
*/

/datum/supply_pack/faction/inteq/gun/kingsnake
	name = "Machinepistol - Kingsnake (9x18mm)"
	desc = "Contains an automatic machinepistol chambered in 9x18mm, painted in the brown-and-gold of Inteq."
	cost = 2000
	contains = list(/obj/item/storage/guncase/kingsnake)
	crate_name = "Machinepistol crate"
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

/datum/supply_pack/faction/inteq/gun/mastiff
	name = "Auto-Shotgun - Mastiff (12g)"
	desc = "An automatic shotgun modified for exclusive use by the IRMG and chambered in 12ga. Comes with 8-round box magazines."
	contains = list(/obj/item/storage/guncase/mastiff)
	cost = 4000
	crate_name = "shotgun crate"

/datum/supply_pack/faction/inteq/gun/mongrel
	name = "SMG - SKM-44v Mongrel (10x22mm)"
	desc = "Contains a shortened variant of the SKM rechambered to 10x22mm and painted in the brown-and-gold of Inteq."
	cost = 3000
	contains = list(/obj/item/storage/guncase/mongrel)
	crate_name = "SMG crate"
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

/datum/supply_pack/faction/inteq/gun/bdm50
	name = "SMG - BDM-50 'Akita' (4.6x30mm)"
	desc = "Contains a compact Automatic personal defense weapon chambered in 4.6x30mm, in use by the IRMG."
	cost = 3500
	contains = list(/obj/item/storage/guncase/bdm50)
	crate_name = "SMG crate"
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

/datum/supply_pack/faction/inteq/gun/inteq_skm
	name = "Assault-Rifle - SKM-44 (7.62x40mm)"
	desc = "Contains a SKM painted in the brown-and-gold of Inteq, chambered in 7.62x40mm. "
	cost = 5000
	contains = list(/obj/item/storage/guncase/skm_inteq)
	crate_name = "auto rifle crate"
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

/datum/supply_pack/faction/inteq/gun/g36
	name = "Assault-Rifle - G36M (5.56x45mm)"
	desc = "An extremely powerful modified G36 to satisfy every gun need a pro mercenary can have. Chambered in 5.56x45mm"
	contains = list(/obj/item/storage/guncase/g36/inteq)
	cost = 8000
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

/datum/supply_pack/faction/inteq/gun/rottweiler
	name = "LMG - KM-05 Rottweiler (.308)"
	desc = "Contains an extensively modified belt fed machine gun, built for special IRMG operations. Bulky and cumbersome, this weapon is chambered in the powerful .308 cartridge."
	cost = 6000
	contains = list(/obj/item/storage/guncase/rottweiler)
	crate_name = "LMG crate"

/datum/supply_pack/faction/inteq/gun/ssg04
	name = "Marksman - SsG-04 (.308)"
	desc = "Contains a high-powered marksman rifle chambered in .308. Painted in the brown-and-gold of Inteq."
	cost = 3500
	contains = list(/obj/item/storage/guncase/ssg04)
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

/datum/supply_pack/faction/inteq/gun/saluki
	name = "Marksman - SSG-08 Saluki (6.5mm)"
	desc = "Contains a military sniper rifle equipped with an 8x sniper scope, fitted by the Inteq Artificer Division. Chambered in the powerful 6.5mm cartridge."
	cost = 4000
	contains = list(/obj/item/storage/guncase/saluki)
	crate_name = "marksman rifle crate"
/* MARK: 6.5mm / 6.5x57mm
bullet
	damage = 40
	armour_penetration = 50
*/

/* // Отключено до реворка плазмы
// Plasma ETAR - Inteq
/datum/supply_pack/faction/inteq/gun/energy/cadejo
	name = "PP10 'Cadejo' Energy Carbine"
	desc = "Contains one refitted Sharplite X12 carbine, for IRMG use. Uses sharplite cells."
	cost = 1250
	contains = list(/obj/item/storage/guncase/cadejo)
	crate_name = "beam carbine crate"

// HADES II - Inteq
/datum/supply_pack/faction/inteq/gun/exp/barghest
	name = "P-Assault-Rifle - PP20 'Barghest' APR"
	desc = "Contains a high-energy, automatic laser rifle. Refitted for IRMG use."
	cost = 7000
	contains = list(/obj/item/storage/guncase/barghest)
	crate_name = "laser crate"
*/

/datum/supply_pack/faction/nanotrasen/gun
	category = "Security - E-Guns"

/*
MARK: E-Guns - NT-SL
*/

/datum/supply_pack/faction/nanotrasen/gun/mini_energy
	name = "E-Pistol - NT-SL X26 Miniature energy pistol"
	desc = "One of the most basic energy weapons in the universe. Compact but low capacity. Shoots lethal and disabler lasers. A simple, yet an inefficient PDW. Power in a pocket! Produced by Nanotrasen-Sharplite"
	cost = 500
	contains = list(/obj/item/storage/guncase/pistol/miniegun_old)
	crate_name = "laser crate"

/datum/supply_pack/faction/nanotrasen/gun/laser
	name = "E-Rifle - NT-SL L-204 laser gun"
	desc = "Basic energy-based laser gun that fires concentrated beams of light which pass through glass and thin metal. Produced by Nanotrasen-Sharplite."
	cost = 1000
	contains = list(/obj/item/storage/guncase/energy/laser)
	crate_name = "laser crate"

/datum/supply_pack/faction/nanotrasen/gun/energy/disabler
	name = "E-Pistol - NT-SL Disabler"
	desc = "A self-defense weapon that exhausts organic targets, weakening them until they collapse. Produced by Nanotrasen-Sharplite."
	cost = 1000
	contains = list(/obj/item/storage/guncase/disabler)
	crate_name = "disabler crate"

/datum/supply_pack/faction/nanotrasen/gun/energy
	name = "E-Rifle - NT-SL"
	desc = "One of the most basic energy weapons in the universe. Shoots lethal and disabler lasers. A simple, yet an efficient PDW. It is the egun. Produced by Nanotrasen-Sharplite"
	cost = 1250
	contains = list(/obj/item/storage/guncase/energy/egun_old)
	crate_name = "energy gun crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/nanotrasen/gun/energy/taser
	name = "E-Pistol - NT-SL Hybrid Taser"
	desc = "A dual-mode taser designed to fire both short-range high-power electrodes and long-range disabler beams. Produced by Nanotrasen-Sharplite."
	cost = 1250
	contains = list(/obj/item/storage/guncase/advtaser)
	crate_name = "hybrid taser crate"

/datum/supply_pack/faction/nanotrasen/gun/etar
	name = "E-SMG - NT-SL 'E-TAR' SMG energy rifle"
	desc = "Contains a compact energy-based PDW platform, ideal for suppressing threats at mid-range. For NT employee use only."
	cost = 2000
	contains = list(/obj/item/storage/guncase/energy/etar_old)
	crate_name = "SMG crate"

/datum/supply_pack/faction/nanotrasen/gun/ultima
	name = "E-Shotgun - NT-SL 'E-SG 500 Second Edition'"
	desc = "Contains an energy-based shotgun equipped with dual kill/disable modes, ideal for short range. The on-board computer is notoriously unreliable. For NT employee use only."
	cost = 3000
	contains = list(/obj/item/gun/energy/e_gun/e_old/iot)
	crate_name = "shotgun crate"

/datum/supply_pack/faction/nanotrasen/gun/heavylaser
	name = "E-Rifle - NT-SL Laser Accelerator Cannon"
	desc = "A sniper-like Nanotrasen laser gun that deals more damage if the target is far away. You can't attach a scope to it, though"
	contains = list(/obj/item/storage/guncase/heavylaser)
	cost = 3500

/datum/supply_pack/faction/nanotrasen/gun/hades
	name = "E-Assault-Rifle - NT-SL AL-655 'Hades'"
	desc = "Nanotrasen's pride in energy weapon development. This premium assault rifle is the most reliable Nanotrasen-Sharplite energy weapon. Good for burning armored targets!"
	cost = 6000
	contains = list(/obj/item/storage/guncase/hades_old)
	crate_name = "laser crate"

/datum/supply_pack/faction/nanotrasen/gun/cryogelida
	name = "Cryo-Pistol - NT-SL PPD-142 'Cryogelida'"
	desc = "A fresh-new experimental plasma pistol developed by Nanotrasen-Sharplite, it has 2 firemodes. Freeze firemode is perfect for cooling syndicate terrorists' heat, and frostbite firemode allows for sending them back into ice age. It synergizes well with Pyrogelida plasma pistol."
	contains = list(/obj/item/storage/guncase/cryogelida)
	cost = 8000

/datum/supply_pack/faction/nanotrasen/gun/pyrogelida
	name = "Pyro-Pistol - NT-SL PPD-238 'Pyrogelida'"
	desc = "A fresh-new experimental plasma pistol developed by Nanotrasen-Sharplite, it has 2 firemodes. Burn firemode is perfect for non-Geneva-convention-violating combat, and IMMOLATE mode lets you commit warcrimes at the rate of 50 per minute. It synergizes well with Cryogelida plasma pistol."
	contains = list(/obj/item/storage/guncase/pyrogelida)
	cost = 9000

/datum/supply_pack/faction/nanotrasen/gun/ion
	name = "Ion-Rifle - NT-SL Ion"
	desc = "A man-portable anti-armor weapon designed to disable mechanical threats at range. Produced by Nanotrasen-Sharplite."
	cost = 10000
	contains = list(/obj/item/storage/guncase/energy/iongun)
	crate_name = "ion rifle crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/nanotrasen/gun/ion_carbine
	name = "Ion-Rifle - NT-SL MK2 Ion carbine"
	desc = "An improved model on the ion projector, built to be more compact and ergonomic, while keeping the same max charge. Developed by Nanotrasen-Sharplite"
	contains = list(/obj/item/storage/guncase/ion_carbine)
	cost = 11000

/*
MARK: Ballistic - VI
*/
/datum/supply_pack/faction/nanotrasen/gun/vi
	category = "Security - VI Guns"

/datum/supply_pack/faction/nanotrasen/gun/vi/rhino
	name = "Revolver - Rhino (.357)"
	desc = "Contains a double-action Rhino Revolver, chambered in .357 magnum."
	cost = 1750
	contains = list(/obj/item/storage/guncase/pistol/rhino)
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

/datum/supply_pack/faction/nanotrasen/gun/vi/challenger
	name = "Pistol - VI 'Challenger' (9x18mm)"
	desc = "Contains a Challenger pistol, produced by Nanotrasen along with Vigilitas Interstellar and is chambered in 9x18mm."
	cost = 750
	contains = list(/obj/item/storage/guncase/pistol/commander)
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

/datum/supply_pack/faction/nanotrasen/gun/vi/combatshotgun
	name = "Shotgun - Combat Shotgun (12g)"
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains two Aussec-designed combat shotguns."
	cost = 3500
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat)
	crate_name = "combat shotguns crate"

/datum/supply_pack/faction/nanotrasen/gun/vi/saber
	name = "SMG - VI Saber (9x18mm)"
	desc = "An experimental ballistic weapon produced by Vigilitas Interstellar. Uses 9x18mm rounds"
	cost = 2500
	contains = list(/obj/item/storage/guncase/saber_old)
	crate_name = "SMG crate"

/datum/supply_pack/faction/nanotrasen/gun/vi/vector
	name = "SMG - VI Vector (9x18mm)"
	desc = "Contains a Vector PDW produced by Sharplite Defense and chambered in 9x18mm."
	cost = 3000
	contains = list(/obj/item/storage/guncase/vector)
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

/*
/datum/supply_pack/faction/nanotrasen/gun/vi/podium
	name = "Pistol - Advantage PH46 Podium (4.6x30mm)"
	desc = "Contains a compact armor-piercing sidearm, chambered in 4.6x30mm. For NT employee use only."
	cost = 1250
	contains = list(/obj/item/storage/guncase/pistol/podium)
*/

/datum/supply_pack/faction/nanotrasen/gun/vi/wt550
	name = "SMG - VI WT-550 (4.6x30mm)"
	desc = "A ballistic PDW produced by Vigilitas Interstellar. Quite old, but still is amazing at filling corporation's enemies with lead. Uses 4.6x30mm rounds"
	cost = 3500
	contains = list(/obj/item/storage/guncase/wt550_old)
	crate_name = "PDW crate"
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

/datum/supply_pack/faction/nanotrasen/gun/vi/gauss
	name = "Rifle - Prototype Gauss (FE pellet)"
	desc = "Contains a high-powered prototype armor-piercing gauss rifle, operable with ferromagnetic pellets. For NT employee use only."
	cost = 3500
	contains = list(/obj/item/storage/guncase/gauss)
	crate_name = "dmr crate"

// MARK: Plasma & Sharplite

/datum/supply_pack/faction/nanotrasen/gun/exp
	category = "Security - Plasma Guns"

/* // Отключено до реворка плазмы
/datum/supply_pack/faction/nanotrasen/gun/exp/l305
	name = "P-SMG - L305 'Rush'"
	desc = "Contains a compact energy-based SMG. For NT employee use only."
	cost = 6000
	contains = list(/obj/item/storage/guncase/energy/etar)
	crate_name = "SMG crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/l204
	name = "P-Rifle - L204 'Resistor'"
	desc = "Contains a lethal, high-energy laser gun."
	cost = 5000
	contains = list(/obj/item/storage/guncase/energy/laser)
	crate_name = "laser crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/hades
	name = "P-Assault-Rifle - AL655 'Hades II'"
	desc = "Contains a high-energy, automatic laser rifle. For NT employee use only."
	cost = 8000
	contains = list(/obj/item/storage/guncase/hades)
	crate_name = "laser crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/l201
	name = "P-Marksman - L201 'Surge'"
	desc = "Contains a high-powered marksman laser. For NT employee use only."
	cost = 12000
	contains = list(/obj/item/storage/guncase/energy/l201)
	crate_name = "dmr crate"
*/

/datum/supply_pack/faction/nanotrasen/gun/exp/al607
	name = "P-Marksman - AL607 'Sarissa'"
	desc = "Contains a AL607 Laser Sniper. For NT employee use only."
	cost = 10000
	contains = list(/obj/item/storage/guncase/energy/al607)
	crate_name = "sniper rifle crate"

/*
/datum/supply_pack/faction/nanotrasen/gun/exp/mini_energy
	name = "X26 'Ohm' Variable Energy Pistol"
	desc = "Contains a small, versatile energy gun, capable of firing both nonlethal and lethal blasts."
	cost = 20000
	contains = list(/obj/item/storage/guncase/pistol/miniegun)
	crate_name = "laser crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/energy/cadejo
	name = "PP10 'Cadejo' Energy Carbine"
	desc = "Contains one refitted Sharplite X12 carbine, for IRMG use. Uses sharplite cells."
	cost = 20000
	contains = list(/obj/item/storage/guncase/cadejo)
	crate_name = "beam carbine crate"


/datum/supply_pack/faction/nanotrasen/gun/exp/cycler
	name = "Advantage AST12 Negotiator"
	desc = "Contains an advanced shotgun with five round dual magazine tubes. For NT employee use only."
	cost = 20000
	contains = list(/obj/item/storage/guncase/cycler)
	crate_name = "shotgun crate"


/datum/supply_pack/faction/nanotrasen/gun/exp/expedition
	name = "SMG - SGL9 Expedition (9x18mm)"
	desc = "Contains a Expidition SMG produced by Nanotrasen Advantage. Chambered in 9x18mm."
	cost = 25
	contains = list(/obj/item/storage/guncase/vector)
	crate_name = "SMG crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/resolution
	name = "PDW - PD46 Resolution (4.6x30mm)"
	desc = "Contains a compact automatic personal defense weapon chambered in 4.6x30mm."
	cost = 25
	contains = list(/obj/item/storage/guncase/wt550)
	crate_name = "PDW crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/bdm50
	name = "PDW - BDM-50 'Akita' (4.6x30mm)"
	desc = "Contains a compact Automatic personal defense weapon chambered in 4.6x30mm, in use by the IRMG."
	cost = 25
	contains = list(/obj/item/storage/guncase/bdm50)
	crate_name = "PDW crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/champion
	name = "PHB Champion Machinepistol (9x18mm)"
	desc = "Contains a compact 9x18mm burst fire machine pistol produced by Nanotrasen advantage. For NT employee use only."
	cost = 25
	contains = list(/obj/item/storage/guncase/saber)
	crate_name = "Machinepistol crate"

/datum/supply_pack/faction/nanotrasen/gun/exp/energy
	name = "Variable Energy Carbine - X12 'Volt'"
	desc = "Contains a versatile energy gun, capable of firing both nonlethal and lethal blasts of light."
	cost = 25
	contains = list(/obj/item/storage/guncase/energy/egun)
	crate_name = "energy gun crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/nanotrasen/gun/exp/x46
	name = "X46 'Amperage' Variable Energy Blaster"
	desc = "Contains an energy-based shotgun equipped with dual kill/disable modes, ideal for short range. For NT employee use only."
	cost = 20000
	contains = list(/obj/item/storage/guncase/energy/ultima)
	crate_name = "shotgun crate"
*/

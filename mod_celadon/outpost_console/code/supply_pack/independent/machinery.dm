/datum/supply_pack/faction/independent/machinery
	group = "Machines & Parts"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/faction/independent/machinery/rnd_beac
	name = "R&D Beacon"
	desc = "A set of specialized platforms for research and production, limited by license. "
	cost = 16000
	contains = list(/obj/item/choice_beacon/rnd)
	crate_name = "r&d starter kit"
	crate_type = /obj/structure/closet/crate/science

// /datum/supply_pack/faction/independent/machinery/selling_pad_pack 	// NEEDS_TO_FIX_ALARM!
// 	name = "Cargo teleport"
// 	desc = " A set of specialized platforms for building and managing a cargo teleport "
// 	cost = 9000
// 	contains = list(/obj/item/circuitboard/machine/selling_pad,
// 					/obj/item/circuitboard/computer/selling_pad_control)
// 	crate_name = "cargo teleport"
// 	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/rnd_full
	name = "Suspicious circuits"
	desc = "A set of specialized circuits for research and production. An unknown craftsman hacked them, now they are not limited by license. "
	cost = 89371
	contains = list(/obj/item/circuitboard/machine/circuit_imprinter,
					/obj/item/circuitboard/machine/protolathe,
					/obj/item/circuitboard/machine/rdserver,
					/obj/item/circuitboard/computer/rdconsole)
	crate_name = "hacked r&d kit"
	crate_type = /obj/structure/closet/crate/science

/*
	MARK:	Двигатели
*/
/datum/supply_pack/faction/independent/machinery/plasma_thruster
	name = "Plasma Thruster Crate"
	desc = "A crate containing a plasma thruster and its heater's electronics. For when you need a lot of extra thrust."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/shuttle/engine/plasma,
					/obj/item/circuitboard/machine/shuttle/heater,
					/obj/item/circuitboard/machine/pipedispenser,
					/obj/machinery/portable_atmospherics/canister/toxins)
	crate_name = "plasma thruster crate"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/faction/independent/machinery/ion_thruster
	name = "Ion Thruster Crate"
	desc = "A crate containing an ion thruster and its precharger's electronics. For when you need a little extra thrust."
	cost = 3000
	contains = list(/obj/item/circuitboard/machine/shuttle/smes,
					/obj/item/circuitboard/machine/shuttle/engine/electric)
	crate_name = "ion thruster crate"
	crate_type = /obj/structure/closet/crate/engineering

/**
	MARK: Генераторы
 */
/datum/supply_pack/faction/independent/machinery/pacman
	name = "P.A.C.M.A.N Generator Crate"
	desc = "Engineers can't set up the engine? Not an issue for you, once you get your hands on this P.A.C.M.A.N. Generator! Takes in plasma and spits out sweet sweet energy."
	cost = 2500
	contains = list(/obj/machinery/power/port_gen/pacman)
	crate_name = "PACMAN generator crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/faction/independent/machinery/solar
	name = "Solar Panel Crate"
	desc = "Go green with this DIY advanced solar array. Contains twenty one solar assemblies, a solar-control circuit board, and tracker. If you have any questions, please check out the enclosed instruction book."
	cost = 1750
	contains  = list(/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/circuitboard/computer/solar_control,
					/obj/item/electronics/tracker,
					/obj/item/paper/guides/jobs/engi/solars)
	crate_name = "solar panel crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/faction/independent/machinery/collector
	name = "Radiation Collector Crate"
	desc = "Contains three radiation collectors. Put that radiation to work on something other than your DNA!"
	cost = 3000
	contains = list(/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector)
	crate_name = "collector crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/faction/independent/machinery/tesla_coils
	name = "Tesla Coil Crate"
	desc = "Whether it's high-voltage executions, creating research points, or just plain old power generation, this pack of four Tesla coils can do it all!"
	cost = 2500
	contains = list(/obj/machinery/power/tesla_coil,
					/obj/machinery/power/tesla_coil,
					/obj/machinery/power/tesla_coil,
					/obj/machinery/power/tesla_coil)
	crate_name = "tesla coil crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/**
	MARK: Дополнения к генераторам
 */
/datum/supply_pack/faction/independent/machinery/grounding_rods
	name = "Grounding Rod Crate"
	desc = "Four grounding rods guaranteed to keep any uppity tesla's lightning under control."
	cost = 2000
	contains = list(/obj/machinery/power/grounding_rod,
					/obj/machinery/power/grounding_rod,
					/obj/machinery/power/grounding_rod,
					/obj/machinery/power/grounding_rod)
	crate_name = "grounding rod crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/*
	MARK:	Запчасти
*/
/datum/supply_pack/faction/independent/machinery/lightbulbs
	name = "Replacement Lights"
	desc = "May the light of Aether shine upon this sector! Or at least, the light of forty two light tubes and twenty one light bulbs."
	cost = 500
	contains = list(/obj/item/storage/box/lights/mixed,
					/obj/item/storage/box/lights/mixed,
					/obj/item/storage/box/lights/mixed)
	crate_name = "replacement lights"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/faction/independent/machinery/t1
	name = "T1 parts crate"
	desc = "A bundle of basic machine parts, containing 3 of each common part type for when you're too lazy to print them yourself."
	cost = 1000
	contains = list(/obj/item/storage/box/stockparts/basic)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/faction/independent/machinery/t2
	name = "T2 parts crate"
	desc = "A bundle of advanced machine parts, containing 2 of each common part type."
	cost = 3500
	contains = list(/obj/item/storage/box/stockparts/t2)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/t3
	name = "T3 parts crate"
	desc = "A bundle of high-tech machine parts, containing 2 of each common part type."
	cost = 6000
	contains = list(/obj/item/storage/box/stockparts/t3)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/machinery/power
	name = "Power Cell Crate"
	desc = "Looking for power overwhelming? Look no further. Contains five high-voltage power cells."
	cost = 5500
	contains = list(/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high)
	crate_name = "power cell crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/**
	MARK: Прочее
 */

/datum/supply_pack/faction/independent/machinery/gravgen
	name = "Ship-Portable Gravity Generator Crate"
	desc = "For those tired of their tools floating away from them. Contains a single gravity generator."
	cost = 2000
	contains = list(/obj/machinery/power/ship_gravity/unanchored)
	crate_name = "gravity generator crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/faction/independent/machinery/breach_shield_gen
	name = "Anti-breach Shield Projector Crate"
	desc = "Hull breaches again? Say no more with the Nanotrasen Anti-Breach Shield Projector! Uses forcefield technology to keep the air in, and the space out. Contains two shield projectors."
	cost = 2500
	contains = list(/obj/machinery/shieldgen,
					/obj/machinery/shieldgen)
	crate_name = "anti-breach shield projector crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/machinery/wall_shield_gen
	name = "Shield Generator Crate"
	desc = "These two shield wall generators are guaranteed to keep any unwanted lifeforms on the outside, where they belong! Not rated for containing singularities or tesla balls."
	cost = 1000
	contains = list(/obj/machinery/power/shieldwallgen,
					/obj/machinery/power/shieldwallgen)
	crate_name = "shield generators crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/machinery/holofield_generator
	name = "Holofield Generator Crate"
	desc = "Contains the electronics you need to set up a new (or replacement) holofield! Buttons not included."
	cost = 1000
	contains = list(/obj/item/circuitboard/machine/shieldwallgen/atmos,
					/obj/item/circuitboard/machine/shieldwallgen/atmos)
	crate_name = "holofield generator crate"
	crate_type = /obj/structure/closet/crate/engineering

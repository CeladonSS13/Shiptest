/datum/supply_pack/faction/independent/machinery
	group = "Machines & Parts"
	crate_type = /obj/structure/closet/crate/engineering

/* MARK: = Machines & Parts =

> Запчасти
> Атмос
> Боты
> Разная машинерия
> Генерация энергии
> Дополнения к двигателям
> Ядра двигателей

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
	cost = 100
	contains = list(/obj/item/storage/box/stockparts/basic)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/faction/independent/machinery/t2
	name = "T2 parts crate"
	desc = "A bundle of advanced machine parts, containing 2 of each common part type."
	cost = 750
	contains = list(/obj/item/storage/box/stockparts/t2)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/t2_laser
	name = "T2 lasers crate"
	desc = "A bundle of advanced machine lasers, containing 10 parts."
	cost = 750
	contains = list(/obj/item/storage/box/stockparts/t2/laser)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/t2_matter
	name = "T2 matter bins crate"
	desc = "A bundle of advanced machine parts, containing 10 parts."
	cost = 750
	contains = list(/obj/item/storage/box/stockparts/t2/matter)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/t2_manipulator
	name = "T2 manipulators crate"
	desc = "A bundle of advanced machine parts, containing 10 parts."
	cost = 750
	contains = list(/obj/item/storage/box/stockparts/t2/manipulator)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/t2_scan
	name = "T2 scanning modules crate"
	desc = "A bundle of advanced machine parts, containing 10 parts."
	cost = 750
	contains = list(/obj/item/storage/box/stockparts/t2/scan)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/t2_capacitor
	name = "T2 capacitors crate"
	desc = "A bundle of advanced machine parts, containing 10 parts."
	cost = 750
	contains = list(/obj/item/storage/box/stockparts/t2/capacitor)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/t3
	name = "T3 parts crate"
	desc = "A bundle of high-tech machine parts, containing 2 of each common part type."
	cost = 1500
	contains = list(/obj/item/storage/box/stockparts/t3)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/machinery/t3_capacitor
	name = "T3 capacitors crate"
	desc = "A bundle of high-tech machine parts, containing 10 parts."
	cost = 1500
	contains = list(/obj/item/storage/box/stockparts/t3/capacitor)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/machinery/t3_scan
	name = "T3 scanning module crate"
	desc = "A bundle of high-tech machine parts, containing 10 parts"
	cost = 1500
	contains = list(/obj/item/storage/box/stockparts/t3/scan)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/machinery/t3_manipulator
	name = "T3 manipulators crate"
	desc = "A bundle of high-tech machine parts, containing 10 parts."
	cost = 1500
	contains = list(/obj/item/storage/box/stockparts/t3/manipulator)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/machinery/t3_laser
	name = "T3 lasers crate"
	desc = "A bundle of high-tech machine parts, containing 10."
	cost = 1500
	contains = list(/obj/item/storage/box/stockparts/t3/laser)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/machinery/t3_matter
	name = "T3 matter bins crate"
	desc = "A bundle of high-tech machine parts, containing 10 parts."
	cost = 1500
	contains = list(/obj/item/storage/box/stockparts/t3/matter)
	crate_name = "\improper stock parts crate"
	crate_type = /obj/structure/closet/crate/secure/science

/datum/supply_pack/faction/independent/machinery/power
	name = "Power Cell Crate"
	desc = "Looking for power overwhelming? Look no further. Contains five high-voltage power cells."
	cost = 1500
	contains = list(/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high,
					/obj/item/stock_parts/cell/high)
	crate_name = "power cell crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/*
MARK: Атмос
*/

/datum/supply_pack/faction/independent/machinery/space_heater
	name = "Space Heater Crate"
	desc = "Contains a single space heater-cooler, for when things get too cold / hot to handle."
	cost = 500
	contains = list(/obj/machinery/space_heater)
	crate_name = "space heater crate"

/datum/supply_pack/faction/independent/machinery/thermomachine
	name = "Thermomachine Crate"
	desc = "Freeze or heat your air."
	cost = 1000
	contains = list(/obj/item/circuitboard/machine/thermomachine)
	crate_name = "thermomachine crate"

/datum/supply_pack/faction/independent/machinery/portapump
	name = "Portable Air Pump Crate"
	desc = "Want to drain a room of air without losing a drop? We've got you covered. Contains a portable air pump."
	cost = 750
	contains = list(/obj/machinery/portable_atmospherics/pump)
	crate_name = "portable air pump crate"

/datum/supply_pack/faction/independent/machinery/portascrubber
	name = "Portable Scrubber Crate"
	desc = "Clean up that pesky plasma leak with your very own portable scrubber."
	cost = 750
	contains = list(/obj/machinery/portable_atmospherics/scrubber)
	crate_name = "portable scrubber crate"

/datum/supply_pack/faction/independent/machinery/hugescrubber
	name = "Huge Portable Scrubber Crate"
	desc = "A huge portable scrubber for huge atmospherics mistakes."
	cost = 2000
	contains = list(/obj/machinery/portable_atmospherics/scrubber/huge/movable/cargo)
	crate_name = "huge portable scrubber crate"
	crate_type = /obj/structure/closet/crate/large

/*
MARK:	Боты
*/

/datum/supply_pack/faction/independent/machinery/mule
	name = "MULEbot Crate"
	desc = "A dilligent MULEbot from the N+S Factories, happy to carry everything you could possibly need, if it's a crate that is." //this description screamed TG. It has been changed.
	cost = 2000
	contains = list(/mob/living/simple_animal/bot/mulebot)
	crate_name = "\improper MULEbot Crate"
	crate_type = /obj/structure/closet/crate/large

/*
MARK:	Разная машинерия
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

/datum/supply_pack/faction/independent/machinery/ion_thruster
	name = "Ion Thruster Crate"
	desc = "A crate containing an ion thruster and its precharger's electronics. For when you need a little extra thrust."
	cost = 1500
	contains = list(/obj/item/circuitboard/machine/shuttle/smes,
					/obj/item/circuitboard/machine/shuttle/engine/electric)
	crate_name = "ion thruster crate"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/faction/independent/machinery/combustion_thruster
	name = "Combustion Thruster Crate"
	desc = "A crate containing a combustion thruster and its heater's electronics. For when you need complicated thrust."
	cost = 2000
	contains = list(/obj/item/circuitboard/machine/shuttle/fire_heater,
					/obj/item/circuitboard/machine/shuttle/engine/fire)
	crate_name = "combustion thruster crate"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/faction/independent/machinery/drill_crate
	name = "Heavy duty laser mining drill"
	desc = "An experimental laser-based mining drill that Nanotrasen is kindly allowing YOU, the customer, to opt into testing of."
	cost = 1000
	contains = list(
		/obj/machinery/drill,
		/obj/item/pinpointer/mineral,
		/obj/item/paper/guides/drill
	)
	crate_name = "laser mining drill crate"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/faction/independent/machinery/ehf_beacon
	name = "EHF point beacon"
	desc = "A crate containing an EHF point beacon, used to mark points of interest and semi-permanent constructions."
	cost = 1000
	contains = list(
		/obj/machinery/power/planet_beacon
	)
	crate_name = "point beacon crate"
	crate_type = /obj/structure/closet/crate/engineering

/*
MARK:	Генерация энергии
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
	cost = 2500
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

/datum/supply_pack/faction/independent/machinery/teg
	name = "Thermoelectric Generator Crate"
	desc = "Turn heat into electricity! Warranty void if sneezed upon."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/generator,
					/obj/item/circuitboard/machine/circulator,
					/obj/item/circuitboard/machine/circulator)
	crate_name = "thermoelectric generator crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/faction/independent/machinery/turbine
	name = "Turbine Crate"
	desc = "Contains the electronics needed for a turbine generator! Plasma gas not included."
	cost = 4000
	contains = list(/obj/item/circuitboard/machine/power_turbine,
					/obj/item/circuitboard/machine/power_compressor,
					/obj/item/circuitboard/computer/turbine_computer)
	crate_name = "turbine crate"
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

/*
MARK:	Дополнения к двигателям
*/

/datum/supply_pack/faction/independent/machinery/emitter
	name = "Emitter Crate"
	desc = "Useful for powering forcefield generators while destroying locked crates and intruders alike. Contains two high-powered energy emitters."
	cost = 3000
	contains = list(/obj/machinery/power/emitter,
					/obj/machinery/power/emitter)
	crate_name = "emitter crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/faction/independent/machinery/field_gen
	name = "Field Generator Crate"
	desc = "Contains two high-powered field generators, crucial for containing singularities and tesla balls. Must be powered by emitters."
	cost = 2000
	contains = list(/obj/machinery/field/generator,
					/obj/machinery/field/generator)
	crate_name = "field generator crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/faction/independent/machinery/grounding_rods
	name = "Grounding Rod Crate"
	desc = "Two grounding rods are guaranteed to keep the lightning of any rebellious tesla under control."
	cost = 3500
	contains = list(/obj/machinery/power/grounding_rod,
					/obj/machinery/power/grounding_rod)

/*
MARK:	Ядра двигателей
*/

/datum/supply_pack/faction/independent/machinery/supermatter_shard
	name = "Supermatter Shard Crate"
	desc = "The power of the heavens condensed into a single crystal."
	cost = 10000
	contains = list(/obj/machinery/power/supermatter_crystal/shard)
	crate_name = "supermatter shard crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

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

/**
	MARK: Прочее
 */

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

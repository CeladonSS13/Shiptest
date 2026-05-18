/datum/supply_pack/machinery
	category = "Engi - Machines & Parts"

/datum/supply_pack/ship_hardware/breach_shield_gen
	cost = 1000

/datum/supply_pack/ship_hardware/wall_shield_gen
	cost = 1200

/datum/supply_pack/ship_hardware/holofield_generator
	cost = 750

/datum/supply_pack/machinery/smes
	name = "SMES Circuit Board"
	desc = "Electronics (circuit board) for a superconducting magnetic energy storage (SMES) unit."
	cost = 500
	contains = list(/obj/item/circuitboard/machine/smes)
	crate_name = "smes circuit board crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/machinery/pacman
	cost = 2000

/datum/supply_pack/machinery/solar
	cost = 2000

/datum/supply_pack/machinery/teg
	cost = 4000

/datum/supply_pack/machinery/turbine
	cost = 3500

/datum/supply_pack/machinery/emitter
	cost = 1000

/datum/supply_pack/machinery/field_gen
	cost = 1500

/datum/supply_pack/machinery/grounding_rods
	cost = 1500

/datum/supply_pack/ship_hardware/ion_thruster
	cost = 1000

/datum/supply_pack/ship_hardware/combustion_thruster
	cost = 1250

/datum/supply_pack/ship_hardware/plasma_thruster
	contains = list(
		/obj/item/circuitboard/machine/shuttle/engine/plasma,
		/obj/item/circuitboard/machine/shuttle/heater,
		/obj/item/circuitboard/machine/pipedispenser,
		/obj/machinery/portable_atmospherics/canister/toxins,
	)

/datum/supply_pack/machinery/rnd_beacon
	name = "R&D Beacon"
	desc = "A set of specialized platforms for research and production, limited by license. "
	cost = 15000
	contains = list(/obj/item/choice_beacon/rnd)
	crate_name = "r&d starter kit"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/machinery/rnd_full
	name = "Suspicious circuits"
	desc = "A set of specialized circuits for research and production. An unknown craftsman hacked them, now they are not limited by license. "
	cost = 65000
	contains = list(
		/obj/item/circuitboard/machine/circuit_imprinter,
		/obj/item/circuitboard/machine/protolathe,
		/obj/item/circuitboard/machine/rdserver,
		/obj/item/circuitboard/computer/rdconsole,
	)
	crate_name = "hacked r&d kit"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/machinery/booze_dispenser
	name = "Booze Dispenser (Machine Board)"
	desc = "The circuit board for a portable booze dispenser."
	cost = 1500
	contains = list(/obj/item/circuitboard/machine/chem_dispenser/drinks/beer)
	crate_name = "service crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/datum/supply_pack/machinery/soda_dispenser
	name = "Soda Dispenser (Machine Board)"
	desc = "The circuit board for a portable soda dispenser."
	cost = 1500
	contains = list(/obj/item/circuitboard/machine/chem_dispenser/drinks)
	crate_name = "service crate"
	crate_type = /obj/structure/closet/crate/hydroponics

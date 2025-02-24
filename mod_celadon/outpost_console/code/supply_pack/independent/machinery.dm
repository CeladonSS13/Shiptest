/datum/supply_pack/faction/independent/machinery
	group = "Machines & Parts"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/faction/independent/machinery/rnd_beac
	name = "R&D Beacon"
	desc = "A set of specialized platforms for research and production, limited by license. "
	cost = 6000
	contains = list(/obj/item/choice_beacon/rnd)
	crate_name = "r&d starter kit"
	crate_type = /obj/structure/closet/crate/science

/datum/supply_pack/faction/independent/machinery/selling_pad_pack
	name = "Cargo teleport"
	desc = " A set of specialized platforms for building and managing a cargo teleport "
	cost = 2500
	contains = list(/obj/item/circuitboard/machine/selling_pad,
					/obj/item/circuitboard/computer/selling_pad_control)
	crate_name = "cargo teleport"
	crate_type = /obj/structure/closet/crate/science

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

/datum/supply_pack/faction/independent/machinery/plasma_thruster
	name = "Plasma Thruster Crate"
	desc = "A crate containing a plasma thruster and its heater's electronics. For when you need a lot of extra thrust."
	cost = 750
	contains = list(/obj/item/circuitboard/machine/shuttle/engine/plasma,
					/obj/item/circuitboard/machine/shuttle/heater,
					/obj/item/circuitboard/machine/pipedispenser,
					/obj/machinery/portable_atmospherics/canister/toxins)
	crate_name = "plasma thruster crate"
	crate_type = /obj/structure/closet/crate/engineering

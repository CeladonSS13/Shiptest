SUBSYSTEM_DEF(machines)
	name = "Machines"
	init_order = INIT_ORDER_MACHINES
	flags = SS_KEEP_TIMING
	wait = 2 SECONDS
	var/list/processing = list()
	var/list/currentrun = list()
	var/list/powernets = list()
	/// Track how many machines we skipped due to empty virtual z-levels
	var/skipped_machines = 0

/datum/controller/subsystem/machines/Initialize()
	makepowernets()
	fire()
	return ..()


/datum/controller/subsystem/machines/get_metrics()
	. = ..()
	var/list/cust = list()
	cust["processing"] = length(processing)
	.["custom"] = cust

/datum/controller/subsystem/machines/proc/makepowernets()
	for(var/datum/powernet/PN in powernets)
		qdel(PN)
	powernets.Cut()

	for(var/obj/structure/cable/PC in GLOB.cable_list)
		if(!PC.powernet)
			var/datum/powernet/NewPN = new()
			NewPN.add_cable(PC)
			propagate_network(PC,PC.powernet)

/datum/controller/subsystem/machines/stat_entry(msg)
	msg = "M:[length(processing)]|PN:[length(powernets)]|S:[skipped_machines]"
	return ..()


/datum/controller/subsystem/machines/fire(resumed = FALSE)
	if (!resumed)
		for(var/datum/powernet/Powernet in powernets)
			Powernet.reset() //reset the power state.
		src.currentrun = processing.Copy()
		skipped_machines = 0

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/obj/machinery/thing = currentrun[currentrun.len]
		currentrun.len--
		
		if(QDELETED(thing))
			processing -= thing
			if (MC_TICK_CHECK)
				return
			continue

		// Skip machines on virtual z-levels with no players present
		// Exceptions:
		// 1. Critical machines (SM, PA, telecomms) always process
		// 2. Machines in outpost areas always process (player hubs)
		// 3. Machines in ship areas always process (player-owned vessels)
		if(!thing.critical_machine)
			var/area/machine_area = get_area(thing)
			// Check if it's an outpost or ship area - these always process
			if(!istype(machine_area, /area/outpost) && !istype(machine_area, /area/ship))
				var/thing_vz = thing.virtual_z()
				if(thing_vz)
					var/players_on_vz = LAZYACCESS(SSmobs.players_by_virtual_z, "[thing_vz]")
					if(!length(players_on_vz))
						skipped_machines++
						if (MC_TICK_CHECK)
							return
						continue

		// Process the machine
		if(thing.process(wait * 0.1) == PROCESS_KILL)
			processing -= thing
			if (!QDELETED(thing))
				thing.datum_flags &= ~DF_ISPROCESSING

		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/machines/proc/setup_template_powernets(list/cables)
	for(var/A in cables)
		var/obj/structure/cable/PC = A
		if(!PC.powernet)
			var/datum/powernet/NewPN = new()
			NewPN.add_cable(PC)
			propagate_network(PC,PC.powernet)

/datum/controller/subsystem/machines/Recover()
	if (istype(SSmachines.processing))
		processing = SSmachines.processing
	if (istype(SSmachines.powernets))
		powernets = SSmachines.powernets

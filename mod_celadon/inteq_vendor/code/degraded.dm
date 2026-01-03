#define TURBGENQ 200000
#define TURBGENG 0.5
#define POWER_TO_THRUST 0.001 // power production to thrust ratio

/obj/machinery/power/shuttle/engine/turbine/degraded
	name = "degraded gas turbine generator"
	desc = "A heavily used gas turbine used for backup power generation. This one has seen better days."
	circuit = /obj/item/circuitboard/machine/power_turbine/degraded

/*
/obj/machinery/power/shuttle/engine/turbine/degraded/process(seconds_per_tick)
	add_avail(lastgen) // add power in process() so it doesn't update power output separately from the rest of the powernet (bad)
	update_overlays()
*/
// Не имеет смысла без измененного TURBGENQ. Он отвечает за то, насколько сложно разогнаться до высоких значений.
/*
/obj/machinery/power/shuttle/engine/turbine/degraded/process_atmos(seconds_per_tick)
	if(!compressor)
		set_machine_stat(BROKEN)
		locate_machinery() // try to find the missing piece

	if(machine_stat & (BROKEN|MAINT)) // we're only running half a turbine, don't continue
		return

	// This is the power generation function. If anything is needed it's good to plot it in EXCEL before modifying
	// the TURBGENQ and TURBGENG values

	lastgen = ((compressor.rpm / TURBGENQ)**TURBGENG) * TURBGENQ * productivity
	thrust = lastgen * POWER_TO_THRUST // second law

	var/turf/outturf = get_step(src, dir)
	if(!LAZYLEN(outturf.atmos_adjacent_turfs))
		compressor.rpmtarget = 0
		return

	// Move gas from the compressor to the outlet
	var/datum/gas_mixture/environment = outturf.return_air()
	var/internal_pressure = compressor.gas_contained.return_pressure()
	var/pressure_delta = internal_pressure - environment.return_pressure()

	// Now set the compressor's RPM target based on how much gas is flowing through
	compressor.rpmtarget = max(0, pressure_delta * compressor.gas_contained.return_volume() / (R_IDEAL_GAS_EQUATION * 4))

	// Equalize the gas between the internal gas mix and the environment
	if(pressure_delta > 0)
		var/datum/gas_mixture/removed = compressor.gas_contained.remove_ratio(pressure_delta / (internal_pressure * 2))
		if(destroy_output)
			qdel(removed)
			return
		outturf.assume_air(removed)
		outturf.air_update_turf()
*/
/obj/item/circuitboard/machine/power_turbine/degraded
	name = "Degraded Power Turbine (Machine Board)"
	icon_state = "engineering"
	build_path = /obj/machinery/power/shuttle/engine/turbine/degraded
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stock_parts/capacitor = 2)

#undef TURBGENQ
#undef TURBGENG
#undef POWER_TO_THRUST

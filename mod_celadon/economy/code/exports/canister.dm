/datum/export/large/gas_canister/get_cost(obj/O)
	var/obj/machinery/portable_atmospherics/canister/C = O
	var/worth = 10

	worth += C.air_contents.get_moles(GAS_BZ)*0.02
	// worth += C.air_contents.get_moles(GAS_STIMULUM)*1
	// worth += C.air_contents.get_moles(GAS_HYPERNOB)*10
	worth += C.air_contents.get_moles(GAS_TRITIUM)*0.04
	// worth += C.air_contents.get_moles(GAS_PLUOXIUM)*0.05
	return worth

/* Было от офов
	worth += C.air_contents.get_moles(GAS_BZ)*2
	worth += C.air_contents.get_moles(GAS_STIMULUM)*100
	worth += C.air_contents.get_moles(GAS_HYPERNOB)*1000
	worth += C.air_contents.get_moles(GAS_TRITIUM)*4
	worth += C.air_contents.get_moles(GAS_PLUOXIUM)*5

1 вариант
	worth += C.air_contents.get_moles(GAS_BZ)*0.02
	worth += C.air_contents.get_moles(GAS_STIMULUM)*100
	worth += C.air_contents.get_moles(GAS_HYPERNOB)*1000
	worth += C.air_contents.get_moles(GAS_TRITIUM)*4
	worth += C.air_contents.get_moles(GAS_PLUOXIUM)*5

2 вариант (текущий)
	worth += C.air_contents.get_moles(GAS_BZ)*0.02
	worth += C.air_contents.get_moles(GAS_STIMULUM)*1
	worth += C.air_contents.get_moles(GAS_HYPERNOB)*10
	worth += C.air_contents.get_moles(GAS_TRITIUM)*0.04
	worth += C.air_contents.get_moles(GAS_PLUOXIUM)*0.05
*/

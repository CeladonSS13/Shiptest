// Логика расчета прожажи:
// Надо поошрять людей таскать канистры с токсичных планет
// И атмос-техов но не сильно

/datum/export/large/gas_canister
	cost = 10 //Base cost of canister. You get more for nice gases inside.
	unit_name = "Gas Canister"
	desc = "Оплата зависит от содержимого (БЗ / Тритиум)."
	export_types = list(/obj/machinery/portable_atmospherics/canister)

/datum/export/large/gas_canister/get_cost(obj/O)
	var/obj/machinery/portable_atmospherics/canister/C = O
	var/worth = 10

	// Standart: 
	//worth += C.air_contents.get_moles(GAS_PLASMA)*0.35	//	~665	// Люди в тупую прожают своих же газы, пока нету времени думать наж этим
	worth += C.air_contents.get_moles(GAS_BZ)*1			//	~1881
	worth += C.air_contents.get_moles(GAS_TRITIUM)*2	//	~3743
	return round(worth)

/* Было от офов
	worth += C.air_contents.get_moles(GAS_BZ)*2
	worth += C.air_contents.get_moles(GAS_STIMULUM)*100
	worth += C.air_contents.get_moles(GAS_HYPERNOB)*1000
	worth += C.air_contents.get_moles(GAS_TRITIUM)*4
	worth += C.air_contents.get_moles(GAS_PLUOXIUM)*5

  Вариант (прошлый)
	worth += C.air_contents.get_moles(GAS_BZ)*0.02
	worth += C.air_contents.get_moles(GAS_STIMULUM)*1
	worth += C.air_contents.get_moles(GAS_HYPERNOB)*10
	worth += C.air_contents.get_moles(GAS_TRITIUM)*0.04
	worth += C.air_contents.get_moles(GAS_PLUOXIUM)*0.05
*/

/obj/machinery/fax/coroner
	name = "coroner fax machine"
	desc = "A specialized fax machine for coroner communications with Central Command."
	fax_name = "Outpost Coroner"
	
/obj/machinery/fax/coroner/Initialize()
	. = ..()
	// Fax is automatically added to GLOB.fax_machines in parent Initialize()
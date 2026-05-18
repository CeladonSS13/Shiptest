//atmos machines
/obj/machinery/atmospherics/components/unary/thermomachine/freezer/upgraded
	name = "upgraded thermomachine"
	desc = "Heats or cools gas in connected pipes with increased efficiency."

/obj/machinery/atmospherics/components/unary/thermomachine/freezer/upgraded/Initialize()
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/stack/sheet/glass(null)
	component_parts += new /obj/item/stock_parts/matter_bin/bluespace(null)
	component_parts += new /obj/item/stock_parts/matter_bin/bluespace(null)
	component_parts += new /obj/item/stock_parts/micro_laser/quadultra(null)
	component_parts += new /obj/item/stock_parts/micro_laser/quadultra(null)
	RefreshParts()

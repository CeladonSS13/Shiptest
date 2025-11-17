/obj/machinery/outpost_selling_pad/delivery
	name = "delivery pad"
	desc = "A pad for receiving purchased equipment."
	icon = 'mod_celadon/_storage_icons/icons/machinery/pad.dmi'
	icon_state = "pad-idle"

/obj/machinery/outpost_selling_pad/delivery/proc/animate_delivery()
	flick("pad-beam", src)
	var/datum/effect_system/spark_spread/sparks = new
	sparks.set_up(5, 1, get_turf(src))
	sparks.start()

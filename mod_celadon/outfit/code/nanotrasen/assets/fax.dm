/obj/machinery/fax/nanotrasen
	special_networks = list(
		list(fax_name = "Outpost Authority", fax_id = "outpost", color = "orange", emag_needed = FALSE),
		list(fax_name = "Nanotrasen Central Command", fax_id = "nanotrasen", color = "green", emag_needed = FALSE),
		list(fax_name = "Frontiersmen Communications Quartermaster", fax_id = "frontiersmen", color = "black", emag_needed = TRUE)
	)

/obj/machinery/fax/admin/nanotrasen
	name = "Central Command Fax Machine"
	fax_name = "Nanotrasen Central Command"
	radio_channel = RADIO_CHANNEL_CENTCOM
	visible_to_network = FALSE
	admin_fax_id = "nanotrasen"

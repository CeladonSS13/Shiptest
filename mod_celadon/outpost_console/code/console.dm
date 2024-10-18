/*
	Faction-less
*/

/obj/machinery/computer/cargo/faction
	name = "faction outpost console"
	desc = "Looks like that console hasn't correct faction connection. Please, message to our specialists!"
	icon_screen = "civ_bounty"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_LIME

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

/obj/machinery/computer/cargo/faction/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostCommunicationsFaction", name)
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/faction/generate_pack_data()
	supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!supply_pack_data[P.group])
			supply_pack_data[P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if(P.hidden && (P.faction != "factionless"))
			continue
		supply_pack_data[P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
		))

/obj/machinery/computer/cargo/faction/ui_static_data(mob/user)
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!data["supplies"][P.group])
			data["supplies"][P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if((P.hidden && !(obj_flags & EMAGGED)) && (P.faction != "factionless"))
			continue
		data["supplies"][P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
			"small_item" = P.small_item,
		))
	return data

/*
	Syndicate
*/

/obj/machinery/computer/cargo/faction/syndicate
	name = "syndicate outpost console"
	desc = "That outpost console belongs to Syndicate."
	icon_screen = "ratvar1"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_RED

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/extractionpod

/obj/machinery/computer/cargo/faction/syndicate/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostCommunicationsFactionSyndicate", name)
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/faction/syndicate/generate_pack_data()
	supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!supply_pack_data[P.group])
			supply_pack_data[P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if(P.hidden && (P.faction != "syndicate"))
			continue
		supply_pack_data[P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
		))

/obj/machinery/computer/cargo/faction/syndicate/ui_static_data(mob/user)
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!data["supplies"][P.group])
			data["supplies"][P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if((P.hidden && !(obj_flags & EMAGGED)) && (P.faction != "syndicate"))
			continue
		data["supplies"][P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
			"small_item" = P.small_item,
		))
	return data

/*
	Inteq
*/

/obj/machinery/computer/cargo/faction/inteq
	name = "inteq outpost console"
	desc = "That outpost console belongs to Inteq."
	icon_screen = "ratvar1"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_RED

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

/obj/machinery/computer/cargo/faction/inteq/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostCommunicationsFactionInteq", name)
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/faction/inteq/generate_pack_data()
	supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!supply_pack_data[P.group])
			supply_pack_data[P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if(P.hidden && (P.faction != "inteq"))
			continue
		supply_pack_data[P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
		))

/obj/machinery/computer/cargo/faction/inteq/ui_static_data(mob/user)
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!data["supplies"][P.group])
			data["supplies"][P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if((P.hidden && !(obj_flags & EMAGGED)) && (P.faction != "inteq"))
			continue
		data["supplies"][P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
			"small_item" = P.small_item,
		))
	return data

/*
	SolFed
*/

/obj/machinery/computer/cargo/faction/solfed
	name = "SolFed outpost console"
	desc = "That outpost console belongs to SolFed."
	icon_screen = "ratvar1"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_RED

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

/obj/machinery/computer/cargo/faction/solfed/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostCommunicationsFactionSolfed", name)
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/faction/solfed/generate_pack_data()
	supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!supply_pack_data[P.group])
			supply_pack_data[P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if(P.hidden && (P.faction != "solfed"))
			continue
		supply_pack_data[P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
		))

/obj/machinery/computer/cargo/faction/solfed/ui_static_data(mob/user)
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!data["supplies"][P.group])
			data["supplies"][P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if((P.hidden && !(obj_flags & EMAGGED)) && (P.faction != "solfed"))
			continue
		data["supplies"][P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
			"small_item" = P.small_item,
		))
	return data

/*
	Independent
*/

/obj/machinery/computer/cargo/faction/independent
	name = "Independent outpost console"
	desc = "That outpost console belongs to Independent faction."
	icon_screen = "ratvar1"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_RED

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

/obj/machinery/computer/cargo/faction/independent/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostCommunicationsFactionIndependent", name)
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/faction/independent/generate_pack_data()
	supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!supply_pack_data[P.group])
			supply_pack_data[P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if(P.hidden && (P.faction != "independent"))
			continue
		supply_pack_data[P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
		))

/obj/machinery/computer/cargo/faction/independent/ui_static_data(mob/user)
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!data["supplies"][P.group])
			data["supplies"][P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if((P.hidden && !(obj_flags & EMAGGED)) && (P.faction != "independent"))
			continue
		data["supplies"][P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
			"small_item" = P.small_item,
		))
	return data

/obj/machinery/computer/cargo/generate_pack_data()
	return

// MARK: Abstract type
/obj/machinery/computer/cargo/faction
	name = "faction outpost console"
	desc = "Looks like that console hasn't correct faction connection. Please, message to our specialists!"
	icon_screen = "civ_bounty"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_LIME
	charge_account = ACCOUNT_FAC
	resistance_flags = INDESTRUCTIBLE
	flags_1 = NODECONSTRUCT_1
	bad_type = /obj/machinery/computer/cargo/faction
	var/faction_theme
	/// Area instance that cargo pods are sent to
	var/area/landing_area
	/// The pod type used to deliver orders
	var/obj/structure/closet/supplypod/pod_type = /obj/structure/closet/supplypod/elysiumpod

/obj/machinery/computer/cargo/faction/Initialize()
	. = ..()
	outpost_docked = SSovermap.get_main_outpost()
	var/datum/bank_account/account = SSeconomy.get_dep_account(charge_account)
	if(account)
		charge_account = account
	landing_area = get_area(src)

/obj/machinery/computer/cargo/faction/ui_data(mob/user)
	var/list/data = list()
	data["onShip"] = !isnull(current_ship)
	data["shipFaction"] = current_faction.name
	data["numMissions"] = current_ship ? LAZYLEN(current_ship.missions) : 0
	data["maxMissions"] = current_ship ? current_ship.max_missions : 0
	data["outpostDocked"] = FALSE // won't display missions
	data["points"] = charge_account?.account_balance || 0
	message = "Sales are near-instantaneous - please choose carefully."
	data["blockade"] = FALSE
	if(outpost_docked?.market?.supply_blocked)
		message = blockade_warning
		data["blockade"] = TRUE
	data["message"] = message
	data["supplies"] = supply_pack_data
	data["factionTheme"] = faction_theme

	data["shipMissions"] = list()
	data["outpostMissions"] = list()

	if(current_ship)
		for(var/datum/mission/M as anything in current_ship.missions)
			data["shipMissions"] += list(M.get_tgui_info())
		if(istype(outpost_docked))
			for(var/datum/mission/M as anything in outpost_docked.missions)
				data["outpostMissions"] += list(M.get_tgui_info())

	return data

/obj/machinery/computer/cargo/faction/ui_static_data(mob/user)
	return generate_pack_data()

/obj/machinery/computer/cargo/faction/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch(action)
		if("purchase")
			. = TRUE
			var/total_cost = text2num(params["total"])
			if(!charge_account.has_money(total_cost))
				say("ERROR: Insufficent funds! Transaction canceled.")
				return

			var/list/empty_turfs = list()
			for(var/turf/open/floor/turf in landing_area)
				if(turf.is_blocked_turf())
					continue
				empty_turfs += turf
				CHECK_TICK
			if(!length(empty_turfs))
				say("ERROR: Landing zone full! No space for drop!", message_cooldown)
				return
			var/turf/landing_turf = pick(empty_turfs)

			var/list/purchasing = params["cart"]
			var/list/unprocessed_packs = list()
			for(var/list/current_item as anything in purchasing)
				unprocessed_packs += locate(current_item["ref"]) in outpost_docked.market.supply_packs
			if(charge_account.adjust_money(-total_cost))
				var/datum/supply_order/SO = new(unprocessed_packs, usr.ckey)
				new /obj/effect/pod_landingzone(landing_turf, pod_type, SO)
				playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
				say("Order incoming!")
				// Логирование покупок
				for(var/datum/supply_pack/pack as anything in unprocessed_packs)
					log_econ("[key_name(usr)] purchased [pack.name] for [pack.cost] credits from [name] at [AREACOORD(src)]")
				log_econ("[key_name(usr)] total purchase cost: [total_cost] credits from [name] at [AREACOORD(src)]")

/obj/machinery/computer/cargo/faction/generate_pack_data()
	supply_pack_data = list()
	if(!istype(outpost_docked))
		return

	for(var/datum/supply_pack/current_pack as anything in outpost_docked.market.supply_packs)
		if(!supply_pack_data[current_pack.category])
			supply_pack_data[current_pack.category] = list(
				"name" = current_pack.category,
				"packs" = list()
			)
		if((!current_pack.available))
			continue
		var/same_faction = current_pack.faction ? current_pack.faction.allowed_faction(current_faction) : FALSE
		if(current_pack.faction_locked && !same_faction)
			continue
		supply_pack_data[current_pack.category]["packs"] += list(list(
			"name" = current_pack.name,
			"cost" = current_pack.cost,
			"faction_locked" = current_pack.faction_locked,
			"ref" = REF(current_pack),
			"desc" = current_pack.desc || current_pack.name,
		))

/*
	MARK: Syndicate
*/
/obj/machinery/computer/cargo/faction/syndicate
	name = "syndicate outpost console"
	desc = "That outpost console belongs to Syndicate."
	icon_screen = "syndishuttle"
	faction_theme = THEME_SYNDICATE
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_RED
	pod_type = /obj/structure/closet/supplypod/syndicate
	charge_account = ACCOUNT_SYN
	current_faction = /datum/faction/syndicate

/obj/structure/closet/supplypod/syndicate
	name = "Syndicate Extraction Pod"
	desc = "A specalised, blood-red styled pod for extracting high-value targets out of active mission areas."
	specialised = TRUE
	style = STYLE_SYNDICATE
	bluespace = TRUE
	explosionSize = list(0,0,0,0)
	delays = list(POD_TRANSIT = 20, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/*
	MARK: Inteq
*/
/obj/machinery/computer/cargo/faction/inteq
	name = "inteq outpost console"
	desc = "That outpost console belongs to Inteq."
	icon_screen = "ratvar1"
	faction_theme = THEME_INTEQ
	light_color = COLOR_TAN_ORANGE
	pod_type = /obj/structure/closet/supplypod/centcompod
	charge_account = ACCOUNT_INT
	current_faction = /datum/faction/inteq

/*
	MARK: SolFed
*/
/obj/machinery/computer/cargo/faction/solfed
	name = "SolFed outpost console"
	desc = "That outpost console belongs to SolFed."
	icon_screen = "vault"
	faction_theme = THEME_SOLFED
	light_color = COLOR_DARK_CYAN
	pod_type = /obj/structure/closet/supplypod/centcompod
	charge_account = ACCOUNT_SLF
	current_faction = /datum/faction/solgov

/*
	MARK: Independent
*/
/obj/machinery/computer/cargo/faction/independent
	name = "Independent outpost console"
	desc = "That outpost console belongs to Independent faction."
	icon_screen = "idce"
	faction_theme = THEME_INDEPENDENT
	light_color = COLOR_VIVID_YELLOW
	charge_account = ACCOUNT_IND
	current_faction = /datum/faction/independent

/obj/machinery/computer/cargo/faction/independent/computer_1
	name = "Independent outpost console #1"
	desc = "That outpost console #1 belongs to Independent faction."
	charge_account = ACCOUNT_IND_1

/obj/machinery/computer/cargo/faction/independent/computer_2
	name = "Independent outpost console #2"
	desc = "That outpost console #2 belongs to Independent faction."
	charge_account = ACCOUNT_IND_2

/obj/machinery/computer/cargo/faction/independent/computer_3
	name = "Independent outpost console #3"
	desc = "That outpost console #3 belongs to Independent faction."
	charge_account = ACCOUNT_IND_3

/obj/machinery/computer/cargo/faction/independent/computer_4
	name = "Independent outpost console #4"
	desc = "That outpost console #4 belongs to Independent faction."
	charge_account = ACCOUNT_IND_4

/*
	MARK: Nanotrasen
*/
/obj/machinery/computer/cargo/faction/nanotrasen
	name = "Nanotrasen outpost console"
	desc = "That outpost console belongs to Nanotrasen."
	icon_screen = "idcentcom"
	faction_theme = THEME_NT
	light_color = LIGHT_COLOR_DARK_BLUE
	pod_type = /obj/structure/closet/supplypod/centcompod
	charge_account = ACCOUNT_NTN
	current_faction = /datum/faction/nt

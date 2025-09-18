/obj/machinery/computer/cargo/ui_data(mob/user) //чинит фракционное карго после фракционного карго оффов
	// var/canBeacon = beacon && (isturf(beacon.loc) || ismob(beacon.loc))//is the beacon in a valid location? // NEEDS_TO_FIX_ALARM!
	var/list/data = list()

	// not a big fan of get_containing_shuttle
	var/obj/docking_port/mobile/D = SSshuttle.get_containing_shuttle(src)
	var/datum/overmap/ship/controlled/ship
	var/outpost_docked = FALSE
	if(D)
		ship = D.current_ship
		outpost_docked = istype(ship.docked_to, /datum/overmap/outpost)

	data["onShip"] = !isnull(ship)
	data["numMissions"] = ship ? LAZYLEN(ship.missions) : 0
	data["maxMissions"] = ship ? ship.max_missions : 0
	data["outpostDocked"] = outpost_docked
	data["points"] = charge_account ? charge_account.account_balance : 0
	data["siliconUser"] = user.has_unlimited_silicon_privilege && check_ship_ai_access(user)
	data["usingBeacon"] = use_beacon //is the mode set to deliver to the beacon or the cargobay?
	data["supplies"] = list()
	message = "Sales are near-instantaneous - please choose carefully."
	if(SSshuttle.supplyBlocked)
		message = blockade_warning
	data["message"] = message

	data["supplies"] = supply_pack_data
	if (cooldown > 0)//cooldown used for printing beacons
		cooldown--

	data["shipMissions"] = list()
	data["outpostMissions"] = list()

	if(current_ship)
		for(var/datum/mission/M as anything in current_ship.missions)
			data["shipMissions"] += list(M.get_tgui_info())
		if(outpost_docked)
			var/datum/overmap/outpost/out = current_ship.docked_to
			for(var/datum/mission/M as anything in out.missions)
				data["outpostMissions"] += list(M.get_tgui_info())

	// Передаем фракционные темы в TGUI
	if(istype(src, /obj/machinery/computer/cargo/faction))
		var/obj/machinery/computer/cargo/faction/faction_console = src
		data["faction_theme"] = faction_console.faction_theme

	return data

/obj/machinery/computer/cargo/faction/ui_static_data(mob/user)
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!data["supplies"][P.category])
			data["supplies"][P.category] = list(
				"name" = P.category,
				"packs" = list()
			)

		data["supplies"][P.category]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name,
		))
	return data

/obj/machinery/computer/cargo/faction/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch(action)
		if("withdrawCash")
			var/val = text2num(params["value"])
			if(!charge_account || !val || val <= 0)
				return
			if(charge_account.adjust_money(-val))
				var/obj/item/holochip/cash_chip = new /obj/item/holochip(drop_location(), val)
				if(ishuman(usr))
					var/mob/living/carbon/human/user = usr
					user.put_in_hands(cash_chip)
				playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
				src.visible_message(span_notice("[src] dispenses a holochip."))
			return TRUE

		if("purchase")
			var/list/purchasing = params["cart"]
			var/total_cost = text2num(params["total"])
			var/area/current_area = get_area(src)
			var/list/packs = list()
			for(var/item in purchasing)
				var/id = item["id"]
				var/datum/supply_pack/pack = SSshuttle.supply_packs[text2path(id)]
				if(pack)
					packs += pack

			if(!length(packs) || !charge_account?.has_money(total_cost) || !istype(current_area))
				message_cooldown = console_cooldown_feedback(src, "ERROR: Insufficent funds! Transaction canceled.", message_cooldown)
				return TRUE

			var/turf/landing_turf
			if(!use_beacon)
				var/list/empty_turfs = list()
				if(!landingzone)
					reconnect()
					if(!landingzone)
						WARNING("[src] couldnt find a Ship/Cargo (aka cargobay) area on a ship, and as such it has set the supplypod landingzone to the area it resides in.")
						landingzone = get_area(src)

				for(var/turf/open/floor/T in landingzone.contents)
					if(T.is_blocked_turf())
						continue
					empty_turfs += T
					CHECK_TICK
				if(!length(empty_turfs))
					message_cooldown = console_cooldown_feedback(src, "ERROR: Landing zone full! No space for drop!", message_cooldown)
					return TRUE
				landing_turf = pick(empty_turfs)

			if(landing_turf && charge_account.adjust_money(-total_cost))
				var/datum/supply_order/SO = new(packs, usr.ckey, "")
				new /obj/effect/pod_landingzone(landing_turf, podType, SO)
				playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
				say("Order incoming!")
				update_appearance()
				return TRUE

		if("mission-act")
			var/datum/mission/mission = locate(params["ref"])
			var/obj/docking_port/mobile/D = SSshuttle.get_containing_shuttle(src)
			var/datum/overmap/ship/controlled/ship = D.current_ship
			var/datum/overmap/outpost/outpost = ship.docked_to
			if(!istype(outpost) || mission.source_outpost != outpost) // important to check these to prevent href fuckery
				return
			if(!mission.accepted)
				if(LAZYLEN(ship.missions) >= ship.max_missions)
					return
				mission.accept(ship, loc)
				return TRUE
			else if(mission.servant == ship)
				if(mission.can_complete())
					mission.turn_in()
				// else
				// 	mission.give_up() // NEEDS_TO_FIX_ALARM!
				return TRUE

/proc/console_cooldown_feedback(obj/source, msg, cooldown)
	playsound(source, 'sound/machines/buzz-sigh.ogg', 50, TRUE)
	if(cooldown <= world.time)
		source.say(msg)
		cooldown = world.time + 5 SECONDS
	return cooldown

/obj/machinery/computer/cargo/faction/proc/faction_ui_interact(mob/user, datum/tgui/ui, var/text, obj/src)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, text, name)
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/faction/proc/generate_faction_pack_data(datum/faction)
	. = supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]

		var/is_faction = ispath(P.faction, faction)
		// Под независимые попадают и те, у которых фракция = null
		if(ispath(faction, /datum/faction/independent) && P.faction == null)
			is_faction = TRUE

		if (is_faction)
			if(!supply_pack_data[P.category])
				supply_pack_data[P.category] = list(
					"name" = P.category,
					"packs" = list()
				)
			// Добавляем товар в группу
			supply_pack_data[P.category]["packs"] += list(list(
				"name" = P.name,
				"cost" = P.cost,
				"id" = pack,
				"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
			))

	return supply_pack_data

/obj/machinery/computer/cargo/faction/proc/faction_ui_static_data(mob/user, datum/faction)	// КОД JOPA
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		var/is_faction = ispath(P.faction, faction)

		if (is_faction)
			// Если нет группы, создаём группу
			if(!data["supplies"][P.category])
				data["supplies"][P.category] = list(
					"name" = P.category,
					"packs" = list()
				)
			// Добавляем товар в группу
			data["supplies"][P.category]["packs"] += list(list(
				"name" = P.name,
				"cost" = P.cost,
				"id" = pack,
				"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
				// "small_item" = P.small_item,
			))


	return data

/*
	MARK: Без фракции
*/

/obj/machinery/computer/cargo/faction
	name = "faction outpost console"
	desc = "Looks like that console hasn't correct faction connection. Please, message to our specialists!"
	icon_screen = "civ_bounty"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_LIME

	contraband = FALSE
	self_paid = FALSE

	charge_account = ACCOUNT_FAC

	podType = /obj/structure/closet/supplypod/centcompod

	flags_1 = NODECONSTRUCT_1
	tgui_shared_states = list(outpostTab = "\"cargo\"")

	var/faction_theme = null

/obj/machinery/computer/cargo/faction/Initialize()
	. = ..()
	var/obj/item/circuitboard/computer/cargo/board = circuit
	contraband = board.contraband
	if (board.obj_flags & EMAGGED)
		obj_flags |= EMAGGED
	else
		obj_flags &= ~EMAGGED
	var/datum/bank_account/B = SSeconomy.get_dep_account(charge_account)
	if(B)
		charge_account = B
	generate_pack_data()

/obj/machinery/computer/cargo/faction/reconnect(obj/docking_port/mobile/port)
	if(!port)
		var/area/ship/current_area = get_area(src)
		if(!istype(current_area))
			return
		port = current_area.mobile_port
	if(!port)
		return
	landingzone = get_area(src)

/obj/machinery/computer/cargo/faction/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostCommunicationsCeladon", name)
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/faction/generate_pack_data()
	supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!supply_pack_data[P.category])
			supply_pack_data[P.category] = list(
				"name" = P.category,
				"packs" = list()
			)

		supply_pack_data[P.category]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
		))

/*
	MARK: Syndicate
*/
/obj/machinery/computer/cargo/faction/syndicate
	name = "syndicate outpost console"
	desc = "That outpost console belongs to Syndicate."
	icon_screen = "syndishuttle"
	faction_theme = "syndicate"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_RED

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/syndicate

	charge_account = ACCOUNT_SYN


/obj/machinery/computer/cargo/faction/syndicate/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/syndicate)

/obj/machinery/computer/cargo/faction/syndicate/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/syndicate)
	return data

/obj/structure/closet/supplypod/syndicate
	name = "Syndicate Extraction Pod"
	desc = "A specalised, blood-red styled pod for extracting high-value targets out of active mission areas."
	specialised = TRUE
	style = STYLE_SYNDICATE
	bluespace = TRUE
	explosionSize = list(0,0,0,0)
	delays = list(POD_TRANSIT = 20, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/structure/closet/supplypod/syndicate/Initialize()
	. = ..()
	var/turf/picked_turf = pick(GLOB.holdingfacility)
	reverse_dropoff_coords = list(picked_turf.x, picked_turf.y, picked_turf.z)

/*
	MARK: Inteq
*/
/obj/machinery/computer/cargo/faction/inteq
	name = "inteq outpost console"
	desc = "That outpost console belongs to Inteq."
	icon_screen = "ratvar1"
	faction_theme = "inteq"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_TAN_ORANGE

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

	charge_account = ACCOUNT_INT

/obj/machinery/computer/cargo/faction/inteq/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/inteq)

/obj/machinery/computer/cargo/faction/inteq/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/inteq)
	return data

/*
	MARK: SolFed
*/
/obj/machinery/computer/cargo/faction/solfed
	name = "SolFed outpost console"
	desc = "That outpost console belongs to SolFed."
	icon_screen = "vault"
	faction_theme = "solfed"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_CYAN

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

	charge_account = ACCOUNT_SLF

/obj/machinery/computer/cargo/faction/solfed/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/solgov)

/obj/machinery/computer/cargo/faction/solfed/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/solgov)
	return data

/*
	MARK: Independent
*/
/obj/machinery/computer/cargo/faction/independent
	name = "Independent outpost console"
	desc = "That outpost console belongs to Independent faction."
	icon_screen = "idce"
	faction_theme = "independent"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_VIVID_YELLOW

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/elysiumpod

	charge_account = ACCOUNT_IND

/obj/machinery/computer/cargo/faction/independent/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/independent)

/obj/machinery/computer/cargo/faction/independent/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/independent)
	return data

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
	faction_theme = "nt"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = LIGHT_COLOR_DARK_BLUE

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

	charge_account = ACCOUNT_NTN

/obj/machinery/computer/cargo/faction/nanotrasen/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/nt)

/obj/machinery/computer/cargo/faction/nanotrasen/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/nt)
	return data

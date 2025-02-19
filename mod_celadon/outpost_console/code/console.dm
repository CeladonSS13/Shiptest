/obj/machinery/computer/cargo/ui_data(mob/user) //чинит фракционное карго после фракционного карго оффов
	var/canBeacon = beacon && (isturf(beacon.loc) || ismob(beacon.loc))//is the beacon in a valid location?
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
	data["beaconZone"] = beacon ? get_area(beacon) : ""//where is the beacon located? outputs in the tgui
	data["usingBeacon"] = use_beacon //is the mode set to deliver to the beacon or the cargobay?
	data["canBeacon"] = !use_beacon || canBeacon //is the mode set to beacon delivery, and is the beacon in a valid location?
	// data["canBuyBeacon"] = charge_account ? (cooldown <= 0 && charge_account.account_balance >= BEACON_COST) : FALSE
	data["beaconError"] = use_beacon && !canBeacon ? "(BEACON ERROR)" : ""//changes button text to include an error alert if necessary
	data["hasBeacon"] = beacon != null//is there a linked beacon?
	data["beaconName"] = beacon ? beacon.name : "No Beacon Found"
	// data["printMsg"] = cooldown > 0 ? "Print Beacon for [BEACON_COST] credits ([cooldown])" : "Print Beacon for [BEACON_COST] credits"//buttontext for printing beacons
	data["supplies"] = list()
	message = "Sales are near-instantaneous - please choose carefully."
	if(SSshuttle.supplyBlocked)
		message = blockade_warning
	if(use_beacon && !beacon)
		message = "BEACON ERROR: BEACON MISSING"//beacon was destroyed
	else if (use_beacon && !canBeacon)
		message = "BEACON ERROR: MUST BE EXPOSED"//beacon's loc/user's loc must be a turf
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

	return data

// UI статика
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
		if((P.hidden && !(obj_flags & EMAGGED)))
			continue
		data["supplies"][P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
			"small_item" = P.small_item,
		))
	return data

// Взаимодействие с UI
/obj/machinery/computer/cargo/faction/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch(action)
		if("withdrawCash")
			var/val = text2num(params["value"])
			// no giving yourself money
			if(!charge_account || !val || val <= 0)
				return
			if(charge_account.adjust_money(-val))
				var/obj/item/holochip/cash_chip = new /obj/item/holochip(drop_location(), val)
				if(ishuman(usr))
					var/mob/living/carbon/human/user = usr
					user.put_in_hands(cash_chip)
				playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
				src.visible_message("<span class='notice'>[src] dispenses a holochip.</span>")
			return TRUE

		if("LZCargo")
			use_beacon = FALSE
			if (beacon)
				beacon.update_status(SP_UNREADY) //ready light on beacon will turn off
		if("LZBeacon")
			use_beacon = TRUE
			if (beacon)
				beacon.update_status(SP_READY) //turns on the beacon's ready light
		// if("printBeacon")
		// 	if(charge_account?.adjust_money(-BEACON_COST))
		// 		cooldown = 10//a ~ten second cooldown for printing beacons to prevent spam
		// 		var/obj/item/supplypod_beacon/C = new /obj/item/supplypod_beacon(drop_location())
		// 		C.link_console(src, usr)//rather than in beacon's Initialize(), we can assign the computer to the beacon by reusing this proc)
		// 		printed_beacons++//printed_beacons starts at 0, so the first one out will be called beacon # 1
		// 		beacon.name = "Supply Pod Beacon #[printed_beacons]"
		if("add")
			var/area/current_area = get_area(src)
			var/datum/supply_pack/pack = SSshuttle.supply_packs[text2path(params["id"])]
			if(!pack || !charge_account?.has_money(pack.cost) || !istype(current_area))
				return

			var/turf/landing_turf
			if(!isnull(beacon) && use_beacon) // prioritize beacons over landing in cargobay
				landing_turf = get_turf(beacon)
				beacon.update_status(SP_LAUNCH)
			else if(!use_beacon)// find a suitable supplypod landing zone in cargobay
				var/list/empty_turfs = list()
				if(!landingzone)
					reconnect()
					if(!landingzone)
						WARNING("[src] couldnt find a Ship/Cargo (aka cargobay) area on a ship, and as such it has set the supplypod landingzone to the area it resides in.")
						landingzone = get_area(src)
				for(var/turf/open/floor/T in landingzone.contents)//uses default landing zone
					if(T.is_blocked_turf())
						continue
					empty_turfs += T
					CHECK_TICK
				landing_turf = pick(empty_turfs)

			// note that, because of CHECK_TICK above, we aren't sure if we can
			// afford the pack, even though we checked earlier. luckily adjust_money
			// returns false if the account can't afford the price
			if(landing_turf && charge_account.adjust_money(-pack.cost))
				var/name = "*None Provided*"
				var/rank = "*None Provided*"
				if(ishuman(usr))
					var/mob/living/carbon/human/H = usr
					name = H.get_authentification_name()
					rank = H.get_assignment(hand_first = TRUE)
				else if(issilicon(usr))
					name = usr.real_name
					rank = "Silicon"
				var/datum/supply_order/SO = new(pack, name, rank, usr.ckey, "")
				new /obj/effect/pod_landingzone(landing_turf, podType, SO)
				update_appearance() // ??????????????????
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
				else
					mission.give_up()
				return TRUE

// Взаимодействие с UI для фракций
/obj/machinery/computer/cargo/faction/proc/faction_ui_interact(mob/user, datum/tgui/ui, var/text, obj/src)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, text, name)
		ui.open()
		if(!charge_account)
			reconnect()

// Генерация информации о доступных товарах для фракций
/obj/machinery/computer/cargo/faction/proc/generate_faction_pack_data(datum/faction)
	. = supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/faction/P = SSshuttle.supply_packs[pack]
		// Проверяем что являемся /datum/supply_pack/faction, т.е. всё из мод-пака outpost_console
		if(!istype(P))
			continue
		var/is_faction = ispath(P.faction, faction)
		// Под независимые попадают и те, у которых фракция = null
		if(ispath(faction, /datum/faction/independent) && P.faction == null)
			is_faction = TRUE

		if (is_faction)
			// Если скрыто, не добавляем товар
			if(P.hidden)
				continue
			// Если нет группы, создаём группу
			if(!supply_pack_data[P.group])
				supply_pack_data[P.group] = list(
					"name" = P.group,
					"packs" = list()
				)
			// Добавляем товар в группу
			supply_pack_data[P.group]["packs"] += list(list(
				"name" = P.name,
				"cost" = P.cost,
				"id" = pack,
				"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
			))

	return supply_pack_data

// Создание UI статики для фракций
/obj/machinery/computer/cargo/faction/proc/faction_ui_static_data(mob/user, datum/faction)
	var/list/data = list()
	data["supplies"] = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/faction/P = SSshuttle.supply_packs[pack]
		var/is_faction = ispath(P.faction, faction)

		if (is_faction)
			// Если скрыто, и не ЕМАГнуто - не показываем товар
			if(P.hidden && !(obj_flags & EMAGGED))
				continue
			// Если нет группы, создаём группу
			if(!data["supplies"][P.group])
				data["supplies"][P.group] = list(
					"name" = P.group,
					"packs" = list()
				)
			// Добавляем товар в группу
			data["supplies"][P.group]["packs"] += list(list(
				"name" = P.name,
				"cost" = P.cost,
				"id" = pack,
				"desc" = P.desc || P.name, // If there is a description, use it. Otherwise use the pack's name.
				"small_item" = P.small_item,
			))


	return data

/*
	Без фракции
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
		ui = new(user, src, "OutpostCommunicationsFaction", name)
		ui.open()
		if(!charge_account)
			reconnect()

// Генерация инфы о всех товарах для нефракционного карго
/obj/machinery/computer/cargo/faction/generate_pack_data()
	supply_pack_data = list()
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if(!supply_pack_data[P.group])
			supply_pack_data[P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if(P.hidden)
			continue
		supply_pack_data[P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.cost,
			"id" = pack,
			"desc" = P.desc || P.name // If there is a description, use it. Otherwise use the pack's name.
		))

/*
	Syndicate
*/
/obj/machinery/computer/cargo/faction/syndicate
	name = "syndicate outpost console"
	desc = "That outpost console belongs to Syndicate."
	icon_screen = "syndishuttle"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_RED

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/extractionpod

	charge_account = ACCOUNT_SYN

/obj/machinery/computer/cargo/faction/syndicate/ui_interact(mob/user, datum/tgui/ui)
	faction_ui_interact(user, ui, "OutpostCommunicationsFactionSyndicate", src)


/obj/machinery/computer/cargo/faction/syndicate/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/syndicate)

/obj/machinery/computer/cargo/faction/syndicate/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/syndicate)
	return data

/*
	Inteq
*/
/obj/machinery/computer/cargo/faction/inteq
	name = "inteq outpost console"
	desc = "That outpost console belongs to Inteq."
	icon_screen = "ratvar1"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_TAN_ORANGE

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

	charge_account = ACCOUNT_INT

/obj/machinery/computer/cargo/faction/inteq/ui_interact(mob/user, datum/tgui/ui)
	faction_ui_interact(user, ui, "OutpostCommunicationsFactionInteq", src)

/obj/machinery/computer/cargo/faction/inteq/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/inteq)

/obj/machinery/computer/cargo/faction/inteq/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/inteq)
	return data

/*
	SolFed
*/
/obj/machinery/computer/cargo/faction/solfed
	name = "SolFed outpost console"
	desc = "That outpost console belongs to SolFed."
	icon_screen = "vault"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_DARK_CYAN

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

	charge_account = ACCOUNT_SLF

/obj/machinery/computer/cargo/faction/solfed/ui_interact(mob/user, datum/tgui/ui)
	faction_ui_interact(user, ui, "OutpostCommunicationsFactionSolfed", src)

/obj/machinery/computer/cargo/faction/solfed/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/solgov)

/obj/machinery/computer/cargo/faction/solfed/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/solgov)
	return data

/*
	Independent
*/
/obj/machinery/computer/cargo/faction/independent
	name = "Independent outpost console"
	desc = "That outpost console belongs to Independent faction."
	icon_screen = "idce"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_VIVID_YELLOW

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/elysiumpod

	charge_account = ACCOUNT_IND

/obj/machinery/computer/cargo/faction/independent/ui_interact(mob/user, datum/tgui/ui)
	faction_ui_interact(user, ui, "OutpostCommunicationsFactionIndependent", src)

/obj/machinery/computer/cargo/faction/independent/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/independent)

/obj/machinery/computer/cargo/faction/independent/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/independent)
	return data

/*
	Nanotrasen
*/
/obj/machinery/computer/cargo/faction/nanotrasen
	name = "Nanotrasen outpost console"
	desc = "That outpost console belongs to Nanotrasen."
	icon_screen = "idcentcom"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = LIGHT_COLOR_DARK_BLUE

	contraband = FALSE
	self_paid = FALSE

	podType = /obj/structure/closet/supplypod/centcompod

	charge_account = ACCOUNT_NTN

/obj/machinery/computer/cargo/faction/nanotrasen/ui_interact(mob/user, datum/tgui/ui)
	faction_ui_interact(user, ui, "OutpostCommunicationsFactionNanotrasen", src)

/obj/machinery/computer/cargo/faction/nanotrasen/generate_pack_data()
	supply_pack_data = generate_faction_pack_data(/datum/faction/nt)

/obj/machinery/computer/cargo/faction/nanotrasen/ui_static_data(mob/user)
	var/list/data = faction_ui_static_data(user, /datum/faction/nt)
	return data

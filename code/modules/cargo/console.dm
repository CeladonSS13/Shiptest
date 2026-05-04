#define SP_LINKED 1
#define SP_READY 2
#define SP_LAUNCH 3
#define SP_UNLINK 4
#define SP_UNREADY 5

/obj/machinery/computer/cargo
	name = "коммуникационная консоль аванпоста"
	cases = list("коммуникационная консоль аванпоста", "коммуникационной консоли аванпоста", "коммуникационной консоли аванпоста", "коммуникационную консоль аванпоста", "коммуникационной консолью аванпоста", "коммуникационной консоли аванпоста")
	desc = "Эта консоль позволяет пользователю взаимодейстовать с ближайшим аванпостом для \
			просмотра и управлениями заданиями выставленными различными организациями."
	icon_screen = "supply_express"
	circuit = /obj/item/circuitboard/computer/cargo
	light_color = COLOR_BRIGHT_ORANGE

	/// The ship we reside on for ease of access
	var/datum/overmap/ship/controlled/current_ship
	var/datum/faction/current_faction
	var/datum/overmap/outpost/outpost_docked

	var/contraband = FALSE
	var/self_paid = FALSE
	var/safety_warning = "По соображениям безопасности автоматизированный шаттл снабжения \
		не может перевозить живые организмы, человеческие останки, секретное ядерное оружие, \
		самонаводящиеся маяки или оборудование, оснащенное каким-либо искусственным интеллектом"
	/// var that tracks message cooldown
	var/message_cooldown

	var/blockade_warning = "Обнаружена Блюспейс нестабильность. Доставка невозможна."
	var/message
	var/list/supply_pack_data
	/// The currently linked supplypod beacon
	var/obj/item/supplypod_beacon/beacon
	/// Area instance that cargo pods are sent to
	var/area/landingzone
	/// The pod type used to deliver orders
	var/podType = /obj/structure/closet/supplypod // [CELADON-EDIT] - CELADON_OUTPOST_CONSOLE - instead of "/obj/structure/closet/supplypod/centcompod"
	/// Cooldown to prevent printing supplypod beacon spam
	var/cooldown = 0
	/// Is the console in beacon mode? exists to let beacon know when a pod may come in
	var/use_beacon = FALSE
	/// The account to charge purchases to, defaults to the cargo budget
	var/datum/bank_account/charge_account
	var/pack_data_cooldown = 0  // [CELADON-ADD] - CELADON_FIXES: Cooldown for generating pack data to prevent FPS drops

/obj/machinery/computer/cargo/Initialize()
	. = ..()
	var/obj/item/circuitboard/computer/cargo/board = circuit
	contraband = board.contraband
	if (board.obj_flags & EMAGGED)
		obj_flags |= EMAGGED
	else
		obj_flags &= ~EMAGGED

/obj/machinery/computer/cargo/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	if(user)
		user.visible_message(span_warning("[user] проводит странной карточкой по [CASE(src, GENITIVE_CASE)]!"),
		span_notice("Вы настраиваете [CASE(src, ACCUSATIVE_CASE)] маршрутизацию и спектр приема, разблокировка специальных предметов снабжения и контрабанды."))

	obj_flags |= EMAGGED
	contraband = TRUE

	// This also permamently sets this on the circuit board
	var/obj/item/circuitboard/computer/cargo/board = circuit
	board.contraband = TRUE
	board.obj_flags |= EMAGGED
	update_static_data(user)

/obj/machinery/computer/cargo/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	. = ..()
	current_ship = port.current_ship
	reconnect(port)

/obj/machinery/computer/cargo/proc/reconnect(obj/docking_port/mobile/port)
	if(current_ship)
		current_faction = current_ship.source_template.faction
		charge_account = current_ship.ship_account
		outpost_docked = current_ship.docked_to

/obj/machinery/computer/cargo/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostCommunicationsCeladon", name) // [CELADON-EDIT] - CELADON_OUTPOST_CONSOLE - instead of "OutpostCommunications", [CELADON-EDIT] - Due to the translation of the text, the name "OutpostCommunicationsCeladon" was changed to Russian.
		ui.open()
		if(!charge_account)
			reconnect()

/obj/machinery/computer/cargo/ui_static_data(mob/user)
	. = ..()
	outpost_docked = current_ship.docked_to
	// [CELADON-EDIT] - CELADON_FIXES: Prevent constant pack data generation every tick
	// if(istype(outpost_docked))
	if(istype(outpost_docked) && pack_data_cooldown <= world.time)
		generate_pack_data()
		pack_data_cooldown = world.time + 50  // Cache for 5 seconds
	else
		supply_pack_data = list()
	// [/CELADON-ADD]

/obj/machinery/computer/cargo/ui_data(mob/user)
	var/list/data = list()

	data["onShip"] = !isnull(current_ship)
	data["shipFaction"] = current_ship.source_template.faction.name
	data["numMissions"] = current_ship ? LAZYLEN(current_ship.missions) : 0
	data["maxMissions"] = current_ship ? current_ship.max_missions : 0
	data["outpostDocked"] = istype(outpost_docked)
	data["points"] = charge_account ? charge_account.account_balance : 0
	data["siliconUser"] = user.has_unlimited_silicon_privilege && check_ship_ai_access(user)
	message = "Покупки будут доставлены в зону доставки вашего ангара."
	data["blockade"] = FALSE
	if(istype(outpost_docked) && outpost_docked.market.supply_blocked)
		message = blockade_warning
		data["blockade"] = TRUE
	data["message"] = message
	data["supplies"] = supply_pack_data

	data["shipMissions"] = list()
	data["outpostMissions"] = list()

	if(current_ship)
		for(var/datum/mission/M as anything in current_ship.missions)
			data["shipMissions"] += list(M.get_tgui_info())
		if(istype(outpost_docked))
			for(var/datum/mission/M as anything in outpost_docked.missions)
				data["outpostMissions"] += list(M.get_tgui_info())

	return data

//[CELADON-ADD] - CELADON_FIXES - Чиним реролл
/datum/overmap/ship/controlled
	var/given_up_missions = 0
	var/giveup_timer = - 15 MINUTES
	var/giveup_timeout = FALSE
//[/CELADON-ADD]

/obj/machinery/computer/cargo/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return
	switch(action)
		if("withdrawCash")
			var/val = text2num(params["value"])
			// no giving yourself money
			if(!charge_account || !val || val <= 0)
				return
			if(charge_account.adjust_money(-val, CREDIT_LOG_WITHDRAW))
				var/obj/item/holochip/cash_chip = new /obj/item/holochip(drop_location(), val)
				if(ishuman(usr))
					var/mob/living/carbon/human/user = usr
					user.put_in_hands(cash_chip)
				playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
				src.visible_message(span_notice("[C_CASE(src, GENITIVE_CASE)] выдала вам голочип."))
			return TRUE

		// if("add")
		if("purchase")
			var/list/purchasing = params["cart"]
			var/total_cost = text2num(params["total"])
			if(!current_ship?.docked_to)	// [CELADON-ADD] - Мне лень убирать этот вызов, можно обойтись банальной проверкой
				return						// [/CELADON-ADD]
			var/datum/overmap/outpost/current_outpost = current_ship.docked_to
			if(!istype(current_ship.docked_to) || purchasing.len == 0)
				return

			if(istype(outpost_docked) && outpost_docked.market.supply_blocked)
				say("Связь с отделом снабжения аванпоста недоступна. Попробуйте позже.")
				return

			if(!charge_account.adjust_money(-total_cost, CREDIT_LOG_CARGO))
				say("Недостаточно средств!")
				return

			playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)
			say("Заказ в пути!")

			var/list/unprocessed_packs = list()
			for(var/list/current_item as anything in purchasing)
				unprocessed_packs += locate(current_item["ref"]) in current_outpost.market.supply_packs

			current_outpost.market.make_order(usr, unprocessed_packs, return_crate_spawner())

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
				mission.accept(ship, loc, return_crate_spawner())
				return TRUE
			else if(mission.servant == ship)
				if(mission.can_complete())
					mission.turn_in()
				//[CELADON-EDIT] - CELADON_FIXES - фиксим ролл миссий
				//else if(tgui_alert(usr, "Give up on [mission]?", src, list("Yes", "No")) == "Yes")
				// mission.give_up()
					ship.given_up_missions = 0
					ship.giveup_timer = world.time-15 MINUTES
					ship.giveup_timeout = FALSE
				else
					if(world.time > ship.giveup_timer)
						if(ship.giveup_timeout)
							ship.given_up_missions = 0
							ship.giveup_timeout = FALSE
						if(ship.given_up_missions < 3)
							ship.given_up_missions = ship.given_up_missions+1
							mission.give_up()
							if(ship.given_up_missions >= 3)
								ship.giveup_timer = world.time+15 MINUTES
								ship.giveup_timeout = TRUE
								to_chat(usr, "<span class='alert'>Достигнуто максимальное количество прерванных миссий. Пожалуйста, подождите 15 минут, пока мы проверяем вашу историю выполнения заданий на предмет возможных махинаций. Дальнейшие попытки отказа от выполнения заданий могут привести к ухудшению вашей репутации.</span>")
							return TRUE
					else
						to_chat(usr, "<span class='alert'>Пожалуйста подождите [ceil((ship.giveup_timer-world.time)/600)] [PLUR_MINUTES_LEFT(ship.giveup_timer)] перед тем как прервать миссию вновь.</span>")
						return TRUE
				//[/CELADON-EDIT]
				return TRUE

/obj/machinery/computer/cargo/attackby(obj/item/W, mob/living/user, params)
	var/value = W.get_item_credit_value()
	if(value && charge_account)
		charge_account.adjust_money(value, CREDIT_LOG_DEPOSIT)
		to_chat(user, span_notice("Ваш депозит [W]. Бюджет вашего корабля составляет: [charge_account.account_balance] кр."))
		qdel(W)
		return TRUE
	..()

/obj/machinery/computer/cargo/proc/generate_pack_data()
	supply_pack_data = list()

	if(!current_ship.docked_to)
		return supply_pack_data

	if(!istype(outpost_docked))
		return supply_pack_data

	for(var/datum/supply_pack/current_pack as anything in outpost_docked.market.supply_packs)
		if(!supply_pack_data[current_pack.category])
			supply_pack_data[current_pack.category] = list(
				"name" = current_pack.category,
				"packs" = list()
			)
		if((!current_pack.available))
			continue
		var/same_faction = current_pack.faction ? current_pack.faction.allowed_faction(current_faction) : FALSE
		var/discountedcost = (same_faction && current_pack.faction_discount) ? current_pack.cost - (current_pack.cost * (current_pack.faction_discount * 0.01)) : null
		if(current_pack.faction_locked && !same_faction)
			continue
		supply_pack_data[current_pack.category]["packs"] += list(list(
			"name" = current_pack.name,
			"cost" = current_pack.cost,
			"discountedcost" = discountedcost ? discountedcost : null,
			"discountpercent" = current_pack.faction_discount,
			"faction_locked" = current_pack.faction_locked, //this will only show if you are same faction, so no issue
			"ref" = REF(current_pack),
			"desc" = (current_pack.desc || current_pack.name) + (discountedcost ? "\n-[current_pack.faction_discount]% отключено из-за принадлежности к вашей фракции.\nБыло [current_pack.cost]" : "") + (current_pack.faction_locked ? "\nВы можете приобрести этот предмет в зависимости от вашей принадлежности к фракции." : ""), // If there is a description, use it. Otherwise use the pack's name.
			"no_bundle" = current_pack.no_bundle
		))


/obj/machinery/computer/cargo/proc/return_crate_spawner()
	var/obj/hangar_crate_spawner/spawner
	spawner = current_ship.shuttle_port.docked.crate_spawner
	return spawner

/obj/machinery/computer/cargo/retro
	icon = 'icons/obj/machines/retro_computer.dmi'
	icon_state = "computer-retro"
	deconpath = /obj/structure/frame/computer/retro

/obj/machinery/computer/cargo/solgov
	icon = 'icons/obj/machines/retro_computer.dmi'
	icon_state = "computer-solgov"
	deconpath = /obj/structure/frame/computer/solgov

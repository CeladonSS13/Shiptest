/obj/machinery/computer/trade_mining_console
	name = "frontier trade console"
	desc = "A secure console for purchasing equipment. Mining points unlock items, credits buy them."
	icon_keyboard = "med_key"
	icon_screen = "supply"
	icon_keyboard = null
	circuit = /obj/item/circuitboard/computer/trade_mining_console
	light_color = LIGHT_COLOR_CYAN
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/password = ""
	var/logged_in = FALSE
	var/obj/machinery/outpost_selling_pad/linked_pad
	var/list/unlocked_items = list()
	var/list/available_items = list()

/obj/machinery/computer/trade_mining_console/Initialize(mapload)
	. = ..()
	password = generate_password()

/obj/machinery/computer/trade_mining_console/LateInitialize()
	. = ..()
	var/obj/machinery/outpost_selling_pad/pad = locate() in range(2,src)
	linked_pad = pad
	addtimer(CALLBACK(src, PROC_REF(send_password_to_captain)), 1 MINUTES)

/obj/machinery/computer/trade_mining_console/RefreshParts()
	. = ..()
	logged_in = FALSE
	unlocked_items = list()

/obj/machinery/computer/trade_mining_console/proc/send_password_to_captain()
	if(QDELETED(src))
		return
	var/area/ship_area = get_area(src)
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!H.mind || !H.client)
			continue
		var/area/player_area = get_area(H)
		if(player_area.type != ship_area.type)
			continue
		if(H.mind.assigned_role == "Captain" || H.mind.assigned_role == "Manager")
			to_chat(H, span_boldnotice("Код доступа к торговой консоли: [password]"))
			to_chat(H, span_notice("Запомните этот код!"))

/obj/machinery/computer/trade_mining_console/proc/generate_password()
	var/list/chars = list("A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","U","V","W","X","Y","Z","2","3","4","5","6","7","8","9")
	var/result = ""
	for(var/i in 1 to 6)
		result += pick(chars)
	return result

/obj/machinery/computer/trade_mining_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MiningConsole")
		ui.open()

/obj/machinery/computer/trade_mining_console/ui_data(mob/user)
	var/list/data = list()
	data["logged_in"] = logged_in
	data["items"] = list()

	var/mob/living/carbon/human/H = user
	var/obj/item/card/bank/card = H?.get_bankcard()

	if(card)
		data["user_points"] = card.mining_points
		data["user_credits"] = card.registered_account?.account_balance || 0

	for(var/item_path in available_items)
		var/atom/A = item_path
		var/list/item_data = available_items[item_path]
		data["items"] += list(list(
			"name" = initial(A.name),
			"path" = "[item_path]",
			"price" = item_data["price"],
			"unlock_cost" = item_data["unlock_cost"],
			"unlocked" = (item_path in unlocked_items)
		))

	return data

/obj/machinery/computer/trade_mining_console/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("login")
			var/input_pass = params["password"]
			if(input_pass == password)
				logged_in = TRUE
				playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)
				return TRUE
			else
				playsound(src, 'sound/machines/triple_beep.ogg', 50, FALSE)
		if("logout")
			logged_in = FALSE
			return TRUE
		if("unlock")
			if(!logged_in)
				return
			var/item_path = text2path(params["path"])
			if(!item_path || (item_path in unlocked_items))
				return
			var/mob/living/carbon/human/H = usr
			var/obj/item/card/bank/card = H?.get_bankcard()
			if(!card)
				return
			var/list/item_data = available_items[item_path]
			var/cost = item_data["unlock_cost"]
			if(card.mining_points >= cost)
				card.mining_points -= cost
				unlocked_items += item_path
				return TRUE
		if("purchase")
			if(!logged_in)
				return
			var/item_path = text2path(params["path"])
			if(!item_path || !(item_path in unlocked_items))
				return
			var/mob/living/carbon/human/H = usr
			var/obj/item/card/bank/card = H?.get_bankcard()
			if(!card?.registered_account)
				return
			var/list/item_data = available_items[item_path]
			var/price = item_data["price"]
			if(card.registered_account.has_money(price))
				if(!linked_pad)
					say("No delivery pad linked.")
					playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
					return
				card.registered_account.adjust_money(-price, "console_purchase")
				if(istype(linked_pad, /obj/machinery/outpost_selling_pad/delivery))
					var/obj/machinery/outpost_selling_pad/delivery/del_pad = linked_pad
					del_pad.animate_delivery()
				else
					do_sparks(5, 0, linked_pad.loc)
				new item_path(linked_pad.loc)
				playsound(src, 'sound/machines/machine_vend.ogg', 50, FALSE)
				return TRUE

/obj/item/circuitboard/computer/trade_mining_console
	name = "frontier trade console (Computer Board)"
	greyscale_colors = "#4a7f3e#3d6633"
	build_path = /obj/machinery/computer/trade_mining_console
	var/list/req_components = list(
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stock_parts/scanning_module = 1,
		/obj/item/stack/cable_coil = 5)

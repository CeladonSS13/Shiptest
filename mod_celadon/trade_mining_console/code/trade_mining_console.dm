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
	var/list/item_stock = list()
	var/list/categories = list()
	var/selected_category = null
	var/selected_item = null
	var/theme = "default"

/obj/machinery/computer/trade_mining_console/Initialize(mapload)
	. = ..()
	password = generate_password()
	if(available_items && length(available_items))
		for(var/item_path in available_items)
			var/list/item_data = available_items[item_path]
			if(!item_data["unlimited"] && item_data["stock"])
				item_stock[item_path] = item_data["stock"]

/obj/machinery/computer/trade_mining_console/LateInitialize()
	. = ..()
	var/obj/machinery/outpost_selling_pad/pad = locate() in range(2,src)
	linked_pad = pad
	addtimer(CALLBACK(src, PROC_REF(send_password_to_captain)), 30 SECONDS)

/obj/machinery/computer/trade_mining_console/RefreshParts()
	. = ..()
	logged_in = FALSE
	unlocked_items = list()
	item_stock = list()
	if(available_items && length(available_items))
		for(var/item_path in available_items)
			var/list/item_data = available_items[item_path]
			if(!item_data["unlimited"] && item_data["stock"])
				item_stock[item_path] = item_data["stock"]

/obj/machinery/computer/trade_mining_console/proc/send_password_to_captain()
	if(QDELETED(src))
		return
	var/area/console_area = get_area(src)
	var/console_ship_name = ""
	// Извлекаем название корабля из названия области
	var/list/console_name_parts = splittext(console_area.name, " ")
	if(length(console_name_parts) >= 2)
		console_ship_name = "[console_name_parts[1]] [console_name_parts[2]]"
	
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(!H.mind || !H.client)
			continue
		var/area/player_area = get_area(H)
		var/player_ship_name = ""
		// Извлекаем название корабля из названия области игрока
		var/list/player_name_parts = splittext(player_area.name, " ")
		if(length(player_name_parts) >= 2)
			player_ship_name = "[player_name_parts[1]] [player_name_parts[2]]"
		
		// Проверяем, находятся ли консоль и игрок на одном корабле
		if(console_ship_name != player_ship_name || !console_ship_name)
			continue
			
		if(H.mind.assigned_role == "Captain" || H.mind.assigned_role == "Manager")
			to_chat(H, "<font size='4' color='red'><b>КОД ДОСТУПА К ТОРГОВОЙ КОНСОЛИ: [password]</b></font>")
			to_chat(H, "<font size='4' color='red'><b>Запомните этот код!</b></font>")

/obj/machinery/computer/trade_mining_console/proc/generate_password()
	var/list/chars = list("A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","U","V","W","X","Y","Z","2","3","4","5","6","7","8","9")
	var/result = ""
	for(var/i in 1 to 6)
		result += pick(chars)

	// Логирование генерации пароля
	var/area/console_area = get_area(src)
	var/log_message = "Trade console password generated: [result] at [console_area] ([x],[y],[z])"
	log_admin(log_message)
	message_admins("[span_adminnotice("Trade Console:")][span_admin(" Password [result] generated at [console_area] ([x],[y],[z]).")]", R_ADMIN)

	return result

/obj/machinery/computer/trade_mining_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "TradeConsole")
		ui.open()

/obj/machinery/computer/trade_mining_console/ui_data(mob/user)
	var/list/data = list()
	data["logged_in"] = logged_in
	data["items"] = list()
	data["categories"] = list()
	data["selected_category"] = selected_category
	data["selected_item"] = selected_item
	data["theme"] = theme

	var/mob/living/carbon/human/H = user
	var/obj/item/card/bank/card = H?.get_bankcard()

	if(card)
		data["user_points"] = card.mining_points
		data["user_credits"] = card.registered_account?.account_balance || 0

	// Собираем категории
	var/list/category_list = list("All")
	if(available_items && length(available_items))
		for(var/item_path in available_items)
			var/list/item_data = available_items[item_path]
			var/category = item_data["category"] || "General"
			if(!(category in category_list))
				category_list += category
	data["categories"] = category_list

	// Собираем предметы
	if(available_items && length(available_items))
		for(var/item_path in available_items)
			var/atom/A = item_path
			var/list/item_data = available_items[item_path]
			var/unlimited = item_data["unlimited"] || FALSE
			var/stock = item_stock[item_path] || 0
			var/category = item_data["category"] || "General"
			var/description = item_data["description"] || initial(A.desc)
			var/icon_state = initial(A.icon_state)
			var/icon_file = initial(A.icon)
			var/icon_base64 = ""
			if(icon_file && icon_state)
				try
					var/icon/I = new /icon(icon_file, icon_state)
					icon_base64 = icon2base64(I)
				catch
					icon_base64 = ""

			var/list/item_info = list(
				"name" = initial(A.name),
				"path" = "[item_path]",
				"unlock_cost" = item_data["unlock_cost"],
				"price" = item_data["price"],
				"unlocked" = (item_path in unlocked_items),
				"unlimited" = unlimited,
				"category" = category,
				"description" = description,
				"icon_state" = icon_state,
				"icon_file" = "[icon_file]",
				"icon_base64" = icon_base64
			)
			if(!unlimited)
				item_info["stock"] = stock
			data["items"] += list(item_info)

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
			selected_category = null
			selected_item = null
			return TRUE
		if("select_category")
			selected_category = params["category"]
			selected_item = null
			return TRUE
		if("select_item")
			selected_item = params["path"]
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
			var/list/item_data = available_items[item_path]
			if(!item_data["unlimited"])
				var/current_stock = item_stock[item_path] || 0
				if(current_stock <= 0)
					say("Item out of stock.")
					playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
					return
			var/mob/living/carbon/human/H = usr
			var/obj/item/card/bank/card = H?.get_bankcard()
			if(!card?.registered_account)
				return
			var/price = item_data["price"]
			if(card.registered_account.has_money(price))
				if(!linked_pad)
					say("No delivery pad linked.")
					playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
					return
				card.registered_account.adjust_money(-price, "console_purchase")
				if(!item_data["unlimited"])
					item_stock[item_path]--
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

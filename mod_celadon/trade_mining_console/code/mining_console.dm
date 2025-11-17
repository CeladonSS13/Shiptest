/obj/machinery/computer/mining_console
	name = "frontier trade console"
	desc = "A secure console for purchasing equipment. Mining points unlock items, credits buy them."
	icon_screen = "supply"
	icon_keyboard = "tech_key"
	circuit = /obj/item/circuitboard/computer/mining_console
	light_color = LIGHT_COLOR_BLUE

	var/password = ""
	var/logged_in = FALSE
	var/obj/machinery/outpost_selling_pad/linked_pad
	var/list/unlocked_items = list()
	var/list/available_items = list(
		/obj/item/gun/energy/kinetic_accelerator = list("price" = 500, "unlock_cost" = 100),
		/obj/item/kinetic_crusher = list("price" = 750, "unlock_cost" = 150),
		/obj/item/pickaxe/silver = list("price" = 300, "unlock_cost" = 50),
		/obj/item/storage/bag/ore = list("price" = 100, "unlock_cost" = 20),
		/obj/item/t_scanner/adv_mining_scanner = list("price" = 400, "unlock_cost" = 80),
		/obj/item/survivalcapsule = list("price" = 600, "unlock_cost" = 120)
	)

/obj/machinery/computer/mining_console/Initialize(mapload)
	. = ..()
	password = generate_password()
	var/obj/item/paper/console_password/P = new(loc, password)
	P.forceMove(loc)

/obj/machinery/computer/mining_console/LateInitialize()
	. = ..()
	var/obj/machinery/outpost_selling_pad/pad = locate() in range(2,src)
	linked_pad = pad

/obj/machinery/computer/mining_console/proc/generate_password()
	var/list/chars = list("A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","U","V","W","X","Y","Z","2","3","4","5","6","7","8","9")
	var/result = ""
	for(var/i in 1 to 6)
		result += pick(chars)
	return result

/obj/machinery/computer/mining_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MiningConsole")
		ui.open()

/obj/machinery/computer/mining_console/ui_data(mob/user)
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

/obj/machinery/computer/mining_console/ui_act(action, params)
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
				do_sparks(5, 0, linked_pad.loc)
				new item_path(linked_pad.loc)
				playsound(src, 'sound/machines/machine_vend.ogg', 50, FALSE)
				return TRUE

/obj/item/circuitboard/computer/mining_console
	name = "frontier trade console (Computer Board)"
	build_path = /obj/machinery/computer/mining_console

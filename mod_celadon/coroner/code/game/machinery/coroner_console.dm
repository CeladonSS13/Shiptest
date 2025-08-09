/obj/machinery/computer/coroner_console
	name = "coroner management console"
	desc = "A console for managing morgue operations and processing body delivery payments."
	icon_screen = "security"
	circuit = /obj/item/circuitboard/computer/coroner_console
	
	var/credits = 0
	var/list/monitored_areas = list()

/obj/machinery/computer/coroner_console/Initialize()
	. = ..()
	find_monitored_areas()

/obj/machinery/computer/coroner_console/proc/find_monitored_areas()
	for(var/area/A in world)
		if(A.area_flags & CORONER_MONITORED)
			monitored_areas += A

/obj/machinery/computer/coroner_console/proc/add_credits(amount)
	credits += amount
	playsound(src, 'sound/machines/ping.ogg', 50, TRUE)

/obj/machinery/computer/coroner_console/proc/withdraw_credits(amount)
	if(credits >= amount)
		credits -= amount
		var/obj/item/holochip/chip = new(get_turf(src))
		chip.credits = amount
		to_chat(world, "<span class='notice'>DEBUG: Created holochip with [amount] credits at [get_turf(src)]</span>")
		return TRUE
	return FALSE

/obj/machinery/computer/coroner_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CoronerConsole", name)
		ui.open()

/obj/machinery/computer/coroner_console/ui_data(mob/user)
	var/list/data = list()
	data["credits"] = credits
	return data

/obj/machinery/computer/coroner_console/ui_act(action, params)
	. = ..()
	if(.)
		return
	
	switch(action)
		if("withdraw")
			var/amount = text2num(params["amount"])
			if(params["amount"] == "all")
				amount = credits
			
			if(withdraw_credits(amount))
				to_chat(usr, "<span class='notice'>Dispensed [amount] credit holochip.</span>")
				return TRUE
			else
				to_chat(usr, "<span class='warning'>Insufficient credits.</span>")
				return TRUE
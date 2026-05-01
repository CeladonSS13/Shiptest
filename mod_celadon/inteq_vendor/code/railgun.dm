/obj/structure/salvageable/railgun
	name = "Malfunctioning Caliban's 'WAR' railgun"
	desc = "This railgun has massive power draw, yet it is a modified version with discarding sabot that increases its heat production. Two rails are surrounded by a helical barrel that ejects shots at tremendous speed."
	icon = 'mod_celadon/_storage_icons/icons/machinery/caliban_rail.dmi'
	icon_state = "railgun-malf"
	salvageable_parts = list(
		/obj/item/stack/sheet/metal/five = 10,
		/obj/item/stack/sheet/plasteel/five = 30,
		/obj/item/stack/sheet/glass/two = 80,
		/obj/item/stack/cable_coil/cut = 80,
		/obj/item/stack/ore/salvage/scraptitanium/five = 60,
		/obj/item/stack/ore/salvage/scrapmetal/five = 60,
		/obj/item/computer_hardware/processor_unit = 40,
		/obj/item/computer_hardware/processor_unit = 40,
		/obj/item/stock_parts/subspace/amplifier = 40,
		/obj/item/stock_parts/subspace/amplifier = 40,
		/obj/item/stock_parts/capacitor/quadratic = 40,
		/obj/item/stock_parts/subspace/analyzer = 40,
		/obj/item/stock_parts/subspace/analyzer = 40,
		/obj/item/stock_parts/subspace/crystal = 30,
		/obj/item/stock_parts/subspace/crystal = 30)
	bound_x = -32
	bound_width = 128
	pixel_x = -32
	pixel_y = -64
	var/volatility = 1

/obj/structure/salvageable/railgun/examine_more(mob/user)
	. = ..()
	. += span_warning("The WAR’s discarding, sabot-jacketed two-stage projectile can pierce even through the heaviest armor. \n\
						Once catapulted from its launcher, the sabot explodes and disengages on approach to its target and triggers a second stage – internal propulsion drives the sabot forward with incredible velocity. This stage melts already superhot projectile and thus it goes through armor like a knife through butter, melting ships in half. Unfortunately, this makes this weapon only usable of being fired in close combat. \n\
						Through a complex, delicate weave of heat exchangers, Heat sinks installed on the ship recycles the heat generated into usable energy. The system works well, but the delicate nature of the exchange renders it highly volatile. \n\
						Unfortunately, this monstrosity stuck in the endless loop of reloading. It seems the internals have been melt...")

/obj/structure/salvageable/railgun/attacked_by(obj/item/attacking_item, mob/living/user)
	if(istype(attacking_item, /obj/item/trash/railgun_sabot))
		if(!contents.len)
			user.balloon_alert_to_viewers("[user] is loading the fucking BSA!", "I'm loading the BSA, I'm doing it!",10)
			if(do_after(user,15,src))
				volatility = 100
				attacking_item.forceMove(src)
		else
			to_chat(user, span_danger("There is already a sabot loaded in!"))
	. = ..()

/obj/structure/salvageable/railgun/attack_hand(mob/living/user)
	. = ..()
	if(contents.len)
		visible_message(span_danger("Looks like \The [user] is unloading [src]!"))
		if(do_after(user, 25, src))
			volatility = 1
			for(var/item in contents)
				user.put_in_hands(item)
	else
		to_chat(user, span_danger("There is nothing I can do about it."))

/obj/structure/salvageable/railgun/crowbar_act(mob/living/user, obj/item/tool)
	if(prob(volatility))
		visible_message(span_danger("\The [src]'s internals scream, as the explosion enlights everyone around!"),
			span_hear("You hear a loud electrical crack!"))
		user.show_message("At the last moment you see what looks like a railgun sabot in the loading chamber! FUCK!!")
		playsound(src.loc, 'sound/magic/lightningshock.ogg', 100, TRUE, extrarange = 5)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(explosion), get_turf(src), 0, 0, 3, 3), 1) // Absolutely normal explosion
	else
		. = ..()

/obj/item/trash/railgun_sabot
	name = "84 mm hybrid railgun sabot"
	desc = "A railgun sabot with propellant inside. Now this is rubbish. But what happens if you load it inside th... Huh..."
	icon = 'icons/obj/ammunition/ammo_bullets.dmi'
	icon_state = "84mm-hedp"

/obj/structure/salvageable/railgun_platform
	name = "Railgun platform"
	desc = "The cells in this platform are: \n\
			The longest lasting, the fastest cycling, and the highest capacity solid state cells TM \n\
			that can be sold to the private military. At the same time, they can discharge completely almost immediately, which is highly extraordinary."
	icon = 'mod_celadon/_storage_icons/icons/machinery/caliban_rail.dmi'
	icon_state = "railgun_platform"
	salvageable_parts = list(
		/obj/item/stack/sheet/metal/five = 10,
		/obj/item/stack/sheet/plasteel/five = 30,
		/obj/item/stack/sheet/glass/two = 80,
		/obj/item/stack/cable_coil/cut = 80,
		/obj/item/stack/ore/salvage/scrapuranium/five = 60,
		/obj/item/stack/ore/salvage/scrapmetal/five = 60,
		/obj/item/stock_parts/capacitor/quadratic = 40,
		/obj/item/stock_parts/capacitor/quadratic = 40,
		/obj/item/stock_parts/capacitor/quadratic = 40,
		/obj/item/stock_parts/capacitor/quadratic = 40,
		/obj/item/stock_parts/cell/high/empty = 40)
	bound_x = -32
	bound_width = 64
	pixel_x = -32
	pixel_y = -64
	var/volatility = 10

/obj/structure/salvageable/railgun_platform/examine_more(mob/user)
	. = ..()
	. += span_warning("A side effect of their high capacity is a proportional increase in volatility, but before you install, you must agree to relieve yourself of all liability. \n\
	You probably can make it 'safe' with some fumbling around.")

/obj/structure/salvageable/railgun_platform/attack_hand(mob/living/user)
	. = ..()
	visible_message(span_danger("\The [user] is messing with the [src] wiring!"))
	if(user.a_intent == INTENT_HELP)
		to_chat(user, span_danger("Trying to fix the wiring..."))
		if(do_after(user, 20, src))
			volatility = 1
	else
		to_chat(user, span_danger("Connecting together some random wires... This won't end good for anyone."))
		if(do_after(user,20,src))
			volatility = 100


/obj/structure/salvageable/railgun_platform/crowbar_act(mob/living/user, obj/item/tool)
	if(prob(volatility))
		visible_message(span_danger("\The [src]'s internals scream, as the explosion enlights everyone around!"),
			span_hear("You hear a loud electrical crack!"))
		user.show_message("Apparently you have touched the WRONG place with the crowbar! OOPSIE!!")
		playsound(src.loc, 'sound/magic/lightningshock.ogg', 100, TRUE, extrarange = 5)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(explosion), get_turf(src), 0, 0, 3, 3), 1) // Absolutely normal explosion
	else
		. = ..()

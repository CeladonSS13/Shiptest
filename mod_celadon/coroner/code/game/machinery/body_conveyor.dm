/obj/machinery/body_conveyor
	name = "body processing conveyor"
	desc = "A specialized conveyor system for processing deceased individuals. Only accepts dead bodies."
	icon = 'icons/obj/recycling.dmi'
	icon_state = "conveyor0"
	density = TRUE // TEMP: Testing collision
	anchored = TRUE
	dir = NORTH

	var/credits_per_body = 1000
	var/obj/machinery/computer/coroner_console/linked_console

/obj/machinery/body_conveyor/Initialize()
	. = ..()
	find_console()

/obj/machinery/body_conveyor/proc/find_console()
	for(var/obj/machinery/computer/coroner_console/console in range(20, src))
		linked_console = console
		break

/obj/machinery/body_conveyor/attack_hand(mob/user)
	return ..()

/obj/machinery/body_conveyor/Bumped(atom/movable/AM)
	if(isliving(AM))
		var/mob/living/body = AM
		if(body.stat == DEAD)
			process_body(body)
		else
			reject_living(body)

/obj/machinery/body_conveyor/Crossed(atom/movable/AM)
	Bumped(AM)

/obj/machinery/body_conveyor/Uncrossed(atom/movable/AM)
	. = ..()



/obj/machinery/body_conveyor/proc/process_body(mob/living/body)
	if(!body.GetComponent(/datum/component/processed_body))
		visible_message("<span class='notice'>[src] processes [body] for payment.</span>")
		if(linked_console)
			linked_console.add_credits(credits_per_body)
			playsound(src, 'mod_celadon/_storge_sounds/sound/effects/bell.ogg', 50, TRUE)

			to_chat(GLOB.admins, span_adminnotice("Body recovery conveyer delivered [body.real_name] ([body.ckey]) to morgue from [get_area_name(body)]."))
			for(var/client/C in GLOB.admins)
					if(C.prefs.toggles & SOUND_ADMINHELP)
						SEND_SOUND(C, sound('mod_celadon/_storge_sounds/sound/effects/bell.ogg'))
		body.AddComponent(/datum/component/processed_body)
	else
		visible_message("<span class='notice'>[src] moves [body] forward (already processed).</span>")
	// Allow body to pass through
	return

/obj/machinery/body_conveyor/proc/reject_living(mob/living/body)
	if(body.stat == DEAD)
		return
	visible_message("<span class='warning'>[src] rejects [body] - only deceased individuals accepted!</span>")
	body.adjustBruteLoss(25)
	body.Knockdown(30)
	body.visible_message("<span class='warning'>[body] is shocked by the conveyor!</span>")
	var/turf/target = get_step(src, SOUTH)
	if(target)
		body.throw_at(target, 3, 2)

//
// Ship Gravity Generator
//

/obj/machinery/power/ship_gravity
	name = "gravitational generator"
	desc = "A ship-portable gravity generator, capable of providing gravity throughout the vessel it is installed on."
	icon = 'icons/obj/machines/ship_gravity.dmi'
	icon_state = "shipgrav"
	base_icon_state = "shipgrav"
	density = TRUE
	idle_power_usage = IDLE_DRAW_MINIMAL
	active_power_usage = ACTIVE_DRAW_EXTREME
	circuit = /obj/item/circuitboard/machine/ship_gravity
	var/datum/looping_sound/gravity_generator/soundloop
	var/charging = FALSE
	var/active = FALSE
	var/charge = 0

	light_power = 0
	light_range = 2
	light_color = COLOR_GRAY
	luminosity = 1

/obj/machinery/power/ship_gravity/unanchored
	anchored = FALSE

/obj/machinery/power/ship_gravity/admin
	idle_power_usage = 0
	active_power_usage = 0
	active = TRUE

/obj/machinery/power/ship_gravity/Initialize()
	. = ..()
	if(anchored)
		connect_to_network()

	soundloop = new(list(src), FALSE)

/obj/machinery/power/ship_gravity/Destroy()
	. = ..()
	QDEL_NULL(soundloop)

/obj/machinery/power/ship_gravity/emp_act(severity)
	. = ..()
	if(prob(50))
		set_state(!active)

/obj/machinery/power/ship_gravity/process()
	if(charging && (!active_power_usage || surplus() >= active_power_usage))
		add_load(active_power_usage)
		charge = min(charge+1, 5)
		if(charge >= 5)
			set_state(TRUE)
	else
		charge = max(charge-1, 0)
		if(!charge)
			set_state(FALSE)
	update_appearance()

/obj/machinery/power/ship_gravity/proc/set_state(toggle)
	if(toggle == active)
		return
	if(toggle)
		active = TRUE
		playsound(src.loc, 'sound/effects/empulse.ogg', 100, TRUE)
		soundloop.start()
		set_light(l_power = 0.5)
		visible_message(span_warning("The [src.name] finishes charging!"), blind_message = span_hear("You hear a low hum fade in."))
	else
		visible_message(span_danger("The [src.name] shuts down due to lack of power!"), blind_message = span_hear("You hear a low hum fade out."))
		active = FALSE
		soundloop.stop()
		set_light(l_power = 0)
		log_game("[src] deactivated due to lack of power at [AREACOORD(src)]", INVESTIGATE_GRAVITY)
	update_appearance()

/obj/machinery/power/ship_gravity/update_overlays()
	. = ..()
	if(active)
		SSvis_overlays.add_vis_overlay(src, icon, "charge_active", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "charge_active", layer, EMISSIVE_PLANE, dir)
		. += "charge_active"
	if(charge < 5)
		SSvis_overlays.add_vis_overlay(src, icon, "charge_[charge]", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "charge_[charge]", layer, EMISSIVE_PLANE, dir)
		. += "charge_[charge]"

/obj/machinery/power/ship_gravity/examine(mob/user)
	. = ..()
	if(anchored)
		. += span_info("It's secured to the floor, you can unsecure it with a <b>wrench</b>.")
	else
		. += span_info("It's currently unsecured, you can secure it with a <b>wrench</b>.")
	if(in_range(user, src) || isobserver(user))
		if(!charging && !charge)
			. += span_info("Its status display is currently turned off.")
		else
			. += span_info("Its status display reads: Current charge at <b>[charge*20]%</b>.")

/obj/machinery/power/ship_gravity/screwdriver_act(mob/living/user, obj/item/I)
	..()
	if(charging || charge)
		to_chat(user, span_notice("You cannot open the maintenance panel on [src] while it is active!"))
		return TRUE
	default_deconstruction_screwdriver(user, "shipgrav_o", "shipgrav", I)
	return TRUE

/obj/machinery/power/ship_gravity/wrench_act(mob/living/user, obj/item/I)
	. =..()
	if(active)
		to_chat(user, span_notice("You cannot unsecure [src] while it is active!"))
		return TRUE
	default_unfasten_wrench(user, I)
	return TRUE

/obj/machinery/power/ship_gravity/crowbar_act(mob/living/user, obj/item/I)
	. = ..()
	default_deconstruction_crowbar(I)
	return TRUE

/obj/machinery/power/ship_gravity/default_unfasten_wrench(mob/user, obj/item/I, time = 20)
	. = ..()
	if(. == SUCCESSFUL_UNFASTEN)
		if(anchored)
			connect_to_network()
		else
			disconnect_from_network()
			charging = FALSE
			set_state(FALSE)

/obj/machinery/power/ship_gravity/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	. = ..()
	port.gravgen_list |= WEAKREF(src)

/obj/machinery/power/ship_gravity/interact(mob/user)
	if(!powernet && active_power_usage)
		to_chat(user, span_notice("[src] isn't connected to a wire!"))
		return
	if(panel_open)
		return
	charging = !charging
	play_click_sound("switch")
	user.visible_message(span_warning("[user] flips [src]'s power [charging ? "on" : "off"]!"), \
		span_info("You flip [src]'s power lever, turning it [charging ? "on" : "off"]"), \
		span_hear("You hear a heavy lever being pulled."))
	update_appearance()

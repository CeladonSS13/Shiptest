// Ship weapons control console
/obj/machinery/computer/ship_weapons
	name = "weapons control console"
	desc = "A console for controlling ship-mounted weapons systems."
	icon_screen = "ratvar3"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_RED
	circuit = /obj/item/circuitboard/computer/ship_weapons

	/// Connected weapon turrets
	var/list/connected_weapons = list()
	/// Current ship reference
	var/datum/overmap/ship/controlled/current_ship
	/// Target coordinates
	var/target_x = 0
	var/target_y = 0
	/// Is targeting mode active
	var/targeting_mode = FALSE

/obj/machinery/computer/ship_weapons/Initialize()
	. = ..()
	find_connected_weapons()

/obj/machinery/computer/ship_weapons/Destroy()
	if(current_ship)
		current_ship.weapon_consoles -= src
	return ..()

/obj/machinery/computer/ship_weapons/proc/find_connected_weapons()
	connected_weapons.Cut()
	var/obj/docking_port/mobile/port = SSshuttle.get_containing_shuttle(src)
	if(!port)
		return

	for(var/obj/machinery/porta_turret/ship/weapon_system/weapon in port.shuttle_areas)
		connected_weapons += weapon
		weapon.linked_console = src

/obj/machinery/computer/ship_weapons/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	if(current_ship && current_ship != port.current_ship)
		current_ship.weapon_consoles -= src
	current_ship = port.current_ship
	current_ship.weapon_consoles |= src
	find_connected_weapons()

/obj/machinery/computer/ship_weapons/ui_interact(mob/user, datum/tgui/ui)
	if(!current_ship)
		var/obj/docking_port/mobile/port = SSshuttle.get_containing_shuttle(src)
		if(port?.current_ship)
			current_ship = port.current_ship
		else
			return

	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ShipWeapons", name)
		ui.open()

/obj/machinery/computer/ship_weapons/ui_data(mob/user)
	. = list()
	.["ship_x"] = current_ship?.x || 0
	.["ship_y"] = current_ship?.y || 0
	.["target_x"] = target_x
	.["target_y"] = target_y
	.["targeting_mode"] = targeting_mode
	.["weapons"] = list()

	for(var/obj/machinery/porta_turret/ship/weapon_system/weapon in connected_weapons)
		if(!weapon || QDELETED(weapon))
			connected_weapons -= weapon
			continue

		var/list/weapon_data = list(
			"name" = weapon.name,
			"type" = weapon.weapon_type,
			"range" = weapon.weapon_range,
			"state" = weapon.weapon_state,
			"ammo" = weapon.ammo_count,
			"max_ammo" = weapon.max_ammo,
			"ref" = REF(weapon)
		)
		.["weapons"] += list(weapon_data)

	.["nearby_targets"] = list()
	if(current_ship && current_ship.current_overmap)
		// Get all objects in current system
		for(var/datum/overmap/target in current_ship.current_overmap.overmap_objects)
			if(target == current_ship || target.docked_to == current_ship)
				continue
			// Only show targets within sensor range
			var/distance = sqrt((current_ship.x - target.x)**2 + (current_ship.y - target.y)**2)
			if(distance > current_ship.sensor_range)
				continue
			
			var/hull_percent = 100
			if(istype(target, /datum/overmap/ship/controlled))
				var/datum/overmap/ship/controlled/target_ship = target
				hull_percent = round((target_ship.hull_integrity / target_ship.max_hull_integrity) * 100)
			
			var/list/target_data = list(
				"name" = target.name,
				"x" = target.x,
				"y" = target.y,
				"distance" = distance,
				"hull_integrity" = hull_percent
			)
			.["nearby_targets"] += list(target_data)

/obj/machinery/computer/ship_weapons/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	. = TRUE

	switch(action)
		if("set_target")
			target_x = clamp(text2num(params["x"]), 1, 30)
			target_y = clamp(text2num(params["y"]), 1, 30)

		if("toggle_targeting")
			targeting_mode = !targeting_mode

		if("charge_weapon")
			var/obj/machinery/porta_turret/ship/weapon_system/weapon = locate(params["weapon_ref"]) in connected_weapons
			if(weapon)
				weapon.start_charging()

		if("fire_weapon")
			var/obj/machinery/porta_turret/ship/weapon_system/weapon = locate(params["weapon_ref"]) in connected_weapons
			if(weapon && target_x && target_y)
				var/distance = sqrt((current_ship.x - target_x)**2 + (current_ship.y - target_y)**2)
				if(distance > weapon.weapon_range)
					say("Наведение невозможно, цель за пределами досягаемости орудия [weapon.name] (дальность: [weapon.weapon_range], расстояние: [round(distance, 0.1)])")
				else
					weapon.fire_at_target(target_x, target_y)

		if("fire_all")
			if(target_x && target_y)
				var/distance = sqrt((current_ship.x - target_x)**2 + (current_ship.y - target_y)**2)
				var/fired_count = 0
				for(var/obj/machinery/porta_turret/ship/weapon_system/weapon in connected_weapons)
					if(weapon.can_fire() && distance <= weapon.weapon_range)
						weapon.fire_at_target(target_x, target_y)
						fired_count++
				if(fired_count == 0)
					say("Наведение невозможно, все орудия за пределами досягаемости (расстояние: [round(distance, 0.1)])")
				else
					say("Выстрел произведен [fired_count] орудиями")

		if("auto_target")
			var/target_name = params["target_name"]
			if(current_ship && current_ship.current_overmap)
				for(var/datum/overmap/target in current_ship.current_overmap.overmap_objects)
					if(target.name == target_name && target != current_ship)
						target_x = target.x
						target_y = target.y
						break
		
		if("refresh_targets")
			// Just update UI data
			. = TRUE

/obj/machinery/computer/ship_weapons/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/multitool))
		var/obj/item/multitool/MT = I
		if(MT.buffer && istype(MT.buffer, /obj/machinery/ammo_loader))
			var/obj/machinery/ammo_loader/loader = MT.buffer
			if(loader.connected_weapon)
				connected_weapons |= loader.connected_weapon
				loader.connected_weapon.linked_console = src
				to_chat(user, span_notice("Added [loader.connected_weapon.name] to weapons console."))
				MT.buffer = null
			else
				to_chat(user, span_warning("Ammo loader has no connected weapon."))
		else
			to_chat(user, span_notice("No ammo loader in multitool buffer."))
		return
	return ..()

// Circuit board for weapons console
/obj/item/circuitboard/computer/ship_weapons
	name = "Ship Weapons Console"
	build_path = /obj/machinery/computer/ship_weapons

/obj/effect/temp_visual/boarding_alert
	name = "phasing energy"
	icon = 'mod_celadon/_storge_icons/icons/machinery/boarding.dmi'
	icon_state = "teleporting_alert"
	randomdir = 0
	duration = 55

/obj/effect/temp_visual/boarding_out
	name = "phasing person"
	icon = 'mod_celadon/_storge_icons/icons/machinery/boarding.dmi'
	icon_state = "teleporting_out"
	randomdir = 0
	duration = 8

/obj/effect/temp_visual/boarding_in
	name = "phasing person"
	icon = 'mod_celadon/_storge_icons/icons/machinery/boarding.dmi'
	icon_state = "teleporting_in"
	randomdir = 0
	duration = 8

/obj/item/circuitboard/machine/boarding_pad
	name = "phasic boarding telepad (Machine Board)"
	icon_state = "security"
	build_path = /obj/machinery/boarding_pad
	req_components = list(/obj/item/stock_parts/capacitor = 2, /obj/item/stack/ore/bluespace_crystal = 5)

/obj/machinery/boarding_pad // mantis B or nothing
	name = "phasic boarding telepad"
	desc = "Устройство для абордажа вражеских шаттлов, один человек на пад. Инструкции? Запросто! Подберитесь к шаттлу в упор, встаньте на телепортер и инициируйте транслокацию."
	icon = 'mod_celadon/_storge_icons/icons/machinery/boarding.dmi'
	icon_state = "boarding_pad"
	circuit = /obj/item/circuitboard/machine/boarding_pad
	var/datum/overmap/ship/controlled/current_ship
	var/obj/effect/overlay/vis/self_overlay
	var/cooldown = 120
	var/datum/map_template/shuttle/shuttletype

/obj/machinery/boarding_pad/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	current_ship = port.current_ship
	shuttletype = current_ship.source_template

/obj/machinery/boarding_pad/Initialize()
	. = ..()
	if(current_ship)
		self_overlay = SSvis_overlays.add_vis_overlay(current_ship.token, icon, "teleportership_alert", layer, plane, dir, unique = TRUE)
	icon_state = "boarding_pad_off"

/obj/machinery/boarding_pad/Destroy()
	if(current_ship)
		SSvis_overlays.remove_vis_overlay(current_ship.token, self_overlay)
	return ..()

/obj/machinery/boarding_pad/process()
	if(cooldown <= 0)
		if(icon_state == "boarding_pad_off")
			icon_state = "boarding_pad"
			playsound(src, 'sound/weapons/flash.ogg', 40, TRUE, frequency = 1.5)
			visible_message(span_notice("Телепортер готов к использованию!"))
		return
	else
		cooldown -= 2

/obj/machinery/boarding_pad/emp_act()
	cooldown = rand(60, 120)
	icon_state = "boarding_pad_off"

/obj/machinery/boarding_pad/attack_hand(mob/user)
	var/mob/living/carbon/M = locate(/mob/living/carbon) in loc // if mobs more than 1, picks random to teleport
	if(!current_ship)
		visible_message(span_warning("Пад не находится на шаттле."))
		return
	if(shuttletype.parent_type == /datum/map_template/shuttle/subshuttles || null)
		visible_message(span_warning("Производитель запрещает использование абордажного телепада на субшаттлах, установите его на материнском корабле."))
		return
	if(cooldown > 0)
		visible_message(span_warning("Устройство заряжается, подождите [cooldown] секунд."))
		return
	if(!M || M != user)
		visible_message(span_warning("Для активации телепортера, оператору необходимо встать на него."))
		return

	var/list/objects = current_ship.get_nearby_overmap_objects()
	var/list/ships = list()
	for(var/datum/overmap/ship/controlled/ship in objects)
		ships += ship.shuttle_port
	for(var/datum/overmap/object in objects)
		for(var/datum/overmap/ship/controlled/ship in object.contents)
			ships += ship.shuttle_port

	if(ships.len == 0)
		visible_message(span_warning("Отсутствуют корабли поблизости."))
		return
	var/obj/docking_port/mobile/selected = tgui_input_list(user, "Выберите шаттл для телепортации", "Меню транслокации", ships)

	var/area/target = tgui_input_list(user, "Выберите зону шаттла для телепортации", "Меню транслокации", selected.shuttle_areas)
	if(target)
		var/list/places = list()
		for(var/turf/open/T in target.contents)
			places += T
			for(var/obj/machinery/D in T.contents)
				if(D.density == TRUE)
					places -= T
					break
		if(places.len == 0)
			visible_message(span_warning("В данной зоне отсутствует свободное место, выберите другую область."))
			return
		balloon_alert(M, "Инициализация, не двигайтесь...")
		playsound(src, 'sound/weapons/flash.ogg', 40, TRUE, frequency = 0.5)
		var/turf/teleport_location = pick(places)
		new /obj/effect/temp_visual/boarding_alert(teleport_location)

		if(do_after(M, 5 SECONDS, target = src))
			new /obj/effect/temp_visual/boarding_out(get_turf(src))
			var/obj/effect/temp_visual/boarding_in/T = new /obj/effect/temp_visual/boarding_in(teleport_location)
			playsound(src, 'mod_celadon/_storge_sounds/sound/boarding_pad.ogg', 60, TRUE, frequency = 1)
			playsound(T, 'mod_celadon/_storge_sounds/sound/boarding_pad.ogg', 60, TRUE, frequency = 1)
			M.invisibility = INVISIBILITY_INVINISMIN // making boarder 1sec invisible for showing animation

			if(do_after(M, 1 SECONDS, target = src))
				M.forceMove(teleport_location)

			cooldown = 100

		icon_state = "boarding_pad_off"
		cooldown += 20 // you may fake teleport and cooldown will be only 20 sec

	M.invisibility = initial(M.invisibility)
	M.add_to_all_human_data_huds()

/obj/machinery/computer/helm/multitool_act(mob/living/user, obj/item/I)
	if(!Adjacent(user))
		return

	to_chat(user, span_warning("You begin to manually override the local database..."))
	if(!do_after(user, 2 SECONDS, src))
		return COMPONENT_BLOCK_TOOL_ATTACK

	priority_announce("Illegal access to local ship database detected.", sender_override="[current_ship.name]", zlevel=virtual_z())
	if(!do_after(user, 10 SECONDS, src))
		return COMPONENT_BLOCK_TOOL_ATTACK

	say("Warning, database corruption present, resetting local database state.")
	playsound(src, 'sound/effects/fuse.ogg')
	current_ship.helm_locked = FALSE
	return COMPONENT_BLOCK_TOOL_ATTACK

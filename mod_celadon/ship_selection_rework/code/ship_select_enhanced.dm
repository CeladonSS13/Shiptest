// Расширение функциональности выбора кораблей с превью фракций

// Добавляем состояние для превью фракций
/datum/ship_select
	var/current_preview_faction
	var/list/preview_cache = list()  // кэш превью фракций

// Расширяем ui_act для обработки faction_preview
/datum/ship_select/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	// Сначала обрабатываем наши действия
	if(action == "faction_preview")
		var/faction_name = lowertext(params["faction"])

		if(!faction_name)
			return TRUE

		// Кэшируем превью если еще нет с защитой от ошибок
		if(!preview_cache[faction_name])
			try
				preview_cache[faction_name] = generate_faction_outfit_previews(faction_name)
			catch
				preview_cache[faction_name] = list()
				log_runtime("Faction preview generation failed for [faction_name]")

		current_preview_faction = faction_name

		// Обновляем UI
		SStgui.update_uis(src)
		return TRUE

	// Обработка открытия ссылок на вики
	if(action == "open_wiki")
		var/wiki_url = params["url"]
		if(wiki_url)
			usr << link(wiki_url)
		return TRUE

	// Если не наши действия, передаем базовому ui_act
	. = ..()
	if(.)
		return
	if(!isnewplayer(usr))
		return
	var/mob/dead/new_player/spawnee = usr

	switch(action)
		if("join")
			var/datum/overmap/ship/controlled/target = locate(params["ship"]) in SSovermap.controlled_ships
			if(!target)
				to_chat(spawnee, span_danger("Unable to locate ship. Please contact admins!"))
				spawnee.new_player_panel()
				return
			if(!target.is_join_option())
				to_chat(spawnee, span_danger("This ship is not currently accepting new players!"))
				spawnee.new_player_panel()
				return

			// Проверяем дублирование имен при входе на корабль
			if(!spawnee.client.prefs.randomise[RANDOM_NAME])
				var/name = spawnee.client.prefs.real_name
				if(GLOB.real_names_joined.Find(name))
					to_chat(spawnee, span_warning("Someone has spawned with this name already."))
					spawnee.new_player_panel()
					return
			var/did_application = FALSE
			if(target.join_mode == SHIP_JOIN_MODE_APPLY)
				var/datum/ship_application/current_application = target.get_application(spawnee)
				if(isnull(current_application))
					var/datum/ship_application/app = new(spawnee, target)
					if(app.get_user_response())
						to_chat(spawnee, span_notice("Ship application sent. You will be notified if the application is accepted."))
					else
						to_chat(spawnee, span_notice("Application cancelled, or there was an error sending the application."))
					return
				switch(current_application.status)
					if(SHIP_APPLICATION_ACCEPTED)
						to_chat(spawnee, span_notice("Your ship application was accepted, continuing..."))
					if(SHIP_APPLICATION_PENDING)
						alert(spawnee, "You already have a pending application for this ship!")
						return
					if(SHIP_APPLICATION_DENIED)
						alert(spawnee, "You can't join this ship, as a previous application was denied!")
						return
				did_application = TRUE

			if(target.join_mode == SHIP_JOIN_MODE_CLOSED || (target.join_mode == SHIP_JOIN_MODE_APPLY && !did_application))
				to_chat(spawnee, span_warning("You cannot join this ship anymore, as its join mode has changed!"))
				return

			ui.close()
			var/datum/job/selected_job = locate(params["job"]) in target.job_slots
			//boots you out if you're banned from officer roles
			if(selected_job.officer && is_banned_from(spawnee.ckey, "Ship Command"))
				to_chat(spawnee, span_danger("You are banned from Officer roles!"))
				spawnee.new_player_panel()
				ui.close()
				return

			// Attempts the spawn itself. This checks for playtime requirements.
			if(!spawnee.AttemptLateSpawn(selected_job, target))
				to_chat(spawnee, span_danger("Unable to spawn on ship!"))
				spawnee.new_player_panel()

		if("buy")
			if(is_banned_from(spawnee.ckey, "Ship Purchasing"))
				to_chat(spawnee, span_danger("You are banned from purchasing ships!"))
				spawnee.new_player_panel()
				ui.close()
				return

			var/datum/map_template/shuttle/template = SSmapping.ship_purchase_list[params["name"]]
			// Проверяем дублирование имен в самом начале с защитой от null prefs
			var/name = "Unknown"
			if(spawnee?.client?.prefs)
				name = spawnee.client.prefs.real_name
			if(GLOB.real_names_joined.Find(name))
				to_chat(spawnee, span_warning("Someone has spawned with this name already."))
				return
			if(SSovermap.ship_spawning)
				to_chat(spawnee, span_danger("A ship is currently spawning. Try again in a little while."))
				return
			if(!SSovermap.player_ship_spawn_allowed())
				to_chat(spawnee, span_danger("No more ships may be spawned at this time!"))
				return
			if(!template.enabled)
				to_chat(spawnee, span_danger("This ship is not currently available for purchase!"))
				return
			if(!template.has_ship_spawn_playtime(spawnee.client))
				to_chat(spawnee, span_danger("You do not have enough playtime to spawn this ship!"))
				return

			var/num_ships_with_template = 0
			for(var/datum/overmap/ship/controlled/Ship as anything in SSovermap.controlled_ships)
				if(template == Ship.source_template)
					num_ships_with_template += 1
			if(num_ships_with_template >= template.limit)
				to_chat(spawnee, span_danger("There are already [num_ships_with_template] ships of this type; you cannot spawn more!"))
				return

			ui.close()

			var/ship_loc
			var/datum/overmap_star_system/selected_system //the star system we want to spawn in

			if(length(SSovermap.outposts) > 1)
				var/datum/overmap/outpost/temp_loc = input(spawnee, "Select outpost to spawn at") as null|anything in SSovermap.outposts
				if(!temp_loc)
					return
				selected_system = temp_loc.current_overmap
				ship_loc = temp_loc
			else
				ship_loc = SSovermap.outposts[1]
				selected_system = SSovermap.tracked_star_systems[1]

			if(!selected_system)
				CRASH("Ship attemped to be bought at spawn menu, but spawning outpost was not selected! This is bad!")

			to_chat(spawnee, "<span class='danger'>Your [template.name] is being prepared. Please be patient!</span>")
			var/datum/overmap/ship/controlled/target = SSovermap.spawn_ship_at_start(template, ship_loc, selected_system)

			if(!target?.shuttle_port)
				to_chat(spawnee, span_danger("There was an error loading the ship. Please contact admins!"))
				spawnee.new_player_panel()
				return
			SSblackbox.record_feedback("tally", "ship_purchased", 1, template.name)
			SSblackbox.record_feedback("tally", "faction_ship_purchased", 1, template.faction.name)
			// Пытаемся заспавнить как первую должность в списке (обычно капитан)
			// Проверки времени игры отключены, чтобы игрок мог присоединиться к своему кораблю
			if(!spawnee.AttemptLateSpawn(target.job_slots[1], target, FALSE))
				to_chat(spawnee, span_danger("Ship spawned, but you were unable to be spawned. You can likely try to spawn in the ship through joining normally, but if not, please contact an admin."))
				spawnee.new_player_panel()

// Расширение ui_data для передачи превью фракций
/datum/ship_select/ui_data(mob/user)
	var/list/data = ..() || list()

	// Передаем превью фракции если есть
	if(current_preview_faction && preview_cache[current_preview_faction])
		data["faction_preview"] = list(
			"faction" = current_preview_faction,
			"previews" = preview_cache[current_preview_faction]
		)

	return data

// Расширение ui_static_data для передачи информации о фракциях
/datum/ship_select/ui_static_data(mob/user)
	var/list/data = ..() || list()

	// Добавляем информацию о фракциях
	data["faction_info"] = get_all_faction_info_data()

	return data

// Очистка превью при закрытии окна
/datum/ship_select/ui_close(mob/user)
	// Очищаем превью при закрытии окна
	current_preview_faction = null
	. = ..()

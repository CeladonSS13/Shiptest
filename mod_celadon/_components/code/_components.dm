// Изменена система оповещений с файла => Shiptest\code\controllers\subsystem\ticker.dm

/datum/controller/subsystem/ticker/fire()
	switch(current_state)
		if(GAME_STATE_STARTUP)
			/*if(Master.initializations_finished_with_no_players_logged_in)		WS Edit - Countdown after init
				timeLeft = (CONFIG_GET(number/lobby_countdown) * 10)		WS Edit - Countdown after init */
			for(var/client/C in GLOB.clients)
				window_flash(C, ignorepref = TRUE) //let them know lobby has opened up.
			to_chat(world, span_boldnotice("Добро пожаловать на [station_name()]!"))
			if(CONFIG_GET(string/servername) == "\[RU] Celadon Shiptest: Alpha")
				send2chat("<@&1100202952943218738>, запущен новый раунд на сервере: **" + CONFIG_GET(string/servername) + "**!", CONFIG_GET(string/chat_announce_new_game))
			if(CONFIG_GET(string/servername) == "\[RU] Celadon Shiptest: Beta")
				send2chat("<@&1226515994332102687>, запущен новый раунд на сервере: **" + CONFIG_GET(string/servername) + "**!", CONFIG_GET(string/chat_announce_new_game))
			SSredbot.send_discord_message("ooc", "**Новый раунд скоро начнётся.**")
			current_state = GAME_STATE_PREGAME
			//Everyone who wants to be an observer is now spawned
			create_observers()
			fire()
		if(GAME_STATE_PREGAME)
				//lobby stats for statpanels
			if(isnull(timeLeft))
				timeLeft = (CONFIG_GET(number/lobby_countdown) * 10)		//WS Edit - Countdown after init
			totalPlayers = LAZYLEN(GLOB.new_player_list)
			totalPlayersReady = 0
			for(var/i in GLOB.new_player_list)
				var/mob/dead/new_player/player = i
				if(player.ready == PLAYER_READY_TO_PLAY)
					++totalPlayersReady

			if(start_immediately)
				timeLeft = 0

			//countdown
			if(timeLeft < 0)
				return
			timeLeft -= wait

			if(timeLeft <= 300 && !tipped)
				send_tip_of_the_round()
				tipped = TRUE

			if(timeLeft <= 0)
				current_state = GAME_STATE_SETTING_UP
				Master.SetRunLevel(RUNLEVEL_SETUP)
				if(start_immediately)
					fire()

		if(GAME_STATE_SETTING_UP)
			if(!setup())
				//setup failed
				current_state = GAME_STATE_STARTUP
				timeLeft = (CONFIG_GET(number/lobby_countdown)) * 10		//WS Edit - Countdown after init
				timeLeft = null
				Master.SetRunLevel(RUNLEVEL_LOBBY)

		if(GAME_STATE_PLAYING)
			mode.process(wait * 0.1)
			check_queue()

			if(!roundend_check_paused && mode.check_finished(force_ending) || force_ending)
				current_state = GAME_STATE_FINISHED
				toggle_ooc(TRUE) // Turn it on
				toggle_dooc(TRUE)
				declare_completion(force_ending)
				Master.SetRunLevel(RUNLEVEL_POSTGAME)

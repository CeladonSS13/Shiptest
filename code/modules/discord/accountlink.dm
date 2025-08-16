// IF you have linked your account, this will trigger a verify of the user
/client/verb/verify_in_discord()
	set category = "Special Verbs"
	set name = "Verify Discord Account"
	set desc = "Verify your discord account with your BYOND account"

	// Safety checks
	if(!CONFIG_GET(flag/sql_enabled))
		to_chat(src, span_warning("This feature requires the SQL backend to be running."))
		return
	if(!SSdiscord && !SSdiscord.reverify_cache)
		to_chat(src, span_warning("Wait for the Discord subsystem to finish initialising"))
		return
	// [CELADON-ADD] - Проверка на то, что система верификации включена
	if(CONFIG_GET(flag/DiscordVerify))
		if(checkDiscordVerify(src.ckey))
			to_chat(usr, span_danger("Ваш аккаунт уже привязан к DISCORD. Больше не жми на эту кнопку, пожалуйста."))
			return
	// [/CELADON-ADD]
	var/message = ""
	// Simple sanity check to prevent a user doing this too often
	var/cached_one_time_token = SSdiscord.reverify_cache[usr.ckey]
	if(cached_one_time_token && cached_one_time_token != "")
		// [CELADON-EDIT] - DISCORD VERIFY
		// message = "You already generated your one time token, it is [cached_one_time_token], if you need a new one, you will have to wait until the round ends, or switch to another server, try verifying yourself in discord by using the command <span class=\"warning\">\"/verify one-time-token:[cached_one_time_token]\"</span>"
		message = "Вы уже сгенерировали свой одноразовый токен. Если вам нужен новый токен, то вам придётся подождать до конца раунда или переключиться на другой сервер.\nВы можете верифицировать себя в Discord, используя команду: \n /verify [cached_one_time_token] \n\n Celadon Discord: https://discord.com/invite/rxsggTJzY3"
		// [/CELADON-EDIT]

	else
		// Will generate one if an expired one doesn't exist already, otherwise will grab existing token
		var/one_time_token = SSdiscord.get_or_generate_one_time_token_for_ckey(ckey)
		SSdiscord.reverify_cache[usr.ckey] = one_time_token
		// [CELADON-EDIT] - DISCORD VERIFY
		// message = "Your one time token is: [one_time_token], Assuming you have the required living minutes in game, you can now verify yourself in discord by using the command <span class=\"warning\">\"!verify [one_time_token]\"</span>"
		message = "Вы можете верифицировать себя в Discord, используя команду: \n /verify [one_time_token] \n\n Celadon Discord: https://discord.com/invite/rxsggTJzY3"
		// [/CELADON-EDIT]

	//Now give them a browse window so they can't miss whatever we told them
	var/datum/browser/window = new/datum/browser(usr, "discordverification", "Discord verification")
	window.set_content("<span>[message]</span>")
	window.open()



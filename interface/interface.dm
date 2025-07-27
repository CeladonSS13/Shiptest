//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/* [CELADON-EDIT] CELADON-INTERFACE
/client/verb/wiki(query as text)
	set name = "wiki"
	set desc = "Type what you want to know about.  This will open the wiki in your web browser. Type nothing to go to the main page."
	set hidden = TRUE
	var/wikiurl = CONFIG_GET(string/wikiurl)
	if(wikiurl)
		if(query)
			var/output = "[wikiurl]?title=Special%3ASearch&profile=default&search=[query]"
			src << link(output)
		else if (query != null)
			src << link(wikiurl)
	else
		to_chat(src, span_danger("The wiki URL is not set in the server configuration."))
	return
*/

/client/verb/lore()
	set name = "lore"
	set desc = "View the lore landing page."
	set hidden = TRUE
	var/loreurl = CONFIG_GET(string/loreurl)
	if(loreurl)
		if(alert("This will open the lore page in your browser. Are you sure?",,"Yes","No")!="Yes")
			return
		src << link(loreurl)
	else
		to_chat(src, span_danger("The lore page URL is not set in the server configuration."))
	return

/* [CELADON-EDIT] - CELADON-INTERFACE Свои конфигурации интерфейса
/client/verb/rules()
	set name = "rules"
	set desc = "Show Server Rules."
	set hidden = TRUE
	var/rulesurl = CONFIG_GET(string/rulesurl)
	if(rulesurl)
		if(alert("This will open the rules in your browser. Are you sure?",,"Yes","No")!="Yes")
			return
		src << link(rulesurl)
	else
		to_chat(src, span_danger("The rules URL is not set in the server configuration."))
	return

/client/verb/github()
	set name = "github"
	set desc = "Visit Github"
	set hidden = TRUE
	var/githuburl = CONFIG_GET(string/githuburl)
	if(githuburl)
		if(alert("This will open the Github repository in your browser. Are you sure?",,"Yes","No")!="Yes")
			return
		src << link(githuburl)
	else
		to_chat(src, span_danger("The Github URL is not set in the server configuration."))
	return

/client/verb/reportissue()
	set name = "report-issue"
	set desc = "Report an issue"
	set hidden = TRUE
	var/githuburl = CONFIG_GET(string/githuburl)
	if(githuburl)
		var/message = "This will open the Github issue reporter in your browser. Are you sure?"
		if(GLOB.revdata.testmerge.len)
			message += "<br>The following experimental changes are active and are probably the cause of any new or sudden issues you may experience. If possible, please try to find a specific thread for your issue instead of posting to the general issue tracker:<br>"
			message += GLOB.revdata.GetTestMergeInfo(FALSE)
		// We still use tgalert here because some people were concerned that if someone wanted to report that tgui wasn't working
		// then the report issue button being tgui-based would be problematic.
		if(tgalert(src, message, "Report Issue","Yes","No")!="Yes")
			return
		var/static/issue_template = file2text(".github/ISSUE_TEMPLATE.md")
		var/servername = CONFIG_GET(string/servername)
		var/url_params = "Reporting client version: [byond_version].[byond_build]\n\n[issue_template]"
		if(GLOB.round_id || servername)
			url_params = "Issue reported from [GLOB.round_id ? " Round ID: [GLOB.round_id][servername ? " ([servername])" : ""]" : servername]\n\n[url_params]"
		DIRECT_OUTPUT(src, link("[githuburl]/issues/new?body=[url_encode(url_params)]"))
	else
		to_chat(src, span_danger("The Github URL is not set in the server configuration."))
	return

/client/verb/joindiscord()
	set name = "discord"
	set desc = "Join Discord Server"
	set hidden = 1
	if(CONFIG_GET(string/discordurl))
		var/message = "This will open the Discord server in your browser. Are you sure?"
		if(alert(src, message, "Join Discord","Yes","No")=="No")
			return
		src << link(CONFIG_GET(string/discordurl))
	else
		to_chat(src, span_danger("The Discord URL is not set in the server configuration."))
	return
*/

// [CELADON] - CELADON-INTERFACE: Свои конфигурации интерфейса
/client/verb/wiki(query as text)
	set name = "wiki"
	set desc = "Напиши то, что хочешь узнать. Можешь ничего не писать, тогда откроется главная страница."
	set hidden = TRUE

	var/wikiurl = CONFIG_GET(string/wikiurl)
	if(!wikiurl)
		to_chat(src, span_danger("Cсылка на Wiki не установлена в конфигурацию сервера. Пожалуйста, оповестите об этом хоста."))
		return

	var/output = wikiurl
	if(query)
		wikiurl += "?title=Special%3ASearch&profile=default&search=[query]"

	DIRECT_OUTPUT(src, link(output))

/client/verb/rules()
	set name = "rules"
	set desc = "Показать Правила Сервера."
	set hidden = TRUE

	var/rulesurl = CONFIG_GET(string/rulesurl)
	if(!rulesurl)
		to_chat(src, span_danger("Cсылка на Правила не установлена в конфигурацию сервера. Пожалуйста, оповестите об этом хоста."))
		return

	if(tgui_alert(usr, "Перейти на страницу правил, это откроет браузер. Вы уверены?", "Правила", list("Да", "Нет")) != "Да")
		return

	DIRECT_OUTPUT(src, link(rulesurl))

/client/verb/github()
	set name = "github"
	set desc = "Посетить Github проекта"
	set hidden = TRUE

	var/githuburl = CONFIG_GET(string/githuburl)
	if(!githuburl)
		to_chat(src, span_danger("Cсылка на Github не установлена в конфигурацию сервера. Пожалуйста, оповестите об этом хоста."))
		return

	if(tgui_alert(usr, "Перейти на страницу нашего репозитория?", "GitHub", list("Да", "Нет")) != "Да")
		return

	DIRECT_OUTPUT(src, link(githuburl))

/client/verb/reportissue()
	set name = "report-issue"
	set desc = "Сообщить о баге или проблеме."

	var/githuburl = CONFIG_GET(string/githuburl)
	if(!githuburl)
		to_chat(src, span_danger("Cсылка на Github не установлена в конфигурацию сервера. Пожалуйста, оповестите об этом хоста."))
		return

	var/testmerge_data = GLOB.revdata.testmerge
	var/has_testmerge_data = (length(testmerge_data) != 0)

	var/message = "Нашли баг? Сообщите о нём нам! Это откроет вам страницу создания Issue на Github, открыть?"
	if(has_testmerge_data)
		message += "\n Следующие экспериментальные изменения активны: \n"
		message += GLOB.revdata.GetTestMergeInfo(FALSE)

	if(tgalert(usr, message, "Сообщить о баге", "Да", "Нет") != "Да")
		return

	var/base_link = githuburl + "/issues/new?template=bug_report_form.yml"
	var/list/concatable = list(base_link)
	var/servername = CONFIG_GET(string/servername)
	var/client_version = "Версия клиента: [byond_version].[byond_build]"

	// the way it works is that we use the ID's that are baked into the template YML and replace them with values that we can collect in game.
	if(GLOB.round_id)
		concatable += ("&additional-info=" + "[client_version]\nRound ID: [GLOB.round_id][servername ? " ([servername])" : ""]")
	else
		concatable += ("&additional-info=" + client_version)

	// Insert testmerges
	if(has_testmerge_data)
		var/list/all_tms = list()
		for(var/entry in testmerge_data)
			var/datum/tgs_revision_information/test_merge/tm = entry
			all_tms += "- \[[tm.title]\]([githuburl]/pull/[tm.number])"
		var/all_tms_joined = jointext(all_tms, "\n")

		concatable += ("&additional-info=" + "[client_version]\nТестовые изменения:\n[url_encode(all_tms_joined)]")

	DIRECT_OUTPUT(src, link(jointext(concatable, "")))

/client/verb/joindiscord()
	set name = "discord"
	set desc = "Перейти на Discord сервер"
	set hidden = TRUE

	var/discordurl = CONFIG_GET(string/discordurl)
	if(!discordurl)
		to_chat(src, span_danger("Cсылка на Discord не установлена в конфигурацию сервера. Пожалуйста, оповестите об этом хоста."))
		return

	if(tgui_alert(usr, "Перейти на наш Discord сервер, это откроет браузер. Вы уверены?", "Перейти на Discord сервер", list("Да", "Нет")) != "Да")
		return

	DIRECT_OUTPUT(src, link(discordurl))
// [/CELADON-EDIT]

/client/verb/changelog()
	set name = "Changelog"
	set category = "OOC"
	if(!GLOB.changelog_tgui)
		GLOB.changelog_tgui = new /datum/changelog()

	GLOB.changelog_tgui.ui_interact(mob)
	if(prefs.lastchangelog != GLOB.changelog_hash)
		prefs.lastchangelog = GLOB.changelog_hash
		prefs.save_preferences()
		winset(src, "infowindow.changelog", "font-style=;")

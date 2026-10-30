/client
	var/discord

/proc/checkDiscord(ckey)
	if(!CONFIG_GET(flag/sql_enabled))
		to_chat(usr, span_warning("This feature requires the SQL backend to be running."))
		return

	if(!SSdbcore.Connect())
		to_chat(usr, span_danger("База данных не подключена."))
		return

	var/datum/DBQuery/q = SSdbcore.NewQuery(
		"SELECT discord_id FROM discord_links WHERE ckey = :ckey AND valid = 1 LIMIT 1",
		list("ckey" = ckey))

	if(!q.Execute())
		qdel(q)
		return

	var/id = "<@???>"
	if(q.NextRow())
		id = "<@" +  num2text(q.item[1], 20) + ">"
	qdel(q)
	return id

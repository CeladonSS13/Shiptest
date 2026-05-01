/client/verb/update_ping(time as num)
	set instant = TRUE
	set name = ".update_ping"
	var/ping = pingfromtime(time)
	lastping = ping
	if (!avgping)
		avgping = ping
	else
		avgping = MC_AVERAGE_SLOW(avgping, ping)

/client/proc/pingfromtime(time)
	return ((world.time+world.tick_lag*TICK_USAGE_REAL/100)-time)*100

/client/verb/display_ping(time as num)
	set instant = TRUE
	set name = ".display_ping"
	to_chat(src, span_notice("Round trip ping took [round(pingfromtime(time),1)]ms"))

/client/verb/ping()
	set name = "Ping"
	// [CELADON-REMOVE] - CELADON_QOL - Очистка вкладки ООС, перенос части в Special Verbs
	/*
	set category = "OOC"
	*/
	// [/CELADON-REMOVE]
	winset(src, null, "command=.display_ping+[world.time+world.tick_lag*TICK_USAGE_REAL/100]")

/datum/ai_controller/proc/check_should_sleep()
	var/virt_z = pawn.virtual_z()
	var/players_on_virtual_z = 0
	if(virt_z)
		players_on_virtual_z = LAZYACCESS(SSmobs.players_by_virtual_z, "[virt_z]")
		if(ai_status == AI_STATUS_ON && !length(players_on_virtual_z))
			set_ai_status(AI_STATUS_OFF)
		else if(ai_status == AI_STATUS_OFF)
			set_ai_status(AI_STATUS_ON)

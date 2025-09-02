/datum/status_effect/offering
	tick_interval = 10 // Check every second

/datum/status_effect/offering/tick()
	// Periodic check to ensure we still have the item
	if(!offered_item || owner.get_active_held_item() != offered_item)
		qdel(src)
		return

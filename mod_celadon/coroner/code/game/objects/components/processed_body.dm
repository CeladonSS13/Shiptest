// Component to mark bodies as already processed for payment
/datum/component/processed_body
	var/processed_time

/datum/component/processed_body/Initialize()
	. = ..()
	processed_time = world.time
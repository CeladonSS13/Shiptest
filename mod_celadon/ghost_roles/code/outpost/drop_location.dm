// Пока что это будут криоподы
/obj/machinery/cryopod/outpost/cook
	name = "sleeper a cook"
	desc = "A closed apparatus designed for the chef."

/obj/machinery/cryopod/outpost/bartender
	name = "sleeper a bartender"
	desc = "A closed apparatus designed for the bartender."

/obj/machinery/cryopod/outpost/maid
	name = "sleeper a maid"
	desc = "A closed apparatus designed for the maid."

/obj/machinery/cryopod/outpost/artist
	name = "sleeper a artist"
	desc = "A closed apparatus designed for the artist."

/obj/machinery/cryopod/outpost/medic
	name = "sleeper a medical doctor"
	desc = "A closed apparatus designed for the medic."

/obj/machinery/cryopod/outpost
	var/linked_spawner_type

/obj/machinery/cryopod/outpost/proc/try_replenish_role()
	if(!linked_spawner_type)
		return
	new linked_spawner_type(get_turf(src))
	qdel(src)


// Исключение для бомжа
/obj/structure/bed/outpost/wagabond
	name = "bed a wagabond"
	icon_state = "dirty_mattress"

/obj/structure/bed/outpost
	/// Type of spawner to recreate when role is replenished
	var/linked_spawner_type

/obj/structure/bed/outpost/proc/try_replenish_role()
	if(!linked_spawner_type)
		return
	// Create new spawner at our location
	new linked_spawner_type(get_turf(src))
	// Remove ourselves
	qdel(src)


/obj/structure/bed/outpost/wagabond/attack_hand(mob/living/user)
	if(!ishuman(user))
		return ..(user)

	var/mob/living/carbon/human/H = user
	if(!H.mind || H.mind.original_ship) // Not a ghost role
		return ..(user)

	// Check if this is the wagabond role
	if(H.mind.assigned_role != "Wagabond")
		return ..(user)

	var/choice = alert(H, "Do you want to leave your role and return to ghost? This will free up the slot for other players.", "Leave Role", "Yes", "No")
	if(choice != "Yes" || !Adjacent(H))
		return

	// Ghost the player and clean up
	if(H.client)
		H.ghostize(TRUE)

	for(var/obj/item/W in H.GetAllContents())
		qdel(W)

	// Try to replenish the role if enabled
	try_replenish_role()

	// Clean up the mob
	qdel(H)

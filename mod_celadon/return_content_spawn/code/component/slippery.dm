/// Used for making the clown PDA only slip if the clown is wearing his shoes and the elusive banana-skin belt
/datum/component/slippery/clowning

/datum/component/slippery/clowning/Slip_on_wearer(datum/source, atom/movable/AM)
	var/obj/item/I = holder.get_item_by_slot(ITEM_SLOT_FEET)
	if(holder.body_position == LYING_DOWN && !holder.buckled)
		if(istype(I, /obj/item/clothing/shoes/clown_shoes))
			Slip(source, AM)
		else
			to_chat(AM,"<span class='warning'>[parent] failed to slip anyone. Perhaps I shouldn't have abandoned my legacy...</span>")

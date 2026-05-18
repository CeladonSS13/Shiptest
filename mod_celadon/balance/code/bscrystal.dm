/obj/item/stack/ore/bluespace_crystal/attack_self(mob/user)
	if(user.next_move > world.time)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	return ..()

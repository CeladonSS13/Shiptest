/obj/item/clothing/suit/toggle/pufferjacket/reskin_obj(mob/user)
	. = ..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_suit()

/obj/item/clothing/suit/toggle/puffervest/reskin_obj(mob/user)
	. = ..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_suit()

/obj/item/clothing/suit/toggle/windbreaker/reskin_obj(mob/user)
	. = ..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_suit()

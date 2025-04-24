/obj/item/tank/jetpack/suit
	name = "hardsuit jetpack upgrade"
	desc = "A modular, compact set of thrusters designed to integrate with a hardsuit. It is fueled by a tank inserted into the suit's storage compartment."
	icon = 'mod_celadon/_storge_icons/icons/obj/jetpack_suit/items.dmi' //Changed item icon
	icon_state = "jetpack_upgrade"
	item_state = "jetpack-black"
	w_class = WEIGHT_CLASS_NORMAL
	actions_types = list(/datum/action/item_action/toggle_jetpack, /datum/action/item_action/jetpack_stabilization)
	volume = 1
	slot_flags = null
	gas_type = null
	full_speed = FALSE
	custom_price = 2000

/obj/item/tank/jetpack/suit
	name = "hardsuit jetpack upgrade"
	desc = "A modular, compact set of thrusters designed to integrate with a hardsuit. It is fueled by a tank inserted into the suit's storage compartment."
	icon = 'mod_celadon/_storge_icons/icons/obj/jetpack_suit/items.dmi' // Changed item icon
	icon_state = "jetpack_upgrade"
	item_state = "jetpack-black"
	w_class = WEIGHT_CLASS_NORMAL
	actions_types = list(/datum/action/item_action/toggle_jetpack, /datum/action/item_action/jetpack_stabilization)
	volume = 1
	slot_flags = null
	gas_type = null
	full_speed = FALSE
	custom_price = 2000

/obj/item/tank/jetpack/suit/turn_on(mob/user)
	if(!istype(loc, /obj/item/clothing/suit/space/hardsuit) || !ishuman(loc.loc) || loc.loc != user)
		return
	var/mob/living/carbon/human/H = user
	icon = 'mod_celadon/_storge_icons/icons/obj/jetpack_suit/tank.dmi'
	icon_state = "jetpack_upgrade-on"
	tank = H.s_store
	air_contents = tank.air_contents
	START_PROCESSING(SSobj, src)
	cur_user = user
	..()

/obj/item/tank/jetpack/suit/turn_off(mob/user)
	icon = 'mod_celadon/_storge_icons/icons/obj/jetpack_suit/tank.dmi'
	icon_state = "jetpack_upgrade"
	tank = null
	air_contents = temp_air_contents
	STOP_PROCESSING(SSobj, src)
	cur_user = null
	..()

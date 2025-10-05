/obj/item/melee/sword/energy_katana
	name = "energy katana"
	desc = "A katana infused with strong energy."
	icon_state = "energy_katana"
	item_state = "energy_katana"
	force = 40
	throwforce = 20
	block_chance = 50
	armour_penetration = 50
	max_integrity = 200
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/datum/effect_system/spark_spread/spark_system
	var/datum/action/innate/dash/ninja/jaunt
	var/dash_toggled = TRUE

// [CELADON-EDIT] - FIXES_ANTAG_NINJA
// /obj/item/melee/sword/energy_katana/Initialize()	// ORIGINAL
/obj/item/melee/sword/energy_katana/Initialize(mapload)
// [/CELADON-EDIT]
	. = ..()
	jaunt = new(src)
	spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

/obj/item/melee/sword/energy_katana/attack_self(mob/user)
	dash_toggled = !dash_toggled
	to_chat(user, span_notice("You [dash_toggled ? "enable" : "disable"] the dash function on [src]."))

/obj/item/melee/sword/energy_katana/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	// [CELADON-ADD] - FIXES_ANTAG_NINJA
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/clothing/suit/space/space_ninja/ninja_suit = H.wear_suit
	if(!istype(ninja_suit))
		to_chat(user, span_warning("<b>ERROR</b>: garments incompatible with carbon material jaunt. Please suit up in compatible garments."))
		return
	if(!dash_toggled || Adjacent(target) || target.density)
		return
	if(ninja_suit.s_coold > 0)
		to_chat(user, span_warning("<b>ERROR</b>: suit is on cooldown."))
		return
	// [/CELADON-ADD]
	jaunt.Teleport(user, target)
	if(proximity_flag && (isobj(target) || issilicon(target)))
		spark_system.start()
		playsound(user, "sparks", 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
		playsound(user, 'sound/weapons/blade1.ogg', 50, TRUE)
		target.emag_act(user)

/obj/item/melee/sword/energy_katana/pickup(mob/living/user)
	. = ..()
	jaunt.Grant(user, src)
	user.update_icons()
	playsound(src, 'sound/items/unsheath.ogg', 25, TRUE)

/obj/item/melee/sword/energy_katana/dropped(mob/user)
	. = ..()
	jaunt?.Remove(user)
	user.update_icons()

//If we hit the Ninja who owns this Katana, they catch it.
//Works for if the Ninja throws it or it throws itself or someone tries
//To throw it at the ninja
/obj/item/melee/sword/energy_katana/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(ishuman(hit_atom))
		// [CELADON-ADD] - FIXES_ANTAG_NINJA
		var/mob/living/carbon/human/hit_human = hit_atom
		if(istype(hit_human.wear_suit, /obj/item/clothing/suit/space/space_ninja))
			var/obj/item/clothing/suit/space/space_ninja/ninja_suit = hit_human.wear_suit
			if(ninja_suit.energyKatana == src)
				returnToOwner(hit_human, 0, 1)
		// [/CELADON-ADD]
				return

	..()

/obj/item/melee/sword/energy_katana/proc/returnToOwner(mob/living/carbon/human/user, doSpark = 1, caught = 0)
	if(!istype(user))
		return
	forceMove(get_turf(user))

	if(doSpark)
		spark_system.start()
		playsound(get_turf(src), "sparks", 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)

	var/msg = ""

	if(user.put_in_hands(src))
		msg = "Your Energy Katana teleports into your hand!"
	else if(user.equip_to_slot_if_possible(src, ITEM_SLOT_BELT, 0, 1, 1))
		// [CELADON-EDIT] - FIXES_ANTAG_NINJA
		// msg = "Your Energy Katana teleports back to you, sheathing itself as it does so!</span>"	// ORIGINAL
		msg = "Your Energy Katana teleports back to you, sheathing itself as it does so!"
		// [/CELADON-EDIT]
	else
		msg = "Your Energy Katana teleports to your location!"

	if(caught)
		if(loc == user)
			msg = "You catch your Energy Katana!"
		else
			msg = "Your Energy Katana lands at your feet!"

	if(msg)
		to_chat(user, span_notice("[msg]"))


/obj/item/melee/sword/energy_katana/Destroy()
	QDEL_NULL(spark_system)
	QDEL_NULL(jaunt)
	return ..()

/datum/action/innate/dash/ninja
	current_charges = 3
	max_charges = 3
	charge_rate = 30
	recharge_sound = null

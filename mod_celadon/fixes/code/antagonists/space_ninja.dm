/obj/item/clothing/suit/space/space_ninja
	var/obj/item/clothing/shoes/space_ninja/n_mask

/obj/item/clothing/suit/space/space_ninja/examine(mob/user)
	. = ..()
	if(!s_initialized)
		return
	if(!user == affecting)
		return
	. += "All systems operational. Current energy capacity: <B>[DisplayEnergy(cell.charge)]</B>.\n"+\
	"[a_boost?"An adrenaline boost is available to use.":"There is no adrenaline boost available.  Try refilling the suit with 20 units of radium."]"

/**
  * Proc called to lock the important gear pieces onto space ninja's body.
  *
  * Called during the suit startup to lock all gear pieces onto space ninja.
  * Terminates if a gear piece is not being worn.  Also gives the ninja the inability to use firearms.
  * If the person in the suit isn't a ninja when this is called, this proc just gibs them instead.
  * Arguments:
  * * ninja - The person wearing the suit.
  * * Returns false if the locking fails due to lack of all suit parts, and true if it succeeds.
  */
/obj/item/clothing/suit/space/space_ninja/proc/lock_suit(mob/living/carbon/human/ninja)
	if(!istype(ninja))
		return FALSE
	if(!is_ninja(ninja))
		to_chat(ninja, span_danger("<B>fÄTaL ÈÈRRoR</B>: 382200-*#00CÖDE <B>RED</B>\nUNAUHORIZED USÈ DETÈCeD\nCoMMÈNCING SUB-R0UIN3 13...\nTÈRMInATING U-U-USÈR..."))
		ninja.gib()
		return FALSE
	if(!istype(ninja.head, /obj/item/clothing/head/helmet/space/space_ninja))
		to_chat(ninja, span_userdanger("ERROR: 100113 UNABLE TO LOCATE HEAD GEAR\nABORTING..."))
		return FALSE
	if(!istype(ninja.shoes, /obj/item/clothing/shoes/space_ninja))
		to_chat(ninja, span_userdanger("ERROR: 122011 UNABLE TO LOCATE FOOT GEAR\nABORTING..."))
		return FALSE
	if(!istype(ninja.gloves, /obj/item/clothing/gloves/space_ninja))
		to_chat(ninja, span_userdanger("ERROR: 110223 UNABLE TO LOCATE HAND GEAR\nABORTING..."))
		return FALSE
	affecting = ninja
	ADD_TRAIT(src, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	slowdown = 0
	icon_state = "s-ninjan"
	n_hood = ninja.head
	ADD_TRAIT(n_hood, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	n_shoes = ninja.shoes
	ADD_TRAIT(n_shoes, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	n_shoes.icon_state = "s-ninjan"
	n_shoes.item_state = "s-ninjan"
	n_gloves = ninja.gloves
	ADD_TRAIT(n_gloves, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	n_gloves.icon_state = "s-ninjan"
	n_gloves.item_state = "s-ninjan"
	n_mask = ninja.wear_mask
	if(n_mask)
		n_mask.icon_state = "s-ninja"
		n_mask.item_state = "s-ninja"
	ADD_TRAIT(ninja, TRAIT_NOGUNS, NINJA_SUIT_TRAIT)
	return TRUE

/**
  * Proc called to unlock all the gear off space ninja's body.
  *
  * Proc which is essentially the opposite of lock_suit.  Lets you take off all the suit parts.
  * Also gets rid of the objection to using firearms from the wearer.
  * Arguments:
  * * ninja - The person wearing the suit.
  */
/obj/item/clothing/suit/space/space_ninja/proc/unlock_suit(mob/living/carbon/human/ninja)
	affecting = null
	REMOVE_TRAIT(src, TRAIT_NODROP, NINJA_SUIT_TRAIT)
	slowdown = 1
	icon_state = "s-ninja"
	if(n_hood)//Should be attached, might not be attached.
		REMOVE_TRAIT(n_hood, TRAIT_NODROP, NINJA_SUIT_TRAIT)
		n_hood.icon_state = "s-ninja"
	if(n_shoes)
		REMOVE_TRAIT(n_shoes, TRAIT_NODROP, NINJA_SUIT_TRAIT)
		n_shoes.icon_state = "s-ninja"
		n_shoes.item_state = "s-ninja"
	if(n_gloves)
		n_gloves.icon_state = "s-ninja"
		n_gloves.item_state = "s-ninja"
		REMOVE_TRAIT(n_gloves, TRAIT_NODROP, NINJA_SUIT_TRAIT)
		n_gloves.candrain = FALSE
		n_gloves.draining = FALSE
	if(n_mask)
		n_mask.icon_state = "s-ninja"
		n_mask.item_state = "s-ninja"
	if(ninja)
		REMOVE_TRAIT(ninja, TRAIT_NOGUNS, NINJA_SUIT_TRAIT)

/**
  * Proc used to delete all the attachments and itself.
  *
  * Can be called to entire rid of the suit pieces and the suit itself.
  */
/obj/item/clothing/suit/space/space_ninja/proc/terminate()
	qdel(n_hood)
	qdel(n_gloves)
	qdel(n_shoes)
	qdel(src)

//Randomizes suit parameters.
/obj/item/clothing/suit/space/space_ninja/proc/randomize_param()
	s_cost = rand(1,10)
	s_acost = rand(10,50)
	s_delay = rand(10,100)

/obj/item/melee/sword/energy_katana
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	wound_bonus = 6
	bare_wound_bonus = 12
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	slot_flags = ITEM_SLOT_BELT
	sharpness = SHARP_EDGED
	obj_flags = UNIQUE_RENAME


// Добавляем функцию обезглавливания
/obj/item/melee/sword/energy_katana/attack(mob/living/target, mob/living/carbon/human/user)
	if(user.mind && !(user.mind.has_antag_datum(/datum/antagonist/ninja)))
		user.Knockdown(100)
		user.dropItemToGround(src, TRUE)
		to_chat(user, span_danger("<B>fÄTaL ÈÈRRoR</B>: 382200-*#00CÖDE <B>RED</B>\nUNAUHORIZED USÈ DETÈCeD\nCoMMÈNCING SUB-R0UIN3 13...\nTÈRMInATING U-U-USÈR..."))
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(rand(force/2, force), BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
		else
			user.adjustBruteLoss(rand(force/2,force))
		return

	if(ishuman(target) && user.zone_selected == BODY_ZONE_HEAD)
		var/mob/living/carbon/human/H = target
		if(H.stat != DEAD && !H.head)
			if(H.health <= 50) // Если здоровье низкое
				if(prob(25)) // 25% шанс обезглавливания
					H.visible_message(span_danger("[user] cleanly decapitates [H] with [src]!"),
									span_userdanger("[user] decapitates you with [src]!"))
					var/obj/item/bodypart/head/head = H.get_bodypart(BODY_ZONE_HEAD)
					if(head)
						head.drop_limb()
						H.death()
					return
	..()


/obj/item/clothing/head/helmet/space/hardsuit/quixote
	name = "\improper Quixote mobility hardsuit helmet"
	desc = "The integrated helmet of a Quixote mobility hardsuit."
	icon_state = "hardsuit0-quixote"
	item_state = "quixote-helm"
	max_integrity = 300
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 25, "bomb" = 50, "bio" = 100, "rad" = 60, "fire" = 50, "acid" = 100)
	hardsuit_type = "quixote"
	max_heat_protection_temperature = 20000

/obj/item/clothing/suit/space/hardsuit/quixote
	name = "\improper Quixote mobility hardsuit"
	desc = "The Quixote mobility suit is the magnum opus of Phorsman equipment, combining durable composite armor with high mobility thrusters."
	icon_state = "quixotesuit"
	item_state = "quixotesuit"
	max_integrity = 300
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 25, "bomb" = 50, "bio" = 100, "rad" = 60, "fire" = 50, "acid" = 100)
	allowed = list(/obj/item/gun, /obj/item/flashlight, /obj/item/tank/internals, /obj/item/ammo_box)
	actions_types = list(/datum/action/item_action/toggle_helmet)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/quixote
	jetpack = /obj/item/tank/jetpack/suit
	slowdown = 0.3
	max_heat_protection_temperature = 20000
	var/datum/action/innate/quixotejump/jump

/obj/item/clothing/suit/space/hardsuit/quixote/Initialize()
	. = ..()
	jump = new(src)

/obj/item/clothing/suit/space/hardsuit/quixote/Destroy()
	QDEL_NULL(jump)
	return ..()

/obj/item/clothing/suit/space/hardsuit/quixote/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING)
		jump.Grant(user)
		user.update_icons()
	else //If it is equipped in any slot except for our outer clothing, we can't dash
		jump.Remove(user)
		user.update_icons()

/obj/item/clothing/suit/space/hardsuit/quixote/dropped(mob/user)
	. = ..()
	jump.Remove(user)
	user.update_icons()

/obj/item/clothing/suit/space/hardsuit/quixote/ui_action_click(mob/user, action)
	if(action == /datum/action/innate/quixotejump)
		jump.Activate()
	else
		return ..()

/obj/item/clothing/head/helmet/space/hardsuit/quixote/dimensional
	name = "\improper Quixote metaspacial hardsuit helmet"
	desc = "The integrated helmet of a Quixote metaspace navigation hardsuit."
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 35, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)

/obj/item/clothing/suit/space/hardsuit/quixote/dimensional
	name = "\improper Quixote metaspacial hardsuit"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 40, "energy" = 35, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	desc = "The Quixote metaspacial mobility suit is the magnum opus of dimensional navigation equipment, combining durable composite armor with high mobility thrusters and defensive plating rated for all manner of exotic particles."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/quixote/dimensional

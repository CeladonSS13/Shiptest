//banana flavored chaos and horror ahead

/obj/item/clothing/shoes/clown_shoes/banana_shoes
	name = "mk-honk prototype shoes"
	desc = "Lost prototype of advanced clown tech. Powered by bananium, these shoes leave a trail of chaos in their wake."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "clown_prototype_off"
	actions_types = list(/datum/action/item_action/toggle)
	var/on = FALSE
	var/always_noslip = FALSE

/obj/item/clothing/shoes/clown_shoes/banana_shoes/Initialize()
	. = ..()
	if(always_noslip)
		clothing_flags |= NOSLIP

/obj/item/clothing/shoes/clown_shoes/banana_shoes/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	AddComponent(/datum/component/material_container, list(/datum/material/hellstone), 200000, TRUE, /obj/item/stack)
	AddComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 75, falloff_exponent = 20)

/obj/item/clothing/shoes/clown_shoes/banana_shoes/step_action()
	. = ..()
	var/mob/wearer = loc
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
	if(on && istype(wearer))
		if(bananium.get_material_amount(/datum/material/hellstone) < 100)
			on = !on
			if(!always_noslip)
				clothing_flags &= ~NOSLIP
			update_appearance()
			to_chat(loc, span_warning("You ran out of bananium!"))
		else
			new /obj/item/grown/bananapeel/specialpeel(get_step(src,turn(wearer.dir, 180))) //honk
			bananium.use_amount_mat(100, /datum/material/hellstone)

/obj/item/clothing/shoes/clown_shoes/banana_shoes/attack_self(mob/user)
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
	var/sheet_amount = bananium.retrieve_all()
	if(sheet_amount)
		to_chat(user, span_notice("You retrieve [sheet_amount] sheets of bananium from the prototype shoes."))
	else
		to_chat(user, span_warning("You cannot retrieve any bananium from the prototype shoes!"))

/obj/item/clothing/shoes/clown_shoes/banana_shoes/examine(mob/user)
	. = ..()
	. += span_notice("The shoes are [on ? "enabled" : "disabled"].")

/obj/item/clothing/shoes/clown_shoes/banana_shoes/ui_action_click(mob/user)
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
	if(bananium.get_material_amount(/datum/material/hellstone))
		on = !on
		update_appearance()
		to_chat(user, span_notice("You [on ? "activate" : "deactivate"] the prototype shoes."))
		if(!always_noslip)
			if(on)
				clothing_flags |= NOSLIP
			else
				clothing_flags &= ~NOSLIP
	else
		to_chat(user, span_warning("You need bananium to turn the prototype shoes on!"))

/obj/item/clothing/shoes/clown_shoes/banana_shoes/update_icon_state()
	if(on)
		icon_state = "clown_prototype_on"
	else
		icon_state = "clown_prototype_off"
	return ..()

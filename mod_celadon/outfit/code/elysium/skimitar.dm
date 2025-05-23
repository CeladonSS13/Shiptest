/*
	Skimitar
*/

/obj/item/melee/skimitar
	name = "Scimitar"
	desc = "An ancient traditional Starbull edged weapon that was very popular among the people of Starbull in 2430 by Sol."
	icon_state = "skimitar"
	item_state = "skimitar"
	icon = 'mod_celadon/_storge_icons/icons/obj/skimitar.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/mob/swords_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/mob/swords_righthand.dmi'
	pickup_sound =  'sound/items/unsheath.ogg'
	drop_sound = 'sound/items/handling/metal_drop.ogg'
	force = 35
	throwforce = 30
	w_class = WEIGHT_CLASS_BULKY
	block_chance = 10
	armour_penetration = 35
	sharpness = IS_SHARP
	attack_verb = list("slashed", "cut")
	hitsound = 'sound/weapons/rapierhit.ogg'
	custom_materials = list(/datum/material/iron = 1000)

/obj/item/melee/skimitar/golden
	name = "Golden scimitar"
	desc = "An ancient traditional Starbull edged weapon that was very popular among the people of Starbull in 2430 by Sol. This particular one is made of gold and emeralds. It looks expensive!"
	icon_state = "skimitar_gold"
	item_state = "skimitar_gold"

/obj/item/melee/skimitar/silenced
	name = "silenced Scimitar"
	icon_state = "skimitar-silenced"
	item_state = "skimitar-silenced"

/obj/item/melee/skimitar/golden/silenced
	name = "silenced Golden scimitar"
	icon_state = "skimitar_gold-silenced"
	item_state = "skimitar_gold-silenced"

/*
	Silencer
*/

/datum/crafting_recipe/skimitar_silenced
	name = "Scimitar"
	result = /obj/item/melee/skimitar/silenced
	reqs = list(/obj/item/melee/skimitar = 1,
				/obj/item/attachment/silencer = 1)
	time = 5
	category = CAT_MISC

/datum/crafting_recipe/skimitar_golden_silenced
	name = "Golden scimitar"
	result = /obj/item/melee/skimitar/golden/silenced
	reqs = list(/obj/item/melee/skimitar/golden = 1,
				/obj/item/attachment/silencer = 1)
	time = 5
	category = CAT_MISC

/datum/crafting_recipe/skimitar
	name = "Scimitar"
	result = /obj/item/melee/skimitar
	reqs = list(/obj/item/melee/skimitar/silenced = 1)
	time = 5
	category = CAT_MISC

/datum/crafting_recipe/skimitar_golden
	name = "Golden scimitar"
	result = /obj/item/melee/skimitar/golden
	reqs = list(/obj/item/melee/skimitar/golden/silenced = 1)
	time = 5
	category = CAT_MISC

/*
	Sheath
*/

/obj/item/storage/belt/skimitar
	name = "Scimitar sheath"
	desc = "Scimitar scabbard, traditionally worn for carrying a scimitar. They look green and suspiciously scaly. "
	icon = 'mod_celadon/_storge_icons/icons/obj/sheath-skimitar.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/sheath-skimitar.dmi'
	icon_state = "sheath"
	item_state = "sheath"
	base_icon_state = "sheath"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE

/obj/item/storage/belt/skimitar/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.use_sound = null //if youre wondering why this is null, its so you can look in your sheath to prepare to draw, without letting anyone know youre preparing to draw it
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.set_holdable(list(
		/obj/item/melee/skimitar
		))

/obj/item/storage/belt/skimitar/examine(mob/user)
	. = ..()
	if(length(contents))
		. += span_notice("Alt-click it to quickly draw the blade.")

/obj/item/storage/belt/skimitar/AltClick(mob/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(length(contents))
		var/obj/item/I = contents[1]
		user.visible_message(span_notice("[user] takes [I] out of [src]."), span_notice("You take [I] out of [src]."))
		user.put_in_hands(I)
		update_appearance()
	else
		to_chat(user, span_warning("[src] is empty!"))

/obj/item/storage/belt/skimitar/update_icon_state()
	item_state = "[base_icon_state]"
	if(contents.len)
		item_state = "sheath_skimitar"
	return ..()

/obj/item/storage/belt/skimitar/full/PopulateContents()
	new /obj/item/melee/skimitar(src)
	update_appearance()

/obj/item/storage/belt/skimitar/Initialize()
	. = ..()
	update_appearance()

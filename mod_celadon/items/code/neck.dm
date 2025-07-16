/obj/item/clothing/neck/padded
	name = "feathered serenity cloak"
	desc = "A meticulously handcrafted cloak that is lined with subtle pockets filled with feathers and down. Its design matches common styles from the followers of Univitarium."
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/neck/overlay/neck.dmi'
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/neck/cloaks.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/neck/in_hands/padded_left.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/clothing/neck/in_hands/padded_right.dmi'
	icon_state = "paddedscarf"
	inhand_icon_state = "paddedscarf"

/obj/item/clothing/neck/padded/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/toggle_attached_clothing,\
		deployable_type = /obj/item/clothing/head/hooded/padded,\
		equipped_slot = ITEM_SLOT_HEAD,\
		action_name = "Toggle Hood",\
		on_deployed = CALLBACK(src, PROC_REF(on_deployed)),\
	)

//Bandaid fix because obscurity is broken D:
/obj/item/clothing/neck/padded/proc/on_deployed()
	var/mob/wearer = loc
	wearer.update_body()

/obj/item/clothing/neck/padded/alt
	name = "feathered serenity cloak"
	desc = "A meticulously handcrafted cloak that is lined with subtle pockets filled with feathers and down. Its design matches common styles from the followers of Univitarium."
	icon_state = "paddedscarfalt"
	inhand_icon_state = "paddedscarfalt"

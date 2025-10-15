/obj/item/clothing/suit/hooded/cloak/padded
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/neck/overlay/neck.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/neck/cloaks.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/neck/in_hands/padded_left.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/neck/in_hands/padded_right.dmi'
	slot_flags = ITEM_SLOT_OCLOTHING | ITEM_SLOT_NECK
	name = "feathered serenity cloak"
	desc = "A meticulously handcrafted cloak that is lined with subtle pockets filled with feathers and down. Its design matches common styles from the followers of Univitarium."
	icon_state = "paddedscarf"
	item_state = "paddedscarf"
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/padded

/obj/item/clothing/head/hooded/cloakhood/padded
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/neck/overlay/neck.dmi'
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/neck/cloaks.dmi'
	flags_inv = HIDEEARS | HIDEEYES | HIDEHAIR | HIDEFACIALHAIR
	clothing_flags = SNUG_FIT
	name = "feathered serenity hood"
	desc = "A hood attached to a feathered serenity cloak."
	icon_state = "paddedscarf_full"
	item_state = "paddedscarf_full"

/obj/item/clothing/suit/hooded/cloak/padded/alt
	icon_state = "paddedscarfalt"
	item_state = "paddedscarfalt"
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/padded/alt

/obj/item/clothing/head/hooded/cloakhood/padded/alt
	icon_state = "paddedscarfalt_full"
	item_state = "paddedscarfalt_full"


/obj/item/clothing/suit/armor/vest/capcarapace/syndievest
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/undersuits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/undersuits.dmi'
	name = "captain's parade coat"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "syndievest"
	item_state = "syndievest"
	body_parts_covered = CHEST | GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/suit/toggle/armor/centcom_formal
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/undersuits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/undersuits.dmi'
	name = "\improper CentCom formal coat"
	desc = "A stylish coat given to CentCom Commanders. Perfect for sending ERTs to suicide missions with style!"
	icon_state = "centcom_formal"
	item_state = "centcom_formal"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/exo/large
	body_parts_covered = CHEST | GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION
	armor = list("melee" = 35, "bullet" = 40, "laser" = 40, "energy" = 50, "bomb" = 35, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 60)
	togglename = "centcom"

/obj/item/clothing/suit/toggle/armor/hos_formal
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/undersuits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/undersuits.dmi'
	name = "\improper Head of Security's parade jacket"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "hosformal"
	item_state = "hosformal"
	body_parts_covered = CHEST | GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90)
	togglename = "hosformal"

/obj/item/clothing/suit/toggle/armor/captains_formal
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/undersuits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/undersuits.dmi'
	name = "\improper Head of Security's parade jacket"
	desc = "captain's parade coat"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "capformal"
	item_state = "capformal"
	body_parts_covered = CHEST | GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION
	armor = list("melee" = 35, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	togglename = "capformal"


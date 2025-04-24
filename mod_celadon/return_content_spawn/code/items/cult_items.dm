/obj/item/clothing/head/magus
	name = "magus helm"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/hats.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/head.dmi'
	icon_state = "magus"
	item_state = "magus"
	desc = "A helm worn by the followers of Nar'Sie."
	flags_inv = HIDEFACE | HIDEHAIR | HIDEFACIALHAIR | HIDEEARS | HIDEEYES
	armor = list("melee" = 50, "bullet" = 30, "laser" = 50,"energy" = 50, "bomb" = 25, "bio" = 10, "rad" = 0, "fire" = 10, "acid" = 10)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/suit/magusred
	name = "magus robes"
	desc = "A set of armored robes worn by the followers of Nar'Sie."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/suit.dmi'
	icon_state = "magusred"
	item_state = "magusred"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	// allowed = list(/obj/item/tome)
	armor = list("melee" = 50, "bullet" = 30, "laser" = 50,"energy" = 50, "bomb" = 25, "bio" = 10, "rad" = 0, "fire" = 10, "acid" = 10)
	flags_inv = HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT

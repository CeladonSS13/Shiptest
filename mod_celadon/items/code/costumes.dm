/obj/item/clothing/suit/hooded/shark_costume // Blahaj
	name = "Shark costume"
	desc = "Finally, a costume to match your favorite plush."
	icon_state = "shark"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/costume.dmi'
	item_state = "shark"
	body_parts_covered = CHEST|GROIN|ARMS
	clothing_flags = THICKMATERIAL
	hoodtype = /obj/item/clothing/head/hooded/shark_hood

/obj/item/clothing/head/hooded/shark_hood
	name = "shark hood"
	desc = "A hood attached to a shark costume."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/costume.dmi'
	icon_state = "shark"
	body_parts_covered = HEAD
	clothing_flags = THICKMATERIAL
	flags_inv = HIDEHAIR|HIDEEARS|HIDEHORNS

/obj/item/clothing/suit/hooded/shork_costume // Oh God Why
	name = "shork costume"
	desc = "Why would you ever do this?"
	icon_state = "sharkcursed"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/costume.dmi'
	item_state = "sharkcursed"
	body_parts_covered = CHEST|GROIN|ARMS
	clothing_flags = THICKMATERIAL
	hoodtype = /obj/item/clothing/head/hooded/shork_hood

/obj/item/clothing/head/hooded/shork_hood
	name = "shork hood"
	desc = "A hood attached to a shork costume."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/costume.dmi'
	icon_state = "sharkcursed"
	body_parts_covered = HEAD
	clothing_flags = THICKMATERIAL
	flags_inv = HIDEHAIR | HIDEEARS | HIDEHORNS

/obj/item/clothing/suit/costume/soviet
	name = "soviet armored coat"
	desc = "Conscript reporting! Sponsored by DonkSoft Co. for historical reenactment of the Third World War!"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/costume.dmi'
	icon_state = "soviet_suit"
	item_state = null
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/suit/costume/deckers
	name = "decker hoodie"
	desc = "Based? Based on what?"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/costume.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/costume.dmi'
	icon_state = "decker_suit"
	item_state = null
	body_parts_covered = CHEST | GROIN | LEGS | ARMS
	supports_variations = DIGITIGRADE_VARIATION

// Костюм горничной тактический белый без статов
/obj/item/clothing/gloves/maid/white // есть проблема с тем что я не могу перекрасить красный цвет...
	name = "maid sleeves"
	desc = "Replica tacticute."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/hands/gloves.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/hands/overlay/hands.dmi'
	icon_state = "syndimaid_arms"
	mob_overlay_state = "tacticool_arms"

/obj/item/clothing/under/costume/maid/white
	name = "maid tacticute costume"
	desc = "Maid tacticute in China."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/under/maidunder.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/under/overlay/maidunder.dmi'
	icon_state = "maid"
	item_state = "maid"

/obj/item/clothing/under/costume/yukata
	name = "black yukata"
	desc = "A comfortable black cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon_state = "yukata1"
	body_parts_covered = CHEST | GROIN | ARMS
	// can_adjust = FALSE
	// supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/costume/yukata/green
	name = "green yukata"
	desc = "A comfortable green cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon_state = "yukata2"

/obj/item/clothing/under/costume/yukata/white
	name = "white yukata"
	desc = "A comfortable white cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon_state = "yukata3"

/obj/item/clothing/under/costume/kimono
	name = "black kimono"
	desc = "A luxurious black silk kimono with traditional flair, ideal for elegant festive occasions."
	icon_state = "kimono1"
	// inhand_icon_state = "yukata1"
	body_parts_covered = CHEST | GROIN | ARMS
	// can_adjust = FALSE
	// supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/costume/kimono/red
	name = "red kimono"
	desc = "A luxurious red silk kimono with traditional flair, ideal for elegant festive occasions."
	icon_state = "kimono2"
	// inhand_icon_state = "kimono2"

/obj/item/clothing/under/costume/kimono/purple
	name = "purple kimono"
	desc = "A luxurious purple silk kimono with traditional flair, ideal for elegant festive occasions."
	icon_state = "kimono3"
	// inhand_icon_state = "kimono3"

/obj/item/clothing/under/costume/gi
	name = "Martial Artist Gi"
	desc = "Assistant, nukie, whatever. You can beat anyone; it's called hard work!"
	icon_state = "martial_arts_gi"
	// greyscale_config = /datum/greyscale_config/gi
	// greyscale_config_worn = /datum/greyscale_config/gi/worn
	greyscale_colors = "#f1eeee#000000"
	// flags_1 = IS_PLAYER_COLORABLE_1
	// inhand_icon_state = null
	// female_sprite_flags = NO_FEMALE_UNIFORM
	// can_adjust = FALSE

/obj/item/clothing/under/costume/gi/Initialize(mapload)
	. = ..()
	// AddElement(/datum/element/gags_recolorable)
	update_icon(UPDATE_OVERLAYS)

/obj/item/clothing/under/costume/gi/goku
	name = "Sacred Gi"
	desc = "Created by a man who touched the hearts and lives of many."
	icon_state = "martial_arts_gi_goku"
	greyscale_colors = "#f89925#3e6dd7"

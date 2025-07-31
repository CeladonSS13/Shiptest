/obj/item/clothing/head/bandana/elysium
	name = "void bandana"
	desc = "This is a simple bandana with a patriotic inscription \"Glory to the Republic!\" on it."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats3.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/elysium_head.dmi'

/obj/item/clothing/head/bandana/elysium/black
	name = "black bandana"
	icon_state = "bandana_black_elysium"
	mob_overlay_state = "bandana_black_elysium"

/obj/item/clothing/head/bandana/elysium/white
	name = "white bandana"
	icon_state = "bandana_white_elysium"
	mob_overlay_state = "bandana_white_elysium"

/obj/item/clothing/head/bandana/elysium/green
	name = "green bandana"
	icon_state = "bandana_green_elysium"
	mob_overlay_state = "bandana_green_elysium"

/obj/item/clothing/head/turban
	name = "void turban"
	desc = "This is a very popular traditional headwear from the Republic of Elysium, and may be seen often in daily life within its' borders. It is traditionally worn only by men."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats3.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/elysium_head.dmi'

/obj/item/clothing/head/turban/black
	name = "black turban"
	icon_state = "turban_black"
	mob_overlay_state = "turban_black"

/obj/item/clothing/head/turban/white
	name = "white turban"
	icon_state = "turban_white"
	mob_overlay_state = "turban_white"

/obj/item/clothing/head/helmet/m10_elysium
	name = "M10 pattern helmet"
	desc = "A widespread protective helmet initally designed for Republic of Elysium's law enforcement, but with time it has found use by its' civilans. There is a handband on it with an inscription that reads: \"Power in unity, wisdom in faith.\""
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats3.dmi'
	icon_state = "m10helm_elysium"
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/elysium_head.dmi'
	mob_overlay_state = "m10helm_elysium"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE
	can_flashlight = TRUE

/obj/item/clothing/head/shemag
	name = "void shemagh"
	desc = "This is a popular piece of headwear from the Republic of Elysium, and it is perfect for protecting one from the Starbull's dust storms."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats3.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/elysium_head.dmi'

/obj/item/clothing/head/shemag/black
	name = "black shemagh"
	icon_state = "shemag_black"
	mob_overlay_state = "shemag_black"

/obj/item/clothing/head/shemag/green
	name = "green shemagh"
	icon_state = "shemag_green"
	mob_overlay_state = "shemag_green"

/obj/item/clothing/head/shemag/white
	name = "white shemagh"
	icon_state = "shemag_white"
	mob_overlay_state = "shemag_white"

/obj/item/clothing/head/space/elysm
	name = "Void"
	desc = "Этого тут быть не должно.."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats3.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/space_suit/overlay/el_space.dmi'
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	flash_protect = FLASH_PROTECTION_WELDER
	strip_delay = 50
	equip_delay_other = 50
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	resistance_flags = NONE
	dog_fashion = null

/obj/item/clothing/head/space/elysm/space_helm
	name = "Elysium EVA Helmet"
	desc = "A pretty nicely made helmet with Elysium Separatists markings."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/head/hats3.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/space_suit/overlay/el_space.dmi'
	icon_state = "space_elysium"
	mob_overlay_state = "space_elysium"
	armor = list("melee" = 20, "bullet" = 15, "laser" = 15, "energy" = 20, "bomb" = 35, "bio" = 100, "rad" = 75, "fire" = 50, "acid" = 100)

/// CentCom Elyzium
/obj/item/clothing/head/turban_elysium
	name = "\improper CentCom commander cap"
	desc = "A traditional turban worn by Elysium employees. It is dyed in the national color of lettuce, which symbolizes the Starbull Gardens."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/elysium_commander.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/elysium_commander.dmi'
	icon_state = "turban_elysium"
	item_state = "turban_elysium"
	flags_inv = 0
	strip_delay = (8 SECONDS)
	body_parts_covered = HEAD | HAIR

/obj/item/clothing/head/shemag_elysium
	name = "\improper CentCom commander cap"
	desc = "A traditional shemag worn by Elysium employees. It is dyed in the national color of lettuce, which symbolizes the Starbull Gardens."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/elysium_commander.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/elysium_commander.dmi'
	icon_state = "shemag_elysium"
	item_state = "shemag_elysium"
	flags_inv = 0
	strip_delay = (8 SECONDS)
	body_parts_covered = HEAD | HAIR | FACEHAIR

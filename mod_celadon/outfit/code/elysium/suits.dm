/obj/item/clothing/suit/apparel
	name = "Apparel of Nothing"
	desc = "Ты блять как это вообще видишь? А ну удаляй давай, щитспавнер хуев."
	icon = 'mod_celadon/_storge_icons/icons/obj/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/mob/elysium_suit.dmi'

/obj/item/clothing/suit/apparel/black
	name = "black cape"
	desc = "Common in the territory of the Elysium Republic, this cape is a traditional casual wear out there."
	icon_state = "apparel_black"
	mob_overlay_state = "apparel_black"
	allowed = list(/obj/item/melee/skimitar)

/obj/item/clothing/suit/apparel/white
	name = "white cape"
	desc = "Common in the territory of the Elysium Republic, this cape is a traditional casual wear out there."
	icon_state = "apparel_white"
	mob_overlay_state = "apparel_white"
	allowed = list(/obj/item/melee/skimitar)

/obj/item/clothing/suit/apparel/green
	name = "green cape"
	desc = "Common in the territory of the Elysium Republic, this cape is a traditional casual wear out there."
	icon_state = "apparel_green"
	mob_overlay_state = "apparel_green"
	allowed = list(/obj/item/melee/skimitar)

/obj/item/clothing/suit/apparel/black/long
	name = "black long cape"
	desc = "Common in the territory of the Elysium Republic, this cape is a traditional casual wear out there."
	icon_state = "long_apparel_black"
	mob_overlay_state = "long_apparel_black"
	allowed = list(/obj/item/melee/skimitar)

/obj/item/clothing/suit/apparel/white/long
	name = "white long cape"
	desc = "Common in the territory of the Elysium Republic, this cape is a traditional casual wear out there."
	icon_state = "long_apparel_white"
	mob_overlay_state = "long_apparel_white"
	allowed = list(/obj/item/melee/skimitar)

/obj/item/clothing/suit/space/elysm
	name = "Void"
	desc = "Этого тут быть не должно.."
	icon = 'mod_celadon/_storge_icons/icons/obj/space_item.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/mob/spacesuits.dmi'
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	strip_delay = 80
	equip_delay_other = 80

/obj/item/clothing/suit/space/elysm/junk
	name = "Junk EVA Suit"
	desc = "This EVA suit is composed of some other, more unfortunate space suits, and it looks and works like a piece of junk. It stings and cuts your body if you wear it, and you get a feeling that using a firesuit with some coffee would be a lot better decision..."
	icon_state = "space_junk"
	mob_overlay_state = "space_junk"
	armor = list("melee" = -10, "bullet" = -10, "laser" = 0, "energy" = 0, "bomb" = -20, "bio" = 50, "rad" = 60, "fire" = 0, "acid" = 0)
	slowdown = 0.5
	allowed = list(/obj/item/tank/internals, /obj/item/flashlight)

/obj/item/clothing/suit/space/elysm/EVA_armored
	name = "Elysium EVA Suit"
	desc = "A reinforced EVA space suits with an armor vest attached to it. It has lots of abrasion marks and places where the paint has peeled off, this space suit has definetly seen much. It has Republic of Elysium flag armbands on the left arm and leg."
	icon_state = "space_elysium"
	mob_overlay_state = "space_elysium"
	armor = list("melee" = 30, "bullet" = 20, "laser" = 30, "energy" = 30, "bomb" = 20, "bio" = 50, "rad" = 60, "fire" = 60, "acid" = 75)
	slowdown = 0.5
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/melee/skimitar, /obj/item/gun)

/obj/item/clothing/under/rank/avanpost
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_commander.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/mob/elysium_commander.dmi'

/// CentCom Elyzium
/obj/item/clothing/under/rank/avanpost/elysium_apparel
	name = "\improper Elysium commander's apparel"
	desc = "A traditional apparel worn by Elysium employees. It is dyed in the national color of lettuce, which symbolizes the Starbull Gardens."
	icon_state = "apparel_elysium"
	item_state = "apparel_elysium"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS

/obj/item/clothing/under/rank/avanpost/elysium_apparel_long
	name = "\improper Elysium commander's apparel"
	desc = "A traditional long apparel worn by Elysium employees. It is dyed in the national color of lettuce, which symbolizes the Starbull Gardens."
	icon_state = "long_apparel_elysium"
	item_state = "long_apparel_elysium"
	body_parts_covered = CHEST | GROIN | ARMS | LEGS

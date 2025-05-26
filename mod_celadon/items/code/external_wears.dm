/obj/item/clothing/suit/jacket/archeologist
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "archeologist jacket"
	desc = "A leather jacket used by archeologists. Perfect to store dynamite sticks."
	icon_state = "explorer_jacket"
	item_state = "explorer_jacket"
	blood_overlay_type = "jacket"
	allowed = list(/obj/item/flashlight,
					/obj/item/tank/internals/emergency_oxygen,
					/obj/item/tank/internals/plasmaman,
					/obj/item/toy,
					/obj/item/storage/fancy/cigarettes,
					/obj/item/lighter,
					/obj/item/radio)
	body_parts_covered = CHEST | GROIN | ARMS
	cold_protection = CHEST |GROIN | ARMS
	supports_variations = DIGITIGRADE_VARIATION
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small

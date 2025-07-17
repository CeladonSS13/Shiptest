
//********************
// 		Coat
//********************

/obj/item/clothing/suit/tajaran
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "sun sister robe"
	desc = "A robe worn by the female priests of the S'rand'Marr religion."
	icon_state = "messarobes"
	item_state = "messarobes"
	allowed = list(/obj/item/tank/internals/emergency_oxygen,
					/obj/item/storage/book/bible,
					/obj/item/nullrod,
					/obj/item/reagent_containers/food/drinks/bottle/holywater)

/obj/item/clothing/suit/toggle/tajaran/wool
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "wool coat"
	desc = "An coat, this one is a design commonly found among the Rhazar'Hrujmagh people."
	icon_state = "zhan_coat"
	item_state = "zhan_coat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST | ARMS | GROIN
	togglename = "zhan"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small
	resistance_flags = NONE
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/suit/toggle/tajaran/naval_coat
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "naval coat"
	desc = "A thick wool coat"
	icon_state = "navalcoat"
	item_state = "navalcoat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST | ARMS | GROIN
	togglename = "naval"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small
	resistance_flags = NONE
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/suit/toggle/tajaran/med_coat
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "medical coat"
	desc = "A sterile insulated coat made of leather stitched over fur."
	icon_state = "medcoat"
	item_state = "medcoat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST | ARMS | GROIN
	togglename = "naval"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small
	resistance_flags = NONE
	supports_variations = DIGITIGRADE_VARIATION

/obj/item/clothing/suit/hunting
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "hunting coat"
	desc = "A coat made of pelts. Commonly used by hunters."
	icon_state = "hunter_coat"
	item_state = "hunter_coat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST | ARMS | GROIN
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small
	supports_variations = DIGITIGRADE_VARIATION

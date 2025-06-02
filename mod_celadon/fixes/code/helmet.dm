/*
// MARK: Фиксы шлемов

Включать по умолчанию всем шлемам в игре карманы - плохой подход, что приводит к очевидным багам.
Регулирует какие шлема имеют оверлеи с карманами а какие нет, плюс регулировать фонарик цеплять фонарик.

- Pockets - Могут ли иметь карманы под очки, (очки и прочее)
- Overlays - Отображение очков на шлемах.
- Flashlight - Можно цеплять фонарик на шлем или нет.

// MARK: Отображение Оверлея
*/

/obj/item/proc/get_helmet_overlays()  // returns the icon for overlaying on a helmet
	return mutable_appearance('mod_celadon/_storge_icons/icons/items/clothing/eyes/overlay/helmet_overlays.dmi', icon_state)

/obj/item/proc/get_helmet_overlays_icon()
	return mutable_appearance('mod_celadon/_storge_icons/icons/items/clothing/eyes/helmet_overlays.dmi', icon_state)

// MARK: Null Pockets

/obj/item/clothing/head/helmet
	pocket_storage_component_path = null

// MARK: Pocket + Overlays

/obj/item/clothing/head/helmet/bulletproof
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

/obj/item/clothing/head/helmet/swat
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

/obj/item/clothing/head/helmet/hardliners
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

/obj/item/clothing/head/helmet/inteq
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

/obj/item/clothing/head/helmet/ngr
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

/obj/item/clothing/head/helmet/syndie
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

/obj/item/clothing/head/helmet/medical
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

/obj/item/clothing/head/helmet/sec
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE

// MARK: +Flashlight

/obj/item/clothing/head/helmet/gezena
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE
	can_flashlight = TRUE

/obj/item/clothing/head/helmet/blueshirt
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE
	can_flashlight = TRUE

/obj/item/clothing/head/helmet/frontier
	can_flashlight = TRUE

/obj/item/clothing/head/helmet/riot
	can_flashlight = TRUE

/obj/item/clothing/head/helmet/riot/gamma_vision
	can_flashlight = FALSE

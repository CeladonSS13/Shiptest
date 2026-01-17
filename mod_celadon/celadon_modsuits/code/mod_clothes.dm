/obj/item/mod
	name = "Base MOD"
	desc = "You should not see this, yell at a coder!"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'

/obj/item/mod/module
	name = "MOD module"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_modules.dmi'
	icon_state = "module"
	overlay_icon_file = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_modules.dmi'

/obj/item/mod/module/examine(mob/user)
	. = ..()
	. +=  span_notice("This module takes <b>[complexity]</b> complexity.")

/obj/item/mod/control
	name = "MOD control unit"
	desc = "The control unit of a Modular Outerwear Device, a powered, back-mounted biomimetic suit that protects against various environments."
	icon_state = "control"
	base_icon_state = "control"
	item_state = "mod_control"
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'
	restricted_bodytypes = BODYTYPE_KEPORI|BODYTYPE_VOX
	activation_step_time = 1.5 SECONDS

/obj/item/clothing/head/mod
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'

/obj/item/clothing/suit/mod
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'

	// Убираем инвентарь в костюмах модов
	pocket_storage_component_path = null

/obj/item/clothing/gloves/mod
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'

/obj/item/clothing/shoes/mod
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'

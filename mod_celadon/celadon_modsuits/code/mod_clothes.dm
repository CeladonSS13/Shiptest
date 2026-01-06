/obj/item/mod
	name = "Base MOD"
	desc = "You should not see this, yell at a coder!"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'

/obj/item/mod/module
	name = "MOD module"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_modules.dmi'
	icon_state = "module"
	overlay_icon_file = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_modules.dmi'

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
	name = "MOD helmet"
	desc = "A helmet for a MODsuit."
	icon_state = "standart-helmet"
	base_icon_state = "helmet"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'
	body_parts_covered = HEAD
	heat_protection = HEAD
	cold_protection = HEAD
	obj_flags = IMMUTABLE_SLOW
	visor_flags = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|ALLOWINTERNALS

/obj/item/clothing/suit/mod
	name = "MOD chestplate"
	desc = "A chestplate for a MODsuit."
	icon_state = "standart-chestplate"
	base_icon_state = "chestplate"
	blood_overlay_type = "armor"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'
	body_parts_covered = CHEST|GROIN
	heat_protection = CHEST|GROIN
	cold_protection = CHEST|GROIN
	obj_flags = IMMUTABLE_SLOW
	// Убираем инвентарь в костюмах модов
	pocket_storage_component_path = null

/obj/item/clothing/gloves/mod
	name = "MOD gauntlets"
	desc = "A pair of gauntlets for a MODsuit."
	icon_state = "standart-gauntlets"
	base_icon_state = "gauntlets"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'
	body_parts_covered = HANDS|ARMS
	heat_protection = HANDS|ARMS
	cold_protection = HANDS|ARMS
	obj_flags = IMMUTABLE_SLOW

/obj/item/clothing/shoes/mod
	name = "MOD boots"
	desc = "A pair of boots for a MODsuit."
	icon_state = "standart-boots"
	base_icon_state = "boots"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/mod_clothing.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/mod_suit/overlay/mod_clothing.dmi'
	body_parts_covered = FEET|LEGS
	heat_protection = FEET|LEGS
	cold_protection = FEET|LEGS
	obj_flags = IMMUTABLE_SLOW
	can_be_tied = FALSE
	visor_flags_inv = HIDESHOES

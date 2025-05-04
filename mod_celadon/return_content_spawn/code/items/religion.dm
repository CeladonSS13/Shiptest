/obj/item/clothing/shoes/plate
	name = "Plate Boots"
	desc = "Metal boots, they look heavy."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/feet.dmi'
	icon_state = "crusader"
	w_class = WEIGHT_CLASS_NORMAL
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 60, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60) //does this even do anything on boots?
	clothing_flags = NOSLIP
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT

/obj/item/clothing/shoes/plate/red
	icon_state = "crusader-red"

/obj/item/clothing/shoes/plate/blue
	icon_state = "crusader-blue"

/obj/item/storage/box/itemset/crusader/blue/PopulateContents()
	new /obj/item/clothing/suit/armor/plate/crusader/blue(src)
	new /obj/item/clothing/head/helmet/plate/crusader/blue(src)
	new /obj/item/clothing/gloves/plate/blue(src)
	new /obj/item/clothing/shoes/plate/blue(src)

/obj/item/storage/box/itemset/crusader/red/PopulateContents()
	new /obj/item/clothing/suit/armor/plate/crusader/red(src)
	new /obj/item/clothing/head/helmet/plate/crusader/red(src)
	new /obj/item/clothing/gloves/plate/red(src)
	new /obj/item/clothing/shoes/plate/red(src)

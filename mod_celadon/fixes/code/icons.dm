// Чинит различные спрайты, криво залитые офами

// Чиним отображение стакана с топливом. Было пусто...
/datum/reagent/fuel
	glass_icon_state = "fuel_glass"

// Чиним оливки, спрайт был с лишним пикселем...
/obj/item/garnish
	icon = 'mod_celadon/_storge_icons/icons/items/misc/overlay/modglass_garnishes_items.dmi'

/obj/item/storage/box/ammo/a556_42
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556_42box_big"

/obj/item/storage/box/ammo/a556_42/ap
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556_42box_big-ap"

/obj/item/storage/box/ammo/a556_42/hp
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556_42box_big-hp"

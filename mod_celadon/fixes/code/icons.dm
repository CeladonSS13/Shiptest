// Чинит различные спрайты, криво залитые офами

// Чиним отображение стакана с топливом. Было пусто...
/datum/reagent/fuel
	glass_icon_state = "fuel_glass"

// Чиним оливки, спрайт был с лишним пикселем...
/obj/item/garnish
	icon = 'mod_celadon/_storge_icons/icons/food_and_drinks/modglass_garnishes_items.dmi'

// Чиним отображение взрывкопья в левой руке
/obj/item/melee/spear/explosive
	lefthand_file = 'mod_celadon/_storge_icons/icons/mob/hands/weapons_hands_left.dmi'

// Чиним отображение клариса сансов
/obj/item/gun/ballistic/automatic/powered/gauss/claris/suns
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/mob/weapons.dmi'

// Чинит различные спрайты, криво залитые офами

// Чиним отображение стакана с топливом. Было пусто...
/datum/reagent/fuel
	glass_icon_state = "fuel_glass"

// Чиним оливки, спрайт был с лишним пикселем...
/obj/item/garnish
	icon = 'mod_celadon/_storage_icons/icons/items/misc/overlay/modglass_garnishes_items.dmi'


/obj/item/gun/energy/e_gun/hades
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'

/obj/item/gun/energy/pulse
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'

/obj/item/gun/energy/pulse/carbine
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob.dmi'

// Чинит капюшоны, путем запрета взятия капюшона из карманов толстовки
//TODO: Чтобы починилось все на свете с худями, надо называть и капюшоны и одежду одним именем
/obj/item/clothing/head/hooded/attack_hand(mob/user)
	if(loc == suit && suit)
		to_chat(user, span_warning("The hood is attached to [suit]!"))
		return
	return ..()

/obj/item/clothing/head/hooded/MouseDrop(atom/over_object)
	if(loc == suit && suit)
		return
	return ..()

// JETPACK_RESPRITE
/obj/item/tank
	pickup_sound = 'mod_celadon/_storage_sounds/sound/items/gas_tank_pick_up.ogg'
	drop_sound = 'mod_celadon/_storage_sounds/sound/items/gas_tank_drop.ogg'

/obj/item/tank/internals/plasmaman
	icon = 'mod_celadon/_storage_icons/icons/items/misc/tank.dmi'

/obj/item/tank/jetpack
	icon = 'mod_celadon/_storage_icons/icons/items/misc/tank.dmi'
	var/classic = TRUE

/obj/item/tank/jetpack/update_icon_state()
	. = ..()
	if(classic)
		if(on)
			icon_state = "[initial(icon_state)]-on"
		else
			icon_state = initial(icon_state)

/obj/item/tank/jetpack/update_overlays()
	. = ..()
	if(!classic && on)
		. += "on_overlay"

/obj/item/tank/jetpack/improvised
	classic = FALSE

/obj/item/tank/jetpack/oxygen
	classic = FALSE

/obj/item/tank/jetpack/oxygen/captain
	classic = FALSE

/obj/item/tank/jetpack/oxygen/security
	classic = FALSE

/obj/item/tank/jetpack/carbondioxide
	classic = FALSE

/obj/item/tank
	var/alert_level = 0 //1 = nominal, 2 = warning, 3 = critical warning, 4 = empty

/obj/item/tank/internals/oxygen
	icon = 'mod_celadon/_storage_icons/icons/items/misc/tank.dmi'

/obj/item/tank/internals/anesthetic
	icon = 'mod_celadon/_storage_icons/icons/items/misc/tank.dmi'

/obj/item/tank/internals/plasmaman
	icon = 'mod_celadon/_storage_icons/icons/items/misc/tank.dmi'

/obj/item/tank/internals/emergency_oxygen
	icon = 'mod_celadon/_storage_icons/icons/items/misc/tank.dmi'

/obj/item/tank/internals/generic
	icon = 'mod_celadon/_storage_icons/icons/items/misc/tank.dmi'

/obj/item/tank/update_overlays()
	. = ..()
	var/status_overlay_icon_state
	var/pressure = air_contents.return_pressure()

	// Switches the pressure status overlay depending on which range the tank pressure lies in
	// The extra icon state check prevents the icon state from being changed if it's already set to it
	switch(pressure)
		if((5 * ONE_ATMOSPHERE) to (29 * ONE_ATMOSPHERE))
			status_overlay_icon_state = "status_nominal"
		if((2 * ONE_ATMOSPHERE) to (5 * ONE_ATMOSPHERE))
			status_overlay_icon_state = "status_warning"
		if((0.75 * ONE_ATMOSPHERE) to (2 * ONE_ATMOSPHERE))
			status_overlay_icon_state = "status_alert"
		if((0.1 * ONE_ATMOSPHERE) to (0.75 * ONE_ATMOSPHERE))
			status_overlay_icon_state = "status_critical"
		else
			status_overlay_icon_state = null

	// Actually sets the overlay. As of now, this has only been done for smaller emergency tanks
	// The if statement is set as follows due to the coarse search type that the istype proc conducts, as subtypes count as valid types
	var/mutable_appearance/status_overlay = mutable_appearance(icon, status_overlay_icon_state)
	if(istype(src, /obj/item/tank/internals/emergency_oxygen/double))
		status_overlay.pixel_x = 1
		status_overlay.pixel_y = 2
	. += status_overlay

// adjusts sprites and issues text alerts depending on tank pressure
/obj/item/tank/proc/pressure_alerts()
	var/pressure = air_contents.return_pressure()
	// Prevents jetpacks from sending any kind of pressure alert
	if(istype(src, /obj/item/tank/jetpack))
		return 0

	// Checks the pressure of the tank while it's in use and sends an alert out when the pressure reaches a specific range.
	switch(pressure)
		if((5 * ONE_ATMOSPHERE) to (29 * ONE_ATMOSPHERE))
			if(alert_level != 1)
				alert_level = 1
				update_overlays()
		if((2 * ONE_ATMOSPHERE) to (5 * ONE_ATMOSPHERE))
			if(alert_level != 2)
				alert_level = 2
				update_overlays()
		if((0.75 * ONE_ATMOSPHERE) to (2 * ONE_ATMOSPHERE))
			if(alert_level != 3)
				alert_level = 3
				update_overlays()
				playsound(src, 'sound/machines/twobeep_high.ogg', 30, FALSE)
				say("Tank is at [pressure] kPa! Pressure critically low! -- Estimated time until depletion: [src.volume * 2.5] minutes.")
		if((0.01 * ONE_ATMOSPHERE) to (0.75 * ONE_ATMOSPHERE))
			if(alert_level != 4)
				alert_level = 4
				update_overlays()
				playsound(src, 'sound/machines/twobeep_high.ogg', 30, FALSE)
				playsound(src, 'sound/machines/beep.ogg', 30, FALSE)
				say("Tank is nearly empty! Replacement recommended!")

	update_appearance(UPDATE_OVERLAYS)

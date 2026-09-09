/obj/item/implant/vital_sensor
	name = "vital sensor (MK1)"
	desc = "An implantable sensor. Works regardless of clothing and reports status only to a paired monitor."
	implant_color = "b"
	activated = FALSE
	allow_multiple = FALSE
	/// Custom label shown on the bound monitor.
	var/sensor_alias
	/// Whether this sensor reports brute/burn/tox/oxy.
	var/show_vitals = FALSE
	/// Whether this sensor can report overmap sector after death.
	var/reports_sector = FALSE
	/// Delay after death before the sector is revealed.
	var/sector_delay = 5 MINUTES
	/// World time until EMP interference ends.
	var/emp_disabled_until = 0
	/// Bound handheld monitor.
	var/datum/weakref/linked_monitor

/obj/item/implant/vital_sensor/advanced
	name = "vital sensor (MK2)"
	desc = "An advanced implantable sensor. Reports vitals and, five minutes after death, the host's sector and coordinates."
	implant_color = "r"
	show_vitals = TRUE
	reports_sector = TRUE

/obj/item/implant/vital_sensor/Destroy()
	var/obj/item/health_sensor_monitor/monitor = linked_monitor?.resolve()
	if(monitor)
		monitor.unlink_sensor(src, silent = TRUE)
	linked_monitor = null
	return ..()

/obj/item/implant/vital_sensor/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	emp_disabled_until = world.time + (severity == EMP_HEAVY ? 60 SECONDS : 30 SECONDS)

/obj/item/implant/vital_sensor/can_be_implanted_in(mob/living/target)
	return iscarbon(target)

/obj/item/implant/vital_sensor/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	if(!force)
		for(var/obj/item/implant/vital_sensor/other in target.implants)
			if(other == src)
				continue
			if(user)
				to_chat(user, span_warning("[target] already has a vital sensor implanted."))
			return FALSE
	return ..()

/obj/item/implant/vital_sensor/get_data()
	return {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> [name]<BR>
				<b>Function:</b> Transmits host status to a paired handheld monitor.<BR>
				<b>Notes:</b> Independent of clothing. One sensor per host."}

/obj/item/implant/vital_sensor/examine(mob/user)
	. = ..()
	if(sensor_alias)
		. += span_notice("Labeled as <b>[sensor_alias]</b>.")
	var/obj/item/health_sensor_monitor/monitor = linked_monitor?.resolve()
	if(monitor)
		. += span_notice("Paired with [monitor].")
	else
		. += span_notice("Not paired. Click this on a vital sensor monitor to bind it.")
	if(imp_in)
		. += span_notice("Currently implanted in [imp_in].")

/obj/item/implant/vital_sensor/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/pen))
		rename_sensor(user)
		return
	return ..()

/obj/item/implant/vital_sensor/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(istype(target, /obj/item/health_sensor_monitor))
		var/obj/item/health_sensor_monitor/monitor = target
		monitor.pair_sensor(src, user)

/obj/item/implant/vital_sensor/proc/can_rename(mob/user)
	if(!user || !user.client)
		return FALSE
	if(user.is_holding(src))
		return TRUE
	if(imp_in && (user == imp_in || user.Adjacent(imp_in)))
		return TRUE
	var/obj/item/health_sensor_monitor/monitor = linked_monitor?.resolve()
	if(monitor && user.is_holding(monitor))
		return TRUE
	return FALSE

/obj/item/implant/vital_sensor/proc/rename_sensor(mob/user)
	if(!user.is_literate())
		to_chat(user, span_notice("You scribble illegibly on [src]!"))
		return
	if(!can_rename(user))
		return
	var/new_alias = tgui_input_text(user, "Sensor label shown on the paired monitor. Leave empty to show the host name.", "Rename Sensor", sensor_alias, MAX_NAME_LEN)
	if(isnull(new_alias) || !can_rename(user))
		return
	sensor_alias = trim(new_alias)
	if(sensor_alias)
		to_chat(user, span_notice("You label [src] as <b>[sensor_alias]</b>."))
	else
		to_chat(user, span_notice("You clear the label on [src]."))

/obj/item/implant/vital_sensor/proc/is_jammed()
	return world.time < emp_disabled_until

/obj/item/implant/vital_sensor/proc/get_display_name()
	var/host_name = imp_in ? imp_in.real_name : "unimplanted"
	if(sensor_alias)
		return "[sensor_alias] ([host_name])"
	return host_name

/obj/item/implant/vital_sensor/proc/get_life_status()
	if(!imp_in || is_jammed())
		return VITAL_SENSOR_NOSIGNAL
	if(imp_in.stat == DEAD || HAS_TRAIT(imp_in, TRAIT_FAKEDEATH))
		if(imp_in.key || imp_in.get_ghost(FALSE, TRUE))
			return VITAL_SENSOR_DEAD
		return VITAL_SENSOR_DNR
	if(imp_in.stat >= SOFT_CRIT)
		return VITAL_SENSOR_CRIT
	return VITAL_SENSOR_ALIVE

/obj/item/implant/vital_sensor/proc/get_overmap_track()
	if(!reports_sector)
		return list("location" = "-", "coords" = "-")
	if(!imp_in || is_jammed())
		return list("location" = "No signal", "coords" = "-")
	var/host_dead = (imp_in.stat == DEAD || HAS_TRAIT(imp_in, TRAIT_FAKEDEATH))
	if(!host_dead)
		return list("location" = "Locked", "coords" = "Locked")
	var/death_time = imp_in.timeofdeath
	if(death_time && world.time < death_time + sector_delay)
		return list("location" = "Acquiring...", "coords" = "Acquiring...")
	var/datum/overmap/overmap_loc = SSovermap.get_overmap_object_by_location(imp_in)
	if(!overmap_loc)
		return list("location" = "Unknown sector", "coords" = "Unknown")
	var/sector_name = overmap_loc.current_overmap?.name
	var/place_name = overmap_loc.name
	if(overmap_loc.docked_to)
		place_name = "[place_name] ([overmap_loc.docked_to.name])"
	var/datum/overmap/coord_source = overmap_loc
	if(isnull(overmap_loc.x) && overmap_loc.docked_to)
		coord_source = overmap_loc.docked_to
	var/coords_text = "Unknown"
	if(!isnull(coord_source.x) && !isnull(coord_source.y))
		coords_text = "[coord_source.x], [coord_source.y]"
	var/location_text = sector_name ? "[sector_name] - [place_name]" : place_name
	return list("location" = location_text, "coords" = coords_text)

/obj/item/implant/vital_sensor/proc/ui_sensor_data(watched)
	var/list/data = list()
	data["ref"] = REF(src)
	data["name"] = get_display_name()
	data["alias"] = sensor_alias
	data["implanted"] = !!imp_in
	data["show_vitals"] = show_vitals
	data["reports_sector"] = reports_sector
	data["watched"] = watched
	var/status = get_life_status()
	data["status"] = (!show_vitals && status == VITAL_SENSOR_CRIT) ? VITAL_SENSOR_ALIVE : status
	var/list/track = get_overmap_track()
	data["location"] = track["location"]
	data["coords"] = track["coords"]
	data["oxydam"] = null
	data["toxdam"] = null
	data["burndam"] = null
	data["brutedam"] = null
	if(show_vitals && imp_in && !is_jammed() && data["status"] != VITAL_SENSOR_NOSIGNAL)
		data["oxydam"] = round(imp_in.getOxyLoss())
		data["toxdam"] = round(imp_in.getToxLoss())
		data["burndam"] = round(imp_in.getFireLoss())
		data["brutedam"] = round(imp_in.getBruteLoss())
	return data

/obj/item/implantcase/vital_sensor
	name = "implant case - 'Vital Sensor MK1'"
	desc = "A glass case containing a MK1 vital sensor implant."
	imp_type = /obj/item/implant/vital_sensor

/obj/item/implantcase/vital_sensor/advanced
	name = "implant case - 'Vital Sensor MK2'"
	desc = "A glass case containing a MK2 vital sensor implant."
	imp_type = /obj/item/implant/vital_sensor/advanced

/obj/item/implanter/vital_sensor
	name = "implanter (vital sensor MK1)"
	imp_type = /obj/item/implant/vital_sensor

/obj/item/implanter/vital_sensor/advanced
	name = "implanter (vital sensor MK2)"
	imp_type = /obj/item/implant/vital_sensor/advanced

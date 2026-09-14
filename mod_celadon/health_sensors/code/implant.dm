/obj/item/organ/cyberimp/chest/vital_sensor
	name = "vital sensor (MK1)"
	desc = "An implantable chest augment. Works regardless of clothing and reports status, sector, and turf coordinates to a paired monitor."
	implant_color = "#3399FF"
	slot = ORGAN_SLOT_VITAL_SENSOR
	w_class = WEIGHT_CLASS_TINY
	/// Custom label shown on the bound monitor.
	var/sensor_alias
	/// Whether this sensor reports brute/burn/tox/oxy.
	var/show_vitals = FALSE
	/// Whether this sensor can report overmap sector after death.
	var/reports_sector = TRUE
	/// Delay after death before the sector is revealed.
	var/sector_delay = 5 MINUTES
	/// World time until EMP interference ends.
	var/emp_disabled_until = 0
	/// Bound handheld monitor.
	var/datum/weakref/linked_monitor

/obj/item/organ/cyberimp/chest/vital_sensor/advanced
	name = "vital sensor (MK2)"
	desc = "An advanced chest augment. Reports vitals and, five minutes after death, the host's sector and turf coordinates."
	implant_color = "#CC3333"
	show_vitals = TRUE

/obj/item/organ/cyberimp/chest/vital_sensor/Destroy()
	var/obj/item/health_sensor_monitor/monitor = linked_monitor?.resolve()
	if(monitor)
		monitor.unlink_sensor(src, silent = TRUE)
	linked_monitor = null
	return ..()

/obj/item/organ/cyberimp/chest/vital_sensor/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	emp_disabled_until = world.time + (severity == EMP_HEAVY ? 60 SECONDS : 30 SECONDS)

/obj/item/organ/cyberimp/chest/vital_sensor/examine(mob/user)
	. = ..()
	if(sensor_alias)
		. += span_notice("Labeled as <b>[sensor_alias]</b>.")
	var/obj/item/health_sensor_monitor/monitor = linked_monitor?.resolve()
	if(monitor)
		. += span_notice("Paired with [monitor].")
	else
		. += span_notice("Not paired. Click this on a vital sensor monitor to bind it.")
	if(owner)
		. += span_notice("Currently implanted in [owner].")
	else
		. += span_notice("Implant with Organ manipulation (chest), or load into an implanter.")

/obj/item/organ/cyberimp/chest/vital_sensor/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/pen))
		rename_sensor(user)
		return
	if(istype(W, /obj/item/implanter))
		var/obj/item/implanter/implanter = W
		implanter.load_vital_sensor(src, user)
		return
	return ..()

/obj/item/organ/cyberimp/chest/vital_sensor/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(istype(target, /obj/item/health_sensor_monitor))
		var/obj/item/health_sensor_monitor/monitor = target
		monitor.pair_sensor(src, user)

/obj/item/organ/cyberimp/chest/vital_sensor/proc/can_rename(mob/user)
	if(!user || !user.client)
		return FALSE
	if(user.is_holding(src))
		return TRUE
	if(owner && (user == owner || user.Adjacent(owner)))
		return TRUE
	var/obj/item/health_sensor_monitor/monitor = linked_monitor?.resolve()
	if(monitor && user.is_holding(monitor))
		return TRUE
	return FALSE

/obj/item/organ/cyberimp/chest/vital_sensor/proc/rename_sensor(mob/user)
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

/obj/item/organ/cyberimp/chest/vital_sensor/proc/is_jammed()
	return world.time < emp_disabled_until

/obj/item/organ/cyberimp/chest/vital_sensor/proc/get_display_name()
	var/host_name = owner ? owner.real_name : "unimplanted"
	if(sensor_alias)
		return "[sensor_alias] ([host_name])"
	return host_name

/obj/item/organ/cyberimp/chest/vital_sensor/proc/get_life_status()
	if(!owner || is_jammed())
		return VITAL_SENSOR_NOSIGNAL
	if(owner.stat == DEAD || HAS_TRAIT(owner, TRAIT_FAKEDEATH))
		if(owner.key || owner.get_ghost(FALSE, TRUE))
			return VITAL_SENSOR_DEAD
		return VITAL_SENSOR_DNR
	if(owner.stat >= SOFT_CRIT)
		return VITAL_SENSOR_CRIT
	return VITAL_SENSOR_ALIVE

/obj/item/organ/cyberimp/chest/vital_sensor/proc/get_overmap_track()
	if(!reports_sector)
		return list("location" = "-", "coords" = "-")
	if(!owner || is_jammed())
		return list("location" = "No signal", "coords" = "-")
	var/host_dead = (owner.stat == DEAD || HAS_TRAIT(owner, TRAIT_FAKEDEATH))
	if(!host_dead)
		return list("location" = "Locked", "coords" = "Locked")
	var/death_time = owner.timeofdeath
	if(death_time && world.time < death_time + sector_delay)
		return list("location" = "Acquiring...", "coords" = "Acquiring...")
	var/location_text = "Unknown sector"
	var/datum/overmap/overmap_loc = SSovermap.get_overmap_object_by_location(owner)
	if(overmap_loc)
		var/sector_name = overmap_loc.current_overmap?.name
		var/place_name = overmap_loc.name
		if(overmap_loc.docked_to)
			place_name = "[place_name] ([overmap_loc.docked_to.name])"
		location_text = sector_name ? "[sector_name] - [place_name]" : place_name
	var/turf/body_turf = get_turf(owner)
	var/coords_text = "Unknown"
	if(body_turf)
		coords_text = "[body_turf.x], [body_turf.y]"
	return list("location" = location_text, "coords" = coords_text)

/obj/item/organ/cyberimp/chest/vital_sensor/proc/ui_sensor_data(watched)
	var/list/data = list()
	data["ref"] = REF(src)
	data["name"] = get_display_name()
	data["alias"] = sensor_alias
	data["implanted"] = !!owner
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
	if(show_vitals && owner && !is_jammed() && data["status"] != VITAL_SENSOR_NOSIGNAL)
		data["oxydam"] = round(owner.getOxyLoss())
		data["toxdam"] = round(owner.getToxLoss())
		data["burndam"] = round(owner.getFireLoss())
		data["brutedam"] = round(owner.getBruteLoss())
	return data

/obj/item/implanter
	/// Loaded vital sensor organ, used alongside regular implant payloads.
	var/obj/item/organ/cyberimp/chest/vital_sensor/vital_imp
	/// Optional organ type to spawn inside the implanter on init.
	var/vital_imp_type

/obj/item/implanter/Initialize(mapload)
	. = ..()
	if(imp_type)
		imp = new imp_type(src)
	if(vital_imp_type && !vital_imp)
		vital_imp = new vital_imp_type(src)
	update_appearance()

/obj/item/implanter/examine(mob/user)
	. = ..()
	if(vital_imp)
		. += span_notice("It is loaded with [vital_imp]. Use in hand to unload.")

/obj/item/implanter/update_icon_state()
	icon_state = "implanter[(imp || vital_imp) ? 1 : 0]"
	return ..()

/obj/item/implanter/attack(mob/living/M, mob/user)
	if(vital_imp)
		implant_vital_sensor(M, user)
		return
	if(!istype(M))
		return
	if(user && imp)
		if(M != user)
			M.visible_message(span_warning("[user] is attempting to implant [M]."))

		var/turf/T = get_turf(M)
		if(T && (M == user || do_after(user, 5 SECONDS, M)))
			if(src && imp)
				if(imp.implant(M, user))
					if (M == user)
						to_chat(user, span_notice("You implant yourself."))
					else
						M.visible_message(span_notice("[user] implants [M]."), span_notice("[user] implants you."))
					imp = null
					update_appearance()
				else
					to_chat(user, span_warning("[src] fails to implant [M]."))

/obj/item/implanter/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/organ/cyberimp/chest/vital_sensor))
		load_vital_sensor(W, user)
		return
	if(istype(W, /obj/item/pen))
		if(!user.is_literate())
			to_chat(user, span_notice("You prod at [src] with [W]!"))
			return
		var/t = stripped_input(user, "What would you like the label to be?", name, null)
		if(user.get_active_held_item() != W)
			return
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		if(t)
			name = "implanter ([t])"
		else
			name = "implanter"
	else
		return ..()

/obj/item/implanter/attack_self(mob/user)
	if(!vital_imp)
		return ..()
	var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = vital_imp
	vital_imp = null
	if(!user.put_in_hands(sensor))
		sensor.forceMove(drop_location())
	to_chat(user, span_notice("You remove [sensor] from [src]."))
	update_appearance()

/obj/item/implanter/proc/load_vital_sensor(obj/item/organ/cyberimp/chest/vital_sensor/sensor, mob/user)
	if(!istype(sensor))
		return FALSE
	if(sensor.owner)
		to_chat(user, span_warning("[sensor] is still implanted."))
		return TRUE
	if(vital_imp == sensor)
		return TRUE
	if(imp || vital_imp)
		to_chat(user, span_warning("[src] already has something loaded."))
		return TRUE
	if(sensor.loc != src)
		if(!user.transferItemToLoc(sensor, src))
			to_chat(user, span_warning("You fail to load [sensor] into [src]."))
			return TRUE
	vital_imp = sensor
	update_appearance()
	to_chat(user, span_notice("You load [sensor] into [src]."))
	return TRUE

/obj/item/implanter/proc/implant_vital_sensor(mob/living/M, mob/user)
	if(!istype(M) || !user || !vital_imp)
		return
	if(!iscarbon(M))
		to_chat(user, span_warning("[M] cannot receive a vital sensor."))
		return
	var/mob/living/carbon/C = M
	if(C.getorganslot(ORGAN_SLOT_VITAL_SENSOR))
		to_chat(user, span_warning("[M] already has a vital sensor implanted."))
		return
	if(M != user)
		M.visible_message(span_warning("[user] is attempting to implant [M]."))
	if(!(M == user || do_after(user, 5 SECONDS, M)))
		return
	if(QDELETED(src) || QDELETED(vital_imp) || vital_imp.owner)
		return
	if(C.getorganslot(ORGAN_SLOT_VITAL_SENSOR))
		to_chat(user, span_warning("[M] already has a vital sensor implanted."))
		return
	if(!vital_imp.Insert(C))
		to_chat(user, span_warning("[src] fails to implant [M]."))
		return
	if(M == user)
		to_chat(user, span_notice("You implant yourself."))
	else
		M.visible_message(span_notice("[user] implants [M]."), span_notice("[user] implants you."))
	vital_imp = null
	update_appearance()

/obj/item/implantcase/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/implanter))
		var/obj/item/implanter/I = W
		if(I.vital_imp)
			to_chat(user, span_warning("[I] already has something loaded."))
			return
		if(I.imp)
			if(imp || I.imp.imp_in)
				return
			I.imp.forceMove(src)
			imp = I.imp
			I.imp = null
			update_appearance()
			reagents = imp.reagents
			I.update_appearance()
		else
			if(imp)
				if(I.imp || I.vital_imp)
					return
				imp.forceMove(I)
				I.imp = imp
				imp = null
				reagents = null
				update_appearance()
			I.update_appearance()
		return
	if(istype(W, /obj/item/pen))
		if(!user.is_literate())
			to_chat(user, span_notice("You scribble illegibly on the side of [src]!"))
			return
		var/t = stripped_input(user, "What would you like the label to be?", name, null)
		if(user.get_active_held_item() != W)
			return
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		if(t)
			name = "implant case - '[t]'"
		else
			name = "implant case"
	else
		return ..()

/obj/item/implanter/vital_sensor
	name = "implanter (vital sensor MK1)"
	vital_imp_type = /obj/item/organ/cyberimp/chest/vital_sensor

/obj/item/implanter/vital_sensor/advanced
	name = "implanter (vital sensor MK2)"
	vital_imp_type = /obj/item/organ/cyberimp/chest/vital_sensor/advanced

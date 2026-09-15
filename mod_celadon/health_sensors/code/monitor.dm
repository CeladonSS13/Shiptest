/obj/item/health_sensor_monitor
	name = "vital sensor monitor"
	desc = "A handheld monitor for implanted vital sensors. Shows status only for hosts bound to this device."
	icon = 'mod_celadon/_storage_icons/icons/health_sensors/vital_monitor.dmi'
	icon_state = "good"
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	custom_price = 1500
	custom_materials = list(/datum/material/iron = 1000, /datum/material/glass = 500)
	pickup_sound = 'sound/items/handling/device_pickup.ogg'
	drop_sound = 'sound/items/handling/device_drop.ogg'
	/// REF(sensor) -> weakref
	var/list/linked_sensors = list()
	/// REF(sensor) -> TRUE for sensors currently watched
	var/list/watched_sensors = list()
	var/audio_alerts = TRUE
	var/visual_alerts = TRUE
	var/alarming = FALSE
	/// Last alert sound we played, so we can retrigger immediately on severity change.
	var/last_alert_sound
	var/next_alert_sound = 0

/obj/item/health_sensor_monitor/Initialize(mapload)
	. = ..()
	linked_sensors = list()
	watched_sensors = list()

/obj/item/health_sensor_monitor/Destroy()
	for(var/sensor_ref in linked_sensors)
		var/datum/weakref/sensor_weak = linked_sensors[sensor_ref]
		var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = sensor_weak?.resolve()
		if(sensor && sensor.linked_monitor?.resolve() == src)
			sensor.linked_monitor = null
	linked_sensors = null
	watched_sensors = null
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/health_sensor_monitor/examine(mob/user)
	. = ..()
	. += span_notice("Click a vital sensor, a loaded implanter, or an implanted host to pair.")
	. += span_notice("[length(linked_sensors)] sensor\s bound. Speaker: [audio_alerts ? "on" : "off"]. Warning light: [visual_alerts ? "on" : "off"].")

/obj/item/health_sensor_monitor/attack_self(mob/user)
	ui_interact(user)

/obj/item/health_sensor_monitor/attackby(obj/item/I, mob/user, params)
	if(pair_from_item(I, user))
		return
	return ..()

/obj/item/health_sensor_monitor/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(pair_from_item(target, user))
		return
	if(!isliving(target))
		return
	var/mob/living/carbon/host = target
	if(!istype(host))
		to_chat(user, span_warning("[target] cannot have a vital sensor."))
		return
	var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = host.getorganslot(ORGAN_SLOT_VITAL_SENSOR)
	if(!sensor)
		to_chat(user, span_warning("[host] has no vital sensor implanted."))
		return
	pair_sensor(sensor, user)

/obj/item/health_sensor_monitor/proc/pair_from_item(atom/target, mob/user)
	if(istype(target, /obj/item/organ/cyberimp/chest/vital_sensor))
		pair_sensor(target, user)
		return TRUE
	if(istype(target, /obj/item/implanter))
		var/obj/item/implanter/implanter = target
		if(istype(implanter.vital_imp, /obj/item/organ/cyberimp/chest/vital_sensor))
			pair_sensor(implanter.vital_imp, user)
			return TRUE
	if(istype(target, /obj/item/organ_storage) && length(target.contents))
		var/obj/item/stored = target.contents[1]
		if(istype(stored, /obj/item/organ/cyberimp/chest/vital_sensor))
			pair_sensor(stored, user)
			return TRUE
	return FALSE

/obj/item/health_sensor_monitor/proc/pair_sensor(obj/item/organ/cyberimp/chest/vital_sensor/sensor, mob/user)
	if(!istype(sensor))
		return
	var/sensor_ref = REF(sensor)
	if(linked_sensors[sensor_ref])
		to_chat(user, span_notice("[sensor] is already bound to [src]."))
		return
	var/obj/item/health_sensor_monitor/old_monitor = sensor.linked_monitor?.resolve()
	if(old_monitor && old_monitor != src)
		old_monitor.unlink_sensor(sensor, silent = TRUE)
		to_chat(user, span_notice("[sensor] is unbound from [old_monitor]."))
	linked_sensors[sensor_ref] = WEAKREF(sensor)
	sensor.linked_monitor = WEAKREF(src)
	to_chat(user, span_notice("You bind [sensor] to [src]."))
	playsound(src, 'sound/machines/twobeep.ogg', 30, TRUE)

/obj/item/health_sensor_monitor/proc/unlink_sensor(obj/item/organ/cyberimp/chest/vital_sensor/sensor, silent = FALSE)
	if(!sensor || !linked_sensors)
		return
	var/sensor_ref = REF(sensor)
	linked_sensors -= sensor_ref
	watched_sensors -= sensor_ref
	if(sensor.linked_monitor?.resolve() == src)
		sensor.linked_monitor = null
	if(!silent)
		visible_message(span_notice("[src] unbinds [sensor]."))
	if(!length(watched_sensors))
		STOP_PROCESSING(SSobj, src)
		set_alarming(FALSE)

/obj/item/health_sensor_monitor/proc/prune_sensors()
	for(var/sensor_ref in linked_sensors)
		var/datum/weakref/sensor_weak = linked_sensors[sensor_ref]
		if(!sensor_weak?.resolve())
			linked_sensors -= sensor_ref
			watched_sensors -= sensor_ref
	if(!length(watched_sensors))
		STOP_PROCESSING(SSobj, src)

/obj/item/health_sensor_monitor/proc/get_alert_level(obj/item/organ/cyberimp/chest/vital_sensor/sensor)
	if(!sensor?.owner || sensor.is_jammed())
		return
	var/status = sensor.get_life_status()
	if(status == VITAL_SENSOR_DEAD || status == VITAL_SENSOR_DNR)
		return VITAL_SENSOR_DEAD
	if(status == VITAL_SENSOR_CRIT)
		return VITAL_SENSOR_CRIT

/obj/item/health_sensor_monitor/process(seconds_per_tick)
	prune_sensors()
	if(!length(watched_sensors))
		set_alarming(FALSE)
		return PROCESS_KILL
	var/alert_level
	for(var/sensor_ref in watched_sensors)
		var/datum/weakref/sensor_weak = linked_sensors[sensor_ref]
		var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = sensor_weak?.resolve()
		var/level = get_alert_level(sensor)
		if(level == VITAL_SENSOR_DEAD)
			alert_level = VITAL_SENSOR_DEAD
			break
		if(level == VITAL_SENSOR_CRIT)
			alert_level = VITAL_SENSOR_CRIT
	set_alarming(!!alert_level)
	if(!alert_level)
		last_alert_sound = null
		return
	if(!audio_alerts)
		return
	if(alert_level == last_alert_sound && world.time < next_alert_sound)
		return
	last_alert_sound = alert_level
	next_alert_sound = world.time + (alert_level == VITAL_SENSOR_DEAD ? 3 SECONDS : 2 SECONDS)
	if(alert_level == VITAL_SENSOR_DEAD)
		playsound(src, 'mod_celadon/_storage_sounds/sound/health_sensors/patient_dead.ogg', 40, FALSE)
	else
		playsound(src, 'mod_celadon/_storage_sounds/sound/health_sensors/patient_bad.ogg', 40, FALSE)

/obj/item/health_sensor_monitor/proc/set_alarming(new_state)
	if(alarming == new_state)
		return
	alarming = new_state
	refresh_alarm_visuals()

/obj/item/health_sensor_monitor/proc/refresh_alarm_visuals()
	update_appearance()

/obj/item/health_sensor_monitor/update_icon_state()
	icon_state = (alarming && visual_alerts) ? "bad" : "good"
	return ..()

/obj/item/health_sensor_monitor/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	for(var/sensor_ref in linked_sensors.Copy())
		var/datum/weakref/sensor_weak = linked_sensors[sensor_ref]
		var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = sensor_weak?.resolve()
		if(sensor)
			unlink_sensor(sensor, silent = TRUE)
	visible_message(span_warning("[src] frantically beeps as its bindings scramble!"))

/obj/item/health_sensor_monitor/ui_state(mob/user)
	return GLOB.hands_state

/obj/item/health_sensor_monitor/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HealthSensorMonitor")
		ui.open()
	ui.set_autoupdate(TRUE)

/obj/item/health_sensor_monitor/ui_data(mob/user)
	prune_sensors()
	var/list/data = list()
	data["audio_alerts"] = audio_alerts
	data["visual_alerts"] = visual_alerts
	var/list/sensors = list()
	for(var/sensor_ref in linked_sensors)
		var/datum/weakref/sensor_weak = linked_sensors[sensor_ref]
		var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = sensor_weak?.resolve()
		if(!sensor)
			continue
		sensors += list(sensor.ui_sensor_data(!!watched_sensors[sensor_ref]))
	data["sensors"] = sensors
	return data

/obj/item/health_sensor_monitor/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	switch(action)
		if("toggle_audio")
			audio_alerts = !audio_alerts
			return TRUE
		if("toggle_visual")
			visual_alerts = !visual_alerts
			refresh_alarm_visuals()
			return TRUE
		if("toggle_watch")
			var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = locate(params["ref"])
			if(!sensor || !linked_sensors[REF(sensor)])
				return
			var/sensor_ref = REF(sensor)
			if(watched_sensors[sensor_ref])
				watched_sensors -= sensor_ref
			else
				watched_sensors[sensor_ref] = TRUE
				START_PROCESSING(SSobj, src)
			if(!length(watched_sensors))
				STOP_PROCESSING(SSobj, src)
				set_alarming(FALSE)
			return TRUE
		if("unpair")
			var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = locate(params["ref"])
			if(!sensor || !linked_sensors[REF(sensor)])
				return
			var/choice = tgui_alert(usr, "Unbind [sensor.get_display_name()] from this monitor?", "Unpair Sensor", list("Yes", "No"))
			if(choice != "Yes")
				return
			if(QDELETED(src) || QDELETED(sensor) || !linked_sensors[REF(sensor)])
				return
			if(!usr.is_holding(src))
				return
			unlink_sensor(sensor)
			return TRUE
		if("rename")
			var/obj/item/organ/cyberimp/chest/vital_sensor/sensor = locate(params["ref"])
			if(!sensor || !linked_sensors[REF(sensor)])
				return
			sensor.rename_sensor(usr)
			return TRUE

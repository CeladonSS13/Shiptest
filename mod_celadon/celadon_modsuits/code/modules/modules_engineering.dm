// MARK: rad_protection
///Radiation Protection - Protects the user from radiation, gives them a geiger counter and rad info in the panel.
/obj/item/mod/module/rad_protection
	name = "MOD radiation protection module"
	desc = "A module utilizing polymers and reflective shielding to protect the user against ionizing radiation; \
		a common danger in space."
		//This comes with software to notify the wearer that they're even in a radioactive area,
		//giving a voice to an otherwise silent killer.
	icon_state = "radshield"
	complexity = 2
	module_type = MODULE_TOGGLE
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0.3
	incompatible_modules = list(/obj/item/mod/module/rad_protection)
	tgui_id = "rad_counter"
	var/current_tick_amount = 0
	var/last_tick_amount = 0
	var/radiation_count = 0
	var/grace = RAD_GEIGER_GRACE_PERIOD
	var/datum/looping_sound/geiger/soundloop
	var/scanning = TRUE

/obj/item/mod/module/rad_protection/on_suit_activation()
	soundloop = new(src, FALSE, TRUE)
	soundloop.volume = 5
	START_PROCESSING(SSobj, src)
	for(var/obj/item/part in mod.mod_parts)
		part.armor = part.armor.modifyRating(arglist(list("rad" = 100)))

/obj/item/mod/module/rad_protection/on_suit_deactivation(deleting = FALSE)
	QDEL_NULL(soundloop)
	STOP_PROCESSING(SSobj, src)
	for(var/obj/item/part in mod.mod_parts)
		part.armor = part.armor.modifyRating(arglist(list("rad" = -100)))


/obj/item/mod/module/rad_protection/on_activation()
	. = ..()
	if(!.)
		return
	to_chat(mod.wearer,span_notice("Sound is activated."))
	scanning = TRUE

/obj/item/mod/module/rad_protection/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	if(!.)
		return
	to_chat(mod.wearer,span_notice("Sound is disabled."))
	scanning = FALSE

/obj/item/mod/module/rad_protection/process(seconds_per_tick)
	if(scanning)
		radiation_count = LPFILTER(radiation_count, current_tick_amount, seconds_per_tick, RAD_GEIGER_RC)

		if(current_tick_amount)
			grace = RAD_GEIGER_GRACE_PERIOD
			last_tick_amount = current_tick_amount

		else
			grace -= seconds_per_tick
			if(grace <= 0)
				radiation_count = 0

	current_tick_amount = 0
	mod_update_sound()

/obj/item/mod/module/rad_protection/proc/mod_update_sound()
	if(!scanning)
		soundloop.stop()
		return
	if(!radiation_count)
		soundloop.stop()
		return
	soundloop.last_radiation = radiation_count
	soundloop.start()

/*
	radiation_count = LPFILTER(radiation_count, current_tick_amount, delta_time, RAD_GEIGER_RC)
	if(current_tick_amount)
		grace = RAD_GEIGER_GRACE_PERIOD
	else
		grace -= delta_time
		if(grace <= 0)
			radiation_count = 0
	current_tick_amount = 0
	soundloop.last_radiation = radiation_count
*/

/obj/item/mod/module/rad_protection/add_ui_data()
	. = ..()
	.["userradiated"] = mod.wearer?.radiation || FALSE
	.["usertoxins"] = mod.wearer?.getToxLoss() || 0
	.["usermaxtoxins"] = mod.wearer?.getMaxHealth() || 0
	.["threatlevel"] = radiation_count

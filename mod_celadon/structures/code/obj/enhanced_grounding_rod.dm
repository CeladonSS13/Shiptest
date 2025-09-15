/obj/item/circuitboard/machine/tesla_ground/enhanced
	name = "Jupiter-class storm harvester (Machine Board)"
	desc = "Уникальная плата для системы сбора энергии электроштормов кораблей класса Jupiter."
	build_path = /obj/machinery/power/tesla_coil/tesla_ground/enhanced
	req_components = list(
		/obj/item/stock_parts/capacitor/quadratic = 10,
		/obj/item/stock_parts/matter_bin/bluespace = 5,
		/obj/item/stack/cable_coil = 50)

/obj/machinery/power/tesla_coil/tesla_ground/enhanced
	name = "Jupiter-class storm harvester"
	desc = "Уникальная система сбора энергии электроштормов, разработанная специально для кораблей класса 'Jupiter'. Способна эффективно преобразовывать энергию молний в электричество для корабельных систем."
	power_loss = 1 // Half the power loss for 2x generation
	circuit = /obj/item/circuitboard/machine/tesla_ground/enhanced

/obj/machinery/power/tesla_coil/tesla_ground/enhanced/zap_act(power, zap_flags, shocked_targets)
	if(anchored && !panel_open)
		obj_flags |= BEING_SHOCKED
		var/power_produced = powernet ? power / power_loss : power
		add_avail(power_produced * input_power_multiplier * 2) // 2x power generation
		flick("coilhit", src)
		addtimer(CALLBACK(src, PROC_REF(reset_shocked)), 10)
		zap_buckle_check(power)
		playsound(src.loc, 'sound/magic/lightningshock.ogg', 100, TRUE, extrarange = 5)
		return power_produced * 2
	else
		. = ..()

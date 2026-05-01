/datum/computer_file/program/radar/lifeline/lifeline_minus
	extended_desc = "This program allows for tracking of crew members via their suit sensors in some range."
	available_on_ntnet = TRUE

/datum/computer_file/program/radar/lifeline/lifeline_minus/trackable(mob/living/carbon/human/humanoid)
	var/turf/here_turf = (get_turf(computer)) //тут мы с компом
	var/turf/target_turf = (get_turf(humanoid)) //тут цель
	var/locate_range = 0
	if (!computer.get_modular_computer_part(MC_NET))//проверка на случай если вынули сетевую карту не закрыв программу ибо да,такое бывает
		return FALSE
	var/list/obj/item/computer_hardware/network_card/net_cards = computer.get_modular_computer_part(MC_NET)
	switch (net_cards.type) //дальность зависит от сетевой карты (Warning:field access requires static type "type")
		if(/obj/item/computer_hardware/network_card) locate_range = 12
		if(/obj/item/computer_hardware/network_card/advanced) locate_range = 24
		else stack_trace("Wrong type of network card") //кусок отладки
	if(!humanoid || !istype(humanoid)) //не гуманойды нам не интересны
		return FALSE
	if(get_dist_euclidian(here_turf, target_turf)> locate_range || target_turf.z != here_turf.z) //проверка на дальность и на z-уровни
		return FALSE
	if(..() && istype(humanoid.w_uniform, /obj/item/clothing/under))
		var/obj/item/clothing/under/uniform = humanoid.w_uniform
		if(!uniform.has_sensor || (uniform.sensor_mode < SENSOR_COORDS)) //люди с выключенными датчиками нам не нужны
			return FALSE

		return TRUE

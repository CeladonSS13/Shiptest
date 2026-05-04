/*
		Core sampling missions
*/
/datum/mission/drill
	name = "Миссия по сбору образцов, 1-го уровня"
	desc = "Нам нужна геологическая информация с одного из соседних планетоидов. \
			Пожалуйста, закрепите буровую установку на месте и держите её под защитой до тех пор, пока она не соберет достаточное количество образцов. \
			Работа буровой установки для отбора образцов чрезвычайно опасна, поэтому рекомендуется соблюдать осторожность."
	value = 2500
	weight = 11

	var/datum/planet_type/selected_planet
	var/list/available_planets = list(
		/datum/planet_type/lava = /obj/structure/vein/lavaland,
		/datum/planet_type/ice = /obj/structure/vein/ice,
		/datum/planet_type/jungle = /obj/structure/vein/jungle,
		/datum/planet_type/sand = /obj/structure/vein/sand,
		/datum/planet_type/rock = /obj/structure/vein/rockplanet,
		/datum/planet_type/moon = /obj/structure/vein/moon,
		/datum/planet_type/asteroid = /obj/structure/vein/asteroid,
	)
	///a punchcard spawned on mission init, allows spawning a specific kind of planet
	var/obj/item/overmap_punchcard_spawner/dynamic/mission/punchcard

	///drill subtypes for fluff
	var/obj/machinery/drill/mission/drill_type = /obj/machinery/drill/mission
	///our linked drill
	var/obj/machinery/drill/mission/sampler

	///how many 'samples' does this mission want
	var/num_wanted = 5
	///what class of vein does this mission want
	var/class_wanted = 1
	///does this mission spawn a punchcard?
	var/spawn_punchcard = TRUE
	///bonus fluff
	var/bonus_text = TRUE

/datum/mission/drill/generate_mission_details()
	. = ..()
	selected_planet = pick(available_planets)
	num_wanted = rand(num_wanted-2,num_wanted+2)
	value += num_wanted*100
	name = "Миссия по сбору образцов на [CASE(selected_planet, DATIVE_CASE)], [class_wanted]-го уровня"
	desc = "Нам нужна геологическая информация с [CASE(selected_planet, NOMINATIVE_CASE)]. \
			Пожалуйста, закрепите буровую установку на месте и держите её под защитой до тех пор, пока она не соберет достаточное количество образцов. \
			Работа буровой установки для отбора образцов чрезвычайно опасна, поэтому рекомендуется соблюдать осторожность."
	if(bonus_text)
		desc += " \n\nДля удобства поиска будет предоставлена перфокарта для обнаружения на сканерах: [CASE(selected_planet, GENITIVE_CASE)]. \
					За неиспользование перфокарты вам будет начислено 500 кредитов."

/datum/mission/drill/accept(datum/overmap/ship/controlled/acceptor, turf/accept_loc, obj/hangar_crate_spawner/cargo_belt)
	. = ..()
	//you shouldn't be accepting this without an outpost but just in case
	if(isnull(cargo_belt))
		sampler = spawn_bound(drill_type, accept_loc, VARSET_CALLBACK(src, sampler, null))
		stack_trace("[src] отправленный с [source_outpost] , не обнаружил грузовой желоб для сброса вещей. Вместо него задействована грузовая консоль.")
	else
		sampler = spawn_bound(drill_type, cargo_belt.loc, VARSET_CALLBACK(src, sampler, null))
	sampler.mission_class = class_wanted
	sampler.num_wanted = num_wanted
	sampler.orevein_wanted = available_planets[selected_planet]
	sampler.name += " (Class [class_wanted] [selected_planet.name])"

	if(spawn_punchcard)
		punchcard = spawn_bound(/obj/item/overmap_punchcard_spawner/dynamic/mission, accept_loc, VARSET_CALLBACK(src, punchcard, null), FALSE)
		punchcard.name += " ([selected_planet.name])"
		punchcard.planet_type = selected_planet
		if(bonus_text)
			punchcard.desc += span_notice("\nA [span_bold("500 кредитов")] будет начислено за сохранение до конца вашей миссии.")

/datum/mission/drill/can_complete()
	. = ..()
	if(!.)
		return
	var/obj/docking_port/mobile/scanner_port = SSshuttle.get_containing_shuttle(sampler)
	return . && (sampler.num_current >= num_wanted) && (scanner_port?.current_ship == servant)

/datum/mission/drill/get_progress_string()
	if(!sampler)
		return "0/[num_wanted]"
	else
		return "[sampler.num_current]/[num_wanted]"

//stupid fox proc
/datum/mission/drill/get_progress_percent()
	if(!sampler)
		return 0
	else
		return sampler.num_current/num_wanted


/datum/mission/drill/Destroy()
	sampler = null
	return ..()

/datum/mission/drill/turn_in()
	//Gives players a little extra money for going past the mission goal
	value += (sampler.num_current - num_wanted)*200
	if(punchcard)
		//500 credit punchcard
		value += 500
		recall_bound(punchcard)

	recall_bound(sampler)
	return ..()

/datum/mission/drill/give_up()
	if(punchcard)
		recall_bound(punchcard)
	recall_bound(sampler)

	return ..()

/datum/mission/drill/classtwo
	name = "Миссия по сбору образцов, 2-го уровня"
	value = 4000	//value = 4500	// [CELADON-EDIT] - CARGO-REWORK-BALANCE
	weight = 9
	class_wanted = 2
	num_wanted = 6

/datum/mission/drill/classthree
	name = "Миссия по сбору образцов, 3-го уровня"
	value = 6000	//value = 8000	// [CELADON-EDIT] - CARGO-REWORK-BALANCE
	weight = 5
	class_wanted = 3
	num_wanted = 8

/*
		Variant for rare planets
*/
/datum/mission/drill/rareplanet
	name = "Редкая миссия по сбору образцов, 1-го уровня"
	desc = "Мы обнаружили редкий планетоид и хотим изучить его геологию. \
			Пожалуйста, закрепите сверло на месте и подержите его до тех пор, пока оно не соберет достаточное количество образцов. \
			Известно не так много информации об этих планетах, поэтому рекомендуется соблюдать осторожность. \
			Для определения местоположения планеты будет предоставлена перфокарта, поскольку найти её иным способом невозможно. "
	value = 3000
	weight = 4
	spawn_punchcard = TRUE

	available_planets = list(
		/datum/planet_type/water = /obj/structure/vein/waterplanet,
		/datum/planet_type/desert = /obj/structure/vein/desert,
	)
	bonus_text = FALSE
	num_wanted = 6

/datum/mission/drill/rare_planet/generate_mission_details()
	. = ..()
	name = "Редкая миссия по сбору образцов на [CASE(selected_planet, DATIVE_CASE)], [class_wanted]-го уровня"
	desc = "Мы обнаружили редкую планету: [CASE(selected_planet, NOMINATIVE_CASE)] и желаем изучить ее геологию. \
			Пожалуйста, закрепите сверло на месте и подержите его до тех пор, пока оно не соберет достаточное количество образцов. \
			Известно не так много информации об этих планетах, поэтому рекомендуется соблюдать осторожность. \
			Для определения местоположения планеты будет предоставлена перфокарта, поскольку найти её иным способом невозможно. "
	if(selected_planet == /datum/planet_type/shrouded)
		name = "Специальная миссия по сбору образцов на [CASE(selected_planet, DATIVE_CASE)], [class_wanted]-го уровня"
		desc = "Мы обнаружили крайне редкую планету: [CASE(selected_planet, NOMINATIVE_CASE)] и желаем изучить ее геологию. \
				Однако почти все, кого мы туда отправляем, обычно возвращаются с криками и отказываются выполнять заказ. \
				Атмосфера, поглощающая электромагнитное излучение, препятствует тщательному сканированию, но поверхность кажется совершенно бесплодной. \
				Пожалуйста, из уважения к Охотнику, соберите образцы, пожалуйста. Также будет бонус. \
				Для определения местоположения планеты будет предоставлена перфокарта, поскольку найти её иным способом невозможно. "
		value += 750

	if(bonus_text)
		desc += " \n\nДля удобства поиска будет предоставлена перфокарта для обнаружения на сканерах: [CASE(selected_planet, GENITIVE_CASE)].\
				За неиспользование перфокарты вам будет начислено 500 кредитов."

/datum/mission/drill/rare_planet/class_two
	name = "Редкая миссия по сбору образцов, 2-го уровня"
	value = 5000
	weight = 3
	class_wanted = 2
	num_wanted = 8
	available_planets = list(
		/datum/planet_type/water = /obj/structure/vein/waterplanet,
		/datum/planet_type/desert = /obj/structure/vein/desert,
		/datum/planet_type/water = /obj/structure/vein/waterplanet,
		/datum/planet_type/desert = /obj/structure/vein/desert,
		/datum/planet_type/shrouded = /obj/structure/vein/shrouded,
	)

/datum/mission/drill/rare_planet/class_three
	name = "Редкая миссия по сбору образцов, 3-го уровня"
	value = 6500
	weight = 2
	class_wanted = 3
	num_wanted = 10
	available_planets = list(
		/datum/planet_type/water = /obj/structure/vein/waterplanet,
		/datum/planet_type/desert = /obj/structure/vein/desert,
		/datum/planet_type/shrouded = /obj/structure/vein/shrouded,
	)

/* The drill itself */

/obj/machinery/drill/mission
	name = "исследовательский бур"
	cases = list("исследовательский бур", "исследовательского бура", "исследовательскому буру", "исследовательский бур", "исследовательским буром", "исследовательском буре")
	desc = "Специализированный лазерный бур, предназначенный для извлечения геологических образцов."

	var/num_current = 0
	var/mission_class
	var/num_wanted
	var/obj/structure/vein/orevein_wanted

/obj/machinery/drill/mission/examine()
	. = ..()
	. += span_notice("Дрель содержит [num_current] образоцов из [num_wanted].")
	if(num_current>=num_wanted)
		. += span_notice("Дополнительные образцы могут быть собраны за 200 кредитов за каждый образец.")

/obj/machinery/drill/mission/start_mining()
	if(orevein_wanted && !istype(our_vein, orevein_wanted))
		say("Ошибка: Неверный класс планетоида для работы.")
		return
	if(our_vein.vein_class < mission_class && our_vein)
		say("Ошибка: Для проведения операции требуется класс жилы [mission_class]-го уровня или выше.")
		return
	return ..()

/obj/machinery/drill/mission/mine_success()
	num_current++

	if(num_current == num_wanted)
		SEND_SIGNAL(src, COMSIG_DRILL_SAMPLES_DONE)
		say("Собраны необходимые образцы. Стоимость дополнительных образцов составляет 200 кредит за штуку. Начата деактивация дрели.")
		if(active)
			stop_mining()

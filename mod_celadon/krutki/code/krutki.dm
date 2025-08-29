/obj/machinery/gacha_machine
	name = "гачи автомат"
	desc = "Загадочная машина, которая поглощает секретные документы и может выдать что-то ценное взамен."
	icon = 'mod_celadon/_storge_icons/icons/machinery/krutki.dmi'
	icon_state = "krutki"
	density = FALSE
	anchored = TRUE
	idle_power_usage = IDLE_DRAW_LOW
	active_power_usage = ACTIVE_DRAW_MEDIUM

	/// Обычные призы (выдаются всегда)
	var/list/common_prizes = list()
	/// Особые призы (артефакты)
	var/list/rare_prizes = list()
	/// Шанс выпадения особого приза (в процентах)
	var/rare_prize_chance = 0.1
	/// Минимальное время до выдачи приза (в секундах)
	var/min_prize_delay = 10
	/// Максимальное время до выдачи приза (в секундах)
	var/max_prize_delay = 30
	/// Текущий таймер до выдачи приза
	var/prize_timer = 0
	/// Флаг обработки документа
	var/processing = FALSE
	/// Обычные фразы автомата
	var/list/common_phrases = list(
		"В следующий раз повезет!",
		"Попробуйте еще раз!",
		"Удача улыбнется вам позже!",
		"Не расстраивайтесь, это всего лишь игра!",
		"Может быть, стоит принести больше документов?",
		"Терпение - ключ к успеху!",
		"Каждая попытка приближает к победе!",
		"Фортуна капризна сегодня!",
		"Не сдавайтесь, удача рядом!",
		"Следующий раз точно будет удачным!"
	)
	/// Фразы при редком призе
	var/list/rare_phrases = list(
		"НЕВЕРОЯТНО! ДЖЕКПОТ!",
		"ПОЗДРАВЛЯЕМ С РЕДЧАЙШИМ ПРИЗОМ!",
		"ВЫ НЕВЕРОЯТНО ВЕЗУЧИЙ!",
		"ИСТОРИЯ БУДЕТ ПОМНИТЬ ЭТОТ МОМЕНТ!"
	)

/obj/machinery/gacha_machine/Initialize()
	. = ..()
	common_prizes = list(
		/obj/item/spacecash/bundle/c1000,
		/obj/item/spacecash/bundle/c500,
		/obj/item/reagent_containers/food/drinks/beer,
		/obj/item/storage/box/donkpockets,
		/obj/effect/spawner/random/entertainment/plushie_celadon_all
	)
	rare_prizes = list(
		/obj/item/assembly/signaler/anomaly
	)

/obj/machinery/gacha_machine/attack_hand(mob/user)
	if(machine_stat & (BROKEN|NOPOWER))
		to_chat(user, span_warning("[src] не работает."))
		return

	if(processing)
		to_chat(user, span_notice("[src] уже обрабатывает документы."))
		return

	var/turf/T = get_turf(src)
	var/obj/item/documents/doc = locate(/obj/item/documents) in T

	if(!doc)
		to_chat(user, span_warning("Положите секретные документы на [src] перед активацией."))
		return

	to_chat(user, span_notice("Вы активируете [src]. Машина начинает поглощать документы."))
	process_documents(user)
	return TRUE

/obj/machinery/gacha_machine/proc/process_documents(mob/user)
	processing = TRUE
	use_power(active_power_usage)
	flick("krutki-anim", src)

	var/turf/T = get_turf(src)
	var/list/documents = list()

	// Собираем все документы на тайле
	for(var/obj/item/documents/doc in T)
		documents += doc

	if(!documents.len)
		processing = FALSE
		icon_state = "krutki"
		return

	// Удаляем документы с эффектом
	for(var/obj/item/documents/doc in documents)
		var/datum/effect_system/spark_spread/sparks = new
		sparks.set_up(3, 1, get_turf(doc))
		sparks.start()
		qdel(doc)

	playsound(src, 'sound/machines/buzz-sigh.ogg', 50, TRUE)

	// Всегда выдаем приз
	prize_timer = rand(min_prize_delay, max_prize_delay)
	to_chat(user, span_notice("[src] издает довольный звук. Похоже, скоро будет приз!"))
	addtimer(CALLBACK(src, PROC_REF(dispense_prize), documents.len), prize_timer SECONDS)

	processing = FALSE

/obj/machinery/gacha_machine/proc/dispense_prize(doc_count = 1)
	if(machine_stat & (BROKEN|NOPOWER))
		return

	flick("krutki-anim", src)
	var/turf/T = get_turf(src)
	var/prize_type

	// Проверяем шанс на особый приз
	var/total_rare_chance = rare_prize_chance * doc_count

	if(prob(total_rare_chance) && rare_prizes.len)
		prize_type = pick(rare_prizes)
		visible_message(span_boldannounce("[src] выдает ОСОБЫЙ приз!"))
		message_admins("Гачи автомат в [ADMIN_VERBOSEJMP(src)] выдал редкий приз! Шанс был [total_rare_chance]%.")
		playsound(src, 'sound/misc/Yeehaw.ogg', 80, TRUE)
		playsound(src, 'sound/misc/highlander.ogg', 80, TRUE)
		say(pick(rare_phrases))
	else if(common_prizes.len)
		prize_type = pick(common_prizes)
		visible_message(span_notice("[src] выдает приз!"))
		playsound(src, 'sound/misc/server-ready.ogg', 80, TRUE)
		say(pick(common_phrases))
	else
		icon_state = "krutki"
		return

	new prize_type(T)

	playsound(src, 'sound/machines/ding.ogg', 50, TRUE)
	var/datum/effect_system/spark_spread/sparks = new
	sparks.set_up(5, 1, T)
	sparks.start()

	prize_timer = 0

/obj/machinery/gacha_machine/examine(mob/user)
	. = ..()
	. += span_info("Положите секретные документы на машину и нажмите на нее, чтобы активировать.")
	if(processing)
		. += span_warning("Машина сейчас обрабатывает документы.")
	if(prize_timer > 0)
		. += span_notice("Машина готовит приз...")

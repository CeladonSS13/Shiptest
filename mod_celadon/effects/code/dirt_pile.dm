/obj/structure/dirt_pile
	name = "empty dirt pile"
	desc = "A small pile of dirt. Something might be buried underneath."
	icon = 'mod_celadon/_storage_icons/icons/structures/snow.dmi'
	icon_state = "snowstone"
	density = FALSE
	anchored = TRUE
	light_color = COLOR_ICEPLANET_LIGHT
	color = COLOR_ICEPLANET_LIGHT
	var/dug_up = FALSE

/obj/structure/dirt_pile/Initialize()
	. = ..()
	// Собираем все предметы на этом тайле в кучку
	addtimer(CALLBACK(src, PROC_REF(collect_items)), 1)

/obj/structure/dirt_pile/proc/collect_items()
	var/turf/T = get_turf(src)
	for(var/obj/item/I in T.contents)
		if(I == src)
			continue
		I.forceMove(src)

	// Также собираем спавнеры после их срабатывания
	for(var/obj/effect/spawner/S in T.contents)
		if(istype(S, /obj/effect/spawner/random))
			var/obj/effect/spawner/random/R = S
			R.spawn_loot()
		qdel(S)

/obj/structure/dirt_pile/attackby(obj/item/I, mob/user, params)
	if(dug_up)
		return ..()

	if(I.tool_behaviour == TOOL_SHOVEL)
		dig_up(user)
		return TRUE

	return ..()

/obj/structure/dirt_pile/proc/dig_up(mob/user)
	if(dug_up)
		return

	user.visible_message(
		span_notice("[user] starts digging up [src]."),
		span_notice("You start digging up [src].")
	)

	if(!do_after(user, 10 SECONDS, target = src))
		return

	user.visible_message(
		span_notice("[user] digs up [src], revealing its contents."),
		span_notice("You dig up [src], revealing what was buried inside.")
	)

	dug_up = TRUE
	name = "dug up dirt"
	desc = "A pile of dirt that has been dug up."
	icon_state = "lavarocks2"

	for(var/obj/item/I in contents)
		I.forceMove(get_turf(src))

/obj/structure/dirt_pile/random
	name = "mysterious dirt pile"
	desc = "A pile of dirt that seems to shimmer slightly. Something unusual might be buried underneath."
	var/list/possible_effects = list(
		"safe" = 5,
		"item" = 40,
		"effect" = 55
	)

/obj/structure/dirt_pile/random/Initialize()
	. = ..()
	// Не собираем предметы для рандомной кучки

/obj/structure/dirt_pile/random/dig_up(mob/user)
	if(dug_up)
		return

	user.visible_message(
		span_notice("[user] starts digging up [src]."),
		span_notice("You start digging up [src].")
	)

	if(!do_after(user, 10 SECONDS, target = src))
		return

	var/effect = pick_weight(possible_effects)
	switch(effect)
		if("safe")
			user.visible_message(
				span_notice("[user] digs up [src], revealing a buried safe!"),
				span_notice("You dig up [src] and find a buried safe!")
			)
			var/obj/structure/safe/S = new(get_turf(src))
			// Устанавливаем 10-значный код
			S.number_of_tumblers = 10
			// Генерируем новую комбинацию
			S.tumblers = list()
			for(var/i in 1 to S.number_of_tumblers)
				S.tumblers.Add(rand(0, 99))
			// Добавляем случайный лут в сейф
			var/obj/effect/spawner/random/outpost_loot/big/loot_spawner = new(S)
			loot_spawner.spawn_loot()
			qdel(loot_spawner)

		if("item")
			user.visible_message(
				span_notice("[user] digs up [src], finding something valuable!"),
				span_notice("You dig up [src] and find something interesting!")
			)
			var/obj/effect/spawner/random/outpost_loot/loot_spawner = new(get_turf(src))
			loot_spawner.spawn_loot_count = 1
			loot_spawner.spawn_loot()
			qdel(loot_spawner)

		if("effect")
			var/effect_type = rand(1,3)
			switch(effect_type)
				if(1) // Healing
					user.visible_message(
						span_green("[user] digs up [src] and is surrounded by a healing aura!"),
						span_green("You dig up [src] and feel refreshed!")
					)
					if(isliving(user))
						var/mob/living/L = user
						L.adjustBruteLoss(-20)
						L.adjustFireLoss(-20)
				if(2) // Sparkles
					user.visible_message(
						span_notice("[user] digs up [src] and sparkles fill the air!"),
						span_notice("You dig up [src] and see beautiful sparkles!")
					)
					do_sparks(5, TRUE, get_turf(src))
				if(3) // Smoke
					user.visible_message(
						span_notice("[user] digs up [src] and harmless smoke puffs out!"),
						span_notice("You dig up [src] and harmless smoke appears!")
					)
					var/datum/effect_system/smoke_spread/smoke = new
					smoke.set_up(3, get_turf(src))
					smoke.start()

	qdel(src)

/obj/structure/dirt_pile/safe
	name = "suspicious dirt pile"
	desc = "A pile of dirt that looks like it's hiding something big underneath."
	var/safe_type = /obj/structure/safe

/obj/structure/dirt_pile/safe/Initialize()
	. = ..()
	// Не собираем предметы для сейфа

/obj/structure/dirt_pile/safe/dig_up(mob/user)
	if(dug_up)
		return

	user.visible_message(
		span_notice("[user] starts digging up [src]."),
		span_notice("You start digging up [src].")
	)

	if(!do_after(user, 30 SECONDS, target = src))
		return

	user.visible_message(
		span_notice("[user] digs up [src], revealing a buried safe!"),
		span_notice("You dig up [src] and find a buried safe!")
	)

	var/obj/structure/safe/S = new safe_type(get_turf(src))
	// Устанавливаем 10-значный код
	S.number_of_tumblers = 10
	// Генерируем новую комбинацию
	S.tumblers = list()
	for(var/i in 1 to S.number_of_tumblers)
		S.tumblers.Add(rand(0, 99))
	// Добавляем случайный лут в сейф
	var/obj/effect/spawner/random/outpost_loot/loot_spawner = new(S)
	loot_spawner.spawn_loot()
	qdel(loot_spawner)
	qdel(src)

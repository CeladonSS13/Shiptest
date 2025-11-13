#define SAUNA_TEMP_BOOST 25
#define SAUNA_LOG_FUEL 150
#define SAUNA_PAPER_FUEL 5
#define SAUNA_MAXIMUM_FUEL 3000
#define SAUNA_WATER_PER_WATER_UNIT 5
#define SAUNA_OVERHEAT_THRESHOLD 2500
#define SAUNA_HEAT_RANGE 3
#define SAUNA_TEMP_PER_FUEL 0.015
#define SAUNA_WATER_TEMP_BOOST 10

/obj/structure/sauna_oven_steam
	name = "sauna oven (steam)"
	desc = "Небольшая печь для сауны с камнями. Добавьте немного древесины или целую кипу бумаг, налейте воды и наслаждайтесь моментом."
	icon = 'mod_celadon/_storage_icons/icons/structures/obj/sauna_oven.dmi'
	icon_state = "sauna_oven"
	density = TRUE
	anchored = TRUE
	resistance_flags = FIRE_PROOF
	var/lit = FALSE
	var/fuel_amount = 0
	var/water_amount = 0
	var/overheated = FALSE
	var/last_sound_time = 0
	var/water_boost_timer = 0

/obj/structure/sauna_oven_steam/examine(mob/user)
	. = ..()
	. += span_notice("The rocks are [water_amount ? "moist ([water_amount] units)" : "dry"].")
	. += span_notice("Fuel level: [fuel_amount]/[SAUNA_MAXIMUM_FUEL] units.")
	if(lit)
		. += span_warning("The oven is currently [overheated ? "dangerously overheated!" : "burning steadily"].")
	if(overheated)
		. += span_danger("WARNING: Overheating detected! Add water or turn off immediately!")

/obj/structure/sauna_oven_steam/Destroy()
	if(lit)
		STOP_PROCESSING(SSobj, src)
	QDEL_NULL(particles)
	return ..()

/obj/structure/sauna_oven_steam/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(lit)
		if(overheated)
			user.visible_message(span_warning("[user] recoils from the dangerously hot [src]!"), span_warning("The [src] is too hot to touch safely!"))
			if(isliving(user))
				var/mob/living/L = user
				L.adjustFireLoss(5)
			return
		lit = FALSE
		overheated = FALSE
		STOP_PROCESSING(SSobj, src)
		user.visible_message(span_notice("[user] turns off [src]."), span_notice("You turn off [src]."))
		playsound(src, 'sound/machines/click.ogg', 50, TRUE)
	else if (fuel_amount)
		lit = TRUE
		START_PROCESSING(SSobj, src)
		user.visible_message(span_notice("[user] turns on [src]."), span_notice("You turn on [src]."))
		playsound(src, 'sound/items/lighter_on.ogg', 50, TRUE)
	else
		balloon_alert(user, "no fuel!")
	update_icon()

/obj/structure/sauna_oven_steam/update_overlays()
	. = ..()
	if(lit)
		. += "sauna_oven_on_overlay"
	if(overheated)
		var/mutable_appearance/overheat_overlay = mutable_appearance(icon, icon_state)
		overheat_overlay.color = "#ff0000"
		overheat_overlay.alpha = 100
		. += overheat_overlay

/obj/structure/sauna_oven_steam/update_icon()
	..()
	icon_state = "[lit ? "sauna_oven_on" : initial(icon_state)]"

/obj/structure/sauna_oven_steam/attackby(obj/item/used_item, mob/user)
	if(used_item.tool_behaviour == TOOL_WRENCH)
		balloon_alert(user, "deconstructing...")
		if(used_item.use_tool(src, user, 60, volume = 50))
			balloon_alert(user, "deconstructed")
			new /obj/item/stack/sheet/mineral/wood(get_turf(src), 30)
			qdel(src)

	else if(istype(used_item, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/reagent_container = used_item
		if(!reagent_container.is_open_container())
			return ..()
		if(reagent_container.reagents.has_reagent(/datum/reagent/water))
			reagent_container.reagents.remove_reagent(/datum/reagent/water, 5)
			user.visible_message(span_notice("[user] pours some \
			water into [src]."), span_notice("You pour \
			some water to [src]."))
			water_amount += 5 * SAUNA_WATER_PER_WATER_UNIT
			if(lit && !overheated)
				water_boost_timer = 10
				playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 50, TRUE)
			else if(lit && overheated)
				playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 75, TRUE)
				user.visible_message(span_notice("[src] hisses loudly as water hits the overheated surface!"), span_notice("The water creates a massive steam cloud!"))
		else
			balloon_alert(user, "no water!")

	else if(istype(used_item, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/wood = used_item
		if(fuel_amount > SAUNA_MAXIMUM_FUEL)
			balloon_alert(user, "it's full!")
			return
		fuel_amount += SAUNA_LOG_FUEL * wood.amount
		wood.use(wood.amount)
		user.visible_message(span_notice("[user] tosses some \
			wood into [src]."), span_notice("You add \
			some fuel to [src]."))
	else if(istype(used_item, /obj/item/paper_bin))
		var/obj/item/paper_bin/paper_bin = used_item
		user.visible_message(span_notice("[user] throws [used_item] into \
			[src]."), span_notice("You add [used_item] to [src].\
			"))
		fuel_amount += SAUNA_PAPER_FUEL * paper_bin.total_paper
		qdel(paper_bin)
	else if(istype(used_item, /obj/item/paper))
		user.visible_message(span_notice("[user] throws [used_item] into \
			[src]."), span_notice("You throw [used_item] into [src].\
			"))
		fuel_amount += SAUNA_PAPER_FUEL
		qdel(used_item)

	return ..()

/obj/structure/sauna_oven_steam/process()
	// Check for overheating
	if(fuel_amount > SAUNA_OVERHEAT_THRESHOLD && !water_amount)
		overheated = TRUE
		if(prob(10))
			visible_message(span_danger("[src] sparks dangerously!"))
			playsound(src, pick('sound/effects/sparks1.ogg', 'sound/effects/sparks2.ogg', 'sound/effects/sparks3.ogg', 'sound/effects/sparks4.ogg'), 75, TRUE)

	else
		var/was_overheated = overheated
		overheated = FALSE
		if(was_overheated)
			update_icon()

	// Steam generation
	if(water_amount)
		water_amount--
		update_steam_particles()
		var/turf/open/pos = get_turf(src)
		if(istype(pos) && pos.air.return_pressure() < 2*ONE_ATMOSPHERE)
			var/current_temp = get_current_temperature()
			pos.atmos_spawn_air("water_vapor=10;TEMP=[current_temp]")
			// Heat nearby players
			heat_nearby_players()
			// Create wet floor effect
			if(prob(20))
				make_wet_floor()
			// Steam sound
			if(world.time > last_sound_time + 30)
				playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 25, TRUE)
				last_sound_time = world.time

	// Fire crackling sound
	if(prob(15) && world.time > last_sound_time + 20)
		playsound(src, 'sound/effects/comfyfire.ogg', 30, TRUE)
		last_sound_time = world.time

	// Water boost timer
	if(water_boost_timer > 0)
		water_boost_timer--

	// Consume fuel
	fuel_amount--
	if(fuel_amount <= 0)
		lit = FALSE
		var/was_overheated = overheated
		overheated = FALSE
		update_steam_particles()
		STOP_PROCESSING(SSobj, src)
		if(was_overheated)
			update_icon()

/obj/structure/sauna_oven_steam/proc/update_steam_particles()
	if(particles)
		if(lit && water_amount)
			return
		QDEL_NULL(particles)
		return

	if(lit && water_amount)
		particles = new /particles/smoke/steam/mild
		particles.position = list(0, 6, 0)

/obj/structure/sauna_oven_steam/proc/heat_nearby_players()
	for(var/mob/living/carbon/human/H in range(SAUNA_HEAT_RANGE, src))
		if(H.bodytemperature < HUMAN_BODYTEMP_HEAT_DAMAGE_LIMIT)
			H.adjust_bodytemperature(2)
			if(prob(5))
				to_chat(H, span_notice("You feel the pleasant warmth from the sauna."))

/obj/structure/sauna_oven_steam/proc/make_wet_floor()
	for(var/turf/open/floor/T in range(2, src))
		if(prob(30))
			T.MakeSlippery(TURF_WET_WATER, 100, 0)

/obj/structure/sauna_oven_steam/proc/get_current_temperature()
	var/turf/open/pos = get_turf(src)
	var/env_temp = T20C
	if(istype(pos) && pos.air)
		env_temp = pos.air.return_temperature()
	var/temp = env_temp + SAUNA_TEMP_BOOST
	// Fuel affects temperature
	temp += fuel_amount * SAUNA_TEMP_PER_FUEL
	// Water boost when recently added
	if(water_boost_timer > 0)
		temp += SAUNA_WATER_TEMP_BOOST
	return temp

#undef SAUNA_TEMP_BOOST
#undef SAUNA_LOG_FUEL
#undef SAUNA_PAPER_FUEL

#undef SAUNA_MAXIMUM_FUEL
#undef SAUNA_WATER_PER_WATER_UNIT
#undef SAUNA_OVERHEAT_THRESHOLD
#undef SAUNA_HEAT_RANGE
#undef SAUNA_TEMP_PER_FUEL
#undef SAUNA_WATER_TEMP_BOOST

/obj/structure/hivebot_beacon
	name = "beacon"
	desc = "Some odd beacon thing."
	icon = 'icons/mob/hivebot.dmi'
	icon_state = "def_radar-off"
	anchored = TRUE
	density = TRUE
	var/bot_type = "norm"
	var/bot_amt = 10
	var/spawn_time_min
	var/spawn_time_max

/obj/structure/hivebot_beacon/Initialize()
	. = ..()
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(2, loc)
	smoke.start()
	visible_message(span_boldannounce("[src] warps in!"))
	playsound(src.loc, 'sound/effects/empulse.ogg', 25, TRUE)
	addtimer(CALLBACK(src, PROC_REF(warpbots)), rand(spawn_time_min, spawn_time_max))

/obj/structure/hivebot_beacon/proc/warpbots()
	icon_state = "def_radar"
	visible_message(span_danger("[src] turns on!"))
	while(bot_amt > 0)
		bot_amt--
		switch(bot_type)
			if("norm")
				new /mob/living/basic/hivebot(get_turf(src))
			if("range")
				new /mob/living/basic/hivebot/ranged(get_turf(src))
			if("rapid")
				new /mob/living/basic/hivebot/rapid(get_turf(src))

	sleep(100)
	visible_message(span_boldannounce("[src] warps out!"))
	playsound(src.loc, 'sound/effects/empulse.ogg', 25, TRUE)
	qdel(src)
	return

/obj/structure/spawner/hivebot
	move_resist = INFINITY
	anchored = TRUE
	resistance_flags = FIRE_PROOF | LAVA_PROOF

/obj/structure/spawner/hivebot/low_threat
	max_mobs = 4
	spawn_time = 300

/obj/structure/spawner/hivebot/medium_threat
	max_mobs = 5
	spawn_time = 250

/obj/structure/spawner/hivebot/high_threat
	max_mobs = 7
	spawn_time = 200

/obj/structure/spawner/hivebot/extreme_threat
	max_mobs = 10
	spawn_time = 150

/mob/living/simple_animal/hostile/hivebot/tele//this still needs work
	name = "Beacon"
	desc = "Some odd beacon thing"
	icon = 'mod_celadon/_storge_icons/icons/mobs/hivebot.dmi'
	icon_state = "def_radar-off"
	icon_living = "def_radar-off"
	health = 200
	maxHealth = 200
	status_flags = 0
	anchored = TRUE
	stop_automated_movement = 1
	var/bot_type = "norm"
	var/bot_amt = 10
	var/spawn_delay = 600
	var/turn_on = 0
	var/auto_spawn = 1
	armour_penetration = 8
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)

/mob/living/simple_animal/hostile/hivebot/tele/New()
	..()
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(5, 0, src.loc)
	smoke.start()
	visible_message(span_danger("The [src] warps in!"))
	playsound(src.loc, 'sound/effects/empulse.ogg', 25, 1)

/mob/living/simple_animal/hostile/hivebot/tele/proc/warpbots()
	icon_state = "def_radar"
	visible_message(span_warning("The [src] turns on!"))
	while(bot_amt > 0)
		bot_amt--
		switch(bot_type)
			if("norm")
				var/mob/living/basic/hivebot/H = new /mob/living/basic/hivebot(get_turf(src))
				H.faction = faction
			if("range")
				var/mob/living/basic/hivebot/range/R = new /mob/living/basic/hivebot/range(get_turf(src))
				R.faction = faction
			if("rapid")
				var/mob/living/basic/hivebot/rapid/F = new /mob/living/basic/hivebot/rapid(get_turf(src))
				F.faction = faction
	spawn(100)
		qdel(src)
	return

/mob/living/simple_animal/hostile/hivebot/tele/handle_automated_action()
	if(!..())
		return
	if(prob(2))//Might be a bit low, will mess with it likely
		warpbots()

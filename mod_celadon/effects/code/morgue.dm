/obj/structure/bodycontainer/morgue/with_corpse
	var/corpse_spawned = FALSE

/obj/structure/bodycontainer/morgue/with_corpse/open()
	if(!corpse_spawned)
		corpse_spawned = TRUE
		var/turf/T = get_step(src, dir)
		var/mob/living/carbon/human/corpse = new(T)
		corpse.death()
		corpse.Drain()
		playsound(src, 'sound/hallucinations/growl1.ogg', 100, TRUE)
	. = ..()

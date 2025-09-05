/obj/structure/bodycontainer/morgue/with_corpse

/obj/structure/bodycontainer/morgue/with_corpse/LateInitialize()
	. = ..()
	var/obj/effect/mob_spawn/human/corpse/assistant/husked/corpse = new(src)
	corpse.create()
//these are good for mappers and already see use in some maps.
/// MARK:SPAWNER
/obj/structure/spawner/lavaland/goliath
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril)

/obj/structure/spawner/lavaland/legion
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril)

/obj/structure/spawner/lavaland/icewatcher
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing)

/obj/structure/spawner/lavaland/whitesandsbasilisk
	mob_types = list(/mob/living/simple_animal/hostile/asteroid/basilisk/whitesands)

	/// MARK:LAVALAND
	//these are ones that we want to see spawning on worlds.

/obj/structure/spawner/lavaland/low_threat //this is the most common one, it shouldn't be a huge issue for most players.
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 27,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing = 1,
		/mob/living/simple_animal/hostile/asteroid/brimdemon = 20,
		/mob/living/simple_animal/hostile/asteroid/goliath/magma = 5,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma = 5,
	)
	max_mobs = 4
	spawn_time = 300

/obj/structure/spawner/lavaland/medium_threat //this is less common. It starts getting dangerous here.
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 27,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing = 1,
		/mob/living/simple_animal/hostile/asteroid/brimdemon = 20,
		/mob/living/simple_animal/hostile/asteroid/goliath/magma = 5,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma = 5,
	)
	max_mobs = 6
	spawn_time = 200 //they spawn a little faster

/obj/structure/spawner/lavaland/high_threat //this should be rare. People will have trouble with this.
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 27,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing = 1,
		/mob/living/simple_animal/hostile/asteroid/brimdemon = 20,
		/mob/living/simple_animal/hostile/asteroid/goliath/magma = 5,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma = 5,
	)
	max_mobs = 9
	spawn_time = 200

/obj/structure/spawner/lavaland/extreme_threat //extremely rare
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 27,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/tendril = 26,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing = 1,
		/mob/living/simple_animal/hostile/asteroid/brimdemon = 20,
		/mob/living/simple_animal/hostile/asteroid/goliath/magma = 5,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma = 5,
	)
	max_mobs = 12
	spawn_time = 150 //bring a friend and some automatic weapons

//and sand world ones. More legions, no brimdemons, no icewings.
/// MARK:SAND

/obj/structure/spawner/lavaland/sand_world/low_threat
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 20,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 40,
		/mob/living/simple_animal/hostile/asteroid/basilisk/whitesands = 40,
	)
	max_mobs = 5
	spawn_time = 300

/obj/structure/spawner/lavaland/sand_world/medium_threat
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 20,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 40,
		/mob/living/simple_animal/hostile/asteroid/basilisk/whitesands = 40,
	)
	max_mobs = 7
	spawn_time = 200

/obj/structure/spawner/lavaland/sand_world/high_threat
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 20,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 40,
		/mob/living/simple_animal/hostile/asteroid/basilisk/whitesands = 40,
	)
	max_mobs = 10
	spawn_time = 200

/obj/structure/spawner/lavaland/sand_world/extreme_threat
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 20,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril = 40,
		/mob/living/simple_animal/hostile/asteroid/basilisk/whitesands = 40,
	)
	max_mobs = 12
	spawn_time = 150

/// MARK:PLASMA
/obj/structure/spawner/plasma_gaint/Initialize()
	. = ..()

/obj/structure/spawner/plasma_gaint/extreme_threat
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril = 13,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma = 13,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing = 5,
		/mob/living/simple_animal/hostile/asteroid/brimdemon = 10,
	)
	max_mobs = 5
	spawn_time = 120

/// MARK:VEIN

/obj/structure/vein/classtwo/plasma_gaint
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma = 60,
		/mob/living/simple_animal/hostile/asteroid/brimdemon = 20,
		/mob/living/simple_animal/hostile/asteroid/goliath = 15,
		)

/obj/structure/vein/classthree/plasma_gaint
	mob_types = list(
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma = 60,
		/mob/living/simple_animal/hostile/asteroid/goliath = 40,
		/mob/living/simple_animal/hostile/asteroid/brimdemon = 20,
		/mob/living/simple_animal/hostile/asteroid/big_plasma = 5,
		)

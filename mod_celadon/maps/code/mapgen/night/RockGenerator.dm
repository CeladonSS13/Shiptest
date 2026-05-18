/datum/map_generator/planet_generator/rock/night
	mountain_height = 0.45
	perlin_zoom = 65

	primary_area_type = /area/overmap_encounter/planetoid/rockplanet

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/icecap/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/icecap/night
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/icecap/night
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/wetlands/night
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/wetlands/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/wetlands/night
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/wetlands/night
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/night
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_MEDIUM_HUMIDITY =/datum/biome/cave/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock/night
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock/night
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock/night
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock/night
		)
	)

/datum/biome/rock/night
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet = 1)

	feature_spawn_chance = 0.25
	feature_spawn_list = list(
		/obj/structure/geyser/random = 80,
		/obj/structure/vein = 60,
		/obj/structure/elite_tumor = 40,
		/obj/structure/vein/classtwo = 40,
		/obj/effect/spawner/random/anomaly/rock = 10,
		/obj/structure/vein/classthree = 10,
		/obj/effect/spawner/minefield = 2,
		/obj/effect/spawner/random/anomaly/big = 1 //get out of here stalker
	)

	flora_spawn_chance = 5
	mob_spawn_chance = 3

	flora_spawn_list = list(
		/obj/structure/flora/rock/rockplanet = 6,
		/obj/structure/flora/tree/cactus = 8,
		/obj/structure/flora/ash/cacti = 2,
		/obj/structure/flora/ash/garden/arid = 2,
		/obj/item/mine/pressure/explosive/rusty/live = 1
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 30,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 30,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 30,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 50,
	)

/datum/biome/rock/icecap/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/snow/lit/rockplanet/nolit = 1,
		/turf/open/floor/plating/asteroid/snow/lit/rockplanet/nolit = 5)
	flora_spawn_chance = 1
	mob_spawn_chance = 2

/datum/biome/rock/wetlands/night
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet/wet = 1)
	flora_spawn_chance = 5
	mob_spawn_chance = 4
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 30,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 30,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 10,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 30,
	)
	flora_spawn_list = list(
		/obj/structure/flora/rock/rockplanet = 6,
		/obj/structure/flora/tree/cactus = 8,
		/obj/structure/flora/ash/cacti = 2,
		/obj/structure/flora/grass/rockplanet/dead = 8,
		/obj/structure/flora/ash/garden/arid = 1,
		/obj/item/mine/pressure/explosive/rusty/live = 1
	)

/datum/biome/cave/rock/night
	closed_turf_types = list(/turf/closed/mineral/random/rockplanet = 1)
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet/cracked = 1)
	flora_spawn_chance = 4
	flora_spawn_list = list(
		/obj/structure/flora/rock/rockplanet = 8,
		/obj/structure/flora/rock/pile/rockplanet = 8,
		/obj/structure/flora/ash/fern = 4,
		/obj/structure/flora/ash/puce = 2,
		/obj/item/mine/pressure/explosive/rusty/live = 1,
		/obj/item/mine/proximity/explosive/live = 1,
	)
	feature_spawn_chance = 0.5
	feature_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon/rockplanet = 4,
		// [/CELADON-ADD]
		/obj/structure/vein = 3,
		/obj/structure/geyser/random = 2,
		/obj/structure/vein/classtwo = 2,
		/obj/structure/elite_tumor = 1,
		/obj/structure/vein/classthree = 1,
		/obj/structure/spawner/burrow/rock_plant = 4,
		/obj/effect/spawner/minefield = 1,
		/obj/effect/spawner/random/anomaly/rock/cave = 1,
	)
	mob_spawn_chance = 6
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 20,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 20,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 30,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 50,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 20,
	)

/datum/biome/cave/rock/wet/night
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet/cracked = 1)
	flora_spawn_chance = 5
	flora_spawn_list = list(
		/obj/structure/flora/rock/rockplanet = 8,
		/obj/structure/flora/rock/pile/rockplanet = 8,
		/obj/structure/flora/ash/fern = 6,
		/obj/structure/flora/ash/puce = 4,
		/obj/structure/flora/ash/garden/arid = 2,
		/obj/item/mine/proximity/explosive/live = 1,
		/obj/item/mine/pressure/explosive/rusty/live = 1
	)
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 30,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 30,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 10,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 30,
	)

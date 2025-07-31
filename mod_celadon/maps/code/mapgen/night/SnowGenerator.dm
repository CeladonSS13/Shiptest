/datum/map_generator/planet_generator/snow/night
	mountain_height = 0.40
	perlin_zoom = 55

	initial_closed_chance = 45
	smoothing_iterations = 20
	birth_limit = 4
	death_limit = 3

	primary_area_type = /area/overmap_encounter/planetoid/ice

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/arctic/rocky/night,
			BIOME_LOW_HUMIDITY = /datum/biome/snow/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/iceberg/lake/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/iceberg/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/iceberg/night
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/arctic/night,
			BIOME_LOW_HUMIDITY = /datum/biome/arctic/rocky/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/snow/lush/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/snow/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/iceberg/night
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/snow/thawed/night,
			BIOME_LOW_HUMIDITY = /datum/biome/snow/forest/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/snow/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/snow/lush/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/iceberg/night
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/snow/lush/night,
			BIOME_LOW_HUMIDITY = /datum/biome/snow/forest/dense/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/snow/forest/dense/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/snow/forest/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/snow/lush/night
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/snow/night,
			BIOME_LOW_HUMIDITY = /datum/biome/snow/forest/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/snow/thawed/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/snow/lush/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/snow/night
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/snow/forest/dense/night,
			BIOME_LOW_HUMIDITY = /datum/biome/snow/forest/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/snow/thawed/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/snow/forest/dense/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/snow/thawed/night
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/snow/ice/night
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/snow/ice/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/snow/ice/night
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/snow/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/snow/thawed/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/snow/thawed/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/snow/night
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/snow/thawed/night,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/snow/thawed/night,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/volcanic/lava/plasma/night,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/volcanic/lava/night,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/volcanic/lava/total/night
		)
	)

/datum/biome/snow/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/snow = 25
	)
	flora_spawn_list = list(
		/obj/structure/flora/tree/pine = 4,
		/obj/structure/flora/rock/icy = 4,
		/obj/structure/flora/rock/pile/icy = 4,
		/obj/structure/flora/grass/both = 12,
		/obj/structure/flora/ash/chilly = 4,
		/obj/structure/flora/ash/garden/frigid = 2,
		/obj/item/mine/pressure/explosive/rusty/live{icon = 'mod_celadon/_storge_icons/icons/items/misc/landmine.dmi'} = 1
	)
	flora_spawn_chance = 10
	mob_spawn_chance = 1
	mob_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon = 2,
		/obj/structure/spawner/ice_moon/polarbear = 2,
		// [/CELADON-ADD]
		/mob/living/simple_animal/hostile/asteroid/wolf/random = 30,
		/obj/structure/spawner/burrow/ice_planet = 4,
		/mob/living/basic/bear/polar = 30,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
		/mob/living/simple_animal/hostile/asteroid/ice_demon/random = 10,
		/mob/living/simple_animal/hostile/asteroid/ice_whelp = 10,
		/mob/living/simple_animal/hostile/asteroid/lobstrosity = 10,
	)
	feature_spawn_chance = 0.1
	feature_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon/demonic_portal/low_threat = 25,
		/obj/structure/spawner/ice_moon/demonic_portal/medium_threat = 50,
		/obj/structure/spawner/ice_moon/demonic_portal/high_threat = 13,
		// [/CELADON-ADD]
		/obj/effect/spawner/random/anomaly/ice = 12,
		/obj/effect/spawner/random/anomaly/big = 1,
		/obj/structure/spawner/burrow/ice_planet = 80,
		/obj/structure/vein/ice = 25,
		/obj/effect/spawner/minefield = 2,
		/obj/structure/vein/ice/classtwo = 50,
		/obj/structure/vein/ice/classthree = 10,
	)

/datum/biome/snow/lush/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/snow = 25
	)
	flora_spawn_list = list(
		/obj/structure/flora/grass/both = 1,
	)
	flora_spawn_chance = 30

/datum/biome/snow/thawed/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/icerock = 1
	)
	flora_spawn_chance = 40
	flora_spawn_list = list(
		/obj/structure/flora/ausbushes/fullgrass = 1,
		/obj/structure/flora/ausbushes/sparsegrass = 1,
		/obj/structure/flora/ausbushes = 1,
		/obj/structure/flora/ausbushes/ppflowers = 1,
		/obj/structure/flora/ausbushes/lavendergrass = 1,
		/obj/structure/flora/ash/garden/frigid = 1,
	)

/datum/biome/snow/forest/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/snow = 25
	)
	flora_spawn_chance = 15
	flora_spawn_list = list(
		/obj/structure/flora/tree/pine = 20,
		/obj/structure/flora/tree/dead = 6,
		/obj/structure/flora/grass/both = 8,
		/obj/item/mine/pressure/explosive/rusty/live{icon = 'mod_celadon/_storge_icons/icons/items/misc/landmine.dmi'} = 1,
	)

/datum/biome/snow/forest/dense/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/snow = 25
	)
	flora_spawn_chance = 25
	flora_spawn_list = list(
		/obj/structure/flora/tree/pine = 20,
		/obj/structure/flora/grass/both = 6,
		/obj/structure/flora/tree/dead = 3,
		/obj/item/mine/pressure/explosive/rusty/live{icon = 'mod_celadon/_storge_icons/icons/items/misc/landmine.dmi'} = 1,
	)

/datum/biome/arctic/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/snow = 1
	)
	feature_spawn_chance = 0.1
	feature_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon = 2,
		/obj/structure/spawner/ice_moon/polarbear = 2,
		// [/CELADON-ADD]
		/obj/structure/spawner/burrow/ice_planet = 4,
		/obj/structure/statue/snow/snowman = 3,
		/obj/structure/statue/snow/snowlegion = 1,
		/obj/structure/vein/ice = 3,
		/obj/structure/vein/ice/classtwo = 4,
		/obj/structure/vein/ice/classthree = 1,
	)
	mob_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon = 2,
		/obj/structure/spawner/ice_moon/polarbear = 2,
		// [/CELADON-ADD]
		/mob/living/simple_animal/hostile/asteroid/wolf/random = 30,
		/obj/structure/spawner/burrow/ice_planet = 2,
		/mob/living/basic/bear/polar = 30,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
		/mob/living/simple_animal/hostile/asteroid/ice_demon/random = 5,
		/mob/living/simple_animal/hostile/asteroid/ice_whelp = 5,
		/mob/living/simple_animal/hostile/asteroid/lobstrosity = 5,
	)
	mob_spawn_chance = 1

/datum/biome/arctic/rocky/night
	open_turf_types = list(/turf/open/floor/plating/asteroid/snow = 25)
	flora_spawn_chance = 5
	flora_spawn_list = list(
		/obj/structure/flora/rock/icy = 2,
		/obj/structure/flora/rock/pile/icy = 2,
	)

/datum/biome/iceberg/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/iceberg = 6,
		/turf/open/floor/plating/ice/iceberg = 1,
		/turf/closed/mineral/ice/nolit = 10
	)
	mob_spawn_chance = 2
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/wolf/random = 30,
		/mob/living/basic/bear/polar = 30,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
		/mob/living/simple_animal/hostile/asteroid/ice_demon/random = 5,
		/mob/living/simple_animal/hostile/asteroid/ice_whelp = 5,
		/mob/living/simple_animal/hostile/asteroid/lobstrosity = 5,
	)
	feature_spawn_chance = 0.3
	feature_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon/demonic_portal/low_threat = 200,
		/obj/structure/spawner/ice_moon/demonic_portal/medium_threat = 400,
		/obj/structure/spawner/ice_moon/demonic_portal/high_threat = 40,
		/obj/structure/spawner/ice_moon/demonic_portal/extreme_threat = 1,
		// [/CELADON-ADD]
		/obj/effect/spawner/random/anomaly/ice = 100,
		/obj/effect/spawner/random/anomaly/big = 1,
		/obj/structure/spawner/burrow/ice_planet/hard = 600,
		/obj/structure/vein/ice = 300,
		/obj/structure/vein/ice/classtwo = 500,
		/obj/structure/vein/ice/classthree = 50,
	)


/datum/biome/iceberg/lake/night
	open_turf_types = list(
		/turf/open/floor/plating/ice = 1
	)

/datum/biome/plasma/night
	open_turf_types = list(
		/turf/open/lava/plasma/ice_moon = 5,
		/turf/open/floor/plating/asteroid/icerock/smooth = 1
	)

/datum/biome/cave/snow/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/icerock = 1
	)
	flora_spawn_chance = 6
	flora_spawn_list = list(
		/obj/structure/flora/grass/both = 10,
		/obj/structure/flora/rock/pile/icy = 2,
		/obj/structure/flora/rock/icy = 2,
		/obj/structure/flora/ash/space = 2,
		/obj/structure/flora/ash/leaf_shroom = 2,
		/obj/structure/flora/ash/cap_shroom = 2,
		/obj/structure/flora/ash/stem_shroom = 2,
		/obj/structure/flora/ash/puce = 2,
		/obj/structure/flora/ash/garden/frigid = 2,
		/obj/item/mine/proximity/explosive/live = 1,
		/obj/item/mine/pressure/explosive/rusty/live = 1
	)
	closed_turf_types = list(
		/turf/closed/mineral/random/snow = 1
	)
	mob_spawn_chance = 2
	mob_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon = 2,
		/obj/structure/spawner/ice_moon/polarbear = 2,
		// [/CELADON-ADD]
		/mob/living/simple_animal/hostile/asteroid/wolf/random = 30,
		/obj/structure/spawner/burrow/ice_planet = 4,
		/mob/living/basic/bear/polar = 30,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
		/mob/living/simple_animal/hostile/asteroid/ice_demon/random = 5,
		/mob/living/simple_animal/hostile/asteroid/ice_whelp = 5,
		/mob/living/simple_animal/hostile/asteroid/lobstrosity = 10,
	)
	feature_spawn_chance = 0.2
	feature_spawn_list = list(
		// [CELADON-ADD] - RETURN_CONTENT
		/obj/structure/spawner/ice_moon/demonic_portal/low_threat = 20,
		/obj/structure/spawner/ice_moon/demonic_portal/medium_threat = 40,
		/obj/structure/spawner/ice_moon/demonic_portal/high_threat = 5,
		/obj/structure/spawner/ice_moon/demonic_portal/extreme_threat = 1,
		/obj/structure/spawner/ice_moon = 20,
		/obj/structure/spawner/ice_moon/polarbear = 20,
		// [/CELADON-ADD]
		/obj/structure/spawner/burrow/ice_planet = 60,
		/obj/structure/spawner/burrow/ice_planet = 40,
		/obj/effect/spawner/random/anomaly/ice/cave = 10,
		/obj/structure/vein/ice = 30,
		/obj/structure/vein/ice/classtwo = 50,
		/obj/structure/vein/ice/classthree = 6,
		/obj/effect/spawner/minefield = 2,
	)

/datum/biome/cave/snow/thawed/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/icerock/cracked = 1
	)
	closed_turf_types = list(
		/turf/closed/mineral/random/snow = 1
	)

/datum/biome/cave/snow/ice/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/icerock = 20,
		/turf/open/floor/plating/ice = 3
	)
	closed_turf_types = list(
		/turf/closed/mineral/random/snow = 1
	)

/datum/biome/cave/volcanic/night
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/basalt = 1
	)
	closed_turf_types = list(
		/turf/closed/mineral/random/snow = 1
		)
	mob_spawn_chance = 2
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/wolf/random = 30,
		/mob/living/basic/bear/polar = 30,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow = 50,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 10,
		/mob/living/simple_animal/hostile/asteroid/ice_demon/random = 10,
		/mob/living/simple_animal/hostile/asteroid/ice_whelp = 10,
		/mob/living/simple_animal/hostile/asteroid/lobstrosity = 10,
	)
	flora_spawn_chance = 3
	flora_spawn_list = list(
		/obj/structure/flora/ash/leaf_shroom = 3,
		/obj/structure/flora/ash/cap_shroom = 3,
		/obj/structure/flora/ash/stem_shroom = 3,
		/obj/item/mine/pressure/explosive/fire/live = 1,
	)
	feature_spawn_chance = 0.2

/datum/biome/cave/volcanic/lava/night
	open_turf_types = list(
		/turf/open/lava/smooth = 10,
		/turf/open/floor/plating/asteroid/icerock/smooth = 1
	)

/datum/biome/cave/volcanic/lava/total/night
	open_turf_types = list(
		/turf/open/lava/smooth = 1
	)

/datum/biome/cave/volcanic/lava/plasma/night
	open_turf_types = list(
		/turf/open/lava/plasma = 7,
		/turf/open/floor/plating/asteroid/icerock/smooth = 1
	)

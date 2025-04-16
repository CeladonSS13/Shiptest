/datum/map_generator/planet_generator/plasma_gaint
	mountain_height = 0.65
	perlin_zoom = 35

	primary_area_type = /area/overmap_encounter/planetoid/plasma_gaint

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/plasma_gaint/forest,
			BIOME_LOW_HUMIDITY = /datum/biome/plasma_gaint/plains/dense/mixed,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/plasma_gaint/forest/rocky,
			BIOME_HIGH_HUMIDITY = /datum/biome/plasma_gaint/outback,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/plasma_gaint/plains/dense
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/plasma_gaint/plains,
			BIOME_LOW_HUMIDITY = /datum/biome/plasma_gaint/outback,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/plasma_gaint/plains/dense,
			BIOME_HIGH_HUMIDITY = /datum/biome/plasma_gaint/plains/dense/mixed,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/plasma_gaint/outback
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/plasma_gaint,
			BIOME_LOW_HUMIDITY = /datum/biome/plasma_gaint/plains,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/plasma_gaint/forest,
			BIOME_HIGH_HUMIDITY = /datum/biome/plasma_gaint/lush,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/plasma_gaint/lava
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/plasma_gaint/plains/dense/mixed,
			BIOME_LOW_HUMIDITY = /datum/biome/plasma_gaint/forest,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/plasma_gaint/plains/dense,
			BIOME_HIGH_HUMIDITY = /datum/biome/plasma_gaint,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/plasma_gaint/lava
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/plasma_gaint/outback,
			BIOME_LOW_HUMIDITY = /datum/biome/plasma_gaint,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/plasma_gaint/plains/dense/mixed,
			BIOME_HIGH_HUMIDITY = /datum/biome/plasma_gaint,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/plasma_gaint/lava
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/plasma_gaint/forest/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/plasma_gaint/outback,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/plasma_gaint/plains,
			BIOME_HIGH_HUMIDITY = /datum/biome/plasma_gaint,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/plasma_gaint/lava
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/plasma_gaint/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/plasma_gaint/rocky,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/plasma_gaint,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/plasma_gaint,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/plasma_gaint/mossy
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/plasma_gaint/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/plasma_gaint,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/plasma_gaint/lava,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/plasma_gaint/mossy,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/plasma_gaint/lava
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/plasma_gaint/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/plasma_gaint,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/plasma_gaint/mossy,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/plasma_gaint/rocky,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/plasma_gaint/lava
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/plasma_gaint/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/plasma_gaint/mossy,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/plasma_gaint/mossy,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/plasma_gaint/lava,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/plasma_gaint/lava
		)
	)

///MARK:BIOME

/datum/biome/plasma_gaint
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/plasma_gaint/lit = 1,
	)

	flora_spawn_list = list(
		/obj/structure/flora/tree/dead/tall/grey = 1,
		/obj/structure/flora/tree/dead/barren = 1,
		/obj/structure/flora/ausbushes/fullgrass/hell = 1,
		/obj/structure/flora/ausbushes/sparsegrass/hell = 1,
	)
	flora_spawn_chance = 25

/datum/biome/plasma_gaint/forest
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/plasma_gaint/lit = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma = 20,
	)
	mob_spawn_chance = 5

	flora_spawn_list = list(
		/obj/structure/flora/tree/dead/tall/grey = 1,
		/obj/structure/flora/tree/dead/barren = 1,
		/obj/structure/flora/ausbushes/fullgrass/hell = 1,
		/obj/structure/flora/ausbushes/sparsegrass/hell = 1,
	)
	flora_spawn_chance = 35

/datum/biome/plasma_gaint/forest/rocky
	flora_spawn_list = list(
		/obj/structure/flora/rock/lava = 2,
		/obj/structure/flora/ausbushes/fullgrass/hell = 10,
		/obj/structure/flora/ausbushes/sparsegrass/hell = 5,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma = 20,
	)
	mob_spawn_chance = 5

	flora_spawn_chance = 10

/datum/biome/plasma_gaint/plains
	open_turf_types = list(
		/turf/open/chasm/plasma = 1,
	)
	feature_spawn_chance = null
	flora_spawn_chance = null

/datum/biome/plasma_gaint/plains/dense
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/basalt/purple/lit/plasma_gaint = 50,
	)
	flora_spawn_chance = 10

/datum/biome/plasma_gaint/plains/dense/mixed
	open_turf_types = list(
		/turf/open/chasm/plasma = 1,
	)
	feature_spawn_chance = null
	flora_spawn_chance = null

/datum/biome/plasma_gaint/outback
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/basalt/purple/lit/plasma_gaint = 20,
	)

/datum/biome/plasma_gaint/lush
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/basalt/purple/lit/plasma_gaint = 1,
	)

/datum/biome/plasma_gaint/lava
	open_turf_types = list(
		/turf/open/lava/plasma_gaint = 1,
	)
	flora_spawn_list = list(
		/obj/structure/flora/rock/lava = 1,
		/obj/structure/flora/rock/pile/lava = 1,
	)
	flora_spawn_chance = 2

/datum/biome/plasma_gaint/lava/rocky
	flora_spawn_chance = 4

///MARK:CAVE

/datum/biome/cave/plasma_gaint
	closed_turf_types = list(
		/turf/closed/mineral/random/plasma_gaint = 1,
	)

	feature_spawn_chance = 10
	feature_spawn_list = list(
		/obj/structure/spawner/plasma_gaint/extreme_threat = 10,
	)

	mob_spawn_chance = 45
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/big_plasma = 30,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma = 40,
	)

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/basalt/plasma_gaint = 1,
	)

/datum/biome/cave/plasma_gaint/rocky
	closed_turf_types = list(
		/turf/closed/mineral/random/plasma_gaint = 1,
	)

	feature_spawn_chance = 0.25
	feature_spawn_list = list(
		/obj/structure/vein/classtwo/plasma_gaint = 30,
		/obj/structure/vein/classthree/plasma_gaint = 60,
	)

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/plasma_gaint = 1,
	)

/datum/biome/cave/plasma_gaint/mossy
	closed_turf_types = list(
		/turf/closed/mineral/random/plasma_gaint = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/big_plasma = 10,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal_plasma = 20,
	)
	mob_spawn_chance = 40

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/plasma_gaint = 1,
	)

/datum/biome/cave/plasma_gaint/lava
	closed_turf_types = list(
		/turf/closed/mineral/random/plasma_gaint = 1,
	)

	open_turf_types = list(
		/turf/open/lava/plasma_gaint = 50,
	)

/datum/map_generator/planet_generator/earth_sand

	mountain_height = 0.3
	perlin_zoom = 80

	primary_area_type = /area/overmap_encounter/planetoid/earth_sand

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/earth_sand/forest,
			BIOME_LOW_HUMIDITY = /datum/biome/earth_sand/plains/dense/mixed,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/earth_sand/forest/rocky,
			BIOME_HIGH_HUMIDITY = /datum/biome/earth_sand/outback,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/earth_sand/plains/dense
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/earth_sand/plains,
			BIOME_LOW_HUMIDITY = /datum/biome/earth_sand/outback,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/earth_sand/plains/dense,
			BIOME_HIGH_HUMIDITY = /datum/biome/earth_sand/plains/dense/mixed,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/earth_sand/outback
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/earth_sand,
			BIOME_LOW_HUMIDITY = /datum/biome/earth_sand/plains,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/earth_sand/forest,
			BIOME_HIGH_HUMIDITY = /datum/biome/earth_sand/lush,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/earth_sand/lava
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/earth_sand/plains/dense/mixed,
			BIOME_LOW_HUMIDITY = /datum/biome/earth_sand/forest,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/earth_sand/plains/dense,
			BIOME_HIGH_HUMIDITY = /datum/biome/earth_sand,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/earth_sand/lava
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/earth_sand/outback,
			BIOME_LOW_HUMIDITY = /datum/biome/earth_sand,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/earth_sand/plains/dense/mixed,
			BIOME_HIGH_HUMIDITY = /datum/biome/earth_sand,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/earth_sand/lava
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/earth_sand/forest/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/earth_sand/outback,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/earth_sand/plains,
			BIOME_HIGH_HUMIDITY = /datum/biome/earth_sand,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/earth_sand/lava
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/earth_sand/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/earth_sand/rocky,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/earth_sand,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/earth_sand,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/earth_sand/mossy
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/earth_sand/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/earth_sand,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/earth_sand/lava,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/earth_sand/mossy,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/earth_sand/lava
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/earth_sand/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/earth_sand,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/earth_sand/mossy,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/earth_sand/rocky,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/earth_sand/lava
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/earth_sand/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/earth_sand/mossy,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/earth_sand/mossy,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/earth_sand/lava,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/earth_sand/lava
		)
	)

/datum/biome/earth_sand
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand/lit = 1
	)
	flora_spawn_list = list(
		/obj/structure/flora/tree/palm = 1,
		/obj/structure/flora/grass/rockplanet/dead = 1,
		/obj/structure/flora/grass/rockplanet = 2
	)
	flora_spawn_chance = 10

/datum/biome/earth_sand/forest
	open_turf_types = list(
		/turf/open/floor/plating/grass/beach/lit = 10,
		/turf/open/floor/plating/asteroid/sand/lit = 1
	)
	flora_spawn_list = list(
		/obj/structure/flora/tree/palm = 1,
		/obj/structure/flora/ausbushes/fullgrass/hell = 2,
		/obj/structure/flora/grass/rockplanet/dead = 1
	)
	flora_spawn_chance = 15

/datum/biome/earth_sand/forest/rocky
	flora_spawn_list = list(
		/obj/structure/flora/rock/beach = 1
	)
	flora_spawn_chance = 15

/datum/biome/earth_sand/plains
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand/lit = 1
	)
	flora_spawn_list = list(
		/obj/structure/flora/tree/palm = 1
	)
	flora_spawn_chance = 15

/datum/biome/earth_sand/plains/dense
	open_turf_types = list(
		/turf/open/floor/plating/grass/beach/lit = 10,
		/turf/open/floor/plating/asteroid/sand/lit = 1
	)
	flora_spawn_chance = 5

/datum/biome/earth_sand/plains/dense/mixed
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand/lit = 1
	)
	flora_spawn_chance = null

/datum/biome/earth_sand/outback
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand/lit = 20
	)

/datum/biome/earth_sand/lush
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand/lit = 1
	)

/datum/biome/earth_sand/lava
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand/lit = 1
	)
	flora_spawn_list = list(
		/obj/structure/flora/ausbushes/fullgrass/hell = 3
	)
	flora_spawn_chance = 2

/datum/biome/earth_sand/lava/rocky
	flora_spawn_chance = 4

/datum/biome/cave/earth_sand
	closed_turf_types = list(
		/turf/closed/mineral/random/whitesands/earth = 1
	)

	flora_spawn_list = list(
		/obj/structure/flora/rock/beach = 1
	)
	flora_spawn_chance = 5

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/whitesands = 1
	)

/datum/biome/cave/earth_sand/rocky
	closed_turf_types = list(
		/turf/closed/mineral/random/whitesands/earth = 1
	)

	flora_spawn_chance = 15

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand = 1
	)

/datum/biome/cave/earth_sand/mossy
	closed_turf_types = list(
		/turf/closed/mineral/random/whitesands/earth = 1
	)

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/sand = 1
	)

/datum/biome/cave/earth_sand/lava
	closed_turf_types = list(
		/turf/closed/mineral/random/whitesands/earth = 1
	)

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/whitesands = 50
	)

/turf/open/floor/plating/asteroid/whitesands/grass
	dug = TRUE // После вскапывания травы появляется чёрный квадрат, потому мы запрещаем трогать траву.

/datum/map_generator/planet_generator/anima

	mountain_height = 1
	perlin_zoom = 30

	initial_closed_chance = 45
	smoothing_iterations = 20
	birth_limit = 4
	death_limit = 3

	primary_area_type = /area/overmap_encounter/planetoid/anima

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/anima/default,
			BIOME_LOW_HUMIDITY = /datum/biome/anima/lavaland,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/anima/lavaland/forest,
			BIOME_HIGH_HUMIDITY = /datum/biome/anima/snow/icerock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/anima/waste
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/anima/snow,
			BIOME_LOW_HUMIDITY = /datum/biome/anima/sand,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/anima/default,
			BIOME_HIGH_HUMIDITY = /datum/biome/anima/waste,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/anima/jungle
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/anima/snow/icerock,
			BIOME_LOW_HUMIDITY = /datum/biome/anima/sand/grass,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/anima/default,
			BIOME_HIGH_HUMIDITY = /datum/biome/anima/lavaland,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/anima/snow/forest
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/anima/jungle,
			BIOME_LOW_HUMIDITY = /datum/biome/anima/default,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/anima/sand/grass,
			BIOME_HIGH_HUMIDITY = /datum/biome/anima/waste,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/anima/snow
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/anima/sand,
			BIOME_LOW_HUMIDITY = /datum/biome/anima/jungle,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/anima/waste,
			BIOME_HIGH_HUMIDITY = /datum/biome/anima/snow,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/anima/lavaland/forest
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/anima/waste/crater,
			BIOME_LOW_HUMIDITY = /datum/biome/anima/lavaland,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/anima/jungle,
			BIOME_HIGH_HUMIDITY = /datum/biome/anima/snow/forest,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/anima/default
		)
	)

//Стандартный биом - (космос)
/datum/biome/anima/default
	open_turf_types = list(
		/turf/open/space/anima = 70,
		/turf/open/indestructible/supermatter_cascade/stationary = 3
	)
	mob_spawn_chance = 5
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/old_demon/anima = 1,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/forgotten/anima = 5
	)
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 1
	)

//Снежные биомы
/datum/biome/anima/snow
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/snow/anima = 25,
	)
	flora_spawn_chance = 10
	flora_spawn_list = list(
		/obj/structure/flora/tree/pine = 4,
		/obj/structure/flora/rock/icy = 4,
		/obj/structure/flora/rock/pile/icy = 4,
		/obj/structure/flora/grass/both = 12,
		/obj/structure/flora/ash/chilly = 4,
		/obj/structure/flora/ash/garden/frigid = 2,
		/obj/item/mine/pressure/explosive/rusty/live = 1
	)
	mob_spawn_chance = 25
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/poison/giant_spider/ice/anima = 20,
		/mob/living/simple_animal/hostile/poison/giant_spider/hunter/ice/anima = 10,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing/anima = 15,
		/mob/living/simple_animal/hostile/asteroid/old_demon = 5
	)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 20,
		/obj/effect/spawner/minefield = 1,
		/obj/structure/trap/chill = 1
	)

/datum/biome/anima/snow/icerock
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/icerock/anima = 1
	)
	flora_spawn_chance = 35
	flora_spawn_list = list(
		/obj/structure/flora/ausbushes/fullgrass = 1,
		/obj/structure/flora/ausbushes/sparsegrass = 1,
		/obj/structure/flora/ausbushes = 1,
		/obj/structure/flora/ausbushes/ppflowers = 1,
		/obj/structure/flora/ausbushes/lavendergrass = 1,
		/obj/structure/flora/ash/garden/frigid = 1,
	)
	mob_spawn_chance = 30
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 20,
		/obj/effect/spawner/minefield = 1,
		/obj/structure/trap/chill = 1
	)

/datum/biome/anima/snow/forest
	flora_spawn_chance = 25
	flora_spawn_list = list(
		/obj/structure/flora/tree/pine = 15,
		/obj/structure/flora/tree/dead = 7,
		/obj/structure/flora/grass/both = 8,
		/obj/item/mine/pressure/explosive/rusty/live = 1,
	)
	mob_spawn_chance = 30
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 20,
		/obj/effect/spawner/minefield = 1,
		/obj/structure/trap/chill = 1
	)

//Биом свалки
/datum/biome/anima/waste
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/wasteplanet/lit/anima = 80,
		/turf/open/floor/plating/wasteplanet/rust/lit/anima = 15,
		/turf/open/floor/plating/wasteplanet/lit/anima = 5
	)
	flora_spawn_chance = 25
	flora_spawn_list = list(
		/obj/effect/spawner/random/waste/mechwreck = 100,
		/obj/effect/spawner/random/waste/mechwreck/rare = 20,
		/obj/effect/spawner/random/trash/decal = 1800,
		/obj/effect/spawner/random/waste/radiation = 80,
		/obj/effect/spawner/random/waste/radiation/more_rads = 10,
		/obj/effect/spawner/random/waste/girder = 600,
		/obj/structure/reagent_dispensers/watertank = 200,
		/obj/item/stack/cable_coil/cut = 500,
		/obj/structure/closet/crate/secure/loot = 30,
		/obj/effect/spawner/random/waste/atmos_can = 50,
		/obj/effect/spawner/random/waste/atmos_can/rare = 1,
		/obj/effect/spawner/random/waste/salvageable = 300,
		/obj/effect/spawner/random/waste/grille_or_trash = 200,
		/obj/effect/spawner/random/maintenance = 200,
		/obj/effect/spawner/random/maintenance/two = 100,
		/obj/effect/spawner/random/maintenance/three = 50,
		/obj/effect/spawner/random/maintenance/four = 20,
		/obj/structure/flora/ash/garden/waste = 70,
		/obj/structure/flora/ash/glowshroom = 200,
		/obj/item/mine/pressure/explosive/shrapnel/live = 20,
		/obj/effect/spawner/random/mine = 6,
		/obj/effect/spawner/minefield = 1
	)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/radiation/waste = 30,
		/obj/effect/radiation/waste/intense = 10,
		/obj/structure/geyser/random = 1,
		/obj/effect/spawner/random/anomaly = 10,
		/obj/structure/trap/damage = 1
	)
	mob_spawn_chance = 30
	mob_spawn_list = list(
		/mob/living/basic/hivebot/strong/anima = 30,
		/mob/living/basic/hivebot/ranged/anima = 15,
		/mob/living/basic/hivebot/ranged/rapid/anima = 15,
		/mob/living/simple_animal/hostile/mimic/anima = 40,
		/mob/living/simple_animal/bot/firebot/rockplanet/anima = 15,
		/mob/living/simple_animal/bot/secbot/ed209/rockplanet/anima = 3,
		/mob/living/simple_animal/hostile/abandoned_minebot/anima = 15,
	)

/datum/biome/anima/waste/crater
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/wasteplanet/lit/anima = 90,
		/turf/open/floor/plating/wasteplanet/rust/lit/anima = 10,
	)
	flora_spawn_list = list(
		/obj/effect/spawner/random/trash/decal = 180,
		/obj/effect/spawner/random/waste/radiation = 16,
		/obj/effect/spawner/random/waste/radiation/more_rads = 2,
		/obj/effect/spawner/random/waste/atmos_can = 36,
		/obj/effect/spawner/random/waste/atmos_can/rare = 1,
		/obj/effect/spawner/random/waste/salvageable = 60,
	)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 10,
		/obj/structure/trap/damage = 1
	)

//Биом джунглей
/datum/biome/anima/jungle
	open_turf_types = list(
	/turf/open/floor/plating/grass/jungle/lit/anima = 1
	)
	flora_spawn_chance = 70
	flora_spawn_list = list(
		/obj/structure/flora/grass/jungle = 1,
		/obj/structure/flora/grass/jungle/b = 1,
		/obj/structure/flora/tree/jungle = 3,
		/obj/structure/flora/rock/jungle = 1,
		/obj/structure/flora/junglebush = 1,
		/obj/structure/flora/junglebush/b = 1,
		/obj/structure/flora/junglebush/c = 1,
		/obj/structure/flora/junglebush/large = 1,
		/obj/structure/spacevine/dense = 5,
		/obj/structure/spacevine/dense = 2,
		/obj/structure/flora/ash/garden = 1,
	)
	mob_spawn_chance = 30
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/jungle/leaper/anima = 5,
		/mob/living/simple_animal/hostile/jungle/seedling/anima = 25
		)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 7,
		/obj/structure/trap/damage = 1
	)

//Биомы лавы
/datum/biome/anima/lavaland
	open_turf_types = list(
		/turf/open/floor/plating/asteroid/basalt/lava_land_surface/lit/anima = 80,
	)
	flora_spawn_chance = 10
	flora_spawn_list = list(
		/obj/structure/flora/ausbushes/ywflowers/hell = 10,
		/obj/structure/flora/ausbushes/sparsegrass/hell = 40,
		/obj/structure/flora/ash/fern = 5,
		/obj/structure/flora/ash/fireblossom = 1,
		/obj/structure/flora/ash/puce = 5,
		/obj/item/mine/pressure/explosive/rusty/live = 1,
	)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/structure/flora/rock/hell = 20,
		/obj/structure/geyser/random = 4,
		/obj/structure/flora/rock/hell = 14,
		/obj/effect/spawner/minefield = 1,
		/obj/effect/spawner/random/anomaly = 15,
		/obj/structure/trap/fire = 1
	)
	mob_spawn_chance = 38
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/brimdemon/anima = 5,
		/mob/living/simple_animal/hostile/asteroid/goliath/magma/anima = 15,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/magmawing/anima = 20,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma/anima = 15
	)

/datum/biome/anima/lavaland/forest
	open_turf_types = list(
	/turf/open/floor/plating/asteroid/purple/lit/anima = 1
	)
	flora_spawn_chance = 65
	flora_spawn_list = list(
		/obj/structure/flora/rock/pile/lava = 3,
		/obj/structure/flora/rock/lava = 2,
		/obj/structure/flora/tree/dead/tall/grey = 10,
		/obj/structure/flora/ausbushes/fullgrass/hell = 40,
		/obj/structure/flora/ausbushes/sparsegrass/hell = 20,
		/obj/structure/flora/ausbushes/hell = 2
	)
	mob_spawn_chance = 35
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/asteroid/brimdemon/anima = 5,
		/mob/living/simple_animal/hostile/asteroid/goliath/magma/anima = 15,
		/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/magmawing/anima = 20,
		/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma/anima = 15
	)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 10,
		/obj/structure/trap/fire = 1
	)

//Биомы песка
/datum/biome/anima/sand
	open_turf_types = list(
	/turf/open/floor/plating/asteroid/whitesands/lit/anima = 1
	)
	flora_spawn_chance = 3
	flora_spawn_list = list(
		/obj/structure/flora/ash/leaf_shroom = 4,
		/obj/structure/flora/ash/cap_shroom = 4,
		/obj/structure/flora/ash/stem_shroom = 4
	)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/structure/geyser/random = 4,
		/obj/effect/spawner/random/anomaly = 8,
		/obj/structure/trap/stun = 1
	)
	mob_spawn_chance = 30
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/jungle/mook/anima = 25,
		/mob/living/simple_animal/hostile/jungle/mega_arachnid/anima = 5
	)

/datum/biome/anima/sand/grass
	open_turf_types = list(
	/turf/open/floor/plating/asteroid/whitesands/grass/lit/anima = 1
	)
	flora_spawn_chance = 5
	flora_spawn_list = list(
		/obj/structure/flora/ash/cacti = 2,
		/obj/structure/flora/ash/fern = 4,
		/obj/structure/flora/tree/tall/whitesands = 4,
		/obj/structure/flora/rock = 3,
		/obj/structure/flora/rock/pile = 3
	)
	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/anomaly = 5,
		/obj/structure/trap/stun = 1
	)
	mob_spawn_chance = 25
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/jungle/mook/anima = 20,
		/mob/living/simple_animal/hostile/jungle/mega_arachnid/anima = 5
	)

/area/ruin/anima
	ambientsounds = AMBIENCE_REEBE
	always_unpowered = FALSE

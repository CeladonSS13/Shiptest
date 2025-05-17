/datum/planet_type/old_town
	name = "old town"
	desc = "An abandoned and infected city. A place you don't want to be."
	planet = DYNAMIC_WORLD_OLD_TOWN
	color = COLOR_NAVY
	mapgen = null
	gravity = GRAVITY_DAMAGE_TRESHOLD
	default_baseturf = /turf/open/floor/plating/asteroid/wasteplanet
	weather_controller_type = /datum/weather_controller/desert
	weight = 0
	// [CELADON-EDIT] -- CELADON_OVERMAP_ICON -- вагагагагагагагагагагага
	// icon_state = "globe"
	icon_state = "sand"
	// [/CELADON-EDIT]
	preserve_level = TRUE
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/plasma_giant
	name = "plasma giant"
	desc = "The backbone of interstellar travel, the mighty plasma giant allows fuel collection to take place."
	ruin_type = RUINTYPE_PLASMA
	gravity = STANDARD_GRAVITY
	planet = DYNAMIC_WORLD_PLASMA_GIANT
	pixel_w = -8
	pixel_z = -8
	icon_state = "planet-plasma"
	icon = 'mod_celadon/_storge_icons/icons/overmap/overmap_large.dmi'
	landing_sound = 'mod_celadon/_storge_sounds/sound/events/planet_landing_3.mp3'
	mapgen = /datum/map_generator/planet_generator/plasma_gaint
	default_baseturf = /turf/open/floor/plating/asteroid/plasma_gaint
	preserve_level = FALSE
	weight = 0
	interference_power = 10

/datum/planet_type/earthsand
	name = "Sand Planet"
	desc = "Great Quicksand"
	planet = DYNAMIC_WORLD_EARTH_SAND
	// [CELADON-EDIT] -- CELADON_OVERMAP_ICON -- вагагагагагагагагагагага
	//	color = COLOR_LIGHT_ORANGE
	icon_state = "sand"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/earth_sand
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/sand
	weight = 0
	ruin_type = RUINTYPE_EARTH_SAND
	landing_sound = 'mod_celadon/_storge_sounds/sound/events/planet_landing_3.mp3'

/datum/planet_type/asteroid
	weight = 40
	ruin_type = RUINTYPE_ASTEROID

/datum/planet_type/ice_night // Мне очень не нравится, как я это сделал, но на другую реализацию у меня не хватает знаний
	name = "frozen planet"
	desc = "A frozen planet covered in thick snow, thicker ice, and dangerous predators."
	planet = DYNAMIC_WORLD_ICE_NIGHT
	icon_state = "snow"
	// color = COLOR_BLUE_LIGHT
	mapgen = /datum/map_generator/planet_generator/snow/night
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_ICE
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/jungle_night
	name = "jungle planet"
	desc = "A densely forested world, filled with vines, animals, and underbrush. Surprisingly habitable with a machete."
	planet = DYNAMIC_WORLD_JUNGLE_NIGHT
	icon_state = "jungle"
	// color = COLOR_LIME
	mapgen = /datum/map_generator/planet_generator/jungle/night
	default_baseturf = /turf/open/floor/plating/dirt/jungle
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_JUNGLE
	landing_sound = 'sound/effects/planet_landing_1.ogg'

/datum/planet_type/rock_night

	name = "rock planet"
	desc = "A rocky red world in the midst of terraforming. While some plants have taken hold, it is widely hostile to life."
	planet = DYNAMIC_WORLD_ROCKPLANET_NIGHT
	icon_state = "red"
	// color = "#bd1313"
	mapgen = /datum/map_generator/planet_generator/rock/night
	default_baseturf = /turf/open/floor/plating/asteroid
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/rockplanet
	ruin_type = RUINTYPE_ROCK
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/beach_night

	name = "beach planet"
	desc = "The platonic ideal of vacation spots. Warm, comfortable temperatures, and a breathable atmosphere."
	planet = DYNAMIC_WORLD_BEACHPLANET_NIGHT
	icon_state = "beach"
	// color = "#c6b597"
	mapgen = /datum/map_generator/planet_generator/beach/night
	default_baseturf = /turf/open/floor/plating/asteroid/sand/lit
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_BEACH
	landing_sound = 'sound/effects/planet_landing_1.ogg'

//Для работы модульной планеты Anima
/datum/planet_type/anima
	name = "???"
	desc = "Some sort of ugly shaped planet with an energy field around it. There's no identification of what this is."
	planet = DYNAMIC_WORLD_ANIMA
	icon_state = "anima"
	//	color = COLOR_YELLOW
	mapgen = /datum/map_generator/planet_generator/anima
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/space/anima
	weather_controller_type = null
	weight = 2
	ruin_type = RUINTYPE_ANIMA

//Меняем цвета планет на овермапе
/datum/planet_type/water
	color = null

/datum/planet_type/desert
	color = null

/datum/planet_type/shrouded
	color = null

/datum/planet_type/moon
	color = null

/datum/planet_type/battlefield
	color = null

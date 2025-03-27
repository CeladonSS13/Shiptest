/datum/planet_type
	var/name = "planet"
	var/desc = "A planet."
	var/planet = null
	var/ruin_type = null
	var/mapgen = null
	var/default_baseturf = null
	var/gravity = 0
	var/weather_controller_type = null
	var/icon_state = "globe"
	var/color = "#ffffff"
	var/weight = 20
	var/preserve_level = FALSE
	var/landing_sound
	// [CELADON-ADD] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	var/icon = 'mod_celadon/_storge_icons/icons/overmap/overmap.dmi'
	var/pixel_w = 0
	var/pixel_z = 0
	// [/CELADON-ADD]

/datum/planet_type/lava
	name = "lava planet"
	desc = "A planet rife with seismic and volcanic activity. High temperatures and dangerous xenofauna render it dangerous for the unprepared."
	planet = DYNAMIC_WORLD_LAVA
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_ORANGE
	//  icon_state = "globe_2"
	icon_state = "volcano"
	// [/CELADON-EDIT]

	mapgen = /datum/map_generator/planet_generator/lava
	default_baseturf = /turf/open/floor/plating/asteroid/basalt/lava
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lavaland
	ruin_type = RUINTYPE_LAVA
	landing_sound = 'sound/effects/planet_landing_2.ogg'


/datum/planet_type/ice
	name = "frozen planet"
	desc = "A frozen planet covered in thick snow, thicker ice, and dangerous predators."
	planet = DYNAMIC_WORLD_ICE
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_BLUE_LIGHT
	// icon_state = "globe_2"
	icon_state = "ice"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/snow
	default_baseturf = /turf/open/floor/plating/asteroid/snow/icemoon
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/snow_planet
	ruin_type = RUINTYPE_ICE
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/jungle
	name = "jungle planet"
	desc = "A densely forested world, filled with vines, animals, and underbrush. Surprisingly habitable with a machete."
	planet = DYNAMIC_WORLD_JUNGLE
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_LIME
	// icon_state = "globe_2"
	icon_state = "jungle"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/jungle
	default_baseturf = /turf/open/floor/plating/dirt/jungle
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_JUNGLE
	landing_sound = 'sound/effects/planet_landing_1.ogg'

/datum/planet_type/rock
	name = "rock planet"
	desc = "A rocky red world in the midst of terraforming. While some plants have taken hold, it is widely hostile to life."
	planet = DYNAMIC_WORLD_ROCKPLANET
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = "#bd1313"
	// icon_state = "globe_2"
	icon_state = "red"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/rock
	default_baseturf = /turf/open/floor/plating/asteroid
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/rockplanet
	ruin_type = RUINTYPE_ROCK
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/sand
	name = "sand planet"
	desc = "A formerly vibrant world, turned to sand by the ravages of the ICW. The survivors of it are long mad by now."
	planet = DYNAMIC_WORLD_SAND
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_GRAY
	// icon_state = "globe_2"
	icon_state = "sand"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/sand
	default_baseturf = /turf/open/floor/plating/asteroid/whitesands
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/desert
	ruin_type = RUINTYPE_SAND
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/beach
	name = "beach planet"
	desc = "The platonic ideal of vacation spots. Warm, comfortable temperatures, and a breathable atmosphere."
	planet = DYNAMIC_WORLD_BEACHPLANET
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	// icon_state = "globe2"
	//	color = "#c6b597"
	icon_state = "beach"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/beach
	default_baseturf = /turf/open/floor/plating/asteroid/sand/lit
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_BEACH
	landing_sound = 'sound/effects/planet_landing_1.ogg'

/datum/planet_type/reebe
	name = "???"
	desc = "Some sort of strange portal. There's no identification of what this is."
	planet = DYNAMIC_WORLD_REEBE
	icon_state = "wormhole"
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_YELLOW
	// [/CELADON-REMOVE]
	mapgen = /datum/map_generator/single_biome/reebe
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/chasm/reebe_void
	weather_controller_type = null
	weight = 0
	ruin_type = RUINTYPE_YELLOW

/datum/planet_type/asteroid
	name = "asteroid field"
	desc = "A field of asteroids with significant traces of minerals."
	planet = DYNAMIC_WORLD_ASTEROID
	icon_state = "asteroid"
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_GRAY
	// [/CELADON-REMOVE]
	mapgen = /datum/map_generator/planet_generator/asteroid
	// Space, because asteroid maps also include space turfs and the prospect of space turfs
	// existing without space as their baseturf scares me.
	default_baseturf = /turf/open/space
	weather_controller_type = null
	ruin_type = null // asteroid ruins when
	landing_sound = 'sound/effects/planet_landing_1.ogg'

/datum/planet_type/spaceruin
	name = "weak energy signal"
	desc = "A very weak energy signal originating from space."
	planet = DYNAMIC_WORLD_SPACERUIN
	icon_state = "strange_event"
	color = null
	mapgen = /datum/map_generator/single_turf/space
	default_baseturf = /turf/open/space
	weather_controller_type = null
	ruin_type = RUINTYPE_SPACE
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/waste
	name = "waste disposal planet"
	desc = "A highly oxygenated world, coated in garbage, radiation, and rust."
	planet = DYNAMIC_WORLD_WASTEPLANET
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	// icon_state = "globe2"
	//	color = "#a9883e"
	icon_state = "waste"
	mapgen = /datum/map_generator/planet_generator/waste
	default_baseturf = /turf/open/floor/plating/asteroid/wasteplanet
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/chlorine
	ruin_type = RUINTYPE_WASTE
	landing_sound = 'sound/effects/planet_landing_2.ogg'

/datum/planet_type/gas_giant
	name = "gas giant"
	desc = "A floating ball of gas, with high gravity and even higher pressure."
	planet = DYNAMIC_WORLD_GAS_GIANT
	icon_state = "planet-giant"
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_DARK_MODERATE_ORANGE
	icon = 'mod_celadon/_storge_icons/icons/overmap/overmap_large.dmi'
	pixel_w = -8
	pixel_z = -8
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/single_biome/gas_giant
	gravity = GAS_GIANT_GRAVITY
	default_baseturf = /turf/open/chasm/gas_giant
	weather_controller_type = null
	ruin_type = null //it's a Gas Giant. Not Cloud fuckin City
	weight = 0
	preserve_level = TRUE
	landing_sound = 'sound/effects/planet_landing_1.ogg'

/datum/planet_type/plasma_giant
	name = "plasma giant"
	desc = "The backbone of interstellar travel, the mighty plasma giant allows fuel collection to take place."
	planet = DYNAMIC_WORLD_PLASMA_GIANT
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_PURPLE
	icon = 'mod_celadon/_storge_icons/icons/overmap/overmap_large.dmi'
	pixel_w = -8
	pixel_z = -8
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/single_biome/plasma_giant
	gravity = GAS_GIANT_GRAVITY
	default_baseturf = /turf/open/chasm/gas_giant/plasma
	weight = 0
	icon_state = "planet-plasma"
	preserve_level = TRUE
	landing_sound = 'sound/effects/planet_landing_1.ogg'

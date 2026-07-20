/datum/planet_type/old_town
	name = "старый город"
	cases = list("старый город", "старому городу", "старому городу", "старый город", "старым городом", "старом городе")
	desc = "Опустевший, пораженный инфекцией город. Худшее место для незапланированной высадки."
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
	name = "плазма гигант"
	cases = list("плазма гигант", "плазмы гиганта", "плазме гиганту", "плазму гигант", "плазмой гигантом", "плазме гиганте")
	desc = "Основа межзвёздных перелётов. Этот могучий плазменный гигант служит для сбора топлива."
	ruin_type = RUINTYPE_PLASMA
	gravity = STANDARD_GRAVITY
	planet = DYNAMIC_WORLD_PLASMA_GIANT
	pixel_w = -8
	pixel_z = -8
	icon_state = "planet-plasma"
	icon = 'mod_celadon/_storage_icons/icons/assets/overmap/overmap_large.dmi'
	landing_sound = 'mod_celadon/_storage_sounds/sound/events/planet_landing_3.mp3'
	mapgen = /datum/map_generator/planet_generator/plasma_gaint
	default_baseturf = /turf/open/floor/plating/asteroid/plasma_gaint
	preserve_level = FALSE
	weight = 0
	interference_power = 10

/datum/planet_type/earthsand
	name = "песчаная планета"
	cases = list("песчаная планета", "песчаной планеты", "песчаной планете", "песчаную планету", "песчаной планетой", "песчаной планете")
	desc = "Великие зыбучие пески"
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
	landing_sound = 'mod_celadon/_storage_sounds/sound/events/planet_landing_3.mp3'

/datum/planet_type/asteroid
	weight = 40
	ruin_type = RUINTYPE_ASTEROID

/datum/planet_type/ice_night // Мне очень не нравится, как я это сделал, но на другую реализацию у меня не хватает знаний
	name = "ледяная планета"
	cases = list("ледяная планета", "ледяной планеты", "ледяной планете", "ледяную планету", "ледяной планетой", "ледяной планете")
	desc = "Замерзшая планета, покрытая глубоким снегом, толстым слоем льда и населенная опасными хищниками."
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
	name = "тропическая планета"
	cases = list("тропическая планета", "тропической планеты", "тропической планете", "тропическую планету", "тропической планетой", "тропической планете")
	desc = "Густо заросший лесом мир, полный лиан, животных и подлеска. Удивительно пригоден для жизни, если под рукой есть мачете."
	planet = DYNAMIC_WORLD_JUNGLE_NIGHT
	icon_state = "jungle"
	// color = COLOR_LIME
	mapgen = /datum/map_generator/planet_generator/jungle/night
	default_baseturf = /turf/open/floor/plating/asteroid/dirt/jungle
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_JUNGLE
	landing_sound = 'sound/effects/planet_landing_1.ogg'

/datum/planet_type/rock_night
	name = "каменная планета"
	cases = list("каменная планета", "каменной планеты", "каменной планете", "каменную планету", "каменной планетой", "каменной планете")
	desc = "Красный скалистый мир в самом разгаре терраформирования. Хотя некоторые растения уже прижились, среда здесь в целом враждебна к жизни."
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
	name = "пляжная планета"
	cases = list("пляжная планета", "пляжной планеты", "пляжной планете", "пляжную планету", "пляжной планетой", "пляжной планете")
	desc = "Настоящий райский уголок для отпуска. Тёплый климат и пригодный для дыхания воздух."
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
	desc = "Какая-то уродливая планета, окружённая энергетическим полем. Невозможно определить, что это такое."
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

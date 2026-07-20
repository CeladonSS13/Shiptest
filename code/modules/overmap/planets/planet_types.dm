/datum/planet_type
	///The name we show on examine
	var/name = "planet"
	///The description we show on examine
	var/desc = "A planet."
	///The ID tag this planet uses. Depreciated
	var/planet = null
	///The ID  tag for the set of ruins this planet uses
	var/ruin_type = null
	///The mapgen we set when we are used
	var/mapgen = null
	///The fallback turf if mapgen fails.
	var/default_baseturf = null
	///The gravity we set. If higher than 1, slowdown effects will be applied
	var/gravity = 0
	///The weather we set when we are used
	var/weather_controller_type = null
	///The icon state on the token
	var/icon_state = "globe"
	///The color we set the token to, note this is overridden by fancy overmaps
	var/color = "#ffffff"
	///Our weight when picking a new overmap object
	var/weight = 40
	///Do we not self destruct when a ship undocks with no players left behind?
	var/preserve_level = FALSE
	///The sound we play when we are landed on. Not recommended outside of stingers.
	var/landing_sound
	///We read from this list to let players know the most common ores on this planet, otherwise does nothing.
	var/list/primary_ores
	///Do we 'selfloop' like the overmap? Probably should only enable this on space levels
	var/selfloop = FALSE
	///How much of a radio message we mess up on nearby or on landed/orbitting ships
	var/interference_power = 0
	// [CELADON-ADD] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	var/icon = 'mod_celadon/_storage_icons/icons/assets/overmap/overmap.dmi'
	var/pixel_w = 0
	var/pixel_z = 0
	// [/CELADON-ADD]


/datum/planet_type/lava
	name = "лавовый планетоид"
	cases = list("лавовый планетоид", "лавового планетоида", "лавовому планетоиду", "лавовый планетоид", "лавовым планетоидом", "лавовом планетоидее")
	desc = "Планета, изобилующая сейсмической и вулканической активностью. Высокие температуры и опасная ксенофауна делают её опасной для неподготовленных исследователей."
	planet = DYNAMIC_WORLD_LAVA
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_ORANGE
	//  icon_state = "lava"
	icon_state = "volcano"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/lava
	default_baseturf = /turf/open/floor/plating/asteroid/basalt/lava
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lavaland
	ruin_type = RUINTYPE_LAVA
	interference_power = 0

	primary_ores = list(
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/plasma,
		)


/datum/planet_type/ice
	name = "ледяной планетоид"
	cases = list("ледяной планетоид", "ледяного планетоида", "ледяному планетоиду", "ледяной планетоид", "ледяным планетоидом", "ледяном планетоидее")
	desc = "Ледяная планета, покрытая толщами снега, вечной мерзлотой и населенная опасными хищниками."
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

	primary_ores = list(\
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/gold,
		)

/datum/planet_type/jungle
	name = "тропический планетоид"
	cases = list("тропический планетоид", "тропического планетоида", "тропическому планетоиду", "тропический планетоид", "тропическим планетоидом", "тропическом планетоидее")
	desc = "Густо заросший лесом мир, полный лиан, диких животных и подлеска. Удивительно пригоден для жизни, если под рукой есть мачете."
	planet = DYNAMIC_WORLD_JUNGLE
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_LIME
	// icon_state = "globe_2"
	icon_state = "jungle"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/jungle
	default_baseturf = /turf/open/floor/plating/asteroid/dirt/jungle
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_JUNGLE
	primary_ores = list(\
		/obj/item/stack/ore/gold,
		/obj/item/stack/ore/diamond, //this isnt very common, but it's more common here than every other planet, so i list it here
		)

/datum/planet_type/rock
	name = "каменный планетоид"
	cases = list("каменный планетоид", "каменного планетоида", "каменному планетоиду", "каменный планетоид", "каменным планетоидом", "каменном планетоидее")
	desc = "Каменистый красный мир в самом разгаре терраформирования. Хотя некоторые растения уже прижились, среда здесь в целом враждебна к жизни."
	planet = DYNAMIC_WORLD_ROCKPLANET
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = "#bd1313"
	// icon_state = "rock"
	icon_state = "rock"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/rock
	default_baseturf = /turf/open/floor/plating/asteroid
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/rockplanet
	ruin_type = RUINTYPE_ROCK
	primary_ores = list(\
		/obj/item/stack/ore/iron,
		)

/datum/planet_type/sand
	name = "cолончаковый планетоид"
	cases = list("cолончаковый планетоид", "cолончакового планетоида", "cолончаковому планетоиду", "cолончаковый планетоид", "cолончаковым планетоидом", "cолончаковом планетоидее")
	desc = "Некогда цветущий мир, выжженный войной с ICW и превращенный в соляную пустыню. Его выжившие обитатели давно лишились рассудка."
	planet = DYNAMIC_WORLD_SAND
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_GRAY
	// icon_state = "whitesands"
	icon_state = "whitesands"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/sand
	default_baseturf = /turf/open/floor/plating/asteroid/whitesands
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/desert
	ruin_type = RUINTYPE_SAND
	primary_ores = list(\
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/titanium,
		)


/datum/planet_type/beach
	name = "океанический планетоид"
	cases = list("океанический планетоид", "океанического планетоида", "океаническому планетоиду", "океанический планетоид", "океаническым планетоидом", "океаническом планетоидее")
	desc = "Платонический идеал места для отпуска. Тёплая, комфортная температура и пригодная для дыхания атмосфера."
	planet = DYNAMIC_WORLD_BEACHPLANET
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = "#c6b597"
	// icon_state = "ocean"
	icon_state = "ocean"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/beach
	default_baseturf = /turf/open/floor/plating/asteroid/sand/lit
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/lush
	ruin_type = RUINTYPE_BEACH
	primary_ores = list(\
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/plasma,
		)

/datum/planet_type/reebe
	name = "???"
	desc = "Странный портал неизвестного происхождения. Идентификация невозможна."
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
	interference_power = 20

//legacy asteroid field, avoid using this outside of punchcards
/datum/planet_type/asteroid
	name = "астероидное поле"
	cases = list("астероидное поле", "астероидного поля", "астероидному полю", "астероидное поле", "астероидным полем", "астероидном поле")
	desc = "Скопление астероидов, богатое залежами ценной руды."
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
	weight = 0
#ifndef RUIN_PLACEMENT_TEST
	selfloop = TRUE
#endif
	primary_ores = list(\
		/obj/item/stack/ore/plasma,
		/obj/item/stack/ore/iron,
		)

/datum/planet_type/spaceruin
	name = "слабый энергосигнал"
	cases = list("слабый энергосигнал", "слабого энергосигнала", "слабому энергосигналу", "слабый энергосигнал", "слабым энергосигналом", "слабом энергосигнале")
	desc = "Очень слабый источник энергии где-то в глубоком космосе."
	planet = DYNAMIC_WORLD_SPACERUIN
	icon_state = "signal_strange"
	color = null
	mapgen = /datum/map_generator/planet_generator/asteroid
	default_baseturf = /turf/open/space
	weather_controller_type = null
	ruin_type = RUINTYPE_SPACE
#ifndef RUIN_PLACEMENT_TEST
	selfloop = TRUE
#endif

// empty space if you need to run a space ruin the old way or just need an empty clearing for whatever reason

/datum/planet_type/space
	name = "слабый энергосигнал"
	cases = list("слабый энергосигнал", "слабого энергосигнала", "слабому энергосигналу", "слабый энергосигнал", "слабым энергосигналом", "слабом энергосигнале")
	desc = "Очень слабый источник энергии где-то в глубоком космосе."
	planet = DYNAMIC_WORLD_SPACE_NO_RUIN
	icon_state = "signal_strange"
	color = null
	weight = 0
	mapgen = /datum/map_generator/single_turf/space
	default_baseturf = /turf/open/space
	weather_controller_type = null
	ruin_type = RUINTYPE_SPACE
#ifndef RUIN_PLACEMENT_TEST
	selfloop = TRUE
#endif

/datum/planet_type/waste
	name = "планетоид-свалка"
	cases = list("планетоид-свалка", "планетоида-свалки", "планетоиду-свалке", "планетоид-свалку", "планетоидом-свалкой", "планетоиде-свалке")
	desc = "Мир с избытком кислорода, полностью покрытый мусором, ржавчиной и радиацией."
	planet = DYNAMIC_WORLD_WASTEPLANET
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	// icon_state = "globe2"
	//	color = "#a9883e"
	icon_state = "waste"
	// [/CELADON-EDIT]
	mapgen = /datum/map_generator/planet_generator/waste
	default_baseturf = /turf/open/floor/plating/asteroid/wasteplanet
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/chlorine
	ruin_type = RUINTYPE_WASTE
	interference_power = 0
	primary_ores = list(\
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/plasma,
		/obj/item/stack/ore/uranium,
		)


/datum/planet_type/gas_giant
	name = "газовый гигант"
	cases = list("газовый гигант", "газового гиганта", "газовому гиганту", "газовый гигант", "газовым гигантом", "газовом гиганте")
	desc = "Огромный газовый шар с сокрушительным давлением и высочайшей гравитацией."
	planet = DYNAMIC_WORLD_GAS_GIANT
	icon_state = "giant"
	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
	//	color = COLOR_DARK_MODERATE_ORANGE
	icon = 'mod_celadon/_storage_icons/icons/assets/overmap/overmap_large.dmi'
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
	interference_power = 10

// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - mod_celadon/maps/code/planet_types.dm
// /datum/planet_type/plasma_giant
// 	name = "plasma giant"
// 	desc = "The backbone of interstellar travel, the mighty plasma giant allows fuel collection to take place."
// 	planet = DYNAMIC_WORLD_PLASMA_GIANT
// 	// [CELADON-EDIT] - CELADON_OVERMAP_ICON - Это вагабонд насрал
// 	//	color = COLOR_PURPLE
// 	// icon_state = "giant"
// 	icon_state = "planet-plasma"
// 	icon = 'mod_celadon/_storage_icons/icons/assets/overmap/overmap_large.dmi'
// 	pixel_w = -8
// 	pixel_z = -8
// 	// [/CELADON-EDIT]
// 	mapgen = /datum/map_generator/single_biome/plasma_giant
// 	gravity = GAS_GIANT_GRAVITY
// 	default_baseturf = /turf/open/chasm/gas_giant/plasma
// 	weight = 0
// 	preserve_level = TRUE
// 	interference_power = 10
// [/CELADON-REMOVE]

/datum/planet_type/water
	name = "водный планетоид"
	cases = list("водный планетоид", "водного планетоида", "водному планетоиду", "водный планетоид", "водным планетоидом", "водном планетоиде")
	desc = "Слабый энергосигнал с планеты, полностью покрытой водой. Внутри есть пещеры с карманами кислорода."
	planet = DYNAMIC_WORLD_WATERPLANET
	icon_state = "water"
	color = LIGHT_COLOR_DARK_BLUE
	weight = 0

	//ruin_type = RUINTYPE_WATER
	mapgen = /datum/map_generator/planet_generator/waterplanet
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/water/beach/deep
	weather_controller_type = /datum/weather_controller/waterplanet

	primary_ores = list(\
		/obj/item/stack/ore/plasma,
		/obj/item/stack/ore/iron,
		)

/datum/planet_type/desert
	name = "пустынный планетоид"
	cases = list("пустынный планетоид", "пустынного планетоида", "пустынному планетоиду", "пустынный планетоид", "пустынным планетоидом", "пустынном планетоиде")
	desc = "Слабый энергосигнал с раскалённой планеты с крайне суровыми условиями для жизни."
	planet = DYNAMIC_WORLD_DESERT
	icon_state = "desert"
	color = "#f3c282"
	weight = 0

	//ruin_type = RUINTYPE_DESERT
	mapgen = /datum/map_generator/planet_generator/desert
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/desert/lit
	weather_controller_type = /datum/weather_controller/desert_yellow
	primary_ores = list(
		/obj/item/stack/ore/gold,
		)

/datum/planet_type/shrouded
	name = "туманный планетоид"
	cases = list("туманный планетоид", "туманного планетоида", "туманному планетоиду", "туманный планетоид", "туманным планетоидом", "туманном планетоиде")
	desc = "Слабый энергосигнал с планеты, окутанной вечным штормом из странных частиц. Они поглощают почти все электромагнитные волны."
	planet = DYNAMIC_WORLD_SHROUDED
	icon_state = "shrouded"
	color = "#783ca4"
	weight = 0

	//ruin_type = RUINTYPE_SHROUDED
	mapgen = /datum/map_generator/planet_generator/shrouded
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/shrouded
	weather_controller_type = /datum/weather_controller/shrouded
	interference_power = 100

	primary_ores = list(\
		/obj/item/stack/ore/uranium,
		/obj/item/stack/ore/plasma,
		/obj/item/stack/ore/iron,
		)

/datum/planet_type/moon
	name = "луна планетоида"
	cases = list("луна планетоида", "луны планетоида", "луне планетоида", "луну планетоида", "луной планетоида", "луне планетоида")
	desc = "Каменистый спутник, вращающийся по орбите близлежащей планеты."
	planet = DYNAMIC_WORLD_MOON
	icon_state = "moon"
	color = "#d1c3c3"
	weight = 20

	mapgen = /datum/map_generator/planet_generator/moon
	ruin_type = RUINTYPE_MOON
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/moon/lit
	weather_controller_type = null

	primary_ores = list(\
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/titanium,
		)

/datum/planet_type/battlefield
	name = "выжженный планетоид"
	cases = list("выжженный планетоид", "выжженного планетоида", "выжженному планетоиду", "выжженный планетоид", "выжженным планетоидом", "выжженном планетоиде")
	desc = "Место ожесточенного сражения с ICW. Руины городов и заповедников, превращенные десятилетиями войн в грязевой ад. Остерегайтесь токсичных дождей, носите противогаз!"
	planet = DYNAMIC_WORLD_BATTLEFIELD
	icon_state = "battlefield"
	color = "#b32048"
	weight = 0

	ruin_type = RUINTYPE_BATTLEFIELD // minor 'planets' have no ruins
	mapgen = /datum/map_generator/planet_generator/battlefield
	default_baseturf = /turf/open/floor/plating/asteroid/dirt/battlefield
	gravity = STANDARD_GRAVITY
	weather_controller_type = /datum/weather_controller/toxic

//superflat planets, intended for use in events

/datum/planet_type/debug
	name = "ТЕСТОВАЯ ПЛАНЕТА"
	cases = list("выжженный планетоид", "выжженного планетоида", "выжженному планетоиду", "выжженный планетоид", "выжженным планетоидом", "выжженном планетоиде")
	desc = "Чисто белый мир для проведения тестов. Если вы видите это, пожалуйста, сообщите на GitHub"
	planet = DYNAMIC_WORLD_TEST
	icon_state = "hazard"
	color = COLOR_WHITE
	mapgen = /datum/map_generator/single_turf/test
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/white/lit
	weather_controller_type = null
	ruin_type = null
	weight = 0

/turf/open/floor/white/lit
	light_range = 2
	light_power = 1
	light_color = COLOR_VERY_LIGHT_GRAY
	baseturfs = /turf/open/floor/white/lit

/datum/map_generator/single_turf/test
	turf_type = /turf/open/floor/white/lit
	area_type = /area/overmap_encounter/planetoid

/datum/planet_type/snowball
	name = "ледяной карликовый планетоид"
	cases = list("ледяной карликовый планетоид", "ледяного карликового планетоида", "ледяному карликовому планетоиду", "ледяной карликовый планетоид", "ледяным карликовым планетоидом", "ледяном карликовом планетоидее")
	desc = "Мир, полностью погребённый под снегом из-за бушующих бурь. Здесь с абсолютной уверенностью нет ничего интересного."
	planet = DYNAMIC_WORLD_SNOWBALL
	icon_state = "misc"
	color = COLOR_WHITE
	mapgen = /datum/map_generator/single_turf/snowball
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/snow/lit
	weather_controller_type = /datum/weather_controller/snow_planet/severe
	ruin_type = null
	weight = 1

/datum/map_generator/single_turf/snowball
	turf_type = /turf/open/floor/plating/asteroid/snow/lit
	area_type = /area/overmap_encounter/planetoid/snowball

/datum/planet_type/dustball
	name = "пылевой карликовый планетоид"
	cases = list("пылевой карликовый планетоид", "пылевого карликового планетоида", "пылевому карликовому планетоиду", "пылевой карликовый планетоид", "пылевым карликовым планетоидом", "пылевом карликовом планетоидее")
	desc = "Мир, целиком покрытый пылью. Здесь с абсолютной уверенностью нет ничего интересного. К тому же, это худшее место для аварийной посадки."
	planet = DYNAMIC_WORLD_DUSTBALL
	icon_state = "misc"
	color = COLOR_WHITE
	mapgen = /datum/map_generator/single_turf/dustball
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/whitesands/lit
	weather_controller_type = /datum/weather_controller/rockplanet/severe
	weight = 1

/datum/map_generator/single_turf/dustball
	turf_type = /turf/open/floor/plating/asteroid/whitesands/lit
	area_type = /area/overmap_encounter/planetoid/dustball


/datum/planet_type/duneball
	name = "пустынный карликовый планетоид"
	cases = list("пустынный карликовый планетоид", "пустынного карликового планетоида", "пустынному карликовому планетоиду", "пустынный карликовый планетоид", "пустынным карликовым планетоидом", "пустынном карликовом планетоидее")
	desc = "Мир, целиком покрытый раскалённым сухим песком. Здесь с абсолютной уверенностью нет ничего интересного."
	planet = DYNAMIC_WORLD_SUPERFLAT
	icon_state = "misc"
	color = COLOR_WHITE
	mapgen = /datum/map_generator/single_turf/duneball
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/desert/lit
	weather_controller_type = /datum/weather_controller/rockplanet/severe
	weight = 1

/datum/map_generator/single_turf/duneball
	turf_type = /turf/open/floor/plating/asteroid/desert/lit
	area_type = /area/overmap_encounter/planetoid/duneball

/datum/planet_type/waterball
	name = "водный карликовый планетоид"
	cases = list("водный карликовый планетоид", "водного карликового планетоида", "водному карликовому планетоиду", "водный карликовый планетоид", "водным карликовым планетоидом", "водном карликовом планетоидее")
	desc = "Мир, целиком покрытый прохладной водой и суровыми штормами. Здесь с абсолютной уверенностью нет ничего интересного."
	planet = DYNAMIC_WORLD_SUPERFLAT
	icon_state = "misc"
	color = COLOR_WHITE
	mapgen = /datum/map_generator/single_turf/waterball
	gravity = STANDARD_GRAVITY
	default_baseturf = /turf/open/floor/plating/asteroid/desert/lit
	weather_controller_type = /datum/weather_controller/waterplanet/severe
	weight = 1

/datum/map_generator/single_turf/waterball
	turf_type = /turf/open/water/stormy_planet_lit
	area_type = /area/overmap_encounter/planetoid/waterball

///MARK: Тюрфы плазменной планеты
/turf/open/floor/plating/asteroid/plasma_gaint
	name = "ashen sand"
	desc = "Sand, tinted by the chemicals in the atmosphere to an uncanny shade of purple."
	icon = 'icons/turf/lavaland_purple.dmi'
	baseturfs = /turf/open/floor/plating/asteroid/plasma_gaint
	turf_type = /turf/open/floor/plating/asteroid/plasma_gaint
	initial_gas_mix = PLASMA_GIANT_ATMOS

/turf/open/floor/plating/asteroid/plasma_gaint/lit
	light_range = 2
	light_power = 0.3
	light_color = LIGHT_COLOR_FIRE

/turf/open/floor/plating/moss/plasma_gaint
	name = "mossy carpet"
	desc = "When the forests burned away and the sky grew dark, the moss learned to feed on the falling ash."
	baseturfs = /turf/open/floor/plating/ashplanet/plasma_gaint //explosions and damage can destroy the moss
	initial_gas_mix = PLASMA_GIANT_ATMOS
	planetary_atmos = TRUE
	icon_state = "moss"
	icon = 'icons/turf/lava_moss.dmi'
	base_icon_state = "moss"
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	layer = HIGH_TURF_LAYER
	gender = PLURAL
	light_power = 1
	light_range = 2
	pixel_x = -9
	pixel_y = -9

/turf/open/floor/plating/grass/lava/purple/plasma_gaint
	initial_gas_mix = PLASMA_GIANT_ATMOS
	baseturfs = /turf/open/floor/plating/grass/lava/purple/plasma_gaint
	icon = 'icons/turf/floors/lava_grass_purple.dmi'
	smooth_icon = 'icons/turf/floors/lava_grass_purple.dmi'

/turf/open/lava/plasma_gaint
	name = "liquid plasma"
	desc = "A flowing stream of chilled liquid plasma. You probably shouldn't get in."
	icon = 'mod_celadon/_storge_icons/icons/structures/turf/lava_plasma.dmi'
	icon_state = "lava-255"
	initial_gas_mix = PLASMA_GIANT_ATMOS
	baseturfs = /turf/open/lava/plasma/plasma_gaint
	slowdown = 2

	base_icon_state = "lava"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FLOOR_LAVA)
	canSmoothWith = list(SMOOTH_GROUP_FLOOR_LAVA)

	light_range = 3
	light_power = 0.75
	light_color = LIGHT_COLOR_PURPLE
	particle_emitter = null

/turf/open/floor/plating/asteroid/basalt/purple/lit/plasma_gaint
	initial_gas_mix = PLASMA_GIANT_ATMOS

/turf/closed/mineral/random/plasma_gaint
	name = "basalt"
	desc = "Eruptions stack like layer-cake, forming vast oceans of dried magma."
	icon_state = "smoothrocks-0"
	environment_type = "basalt"
	turf_type = /turf/open/floor/plating/asteroid/basalt/plasma_gaint
	baseturfs = /turf/open/floor/plating/asteroid/basalt/plasma_gaint
	initial_gas_mix = PLASMA_GIANT_ATMOS
	defer_change = 1

	mineralChance = 5
	mineralSpawnChanceList = list(
		/obj/item/stack/ore/uranium = 10,
		/obj/item/stack/ore/diamond = 4,
		/obj/item/stack/ore/gold = 20,
		/obj/item/stack/ore/plasma = 45,
		/obj/item/stack/ore/silver = 24,
		/obj/item/stack/ore/iron = 45,
		/obj/item/stack/ore/titanium = 33,
		/turf/closed/mineral/gibtonite/volcanic = 8,
		/obj/item/stack/ore/bluespace_crystal = 5)

/turf/open/floor/plating/asteroid/basalt/plasma_gaint
	initial_gas_mix = PLASMA_GIANT_ATMOS
	planetary_atmos = TRUE
	icon = 'icons/turf/lavaland_purple.dmi'
	baseturfs = /turf/open/floor/plating/asteroid/basalt/plasma_gaint
	turf_type = /turf/open/floor/plating/asteroid/basalt/plasma_gaint

/turf/open/lava/plasma_gaint/lit
	light_range = 0
	light_power = 0

/turf/open/chasm/plasma
	baseturfs = /turf/open/chasm
	icon = 'mod_celadon/_storge_icons/icons/structures/turf/chasms_plasma.dmi'
	icon_state = "chasms-255"
	base_icon_state = "chasms"
	light_color = COLOR_PURPLE
	color = null
	initial_gas_mix = PLASMA_GIANT_ATMOS

	light_range = 3
	light_power = 0.75

/turf/open/floor/plating/ashplanet/plasma_gaint
	baseturfs = /turf/open/floor/plating/ashplanet/plasma_gaint/wateryrock //I assume this will be a chasm eventually, once this becomes an actual surface
	initial_gas_mix = PLASMA_GIANT_ATMOS

/turf/open/floor/plating/ashplanet/plasma_gaint/wateryrock
	gender = PLURAL
	name = "wet rocky ground"
	smoothing_flags = NONE
	icon_state = "wateryrock"
	slowdown = 2
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/plating/ashplanet/plasma_gaint/wateryrock/Initialize(mapload, inherited_virtual_z)
	icon_state = "[icon_state][rand(1, 9)]"
	. = ..()

/turf/open/lava/plasma/plasma_gaint
	baseturfs = /turf/open/lava/plasma/plasma_gaint
	initial_gas_mix = PLASMA_GIANT_ATMOS

///MARK: Тюрфы пустынной планеты

/turf/closed/mineral/random/whitesands/earth
	name = "sandstone"
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	turf_type = /turf/open/floor/plating/asteroid/whitesands/earth
	baseturfs = /turf/open/floor/plating/asteroid/whitesands/earth

/turf/open/floor/plating/asteroid/whitesands/earth
	name = "sand"
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	icon = 'mod_celadon/_storge_icons/icons/structures/turf/beach.dmi'
	icon_state = "sand"

///MARK: Тюрфы ночи

/turf/open/water/jungle/nolit
	light_range = 0

/turf/open/water/beach/nolit
	light_range = 0

/turf/open/water/beach/deep/nolit
	light_range = 0

/turf/open/floor/plating/asteroid/snow/lit/rockplanet/nolit
	light_range = 0

/turf/closed/mineral/ice/nolit
	light_range = 0

/turf/closed/indestructible/edge
	light_on = 0
	light_power = 0
	light_system = 0
	dynamic_lighting = 0

///MARK: Тюрфы для модульной anima

#define ANIMA_DEFAULT_ATMOS "n2=100;TEMP=100.00"

///MARK: Базовый турф - родитель
/turf/open/space/anima
	planetary_atmos = FALSE
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	CanAtmosPass = ATMOS_PASS_NO
	footstep = null
	light_range = 2
	light_power = 2
	light_color = COLOR_VERY_LIGHT_GRAY

///MARK: Снежные турфы
/turf/open/floor/plating/asteroid/snow/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE
	light_range = 2
	light_power = 0.8
	light_color = COLOR_VERY_LIGHT_GRAY

/turf/open/floor/plating/asteroid/icerock/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE
	light_range = 1
	light_power = 0.8
	light_color = COLOR_VERY_LIGHT_GRAY

///MARK: Мусорные турфы
/turf/open/floor/plating/asteroid/wasteplanet/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/plating/wasteplanet/rust/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/plating/wasteplanet/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

///MARK: Джунглиевый турф
/turf/open/floor/plating/grass/jungle/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

///MARK: Лавовый турф
/turf/open/floor/plating/asteroid/basalt/lava_land_surface/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/lava/smooth/lava_land_surface/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE
	light_range = 2
	light_power = 0.5
	light_color = COLOR_VERY_LIGHT_GRAY

/turf/open/floor/plating/asteroid/purple/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

///MARK: Песчанный турф
/turf/open/floor/plating/asteroid/whitesands/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/plating/asteroid/whitesands/grass/lit/anima
	initial_gas_mix = ANIMA_DEFAULT_ATMOS
	planetary_atmos = FALSE

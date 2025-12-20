/turf/open/floor/plating/ice/temperate/gradus_minus_30
	initial_gas_mix = "o2=22;n2=82;TEMP=243.15"
	initial_temperature = 243.15

/turf/open/floor/plating/asteroid/dirt/grass/lavaland/o2
	initial_gas_mix = BEACHPLANET_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/plating/asteroid/purple/o2
	initial_gas_mix = BEACHPLANET_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/plating/asteroid/obsidian/o2
	initial_gas_mix = BEACHPLANET_DEFAULT_ATMOS
	planetary_atmos = FALSE

// MARK: FESTIVE

/turf/open/floor/festive
	icon = 'mod_celadon/_storage_icons/icons/structures/turf/cobblestone.dmi'
	icon_state = "unsmooth"
	initial_gas_mix = "o2=22;n2=82;TEMP=266"

/turf/open/floor/festive/cobblestone
	name = "cobblestone"
	baseturfs = /turf/open/floor/festive/cobblestone
	canSmoothWith = list(/turf/open/floor/festive/cobblestone)
	planetary_atmos = 1

/turf/open/floor/festive/cobblestone/safe	//this is literally cobblestone but safe for inside use because I don't want to fuck with aesthetics
	baseturfs = /turf/open/floor/festive/cobblestone/safe
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/festive/sidewalk
	name = "sidewalk"
	baseturfs = /turf/open/floor/festive/sidewalk
	icon = 'mod_celadon/_storage_icons/icons/structures/turf/sidewalk.dmi'
	canSmoothWith = list(/turf/open/floor/festive/sidewalk)
	planetary_atmos = 1

/turf/open/floor/festive/alleyway
	name = "alleyway bricks"
	baseturfs = /turf/open/floor/festive/alleyway
	icon = 'mod_celadon/_storage_icons/icons/structures/turf/alleywaybricks.dmi'
	canSmoothWith = list(/turf/open/floor/festive/alleyway)
	planetary_atmos = 1

/turf/open/floor/festive/alleyway/safe	//this is literally alleyway but safe for inside use because I don't want to fuck with aesthetics
	baseturfs = /turf/open/floor/festive/alleyway/safe
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = FALSE

// MARK: URBAN

/turf/open/floor/urban
	icon = 'mod_celadon/_storage_icons/icons/structures/floors/urban_turfs.dmi'
	icon_state = "sidewalk-tile-detail"
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/floor/urban/asphalt
	name = "asphalt"
	desc = "Once-hot asphalt."
	icon_state = "asphalt0"

/turf/open/floor/urban/asphalt/Initialize(mapload)
	. = ..()
	icon_state = "asphalt[rand(0,3)]"

/turf/open/floor/urban/sidewalk
	name = "weathered tiling"
	desc = "Great for speeding on."
	icon_state = "sidewalk-tile"

/turf/open/floor/urban/sidewalk/detail
	icon_state = "sidewalk-tile-detail"

/turf/open/floor/urban/sidewalk/paved
	name = "paved tiles"
	icon_state = "brick-paver"

/turf/open/floor/urban/sidewalk/flat
	name = "flat paved tiles"
	icon_state = "flat"

/turf/open/floor/urban/sidewalk/flat/Initialize(mapload)
	. = ..()
	icon_state = "flat[rand(1,3)]"

/turf/open/floor/urban/sidewalk/blocks
	name = "blocked sidewalk tiles"
	icon_state = "blocks"

/turf/open/floor/urban/sidewalk/blocks/Initialize(mapload)
	. = ..()
	icon_state = "blocks[rand(1,3)]"

/turf/open/floor/urban/sidewalk/dark
	icon_state = "sidewalk_alt"

/turf/open/floor/urban/sidewalk/dark/detail
	icon_state = "sidewalk_alt_detail"

/turf/open/floor/urban/sidewalk/dark/grid
	icon_state = "sidewalk_alt_grid"

/turf/open/floor/urban/foundation
	name = "foundation"
	desc = "The unclean but highly compacted solid foundation for a building or structure."
	icon_state = "rust"

/turf/open/floor/urban/foundation/Initialize(mapload)
	. = ..()
	icon_state = "rust[rand(1,12)]"

/turf/open/floor/urban/roofing_tiles
	name = "roofing tiles"
	desc = "You're on top of the world!"
	icon_state = "rooftop"

/turf/open/floor/urban/roofing_tiles/Initialize(mapload)
	. = ..()
	icon_state = "rooftop[rand(1,3)]"

/turf/open/floor/urban/concrete
	name = "concrete"
	icon = 'mod_celadon/_storage_icons/icons/structures/floors/concrete.dmi'
	icon_state = "concrete"

/turf/open/floor/urban/concrete/damage
	name = "concrete damage"
	icon_state = "concrete0"

/turf/open/floor/urban/concrete/damage/Initialize(mapload)
	. = ..()
	icon_state = "concrete[rand(0,2)]"

/turf/open/floor/urban/concrete/no_damage
	name = "concrete no damage"
	icon_state = "concrete0"

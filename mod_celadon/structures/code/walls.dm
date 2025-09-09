/////////////////////Gold titanium walls/////////////////////

/turf/closed/wall/mineral/titanium/gold //has to use this path due to how building walls works
	name = "gold wall"
	desc = "A light-weight gold wall used in shuttles."
	icon = 'mod_celadon/_storage_icons/icons/structures/walls/gold_shuttle_wall.dmi'
	icon_state = "shuttle_wall-0"
	base_icon_state = "shuttle_wall"
	explosion_block = 3
	flags_1 = CAN_BE_DIRTY_1
	flags_ricochet = RICOCHET_SHINY | RICOCHET_HARD
	sheet_type = /obj/item/stack/sheet/mineral/gold
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	smoothing_groups = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_TITANIUM_WALLS)
	canSmoothWith = list(SMOOTH_GROUP_TITANIUM_WALLS, SMOOTH_GROUP_AIRLOCK, SMOOTH_GROUP_SHUTTLE_PARTS, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE)

	hitsound_type = PROJECTILE_HITSOUND_NON_LIVING

	brute_mod = 1.5
	max_integrity = 550

/turf/closed/wall/mineral/titanium/gold/exterior
	smoothing_groups = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_TITANIUM_WALLS_EXTERIOR)
	canSmoothWith = list(SMOOTH_GROUP_TITANIUM_WALLS_EXTERIOR, SMOOTH_GROUP_AIRLOCK, SMOOTH_GROUP_SHUTTLE_PARTS, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE)

/turf/closed/wall/mineral/titanium/gold/nodiagonal
	icon = 'mod_celadon/_storage_icons/icons/structures/walls/gold_shuttle_wall.dmi'
	icon_state = "map-shuttle_nd"
	base_icon_state = "shuttle_wall"
	smoothing_flags = SMOOTH_BITMASK

/turf/closed/wall/mineral/titanium/gold/nosmooth
	icon = 'mod_celadon/_storage_icons/icons/structures/walls/gold_nosmoth_shuttle.dmi'
	icon_state = "wall"
	smoothing_flags = NONE

/turf/closed/wall/mineral/titanium/gold/overspace
	icon_state = "map-overspace"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	fixed_underlay = list("space" = TRUE)

/turf/closed/indestructible/riveted/command
	name = "command plastinum wall"
	icon = 'mod_celadon/_storage_icons/icons/structures/walls/ref_cc_wall.dmi'
	icon_state = "cplastitanium_wall-0"
	base_icon_state = "cplastitanium_wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_WALLS, SMOOTH_GROUP_SYNDICATE_WALLS)
	canSmoothWith = list(SMOOTH_GROUP_SYNDICATE_WALLS, SMOOTH_GROUP_PLASTITANIUM_WALLS, SMOOTH_GROUP_AIRLOCK, SMOOTH_GROUP_SHUTTLE_PARTS)


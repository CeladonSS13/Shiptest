/obj/structure/flora/tree/crystal
	name = "crystalline tree"
	desc = "An exotic growth that appears to be a tree-like form, though grown entirely out of crystal."
	pixel_x = -32
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/crystal_trees.dmi'
	icon_state = "gem"

/obj/structure/flora/tree/crystal/Initialize(mapload)
	. = ..()
	icon_state = "gem[rand(1,2)]"

/obj/structure/flora/tree/crystal/attackby(obj/item/attacking_item, mob/user)
	return TRUE // could probably make this mineable but I'm lazy

/obj/structure/flora/rock/spire
	name = "crystal spire"
	desc = "A crystalline structure suspended in mid-air."
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/crystal_trees.dmi'
	icon_state = "spire"
	pixel_x = -32
	layer = ABOVE_MOB_LAYER // this is basically a tree

/obj/structure/flora/rock/spire/Initialize(mapload)
	. = ..()
	icon_state = "spire[rand(1,3)]"

/obj/effect/floor_decal/crystal
	name = "crystals"
	icon = 'mod_celadon/_storge_icons/icons/structures//crystal.dmi'
	icon_state = "crystal_gen"
	layer = 2

/obj/effect/floor_decal/crystal/random/Initialize(mapload, newdir, newcolour, bypass, set_icon_state)
	icon_state = "crystal_gen[rand(1,3)]"
	. = ..()

/obj/effect/floor_decal/crystal/random/dark
	color = "#666666"


/obj/structure/flora/tree/alt_pine
	name = "pine tree"
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/pinetrees.dmi'
	var/list/icon_states = list("pine_1", "pine_2", "pine_3")

/obj/structure/flora/tree/alt_pine/Initialize()
	. = ..()

	if(islist(icon_states) && icon_states.len)
		icon_state = pick(icon_states)

/obj/structure/flora/tree/alt_pine/New()
	..()
	icon_state = "pine_[rand(1, 3)]"

/obj/structure/flora/tree/alt_pine/xmas
	name = "xmas tree"
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/pinetrees.dmi'
	icon_state = "pine_c"

/obj/structure/flora/tree/alt_pine/xmas/New()
	..()
	icon_state = "pine_c"


/obj/structure/flora/rock/ice
	name = "ice"
	desc = "A large formation made of ice."
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/ice_rocks.dmi'
	icon_state = "rock_1"

/obj/structure/flora/rock/ice/Initialize(mapload)
	. = ..()
	icon_state = "rock_[rand(1,3)]"

/obj/structure/flora/rock/snow
	name = "snowy boulder"
	desc = "A weathered boulder, coated in a fine dusting of snow."
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/snowrocks.dmi'
	icon_state = "rocklarge1"

/obj/structure/flora/rock/snow/Initialize(mapload)
	. = ..()
	icon_state = "rocklarge[rand(1,2)]"

/obj/effect/floor_decal/snowrocks
	name = "snow rocks"
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/snowrocks.dmi'
	icon_state = "rocksmall1"

/obj/effect/floor_decal/snowrocks/Initialize(mapload, newdir, newcolour, bypass, set_icon_state)
	icon_state = "rocksmall[rand(1,2)]"
	. = ..()

/// MARK: WILD PLANTS
//grass
/obj/structure/flora/herb
	name = "herb"
	desc = "This is herb"
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/wild_plants.dmi'
	icon_state = "herb_1"
	gender = PLURAL	//"this is grass" not "this is a grass"

/obj/structure/flora/herb/a
	icon_state = "herb_2"

/obj/structure/flora/herb/b
	icon_state = "herb_3"

/obj/structure/flora/herb/c
	icon_state = "herb_4"

/obj/structure/flora/herb/d
	icon_state = "herb_5"

/obj/structure/flora/herb/e
	icon_state = "herb_6"

/obj/structure/flora/herb/f
	icon_state = "herb_7"

/obj/structure/flora/herb/g
	icon_state = "herb_8"

/obj/structure/flora/flytrap
	name = "flytrap"
	desc = "This is flytrap"
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/wild_plants.dmi'
	icon_state = "flytrap"
	gender = PLURAL	//"this is grass" not "this is a grass"

/obj/structure/flora/explosive_shrooms
	name = "explosive shrooms"
	desc = "This is explosive shrooms"
	icon = 'mod_celadon/_storge_icons/icons/structures/obj/flora/wild_plants.dmi'
	icon_state = "explosive_shrooms"
	gender = PLURAL	//"this is grass" not "this is a grass"

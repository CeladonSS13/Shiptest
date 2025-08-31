/turf/closed/wall/mineral/cult
	name = "runed metal wall"
	desc = "A cold metal wall engraved with indecipherable symbols. Studying them causes your head to pound."
	icon = 'icons/turf/walls/cult_wall.dmi'
	icon_state = "cult_wall-0"
	base_icon_state = "cult_wall"
	smoothing_flags = SMOOTH_BITMASK
	canSmoothWith = null
	sheet_type = /obj/item/stack/sheet/mineral/hidden/hellstone
	sheet_amount = 1
	max_integrity = 600

/turf/closed/wall/mineral/cult/Initialize(mapload, inherited_virtual_z)
	new /obj/effect/temp_visual/cult/turf(src)
	. = ..()

/turf/closed/wall/mineral/cult/artificer
	name = "runed stone wall"
	desc = "A cold stone wall engraved with indecipherable symbols. Studying them causes your head to pound."
	sheet_type = null
	girder_type = null

// no sheets, just a cult effect
/turf/closed/wall/mineral/cult/artificer/create_sheets()
	new /obj/effect/temp_visual/cult/turf(get_turf(src))
	return

/turf/closed/wall/vault
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"

/turf/closed/wall/ice
	icon = 'icons/turf/walls/icedmetal_wall.dmi'
	icon_state = "icedmetal_wall-0"
	base_icon_state = "icedmetal_wall"
	desc = "A wall covered in a thick sheet of ice."
	smoothing_flags = SMOOTH_BITMASK
	canSmoothWith = null
	hardness = 35
	breakdown_duration = 40
	bullet_sizzle = TRUE
	burn_mod = 2

/turf/closed/wall/rust
	name = "rusted wall"
	desc = "A rusted metal wall."
	icon = 'icons/turf/walls/rusty_wall.dmi'
	icon_state = "rusty_wall-0"
	base_icon_state = "rusty_wall"
	smoothing_flags = SMOOTH_BITMASK
	hardness = 45
	max_integrity = 300
	min_dam = 5

/turf/closed/wall/rust/yesdiag
	icon_state = "rusty_wall-255"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/turf/closed/wall/r_wall/rust
	name = "rusted reinforced wall"
	desc = "A huge chunk of rusted reinforced metal."
	icon = 'icons/turf/walls/rusty_reinforced_wall.dmi'
	icon_state = "rusty_reinforced_wall-0"
	base_icon_state = "rusty_reinforced_wall"
	smoothing_flags = SMOOTH_BITMASK
	hardness = 15
	atom_integrity = 1000
	min_dam = 5

/turf/closed/wall/r_wall/rust/yesdiag
	icon_state = "rusty_reinforced_wall-255"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS

/turf/closed/wall/mineral/bronze
	name = "clockwork wall"
	desc = "A huge chunk of bronze, decorated like gears and cogs."
	icon = 'icons/turf/walls/clockwork_wall.dmi'
	icon_state = "clockwork_wall-0"
	base_icon_state = "clockwork_wall"
	smoothing_flags = SMOOTH_BITMASK
	sheet_type = /obj/item/stack/tile/bronze
	sheet_amount = 2
	girder_type = /obj/structure/girder/bronze

/turf/closed/wall/bathhouse
	desc = "It's cool to the touch, pleasantly so."
	icon = 'icons/turf/shuttleold.dmi'
	icon_state = "block"
	base_icon_state = "block"
	smoothing_flags = NONE
	canSmoothWith = null


// [CELADON-ADD]
/turf/closed/wall/r_wall/rust/try_decon(obj/item/W, mob/user, turf/T)
	switch(d_state)
		if(INTACT)
			if(W.tool_behaviour == TOOL_WIRECUTTER)
				if(W.use_tool(src, user, 40, volume=100))
					W.play_tool_sound(src, 100)
					d_state = SUPPORT_LINES
					update_appearance() // [CELADON-EDIT] - PR #1116
					to_chat(user, "<span class='notice'>You cut the outer grille.</span>")
					return 1

		if(SUPPORT_LINES)
			if(W.tool_behaviour == TOOL_SCREWDRIVER)
				to_chat(user, "<span class='notice'>You begin unsecuring the support lines...</span>")
				if(W.use_tool(src, user, 40, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != SUPPORT_LINES)
						return 1
					d_state = COVER
					update_appearance()
					to_chat(user, "<span class='notice'>You unsecure the support lines.</span>")
				return 1

		if(COVER)
			if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=0))
					return
				to_chat(user, "<span class='notice'>You begin slicing through the metal cover...</span>")
				if(W.use_tool(src, user, 60, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != COVER)
						return 1
					d_state = CUT_COVER
					update_appearance() // [CELADON-EDIT] - PR #1116
					to_chat(user, "<span class='notice'>You press firmly on the cover, dislodging it.</span>")
					dismantle_wall()
				return 1


	return 0
// [/CELADON-ADD]

/obj/machinery/door/airlock
	var/multi_tile = FALSE
	var/width = 1
	var/obj/airlock_filler_object/filler

/obj/machinery/door/airlock/Move()
	if(multi_tile)
		SetBounds()
	return ..()

/obj/machinery/door/airlock/Destroy()
	if(filler)
		qdel(filler)
		filler = null
	return ..()

/obj/machinery/door/airlock/multi_tile/New()
	update_dir()
	//to_chat(world, "<span class='boldannounce'>New() works</span>")
	. = ..()

/obj/machinery/door/airlock/multi_tile/Initialize(mapload)
	update_dir()
	//to_chat(world, "<span class='boldannounce'>Intialize() works</span>")
	. = ..()

/obj/machinery/door/airlock/multi_tile/proc/update_dir()
	if(dir in list(NORTH, SOUTH))
		//to_chat(world, "<span class='boldannounce'>if works (N and S)</span>")
		bound_width = width * world.icon_size
		//to_chat(world, "<span class='boldannounce'>[bound_width]</span>")
		bound_height = world.icon_size
		//to_chat(world, "<span class='boldannounce'>[bound_height]</span>")
	else
		//to_chat(world, "<span class='boldannounce'>else works (W and E)</span>")
		bound_width = world.icon_size
		//to_chat(world, "<span class='boldannounce'>[bound_width]</span>")
		bound_height = width * world.icon_size
		//to_chat(world, "<span class='boldannounce'>[bound_height]</span>")

/obj/machinery/door/airlock/proc/SetBounds()
	if(!multi_tile)
		return
	if(dir in list(NORTH, SOUTH))
		bound_width = width * world.icon_size
		bound_height = world.icon_size
		if(!filler)
			filler = new(get_step(src,EAST))
			filler.parent_airlock = src
		else
			filler.loc = get_step(src,EAST)
	else
		bound_width = world.icon_size
		bound_height = width * world.icon_size
		if(!filler)
			filler = new(get_step(src,NORTH))
			filler.parent_airlock = src
		else
			filler.loc = get_step(src,NORTH)
	filler.density = density
	filler.set_opacity(opacity)

/obj/machinery/door/airlock/multi_tile
	multi_tile = TRUE
	width = 2
	dir = NORTH

/obj/machinery/door/airlock/multi_tile/New()
	. = ..()
	apply_opacity_to_my_turfs(opacity)

/obj/machinery/door/airlock/multi_tile/open()
	if(..())
		apply_opacity_to_my_turfs(opacity)


/obj/machinery/door/airlock/multi_tile/close()
	if(..())
		apply_opacity_to_my_turfs(opacity)

/obj/machinery/door/airlock/multi_tile/Destroy()
	apply_opacity_to_my_turfs(0)
	return ..()

//Multi-tile poddoors don't turn invisible automatically, so we change the opacity of the turfs below instead one by one.
/obj/machinery/door/airlock/multi_tile/proc/apply_opacity_to_my_turfs(new_opacity)
	for(var/turf/T in locs)
		T.opacity = new_opacity
		T.directional_opacity = ALL_CARDINALS
		T.reconsider_lights()
		T.air_update_turf(1)
	update_freelook_sight()

/*
	AIRLOCKS
*/

/obj/machinery/door/airlock/glass_large
	name = "Large Glass Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/glass/multi_tile.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/glass/overlays.dmi'
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE
	bound_width = 64 // 2x1
	assemblytype = /obj/structure/door_assembly/multi_tile/glass

/obj/machinery/door/airlock/multi_tile/metal
	name = "Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/metal/multi_tile.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/metal/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/base
	name = "Base airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/base/multi_tile.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/base/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/base
	bound_width = 64
	dir = NORTH

/obj/machinery/door/airlock/multi_tile/base/glass
	name = "Base Glass airlock"
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

// Departments

/obj/machinery/door/airlock/multi_tile/public
	name = "Public Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/public.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/security
	name = "Security Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/security.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/maintenance
	name = "Maintenance Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/maintenance.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/maintenanceexternal
	name = "Maintenance External Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/maintenanceexternal.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/engineering
	name = "Engineering Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/engineering.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/atmos
	name = "Atmos Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/atmos.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/solgov
	name = "SolGov Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/solgov.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/command
	name = "Command Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/command.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/medical
	name = "Public Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/medical.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/station/overlays_smooth.dmi'
	assemblytype = /obj/structure/door_assembly/multi_tile/metal
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/multi_tile/public/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/security/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/maintenance/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/maintenanceexternal/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/engineering/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/atmos/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/solgov/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/command/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/medical/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

// Glassed

/obj/machinery/door/airlock/multi_tile/public/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/security/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/maintenance/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/maintenanceexternal/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/engineering/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/atmos/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/solgov/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/command/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/medical/glass
	opacity = FALSE
	airlock_material = "glass"
	glass = TRUE

/obj/machinery/door/airlock/multi_tile/public/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/security/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/maintenance/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/maintenanceexternal/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/engineering/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/atmos/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/solgov/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/command/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/obj/machinery/door/airlock/multi_tile/medical/glass/v
	dir = WEST
	bound_width = 32
	bound_height = 64 // 1x2

/*
	FILLERS (not included)
*/

/obj/airlock_filler_object
	name = ""
	density = TRUE
	opacity = TRUE
	anchored = TRUE
	var/parent_airlock

/obj/airlock_filler_object/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(.)
		return
	// Snowflake handling for PASSGLASS.
	if(istype(mover) && (mover.pass_flags & PASSGLASS))
		return !opacity

/obj/airlock_filler_object/can_be_pulled(user, grab_state, force)
	return FALSE

/obj/airlock_filler_object/singularity_act()
	return

/obj/airlock_filler_object/singularity_pull(S, current_size)
	return

/obj/airlock_filler_object/Destroy(force)
	if(parent_airlock)
		parent_airlock = null
	return ..()

/*
	ASSEMBLIES
*/

/obj/structure/door_assembly/multi_tile
	dir = EAST
	var/width = 1

/obj/structure/door_assembly/multi_tile/Initialize(mapload)
	. = ..()
	update_dir()

/obj/structure/door_assembly/multi_tile/Move()
	. = ..()
	update_dir()

/obj/structure/door_assembly/multi_tile/proc/update_dir()
	if(dir in list(NORTH, SOUTH))
		bound_width = width * world.icon_size
		bound_height = world.icon_size
	else
		bound_width = world.icon_size
		bound_height = width * world.icon_size

/obj/structure/door_assembly/multi_tile/metal
	name = "Large Airlock Assembly"
	base_name = "Large Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/metal/multi_tile.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/metal/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/multi_tile/metal
	glass_type = /obj/machinery/door/airlock/glass_large
	bound_width = 64 // 2x1

/obj/structure/door_assembly/multi_tile/glass
	name = "Large Glass Airlock Assembly"
	base_name = "Large Glass Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/glass/multi_tile.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/glass/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/glass_large
	bound_width = 64 // 2x1

/obj/structure/door_assembly/multi_tile/base
	name = "Base Airlock Assembly"
	base_name = "Base Airlock"
	icon = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/base/multi_tile.dmi'
	overlays_file = 'mod_celadon/_storge_icons/icons/obj/machinery/airlocks/base/overlays.dmi'
	airlock_type = /obj/machinery/door/airlock/multi_tile/base
	glass_type = /obj/machinery/door/airlock/multi_tile/base/glass
	bound_width = 64 // 2x1

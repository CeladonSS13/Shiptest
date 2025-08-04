// Construction recipes for ship weapons system

// Weapon turret construction
/obj/machinery/porta_turret/ship/weapon_system/laser/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wrench))
		if(anchored)
			to_chat(user, span_notice("You begin unbolting [src]..."))
			if(do_after(user, 40, target = src))
				anchored = FALSE
				to_chat(user, span_notice("You unbolt [src]."))
		else
			to_chat(user, span_notice("You begin bolting [src]..."))
			if(do_after(user, 40, target = src))
				anchored = TRUE
				to_chat(user, span_notice("You bolt [src] to the floor."))
		return
	return ..()

// Ammo loader construction
/obj/machinery/ammo_loader/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wrench))
		if(anchored)
			to_chat(user, span_notice("You begin unbolting [src]..."))
			if(do_after(user, 40, target = src))
				anchored = FALSE
				to_chat(user, span_notice("You unbolt [src]."))
		else
			to_chat(user, span_notice("You begin bolting [src]..."))
			if(do_after(user, 40, target = src))
				anchored = TRUE
				to_chat(user, span_notice("You bolt [src] to the floor."))
		return
	return ..()

// Research recipes for advanced weapons
/datum/design/ship_weapon_laser
	name = "Ship Laser Turret"
	desc = "A laser turret designed for ship-to-ship combat."
	id = "ship_weapon_laser"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2000, /datum/material/silver = 1000)
	build_path = /obj/machinery/porta_turret/ship/weapon_system/laser
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ship_weapon_ballistic
	name = "Ship Ballistic Turret"
	desc = "A ballistic turret designed for ship-to-ship combat."
	id = "ship_weapon_ballistic"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 500)
	build_path = /obj/machinery/porta_turret/ship/weapon_system/ballistic
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ship_weapon_explosive
	name = "Ship Missile Launcher"
	desc = "A missile launcher designed for ship-to-ship combat."
	id = "ship_weapon_explosive"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 8000, /datum/material/silver = 2000, /datum/material/gold = 1000)
	build_path = /obj/machinery/porta_turret/ship/weapon_system/explosive
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ammo_loader_ballistic
	name = "Ballistic Ammo Loader"
	desc = "Automatically reloads ballistic ship weapons."
	id = "ammo_loader_ballistic"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 1000)
	build_path = /obj/machinery/ammo_loader/ballistic
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ammo_loader_explosive
	name = "Missile Loader"
	desc = "Automatically reloads missile launchers."
	id = "ammo_loader_explosive"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/silver = 500)
	build_path = /obj/machinery/ammo_loader/explosive
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
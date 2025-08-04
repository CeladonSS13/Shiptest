// Example ship weapon loadouts and presets

// Light fighter loadout
/obj/machinery/porta_turret/ship/weapon_system/preset/light_fighter
	name = "light fighter laser"
	weapon_type = "laser"
	weapon_range = 12
	charge_cost = 200
	charge_time = 15
	weapon_burst_count = 1

// Heavy cruiser loadout
/obj/machinery/porta_turret/ship/weapon_system/preset/heavy_cruiser
	name = "cruiser cannon"
	weapon_type = "ballistic"
	weapon_range = 18
	charge_cost = 400
	charge_time = 25
	weapon_burst_count = 2
	ammo_count = 200
	max_ammo = 200

// Missile frigate loadout
/obj/machinery/porta_turret/ship/weapon_system/preset/missile_frigate
	name = "frigate missile launcher"
	weapon_type = "explosive"
	weapon_range = 22
	charge_cost = 600
	charge_time = 45
	weapon_burst_count = 1
	ammo_count = 20
	max_ammo = 20

// Defensive turret for stations
/obj/machinery/porta_turret/ship/weapon_system/preset/station_defense
	name = "station defense turret"
	weapon_type = "laser"
	weapon_range = 25
	charge_cost = 300
	charge_time = 20
	weapon_burst_count = 3

// Example weapon console setup
/obj/machinery/computer/ship_weapons/preset
	name = "tactical weapons console"
	desc = "An advanced weapons control system with enhanced targeting capabilities."

/obj/machinery/computer/ship_weapons/preset/Initialize()
	. = ..()
	// Auto-connect to nearby weapons on initialization
	addtimer(CALLBACK(src, PROC_REF(auto_connect_weapons)), 5 SECONDS)

/obj/machinery/computer/ship_weapons/preset/proc/auto_connect_weapons()
	find_connected_weapons()
	if(length(connected_weapons))
		say("Weapons systems online. [length(connected_weapons)] weapon(s) detected.")

// Example ammo loader setup
/obj/machinery/ammo_loader/preset/auto_connect
	name = "auto-connecting ammo loader"
	desc = "An ammunition loader that automatically connects to nearby weapons."

/obj/machinery/ammo_loader/preset/auto_connect/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(auto_connect_to_weapons)), 3 SECONDS)

/obj/machinery/ammo_loader/preset/auto_connect/proc/auto_connect_to_weapons()
	var/obj/machinery/porta_turret/ship/weapon_system/nearby_weapon = locate() in range(5, src)
	if(nearby_weapon && nearby_weapon.weapon_type == ammo_type)
		connect_to_weapon(nearby_weapon)
		visible_message(span_notice("[src] connects to [nearby_weapon]."))

// Map helper for quick weapon setup
/obj/effect/landmark/ship_weapon_setup
	name = "ship weapon setup point"
	desc = "A landmark for setting up ship weapons during map initialization."
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "x2"

	var/weapon_type_to_spawn = /obj/machinery/porta_turret/ship/weapon_system/laser
	var/spawn_ammo_loader = TRUE
	var/spawn_console = FALSE

/obj/effect/landmark/ship_weapon_setup/Initialize()
	. = ..()

	// Spawn weapon
	if(weapon_type_to_spawn)
		new weapon_type_to_spawn(get_turf(src))

	// Spawn ammo loader if needed
	if(spawn_ammo_loader)
		var/turf/loader_turf = locate(x+1, y, z)
		if(loader_turf)
			new /obj/machinery/ammo_loader/preset/auto_connect(loader_turf)

	// Spawn console if needed
	if(spawn_console)
		var/turf/console_turf = locate(x, y+1, z)
		if(console_turf)
			new /obj/machinery/computer/ship_weapons/preset(console_turf)

	qdel(src)

// Variants for different weapon types
/obj/effect/landmark/ship_weapon_setup/ballistic
	weapon_type_to_spawn = /obj/machinery/porta_turret/ship/weapon_system/ballistic

/obj/effect/landmark/ship_weapon_setup/explosive
	weapon_type_to_spawn = /obj/machinery/porta_turret/ship/weapon_system/explosive

/obj/effect/landmark/ship_weapon_setup/full_setup
	spawn_console = TRUE

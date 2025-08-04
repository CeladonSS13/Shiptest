// Admin-only ship weapons with ship destruction capability

/obj/machinery/porta_turret/ship/weapon_system/admin
	name = "admin destruction cannon"
	desc = "An extremely powerful weapon capable of destroying entire ships. Admin use only."
	weapon_type = "admin_destruction"
	weapon_range = 30
	charge_cost = 2000
	charge_time = 120
	req_access = list(ACCESS_CENT_GENERAL)

/obj/machinery/porta_turret/ship/weapon_system/admin/deal_damage_to_target(datum/overmap/target)
	if(!istype(target, /datum/overmap/ship/controlled))
		return ..()
	
	var/datum/overmap/ship/controlled/target_ship = target
	// Admin weapon destroys ship instantly
	target_ship.take_weapon_damage(target_ship.hull_integrity, weapon_type)
	
	// Create massive explosion
	if(target_ship.shuttle_port)
		var/list/areas = target_ship.shuttle_port.shuttle_areas
		if(length(areas))
			var/turf/target_turf = pick(areas)
			if(target_turf)
				explosion(target_turf, 5, 8, 12, 4)
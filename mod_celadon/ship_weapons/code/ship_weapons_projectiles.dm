// Phantom projectiles for visual effects

/obj/projectile/ship_weapon
	name = "ship weapon projectile"
	icon = 'icons/obj/projectiles.dmi'
	damage = 0
	nodamage = TRUE
	speed = 2
	range = 30
	
/obj/projectile/ship_weapon/laser
	name = "ship laser"
	icon_state = "laser"
	light_color = "#ff0000"
	light_range = 2

/obj/projectile/ship_weapon/ballistic
	name = "ship bullet"
	icon_state = "bullet"

/obj/projectile/ship_weapon/explosive
	name = "ship missile"
	icon_state = "rocket"
	light_color = "#ffaa00"
	light_range = 3

// Add projectile firing to weapons
/obj/machinery/porta_turret/ship/weapon_system/fire_at_target(target_x, target_y)
	. = ..()
	if(.)
		fire_phantom_projectile(target_x, target_y)

/obj/machinery/porta_turret/ship/weapon_system/proc/fire_phantom_projectile(target_x, target_y)
	var/obj/docking_port/mobile/port = SSshuttle.get_containing_shuttle(src)
	if(!port?.current_ship)
		return
	
	var/datum/overmap/ship/current_ship = port.current_ship
	var/target_turf = OVERMAP_TOKEN_TURF(target_x, target_y, current_ship.current_overmap)
	if(!target_turf)
		return
	
	var/obj/projectile/ship_weapon/projectile
	switch(weapon_type)
		if("laser")
			projectile = new /obj/projectile/ship_weapon/laser(get_turf(src))
		if("ballistic")
			projectile = new /obj/projectile/ship_weapon/ballistic(get_turf(src))
		if("explosive")
			projectile = new /obj/projectile/ship_weapon/explosive(get_turf(src))
	
	if(projectile)
		var/angle = get_angle(src, target_turf)
		projectile.preparePixelProjectile(target_turf, src, null, 0, 0)
		projectile.fire(angle)
/obj/projectile/plasma
	//wall_damage_flags = PROJECTILE_BONUS_DAMAGE_MINERALS	// Это конечно круто, но не то
	//wall_damage_override = MINERAL_WALL_INTEGRITY
	var/mine_range = 1 //mines this many additional tiles of rock

/obj/projectile/plasma/on_hit(atom/target)
	. = ..()
	if(ismineralturf(target))
		var/turf/closed/mineral/M = target
		M.gets_drilled(firer, FALSE)
		if(mine_range)
			mine_range--
			range++
		if(range > 0)
			return BULLET_ACT_FORCE_PIERCE

/obj/projectile/plasma/adv
	mine_range = 2

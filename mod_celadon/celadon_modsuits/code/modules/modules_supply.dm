//Supply modules for MODsuits

/obj/item/mod/module/ash_accretion
	name = "MOD ash accretion module"
	desc = "A module that collects ash from the terrain, covering the suit in a protective layer, this layer is \
		lost when moving across standard terrain."
	icon_state = "ash_accretion"
	removable = FALSE
	incompatible_modules = list(/obj/item/mod/module/ash_accretion)
	overlay_state_inactive = "module_ash"
	use_mod_colors = TRUE
	/// How many tiles we can travel to max out the armor.
	var/max_traveled_tiles = 20
	/// How many tiles we traveled through.
	var/traveled_tiles = 0
	/// Armor values per tile.
	var/list/armor_values = list("melee" = 1, "bullet" = 1, "laser" = 1, "energy" = 1, "bomb" = 1) // вплоть до 60 мили и 80 с тяжелым армор бустером. Have fun!
	/// Speed added when you're fully covered in ash.
	var/speed_added = 0.5
	/// Speed that we actually added.
	var/actual_speed_added = 0
	/// Turfs that let us accrete ash.
	var/static/list/accretion_turfs
	/// Turfs that let us keep ash.
	var/static/list/keep_turfs

/obj/item/mod/module/ash_accretion/Initialize(mapload)
	. = ..()
	if(!accretion_turfs)
		accretion_turfs = typecacheof(list(
			/turf/open/floor/plating/asteroid,
			/turf/open/floor/plating/ashplanet,
			// /turf/open/floor/plating/dirt,
		))
	if(!keep_turfs)
		keep_turfs = typecacheof(list(
			/turf/open/floor/grass,
			///turf/open/floor/plating/snowed,
			/turf/open/floor/plating/sandy_dirt,
			/turf/open/floor/plating/ironsand,
			/turf/open/floor/plating/ice,
			/turf/open/indestructible/hierophant,
			/turf/open/indestructible/boss,
			/turf/open/indestructible/necropolis,
			/turf/open/lava,
			/turf/open/water,
		))

/obj/item/mod/module/ash_accretion/on_suit_activation()
	ADD_TRAIT(mod.wearer, TRAIT_ASHSTORM_IMMUNE, MOD_TRAIT)
	ADD_TRAIT(mod.wearer, TRAIT_SNOWSTORM_IMMUNE, MOD_TRAIT)
	RegisterSignal(mod.wearer, COMSIG_MOVABLE_MOVED, .proc/on_move)

/obj/item/mod/module/ash_accretion/on_suit_deactivation(deleting = FALSE)
	REMOVE_TRAIT(mod.wearer, TRAIT_ASHSTORM_IMMUNE, MOD_TRAIT)
	REMOVE_TRAIT(mod.wearer, TRAIT_SNOWSTORM_IMMUNE, MOD_TRAIT)
	UnregisterSignal(mod.wearer, COMSIG_MOVABLE_MOVED)
	if(!traveled_tiles)
		return
	var/list/parts = mod.mod_parts + mod
	var/list/removed_armor = armor_values.Copy()
	for(var/armor_type in removed_armor)
		removed_armor[armor_type] = -removed_armor[armor_type] * traveled_tiles
	for(var/obj/item/part as anything in parts)
		part.armor = part.armor.modifyRating(arglist(removed_armor))
	if(traveled_tiles == max_traveled_tiles)
		mod.slowdown += speed_added
		mod.wearer.update_equipment_speed_mods()
	traveled_tiles = 0

/obj/item/mod/module/ash_accretion/generate_worn_overlay(mutable_appearance/standing)
	overlay_state_inactive = "[initial(overlay_state_inactive)]-[mod.skin]"
	return ..()

/obj/item/mod/module/ash_accretion/proc/on_move(atom/source, atom/oldloc, dir, forced)
	if(!isturf(mod.wearer.loc)) //dont lose ash from going in a locker
		return
	if(traveled_tiles) //leave ash every tile
		new /obj/effect/temp_visual/light_ash(get_turf(src))
	if(is_type_in_typecache(mod.wearer.loc, accretion_turfs))
		if(traveled_tiles >= max_traveled_tiles)
			return
		traveled_tiles++
		var/list/parts = mod.mod_parts + mod
		for(var/obj/item/part as anything in parts)
			part.armor = part.armor.modifyRating(arglist(armor_values))
		if(traveled_tiles >= max_traveled_tiles)
			balloon_alert(mod.wearer, "fully ash covered")
			mod.wearer.color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,3) //make them super light
			animate(mod.wearer, 1 SECONDS, color = null, flags = ANIMATION_PARALLEL)
			playsound(src, 'sound/effects/sparks1.ogg', 100, TRUE)
			actual_speed_added = max(0, min(mod.slowdown_active, speed_added))
			mod.slowdown -= actual_speed_added
			mod.wearer.update_equipment_speed_mods()
	else if(is_type_in_typecache(mod.wearer.loc, keep_turfs))
		return
	else
		if(traveled_tiles <= 0)
			return
		if(traveled_tiles == max_traveled_tiles)
			mod.slowdown += actual_speed_added
			mod.wearer.update_equipment_speed_mods()
		traveled_tiles--
		var/list/parts = mod.mod_parts + mod
		var/list/removed_armor = armor_values.Copy()
		for(var/armor_type in removed_armor)
			removed_armor[armor_type] = -removed_armor[armor_type]
		for(var/obj/item/part as anything in parts)
			part.armor = part.armor.modifyRating(arglist(removed_armor))
		if(traveled_tiles <= 0)
			balloon_alert(mod.wearer, "ran out of ash!")

/obj/item/mod/module/sphere_transform
	name = "MOD sphere transform module"
	desc = "A module able to move the suit's parts around, turning it and the user into a sphere. \
		The sphere can move quickly, even through lava, and launch mining bombs to decimate terrain."
	icon_state = "sphere"
	module_type = MODULE_ACTIVE
	removable = FALSE
	active_power_cost = DEFAULT_CHARGE_DRAIN*0.5
	use_power_cost = DEFAULT_CHARGE_DRAIN*3
	incompatible_modules = list(/obj/item/mod/module/sphere_transform)
	cooldown_time = 1.25 SECONDS
	/// Time it takes us to complete the animation.
	var/animate_time = 0.25 SECONDS

/obj/item/mod/module/sphere_transform/on_activation()
	if(!mod.wearer.has_gravity())
		balloon_alert(mod.wearer, "no gravity!")
		return FALSE
	. = ..()
	if(!.)
		return
	playsound(src, 'sound/items/modsuit/ballin.ogg', 100, TRUE)
	mod.wearer.add_filter("mod_ball", 1, alpha_mask_filter(icon = icon('icons/mob/clothing/modsuit/mod_modules.dmi', "ball_mask"), flags = MASK_INVERSE))
	mod.wearer.add_filter("mod_blur", 2, angular_blur_filter(size = 15))
	mod.wearer.add_filter("mod_outline", 3, outline_filter(color = "#000000AA"))
	mod.wearer.base_pixel_y -= 4
	animate(mod.wearer, animate_time, pixel_y = mod.wearer.base_pixel_y, flags = ANIMATION_PARALLEL)
	mod.wearer.SpinAnimation(1.5)
	ADD_TRAIT(mod.wearer, TRAIT_LAVA_IMMUNE, MOD_TRAIT)
	ADD_TRAIT(mod.wearer, TRAIT_HANDS_BLOCKED, MOD_TRAIT)
	ADD_TRAIT(mod.wearer, TRAIT_FORCED_STANDING, MOD_TRAIT)
	ADD_TRAIT(mod.wearer, TRAIT_NOSLIPALL, MOD_TRAIT)
	// mod.wearer.AddComponent(/datum/component/footstep, FOOTSTEP_MOB_HUMAN, 1, -6)
	// mod.wearer.RemoveComponent(/datum/component/footstep, FOOTSTEP_OBJ_ROBOT, 1, -6, sound_vary = TRUE)
	mod.wearer.add_movespeed_modifier(/datum/movespeed_modifier/sphere)
	RegisterSignal(mod.wearer, COMSIG_MOB_STATCHANGE, .proc/on_statchange)

/obj/item/mod/module/sphere_transform/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	if(!.)
		return
	if(!deleting)
		playsound(src, 'sound/items/modsuit/ballin.ogg', 100, TRUE, frequency = -1)
	mod.wearer.base_pixel_y = 0
	animate(mod.wearer, animate_time, pixel_y = mod.wearer.base_pixel_y)
	addtimer(CALLBACK(mod.wearer, TYPE_PROC_REF(/datum, remove_filter), list("mod_ball", "mod_blur", "mod_outline")), animate_time)
	REMOVE_TRAIT(mod.wearer, TRAIT_LAVA_IMMUNE, MOD_TRAIT)
	REMOVE_TRAIT(mod.wearer, TRAIT_HANDS_BLOCKED, MOD_TRAIT)
	REMOVE_TRAIT(mod.wearer, TRAIT_FORCED_STANDING, MOD_TRAIT)
	REMOVE_TRAIT(mod.wearer, TRAIT_NOSLIPALL, MOD_TRAIT)
	mod.wearer.remove_movespeed_mod_immunities(MOD_TRAIT, /datum/movespeed_modifier/damage_slowdown)
	// mod.wearer.AddComponent(/datum/component/footstep, FOOTSTEP_OBJ_ROBOT, 1, -6, sound_vary = TRUE)
	// mod.wearer.TakeComponent(/datum/component/footstep, FOOTSTEP_MOB_HUMAN, 1, -6)
	mod.wearer.remove_movespeed_modifier(/datum/movespeed_modifier/sphere)
	UnregisterSignal(mod.wearer, COMSIG_MOB_STATCHANGE)

/obj/item/mod/module/sphere_transform/on_use()
	/*
	// GO BALLING, MY SON
	if(!lavaland_equipment_pressure_check(get_turf(src)))
		balloon_alert(mod.wearer, "too much pressure!")
		playsound(src, 'sound/weapons/gun/general/dry_fire.ogg', 25, TRUE)
		return FALSE
	*/
	return ..()

/obj/item/mod/module/sphere_transform/on_select_use(atom/target)
	. = ..()
	if(!.)
		return
	var/obj/projectile/bomb = new /obj/projectile/bullet/reusable/mining_bomb(mod.wearer.loc)
	bomb.preparePixelProjectile(target, mod.wearer)
	bomb.firer = mod.wearer
	playsound(src, 'sound/weapons/gun/general/grenade_launch.ogg', 75, TRUE)
	INVOKE_ASYNC(bomb, /obj/projectile.proc/fire)
	drain_power(use_power_cost)

/obj/item/mod/module/sphere_transform/on_active_process(delta_time)
	animate(mod.wearer) //stop the animation
	mod.wearer.SpinAnimation(1.5) //start it back again
	if(!mod.wearer.has_gravity())
		on_deactivation() //deactivate in no grav

/obj/item/mod/module/sphere_transform/proc/on_statchange(datum/source)
	SIGNAL_HANDLER

	if(!mod.wearer.stat)
		return
	on_deactivation()

/obj/projectile/bullet/reusable/mining_bomb
	name = "mining bomb"
	desc = "A bomb. Why are you examining this?"
	icon_state = "mine_bomb"
	icon = 'icons/obj/clothing/modsuit/mod_modules.dmi'
	damage = 0
	nodamage = TRUE
	range = 6
	suppressed = SUPPRESSED_VERY
	light_system = MOVABLE_LIGHT
	light_range = 1
	light_power = 1
	light_color = COLOR_LIGHT_ORANGE
	ammo_type = /obj/structure/mining_bomb

/obj/projectile/bullet/reusable/mining_bomb/handle_drop()
	if(dropped)
		return
	dropped = TRUE
	new ammo_type(get_turf(src), firer)

/obj/structure/mining_bomb
	name = "mining bomb"
	desc = "A bomb. Why are you examining this?"
	icon_state = "mine_bomb"
	icon = 'icons/obj/clothing/modsuit/mod_modules.dmi'
	anchored = TRUE
	resistance_flags = FIRE_PROOF|LAVA_PROOF
	light_system = MOVABLE_LIGHT
	light_range = 1
	light_power = 1
	light_color = COLOR_LIGHT_ORANGE
	/// Time to prime the explosion
	var/prime_time = 0.5 SECONDS
	/// Time to explode from the priming
	var/explosion_time = 1 SECONDS
	/// Damage done on explosion.
	var/damage = 15
	/// Damage multiplier on hostile fauna.
	var/fauna_boost = 4
	/// Image overlaid on explosion.
	var/static/image/explosion_image

/obj/structure/mining_bomb/Initialize(mapload, atom/movable/firer)
	. = ..()
	generate_image()
	addtimer(CALLBACK(src, .proc/prime, firer), prime_time)

/obj/structure/mining_bomb/on_changed_z_level(turf/old_turf, turf/new_turf, same_z_layer, notify_contents)
	if(same_z_layer)
		return ..()
	explosion_image = null
	generate_image()
	return ..()

/obj/structure/mining_bomb/proc/generate_image()
	explosion_image = image('icons/effects/96x96.dmi', "judicial_explosion")
	explosion_image.pixel_x = -32
	explosion_image.pixel_y = -32
	SET_PLANE_EXPLICIT(explosion_image, ABOVE_GAME_PLANE, src)

/obj/structure/mining_bomb/proc/prime(atom/movable/firer)
	add_overlay(explosion_image)
	addtimer(CALLBACK(src, .proc/boom, firer), explosion_time)

/obj/structure/mining_bomb/proc/boom(atom/movable/firer)
	visible_message(span_danger("[src] взрывается!"))
	playsound(src, 'sound/magic/magic_missile.ogg', 200, vary = TRUE)
	for(var/turf/closed/mineral/rock in circle_range_turfs(src, 2))
		rock.gets_drilled()
	for(var/mob/living/mob in range(1, src))
		mob.apply_damage(12 * (ishostile(mob) ? fauna_boost : 1), BRUTE, spread_damage = TRUE)
		if(!ishostile(mob) || !firer)
			continue
		var/mob/living/simple_animal/hostile/hostile_mob = mob
		hostile_mob.GiveTarget(firer)
	for(var/obj/object in range(1, src))
		object.take_damage(damage, BRUTE, BOMB)
	qdel(src)

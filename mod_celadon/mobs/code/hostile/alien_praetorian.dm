/mob/living/simple_animal/hostile/alien/praetorian
	name = "alien praetorian"
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "alienp"
	icon_state = "alienp"
	icon_dead = "alienp_dead"
	health_doll_icon = "alienq"
	bubble_icon = "alienroyal"
	health = 500
	maxHealth = 500
	melee_damage_lower = 40
	melee_damage_upper = 40
	armour_penetration = 30
	butcher_results = list(/obj/item/food/meat/slab/xeno = 6,
							/obj/item/stack/sheet/animalhide/xeno = 2)
	mob_size = MOB_SIZE_LARGE
	charge_cooldown = 20 SECONDS
	speed = 1
	rapid_melee = 1
	ranged = 1
	move_to_delay = 4
	projectiletype = /obj/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'
	status_flags = 0
	unique_name = 0
	armor = list("melee" = 40, "bullet" = 40, "laser" = 20, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 100, "fire" = -100, "acid" = 80)

/mob/living/simple_animal/hostile/alien/praetorian/AttackingTarget()
	. = ..()
	if(isliving(target))
		var/mob/living/bonk = target
		if(!bonk.anchored)
			var/atom/throw_target = get_edge_target_turf(bonk, src.dir)
			bonk.throw_at(throw_target, rand(1,5), 2, src, gentle = TRUE)

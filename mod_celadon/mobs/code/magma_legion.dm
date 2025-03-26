//Legion
/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma
	name = "magma legion"
	desc = "You can still see what was once a human under the shifting mass of corruption."
	icon = 'mod_celadon/_storge_icons/icons/mobs/legion_magma.dmi'
	icon_state = "legion"
	icon_living = "legion"
	icon_aggro = "legion"
	icon_dead = "legion"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_MINERAL | MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_ICON
	obj_damage = 80
	melee_damage_lower = 25
	melee_damage_upper = 25
	maxHealth = 85
	health = 85
	attack_verb_continuous = "lashes out at"
	attack_verb_simple = "lash out at"
	speak_emote = list("echoes")
	attack_sound = 'sound/weapons/pierce.ogg'
	throw_message = "bounces harmlessly off of"
	armor = list("melee" = 60, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	loot = list(/obj/item/stack/ore/hellstone)
	brood_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/magma
	del_on_death = 1
	stat_attack = HARD_CRIT
	robust_searching = 1
	speed = 3
	move_to_delay = 10
	ranged_cooldown = 10
	ranged_cooldown_time = 20

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	if(prob(5))
		new /obj/item/crusher_trophy/magma_skull/magma(loc)
		visible_message("<span class='warning'>One of the [src]'s skulls looks intact.</span>")
	qdel(src)

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/magma/death(gibbed)
	explosion(src, 0, 0, 2, 3, TRUE, flame_range = 3)
	..(gibbed)

//Legion skull
/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/magma
	name = "legion"
	desc = "One of many."
	icon = 'mod_celadon/_storge_icons/icons/mobs/legion_magma.dmi'
	icon_state = "legion_head"
	icon_living = "legion_head"
	icon_aggro = "legion_head"
	icon_dead = "legion_head"
	icon_gib = "syndicate_gib"
	friendly_verb_continuous = "buzzes near"
	friendly_verb_simple = "buzz near"
	vision_range = 10
	maxHealth = 5
	health = 5
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	speak_emote = list("echoes")
	attack_sound = 'mod_celadon/_storge_sounds/sound/effects/boom_small.ogg'
	throw_message = "is shrugged off by"
	del_on_death = TRUE
	stat_attack = SOFT_CRIT
	robust_searching = 1
	can_infest_dead = FALSE
	speed = 3
	move_to_delay = 10
	melee_damage_type = BURN
	faction = list("magma")

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/magma/death(gibbed)
	explosion(src, 0, 0, 1, 1, TRUE, flame_range = 1)
	return ..()

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/magma/Life()
	return

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/magma/infest(mob/living/carbon/human/H)
	return

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/magma/on_hit(mob/living/target)
	target.apply_damage(rand(melee_damage_lower, melee_damage_upper), BURN)

//Trophey legion
/obj/item/crusher_trophy/magma_skull/magma
	name = "magma skull"
	desc = "A dead and lifeless magma skull. Could be used in crafting."
	icon = 'mod_celadon/_storge_icons/icons/mobs/legion_magma.dmi'
	icon_state = "legion_skull"
	denied_type = /obj/item/crusher_trophy/magma_skull/magma
	bonus_value = 10

/obj/item/crusher_trophy/magma_skull/magma/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Suitable as a trophy for a proto-kinetic crusher.</span>"

/obj/item/crusher_trophy/magma_skull/magma/effect_desc()
	return "a kinetic crusher to armor penetration +<b>[bonus_value + 5]</b> up"

/obj/item/crusher_trophy/magma_skull/magma/add_to(obj/item/kinetic_crusher/H, mob/living/user)
	. = ..()
	if(.)
		H.armour_penetration += bonus_value

/obj/item/crusher_trophy/magma_skull/magma/remove_from(obj/item/kinetic_crusher/H, mob/living/user)
	. = ..()
	if(.)
		H.armour_penetration -= bonus_value


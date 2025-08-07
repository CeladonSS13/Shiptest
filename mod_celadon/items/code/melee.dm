/obj/item/melee/duelenergy/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = NON_PROJECTILE_ATTACKS)
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		if((NON_PROJECTILE_ATTACKS).Find(attack_type) != null)
			var check = prob(50)
			if(check)
				playsound(src.loc, 'mod_celadon/_storge_sounds/sound/weapons/laser_melee.ogg', 100, TRUE)
			return check
		else if(attack_type == PROJECTILE_ATTACK)
			var check = prob(30)
			if(check)
				playsound(src.loc, 'mod_celadon/_storge_sounds/sound/weapons/laser_balist.ogg', 100, TRUE)
			return check
	return FALSE

/obj/item/melee/duelenergy/IsReflect()
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		return prob(70)

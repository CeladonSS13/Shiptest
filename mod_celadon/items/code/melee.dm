/obj/item/melee/duelenergy/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
    if(HAS_TRAIT(src, TRAIT_WIELDED))
        if(attack_type == MELEE_ATTACK)
            return prob(50)
        else if(attack_type == PROJECTILE_ATTACK)
            return prob(30)
    return FALSE

/obj/item/melee/duelenergy/IsReflect()
    if(HAS_TRAIT(src, TRAIT_WIELDED))
        return prob(70)

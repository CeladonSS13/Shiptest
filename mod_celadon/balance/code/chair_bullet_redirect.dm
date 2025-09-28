/mob/living/carbon/human/bullet_act(obj/projectile/P, def_zone, piercing_hit = FALSE)
	if(stat == DEAD && buckled && istype(buckled, /obj/structure/chair))
		if(prob(15))
			var/obj/structure/chair/chair = buckled
			visible_message(span_warning("[P] пробивает [src] насквозь и попадает в [chair]!"))
			chair.bullet_act(P, def_zone, piercing_hit)
			return BULLET_ACT_HIT
	return ..()

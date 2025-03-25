/mob/living/simple_animal/pet/fox/fennec/eldritch
	maxHealth = 100
	health = 100
	held_state = "fennec_eldritch"
	icon = 'mod_celadon/_storge_icons/icons/mobs/kovac_animals.dmi'
	held_lh = 'mod_celadon/_storge_icons/icons/mobs/animals_held_lh.dmi'
	held_rh = 'mod_celadon/_storge_icons/icons/mobs/animals_held_rh.dmi'

/mob/living/simple_animal/pet/fox/fennec/eldritch/update_resting()
	. = ..()
	if(stat == DEAD)
		return
	if (resting)
		icon_state = "[icon_living]_rest"
		collar_type = "[initial(collar_type)]_rest"
	else
		icon_state = "[icon_living]"
		collar_type = "[initial(collar_type)]"
	regenerate_icons()

/mob/living/simple_animal/pet/fox/fennec/eldritch/Life()
	return

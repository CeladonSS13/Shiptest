/mob/living/simple_animal/pet/fox/emma
	name = "Emma"
	icon_state = "emma"
	icon_living = "emma"
	icon_dead = "emma_dead"
	held_state = "emma"
	see_in_dark = 10
	gender = FEMALE
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	held_lh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_lh.dmi'
	held_rh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_rh.dmi'

/mob/living/simple_animal/pet/fox/emma/update_resting()
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

/mob/living/simple_animal/pet/fox/emma/Life()
	return

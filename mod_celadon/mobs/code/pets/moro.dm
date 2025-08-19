/mob/living/simple_animal/pet/cat/moro
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	held_lh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_lh.dmi'
	held_rh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_rh.dmi'
	name = "Moro"
	desc = "He likes grechkya."
	icon_state = "moro"
	icon_living = "moro"
	icon_dead = "moro_dead"
	held_state = "moro"
	unique_pet = TRUE
	mob_size = MOB_SIZE_LARGE
	gender = MALE
	unsuitable_atmos_damage = 0
	minbodytemp = 800
	minbodytemp = 0
	melee_damage_lower = 5
	melee_damage_upper = 15

/mob/living/simple_animal/pet/cat/moro/Life()
	return

/mob/living/simple_animal/pet/cat/moro/update_resting()
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

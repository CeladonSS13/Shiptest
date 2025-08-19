/mob/living/simple_animal/pet/fox/fennec
	name = "Red"
	desc = "It's a fennec!"
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	held_lh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_lh.dmi'
	held_rh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_rh.dmi'
	icon_state = "fennec"
	icon_living = "fennec"
	icon_dead = "fennec_dead"
	held_state = "fennec"
	see_in_dark = 10
	// vocal_bark_id = "weh"
	// vocal_speed = 1.5
	speak_chance = 15
	maxHealth = 50
	health = 50
	gender = MALE

/mob/living/simple_animal/pet/fox/fennec/update_resting()
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

/mob/living/simple_animal/pet/fox/fennec/Life()
	return

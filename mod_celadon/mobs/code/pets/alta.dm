/mob/living/simple_animal/pet/cat/alta
	name = "Alta"
	desc = "A cute white cat."
	icon_state = "alta"
	icon_living = "alta"
	icon_dead = "alta_dead"
	held_state = "alta"
	worn_slot_flags = ITEM_SLOT_HEAD
	unique_pet = TRUE
	gender = FEMALE
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	held_lh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_lh.dmi'
	held_rh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_rh.dmi'
	head_icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_head.dmi'

/mob/living/simple_animal/pet/cat/alta/Life()
	return

/mob/living/simple_animal/pet/cat/alta/update_resting()
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

/mob/living/simple_animal/pet/cat/space/alta
	name = "Space Alta"
	desc = "An ordinary Alta, except that she is wearing a special elite modsuit from a Cybersun to protect herself in space."
	icon_state = "spacealta"
	icon_living = "spacealta"
	icon_dead = "spacealta_dead"
	held_state = "spacealta"
	worn_slot_flags = ITEM_SLOT_HEAD
	unique_pet = TRUE
	gender = FEMALE
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	held_lh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_lh.dmi'
	held_rh = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_held_rh.dmi'
	head_icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets_head.dmi'

/mob/living/simple_animal/pet/cat/space/alta/Life()
	return

/mob/living/simple_animal/pet/cat/space/alta/update_resting()
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

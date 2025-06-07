/mob/living/simple_animal/pet/dog/fox/syndifox
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	name = "Syndifox"
	desc = "Syndifox, the Syndicate's most respected mascot. I wonder what it says?"
	icon_state = "syndifox"
	icon_living = "syndifox"
	icon_dead = "syndifox_dead"
	unsuitable_atmos_damage = 0
	minbodytemp = 800
	minbodytemp = 0
	melee_damage_lower = 10
	melee_damage_upper = 20
	held_state = "syndifox"

/mob/living/simple_animal/pet/dog/fox/syndifox/update_resting()
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

/mob/living/simple_animal/pet/dog/fox/syndifox/Life()
	return

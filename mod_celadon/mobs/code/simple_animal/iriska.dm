/mob/living/simple_animal/pet/cat/iriska
	name = "Iriska"
	desc = "The captain's own cat. Fat and lazy. She's absolutely massive and looks impossibly heavy."
	icon = 'mod_celadon/_storage_icons/icons/mobs/pet_content/pets.dmi'
	icon_state = "iriska"
	icon_living = "iriska"
	icon_dead = "iriska_dead"
	health = 50
	maxHealth = 50
	response_disarm_simple = "rubs"
	response_harm_simple = "makes terrible mistake by kicking"
	mob_size = MOB_SIZE_HUGE

/mob/living/simple_animal/pet/cat/iriska/Move()
	return

/mob/living/simple_animal/pet/cat/iriska/forceMove(atom/destination)
	if(ismecha(usr))
		return ..(destination)
	return

/mob/living/simple_animal/pet/cat/iriska/update_resting()
	return

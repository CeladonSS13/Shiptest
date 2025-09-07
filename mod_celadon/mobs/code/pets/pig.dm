/mob/living/simple_animal/pet/dog/corgi/pig
	name = "Pig"
	real_name = "Pig"
	desc = "Grunts."
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	icon_state = "pigs"
	icon_living = "pigs"
	icon_dead = "pigs_dead"
	speak = list("OINK!","WHEEEE!","OINK?")
	speak_emote = list("grunts")
	emote_hear = list("grunts.")
	emote_see = list("grunts.")
	speak_chance = 5
	turns_per_move = 1
	see_in_dark = 3
	maxHealth = 50
	health = 50
	attacked_sound = 'mod_celadon/_storge_sounds/sound/mobs/pig/oink.ogg'
	deathsound = 'mod_celadon/_storge_sounds/sound/mobs/pig/death.ogg'
	butcher_results = list(/obj/item/food/meat/slab/pig = 3)
	density = TRUE
	mob_size = MOB_SIZE_LARGE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	held_state = "pigs"
	faction = list("neutral")

/mob/living/simple_animal/pet/dog/corgi/pig/Initialize(mapload)
	. = ..()
	if(prob(1))
		name = "Randy Sandy"
		desc = "<big>Самый жирный боров.</big>"
		maxHealth = 500
		health = 500

/mob/living/simple_animal/pet/dog/corgi/pig/Life()
	..()
	if(stat)
		return
	if(prob(10))
		var/chosen_sound = pick('mod_celadon/_storge_sounds/sound/mobs/pig/hru.ogg', 'mod_celadon/_storge_sounds/sound/mobs/pig/oink.ogg', 'mod_celadon/_storge_sounds/sound/mobs/pig/squeak.ogg')
		playsound(src, chosen_sound, 50, TRUE)

/mob/living/simple_animal/pet/dog/corgi/pig/update_corgi_fluff()
	name = real_name
	desc = initial(desc)
	speak = list("OINK!", "WEEEE!", "OINK?")
	speak_emote = list("oinks")
	emote_hear = list("oinks!")
	emote_see = list("oinks thoughtfully")
	set_light(0)

	if(inventory_head?.dog_fashion)
		var/datum/dog_fashion/DF = new inventory_head.dog_fashion(src)
		DF.apply(src)

	if(inventory_back?.dog_fashion)
		var/datum/dog_fashion/DF = new inventory_back.dog_fashion(src)
		DF.apply(src)

/obj/item/food/meat/slab/pig
	name = "salo"
	icon_state = "salo"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/salo.dmi'
	foodtypes = MEAT

/obj/item/food/meat/slab/pig/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meat/rawcutlet/plain/salo, 3, 30)

/obj/item/food/meat/rawcutlet/plain/salo
	name = "salo"
	icon_state = "salo_slice"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/salo.dmi'

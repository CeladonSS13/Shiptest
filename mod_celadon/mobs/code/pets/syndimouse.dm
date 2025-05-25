/mob/living/simple_animal/mouse/syndie
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	name = "SyndiMouse"
	// body_color = "red"	// NEEDS_TO_FIX_ALARM!
	icon_state = "mouse_red"
	icon_living = "mouse_red"
	desc = "It's a SyndiMouse in a spacesuit."
	icon_dead = "mouse_red_dead"
	held_state = "mouse_red"
	gender = MALE
	health = 175
	maxHealth = 175
	unsuitable_atmos_damage = 0
	minbodytemp = 800
	minbodytemp = 0
	melee_damage_lower = 15
	melee_damage_upper = 45
	faction = list("Syndicate")

/mob/living/simple_animal/mouse/Initialize()
	. = ..()
	// GLOB.mouse_spawned += 1	// NEEDS_TO_FIX_ALARM!
	ADD_TRAIT(src, TRAIT_HOLDABLE, INNATE_TRAIT)
	AddComponent(/datum/component/squeak, list('sound/effects/mousesqueek.ogg'=1), 100, extrarange = SHORT_RANGE_SOUND_EXTRARANGE) //as quiet as a mouse or whatever
	// if(!body_color)
	// 	body_color = pick( list("brown","gray","white","red") )		// NEEDS_TO_FIX_ALARM!
	// icon_state = "mouse_[body_color]"
	// icon_living = "mouse_[body_color]"
	// icon_dead = "mouse_[body_color]_dead"

/obj/item/reagent_containers/food/snacks/deadmouse
	icon = 'mod_celadon/_storge_icons/icons/mobs/pet_content/pets.dmi'
	icon_state = "mouse_red_dead"
	desc = "Dead mouse in a spacesuit. Taraja's favorite food"

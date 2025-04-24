/mob/living/simple_animal/hostile/asteroid/roach/tank
	name = "Panzer Roach"
	desc = "A monstrous, dog-sized cockroach. This one looks more robust than others."
	icon_state = "panzer"
	icon_living = "panzer_move"
	icon_aggro = "panzer_move"
	icon_dead = "panzer_dead"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/roachmeat/panzer = 6)
	turns_per_move = 2
	maxHealth = 45
	health = 45
	move_to_delay = 6
	mob_size = MOB_SIZE_SMALL * 15 // 15
	density = TRUE
	// rarity_value = 22.5

	speak_emote = list("slammed into", "pounded into", "crushed")

	melee_damage_lower = 7 // Slow, but big punch
	melee_damage_upper = 16
	armour_penetration = 10

	// Armor related variables
	armor = list("melee" = 15, "bullet" = 25, "laser" = 10, "energy" = 10, "bomb" = 20, "bio" = 25, "rad" = 50, "fire" = 0, "acid" = 0)

// Panzers won't slip over on water or soap.
/mob/living/simple_animal/hostile/asteroid/roach/tank/slip(var/slipped_on,stun_duration=8)
	return FALSE


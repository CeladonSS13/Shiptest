/mob/living/simple_animal/hostile/asteroid/roach/hunter
	name = "Jager Roach"
	desc = "A monstrous, dog-sized cockroach. This one has bigger claws."
	icon_state = "jager"
	icon_living = "jager_move"
	icon_aggro = "jager"
	icon_dead = "jager_dead"

	turns_per_move = 3
	maxHealth = 25
	health = 25
	move_to_delay = 2.5

	melee_damage_lower = 4
	melee_damage_upper = 8
	armour_penetration = 30

	speak_emote = list("slashed", "rended", "diced")

	butcher_results = list(/obj/item/food/meat/roachmeat/jager = 3)

	// Armor related variables - jager jacket
	armor = list("melee" = 5, "bullet" = 2, "laser" = 2, "energy" = 2, "bomb" = 0, "bio" = 25, "rad" = 50, "fire" = 0, "acid" = 0)


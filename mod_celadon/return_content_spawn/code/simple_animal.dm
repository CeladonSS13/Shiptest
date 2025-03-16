// Hivelord
/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril
	fromtendril = TRUE

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf/tendril
	fromtendril = TRUE

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow/tendril
	fromtendril = TRUE

// Goliath
/mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient
	pre_attack_icon = "ancient_goliath_preattack"
	throw_message = "does nothing to the rocky hide of the"

/mob/living/simple_animal/hostile/asteroid/goliath/beast/tendril
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/goliath = 2, /obj/item/stack/sheet/bone = 2, /obj/item/stack/sheet/sinew = 2)
	fromtendril = TRUE

// Goliath broodmother child - не знаю, нужно ли это или нет, в случае чего расскомментировать
// /mob/living/simple_animal/hostile/asteroid/elite/broodmother_child
// 	butcher_results = list()

// basilisk
/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/tendril
	fromtendril = TRUE

// swarmer
/mob/living/simple_animal/hostile/megafauna/swarmer_swarm_beacon
	achievement_type = /datum/award/achievement/boss/swarmer_beacon_kill
	crusher_achievement_type = /datum/award/achievement/boss/swarmer_beacon_crusher
	score_achievement_type = /datum/award/score/swarmer_beacon_score

//goat
/mob/living/simple_animal/hostile/retaliate/goat
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/clothing/head/goatpelt = 1)

//penguin
/mob/living/simple_animal/pet/penguin/emperor/shamebrero
	name = "Shamebrero penguin"
	desc = "Shameful of all he surveys."
	icon_state = "penguin_shamebrero"
	icon_living = "penguin_shamebrero"
	// gold_core_spawnable = NO_SPAWN
	unique_pet = TRUE


///////////////////////////////////////////////////////////
/// HOSTILEs
///////////////////////////////////////////////////////////
/mob/living/simple_animal/hostile/human/skeleton/templar
	loot = list(/obj/effect/decal/remains/human,
				/obj/item/clothing/suit/armor/witchhunter,
				/obj/item/clothing/head/witchunter,
				/obj/item/melee/sword/claymore{name = "holy sword"})

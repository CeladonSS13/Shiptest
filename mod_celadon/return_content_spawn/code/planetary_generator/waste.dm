/datum/biome/waste/metal
	mob_spawn_list = list( //nor organics, more biased towards hivebots though
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/strong = 80,
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged = 50,
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged/rapid = 50,
		/mob/living/simple_animal/bot/firebot/rockplanet = 15,
		/mob/living/simple_animal/bot/secbot/ed209/rockplanet = 3,
		/mob/living/simple_animal/hostile/abandoned_minebot = 15,
		/mob/living/simple_animal/bot/floorbot/rockplanet = 15,
		/obj/structure/spawner/wasteplanet/hivebot/low_threat = 20,
		/obj/structure/spawner/wasteplanet/hivebot/medium_threat = 10,
		/obj/structure/spawner/wasteplanet/hivebot/high_threat = 5,
		/obj/structure/spawner/wasteplanet/hivebot/extreme_threat = 2,
		/obj/structure/spawner/hivebot = 35,
	)

/datum/biome/cave/waste/metal //deeper in, there's no normal stuff here
	mob_spawn_list = list( //nor organics, more biased towards hivebots though
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/strong = 80,
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged = 50,
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged/rapid = 50,
		/mob/living/simple_animal/bot/firebot/rockplanet = 15,
		/mob/living/simple_animal/bot/secbot/ed209/rockplanet = 3,
		/mob/living/simple_animal/hostile/abandoned_minebot = 15,
		/mob/living/simple_animal/bot/floorbot/rockplanet = 15,
		/obj/structure/spawner/wasteplanet/hivebot/low_threat = 20,
		/obj/structure/spawner/wasteplanet/hivebot/medium_threat = 10,
		/obj/structure/spawner/wasteplanet/hivebot/high_threat = 5,
		/obj/structure/spawner/wasteplanet/hivebot/extreme_threat = 2,
		/obj/structure/spawner/hivebot = 20,
	)

/datum/biome/cave/waste/metal/hivebot
	mob_spawn_list = list( //Whoops! All hivebots!
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/strong = 80,
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged = 50,
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged/rapid = 50,
		/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged/rapid = 50
	)
	feature_spawn_list = list(
		/obj/structure/spawner/wasteplanet/hivebot/low_threat = 20,
		/obj/structure/spawner/wasteplanet/hivebot/medium_threat = 10,
		/obj/structure/spawner/wasteplanet/hivebot/high_threat = 5,
		/obj/structure/spawner/wasteplanet/hivebot/extreme_threat = 2,
		/obj/structure/spawner/hivebot = 1,
		/obj/effect/spawner/minefield/manhack = 2,
		)




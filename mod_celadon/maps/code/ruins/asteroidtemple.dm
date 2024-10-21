// False wall

/obj/machinery/button/door/false_wall
	name = "Skull button"
	desc = "Ancient mechanism, looks like button with shape of skull"
	icon = 'icons/obj/mining.dmi'
	icon_state = "skull"
	use_power = 0

/turf/closed/indestructible/riveted/boss/fake
	var/id = null

/turf/closed/indestructible/riveted/boss/fake/proc/open()
	density = 0
	opacity = 0
	icon = 'icons/turf/floors.dmi'
	icon_state = "clockwork_floor"

/turf/closed/indestructible/riveted/boss/fake/proc/close()
	density = 1
	opacity = 1
	icon = 'icons/turf/walls/boss_wall.dmi'
	icon_state = "wall"

/obj/machinery/button/door/false_wall/attack_hand(mob/user as mob)
	for(var/turf/closed/indestructible/riveted/boss/fake/W)
		if(W.id == id)
			playsound (src, 'sound/machines/clockcult/steam_whoosh.ogg')
			if(W.density)
				spawn(10)
					W.open()
					return
			else
				spawn(10)
					W.close()
					return

/obj/effect/spawner/lootdrop/templestuff
	name = "random temple loot"
	lootcount = 1
	loot = list(
	/obj/structure/fluff/clockwork/blind_eye,
	/obj/structure/fluuf/clockcult/clockgolem_remains,
	/obj/structure/fluff/clockcult/fallen_armor,
	/obj/item/lighter/clockwork,
	/obj/structure/fluff/clockwork/alloy_shards,
	/obj/structure/fluff/clockwork/alloy_shards/small,
	/obj/structure/fluff/clockwork/alloy_shards/medium,
	/obj/structure/fluff/clockwork/alloy_shards/medium_gearbit,
	/obj/structure/fluff/clockwork/alloy_shards/large,
	/obj/item/stack/sheet/mineral/gold/five,
	/obj/item/coin/silver,
	/obj/item/coin/gold,
	/obj/item/coin/diamond,
	/obj/item/reagent_containers/glass/mortar/gold,
	/mob/living/simple_animal/hostile/asteroid/goldgrub,
	/obj/item/ectoplasm,
	/obj/item/stack/ore/diamond
	)

/obj/item/keycard/gatedrop/temple
	name = "Treasure Key"
	desc = "A dusty key, smudged with dried blood."
	puzzle_id = "templekey"

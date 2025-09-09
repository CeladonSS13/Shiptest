/*
 * RETURN_MINES_FIELD - Взято из:
 * code/game/objects/items/devices/mines.dm
 */

/obj/effect/spawner/random/mine
	name = "live mine spawner (random)"
	spawn_loot_count = 1
	spawn_loot_split = TRUE
	loot = list(
		/obj/item/mine/pressure/explosive/live = 10,
		/obj/item/mine/pressure/explosive/shrapnel/live = 3,
		/obj/item/mine/pressure/explosive/rad/live = 3,
		/obj/item/mine/pressure/explosive/fire/live = 3)

/obj/effect/spawner/minefield
	name = "minefield spawner"
	var/minerange = 9
	var/minetype = /obj/item/mine/pressure/explosive/rusty/live

/obj/effect/spawner/minefield/Initialize(mapload)
	. = ..()
	for(var/turf/open/T in view(minerange,loc))
		if(prob(5))
			new minetype(T)

/obj/effect/spawner/minefield/random
	name = "random minefield spawner"
	minetype = /obj/effect/spawner/random/mine

/obj/effect/spawner/minefield/manhack
	name = "manhack field spawner"
	minetype = /obj/item/mine/proximity/spawner/manhack/live

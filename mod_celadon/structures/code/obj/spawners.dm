LIVE_MINE_HELPER(proximity/spawner/magma_skull)

/obj/item/mine/proximity/spawner/magma_skull
	name = "\improper magma skull"
	desc = "This is magma skull"
	spawn_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/magma
	spawn_number = 1

/obj/effect/spawner/minefield/magma_skull
	name = "magma skull field spawner"
	minetype = /obj/item/mine/proximity/spawner/magma_skull/live

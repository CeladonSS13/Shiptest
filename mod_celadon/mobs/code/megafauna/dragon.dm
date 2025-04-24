/mob/living/simple_animal/hostile/megafauna/dragon/plasma
	loot = list(/obj/structure/closet/crate/necropolis/dragon_plasma)
	health = 3500
	maxHealth = 3500

/obj/structure/closet/crate/necropolis/dragon_plasma
	name = "dragon chest"

/obj/structure/closet/crate/necropolis/dragon_plasma/PopulateContents()
	var/loot = rand(1,4)
	switch(loot)
		if(1)
			new /obj/item/gun/ballistic/automatic/hmg/shredder(src)
		if(2)
			new /obj/item/gun/ballistic/automatic/assault/cm82(src)
		if(3)
			new /obj/item/gun/ballistic/automatic/marksman/taipan(src)
		if(4)
			new /obj/item/gun/ballistic/automatic/marksman/f90(src)

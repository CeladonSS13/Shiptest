/obj/item/grenade/spawnergrenade/clown
	name = "C.L.U.W.N.E."
	desc = "A sleek device often given to clowns on their 10th birthdays for protection. You can hear faint scratching coming from within."
	icon = 'mod_celadon/_storge_icons/icons/other/clown_mime/grenade.dmi'
	icon_state = "clown_ball"
	item_state = "clown_ball"
	spawner_type = list(/mob/living/simple_animal/hostile/retaliate/clown/fleshclown, /mob/living/simple_animal/hostile/retaliate/clown/clownhulk, /mob/living/simple_animal/hostile/retaliate/clown/longface, /mob/living/simple_animal/hostile/retaliate/clown/clownhulk/chlown, /mob/living/simple_animal/hostile/retaliate/clown/clownhulk/honcmunculus, /mob/living/simple_animal/hostile/retaliate/clown/mutant/blob, /mob/living/simple_animal/hostile/retaliate/clown/banana, /mob/living/simple_animal/hostile/retaliate/clown/honkling, /mob/living/simple_animal/hostile/retaliate/clown/lube)
	deliveryamt = 1

/obj/item/grenade/spawnergrenade/clown_broken
	name = "stuffed C.L.U.W.N.E."
	desc = "A sleek device often given to clowns on their 10th birthdays for protection. While a typical C.L.U.W.N.E only holds one creature, sometimes foolish young clowns try to cram more in, often to disasterous effect."
	icon = 'mod_celadon/_storge_icons/icons/other/clown_mime/grenade.dmi'
	icon_state = "clown_broken"
	item_state = "clown_broken"
	spawner_type = /mob/living/simple_animal/hostile/retaliate/clown/mutant
	deliveryamt = 5

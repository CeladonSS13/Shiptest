//разварровывает боевых ботов
/mob/living/simple_animal/hostile/automated/quadrotor/nanotrasen
	name = "Vigilitas Drone"
	desc = "A cheap defensive drone manufactured by Nanotrasen. Commonly used as a distraction in the field against heavy Syndicate strike teams."
	icon = 'mod_celadon/_storage_icons/icons/mobs/aibots.dmi'
	health = 60
	maxHealth = 60
	projectilesound = 'sound/weapons/gun/laser/sharplite-fire.ogg'
	projectiletype = /obj/projectile/beam/laser/nanotrasen
	casingtype = null
	faction = list(ROLE_DEATHSQUAD)

/mob/living/simple_animal/hostile/automated/rover/nanotrasen
	name = "Vigilitas \"Scenthound\" defense rover"
	desc = "A scouting drone manufactured by Nanotrasen. Commonly fielded in small forward groups ahead of Vigilitas teams, or placed in security checkpoints."
	health = 100
	maxHealth = 100
	armor = list("melee" = 20, "bullet" = 30, "laser" = 30, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 30, "fire" = 30, "acid" = 30)
	icon_state = "nanotrasentread"
	icon = 'mod_celadon/_storage_icons/icons/mobs/aibots.dmi'
	projectilesound = 'sound/weapons/gun/smg/resolution.ogg'
	casingtype = /obj/item/ammo_casing/c46x30mm
	faction = list(ROLE_DEATHSQUAD)
	rapid = 3
	rapid_fire_delay = 3
	retreat_distance = 2
	minimum_distance = 3

/mob/living/simple_animal/hostile/automated/bipedal/nanotrasen
	desc = "A lumbering automaton garbed in Nanotrasen titanium, with an integrated energy rifle attached in place of a left arm. The simple algorithms driving its servos level the energy rifle in your direction."
	icon_state = "nanotrasen_bipedal"
	icon = 'mod_celadon/_storage_icons/icons/mobs/aibots.dmi'
	retreat_distance = 2
	minimum_distance = 4
	rapid = 2
	rapid_fire_delay = 3
	projectilesound = 'sound/weapons/gun/laser/sharplite-fire.ogg'
	projectiletype = /obj/projectile/beam/laser/nanotrasen/assault
	casingtype = null
	faction = list(ROLE_DEATHSQUAD)

/mob/living/simple_animal/hostile/automated/walkmine/nanotrasen
	faction = list("Deathsquad")
	examine_text = span_notice("It has a <span class='boldnotice'>Nanotrasen</span> logo printed on its outer plating.")

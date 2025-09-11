/mob/living/simple_animal/hostile/human/solfed
	name = "\improper SolFed Gehilfe"
	desc = "A Gehilfe serving the SolFed navy. This one seems to have orders to report unauthorized individuals."
	icon_state = "nanotrasen"
	icon_living = "nanotrasen"
	speak_chance = 0
	stat_attack = HARD_CRIT
	atmos_requirements = IMMUNE_ATMOS_REQS
	maxbodytemp = 400
	unsuitable_atmos_damage = 15
	faction = list(ROLE_DEATHSQUAD)
	loot = list()
	check_friendly_fire = TRUE
	dodging = TRUE
	rapid_melee = 2
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed

	armor_base = /obj/item/clothing/suit/armor/vest

/* melee guys */

/mob/living/simple_animal/hostile/human/solfed/melee
	name = "SolFed Nahkampfkrieger"
	desc = "A melee combatant serving the SolFed navy. Armed with a knife, ready to fight!"
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	status_flags = 0
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/melee
	armor_base = /obj/item/clothing/suit/armor/vest/alt

	r_hand = /obj/item/melee/energy/sword/saber/knife/pre_active

	melee_damage_lower = 20
	melee_damage_upper = 20

	var/projectile_deflect_chance = 0 //you cant deflect bullets with a knife

/mob/living/simple_animal/hostile/human/solfed/melee/bullet_act(obj/projectile/Proj)
	if(prob(projectile_deflect_chance))
		visible_message("<span class='danger'>[src] blocks [Proj] with its shield!</span>")
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/simple_animal/hostile/human/solfed/melee/heavy
	name = "SolFed Energy Nahkampfkrieger"
	desc = "A well trained melee combatant serving the SolFed navy. Armed with an energy kampfmesser and a shield, ready to slash!"
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/blade1.ogg'
	status_flags = 0
	rapid_melee = 3
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/melee/heavy

	r_hand = /obj/item/melee/energy/sword/saber/knife/pre_active
	l_hand = /obj/item/shield/riot

	melee_damage_lower = 20
	melee_damage_upper = 20

	projectile_deflect_chance = 75

/* ranged guys */

/mob/living/simple_animal/hostile/human/solfed/guard
	name = "\improper SolFed Patrol Officer"
	desc = "A Patrol Officer serving the SolFed navy. Probably a former cop. He wields his Glock 17, ready to shoot unauthorized individuals."
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c9mm
	rapid = 3
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/guard
	armor_base = /obj/item/clothing/suit/armor/vest
	r_hand = /obj/item/gun/ballistic/automatic/pistol/glock
	projectilesound = 'mod_celadon/_storage_sounds/sound/gun/shot_glock.wav'

/mob/living/simple_animal/hostile/human/solfed/guard/Aggro()
	..()
	summon_backup(15)
	say("WE'VE GOT HOSTILES!!")

/mob/living/simple_animal/hostile/human/solfed/ranged
	name = "\improper SolFed Seitenwaffenmeister"
	desc = "A Seitenwaffenmeister serving the SolFed navy. Holding his Terragov Pistole C, ready to gun down terrorist scum."
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/caseless/c556mm
	rapid = 3
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/pistol
	armor_base = /obj/item/clothing/suit/armor/vest/marine
	r_hand = /obj/item/gun/ballistic/automatic/pistol/solgov/old
	projectilesound = 'sound/weapons/gun/pistol/pistolec.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/gunner
	name = "\improper SolFed Marine"
	desc = "A Marine serving the SolFed navy. He carries a loaded G36, ready to attack navy's enemies."
	rapid = 3
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine
	armor_base = /obj/item/clothing/suit/armor/vest/marine
	casingtype = /obj/item/ammo_casing/a556_45
	r_hand = /obj/item/gun/ballistic/automatic/assault/g36
	projectilesound = 'mod_celadon/_storage_sounds/sound/gun/g36.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/gunner/elysium //I HATE CLIP GUNS
	name = "\improper Elysium Brigade Haris"
	desc = "A brave Haris serving the Elysium Brigade. Holds tight grip of his trusty P16, ready to defend his nation."
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/elysium
	armor_base = /obj/item/clothing/suit/armor/vest/bulletproof
	casingtype = /obj/item/ammo_casing/a556_42
	r_hand = /obj/item/gun/ballistic/automatic/assault/cm82
	projectilesound = 'sound/weapons/gun/rifle/m16.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/shotgun
	name = "\improper SolFed Wachter"
	desc = "A Wachter serving the SolFed navy. He wields an imported CM-15, ready to blast unauthorized individuals."
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/shotgun
	armor_base = /obj/item/clothing/suit/armor/vest/marine/medium
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	r_hand = /obj/item/gun/ballistic/shotgun/cm15
	rapid = 2
	retreat_distance = 2
	minimum_distance = 2
	shoot_point_blank = TRUE
	projectilesound = 'sound/weapons/gun/shotgun/shot.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/shotgun/incendiary
	name = "\improper SolFed Flammenwachter"
	desc = "A Wachter serving the SolFed navy. He wields an imported CM-15, ready to blast unauthorized individuals with heavy FIRE."
	casingtype = /obj/item/ammo_casing/shotgun/dragonsbreath

/mob/living/simple_animal/hostile/human/solfed/ranged/gauss
	name = "\improper SolFed Gaussmarine"
	desc = "A Gaussmarine serving the SolFed navy. Proudly wields an imported Nanotrasen Gauss rifle, always on guard."
	rapid = 3
	rapid_fire_delay = 4
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/gauss
	armor_base = /obj/item/clothing/suit/armor/vest/blueshirt
	casingtype = /obj/item/ammo_casing/caseless/gauss
	r_hand = /obj/item/gun/ballistic/automatic/powered/gauss
	projectilesound = 'sound/weapons/gun/gauss/magrifle.ogg'

/* Ranged Heavy weapon guys */

/mob/living/simple_animal/hostile/human/solfed/ranged/gauss/heavy
	name = "SolFed Heavy Gaussmarine"
	desc = "A Heavy Gaussmarine serving the SolFed navy. Proudly wields an aging GAR, ready to blast."
	rapid = 5
	rapid_fire_delay = 6
	rapid_melee = 2
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/gauss/heavy
	armor_base = /obj/item/clothing/suit/armor/vest/marine/heavy
	casingtype = /obj/item/ammo_casing/caseless/gauss/lance
	r_hand = /obj/item/gun/ballistic/automatic/powered/gauss/gar
	projectilesound = 'sound/weapons/gun/gauss/gar.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/panzerfaust
	name = "\improper SolFed Feldwebel"
	desc = "A well-armed SolFed navy Feldwebel. Ready to protect his navy with a Panzerfaust, FOR THE FATHERLAND!"
	rapid = 3
	rapid_fire_delay = 50
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/sergeant
	casingtype = /obj/item/ammo_casing/caseless/rocket
	r_hand = /obj/item/gun/ballistic/rocketlauncher/solgov
	projectilesound = 'sound/weapons/gun/general/rocket_launch.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/sniper
	name = "\improper SolFed Scharfschutze"
	desc = "Snipin is a good job mate, especially when you are serving in the SolFed navy."
	rapid = 1
	rapid_fire_delay = 15
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/marine/sniper
	armor_base = /obj/item/clothing/suit/armor/vest/det_suit
	casingtype = /obj/item/ammo_casing/caseless/a858
	r_hand = /obj/item/gun/ballistic/rifle/solgov
	projectilesound = 'sound/weapons/gun/sniper/shot.ogg'

/* Melee Space mobs */

/mob/living/simple_animal/hostile/human/solfed/melee/space
	name = "SolFed Gehilfe"
	desc = "It's like an assistant, but in space! This one is related to SolFed's navy and seems upset."
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/space
	status_flags = 0
	rapid_melee = 1
	melee_damage_lower = 5
	melee_damage_upper = 5
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0

/mob/living/simple_animal/hostile/human/solfed/melee/space/elysium
	name = "Elysium Brigade Mulazim"
	desc = "A true patriot of his nation, tightly holding a starbulan Scimitar, ready to kill on sight any traitor he sees."
	r_hand = /obj/item/melee/skimitar
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/space/elysium
	armor_base = /obj/item/clothing/suit/space/hardsuit/solfed/elysium
	melee_damage_lower = 35
	melee_damage_upper = 35

/* Ranged Space mobs */

/mob/living/simple_animal/hostile/human/solfed/ranged/space
	name = "SolFed Gehilfe"
	desc = "It's like an assistant, but in space! This one is related to SolFed's navy and seems upset."
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/space
	casingtype = /obj/item/ammo_casing/c22lr
	r_hand = /obj/item/gun/ballistic/automatic/pistol/disposable
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/space/commander
	name = "SolFed Kommandant"
	desc = "A high-ranking SolFed navy Kommandant. Commanding his servants, ready to show self-defense with a HC Model H."
	rapid = 5
	rapid_fire_delay = 4
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/space/captain
	casingtype = /obj/item/ammo_casing/caseless/gauss/slug/hc
	r_hand = /obj/item/gun/ballistic/automatic/powered/gauss/modelh
	projectilesound = 'sound/weapons/gun/gauss/modelh.ogg'

/mob/living/simple_animal/hostile/human/solfed/ranged/space/elysium
	name = "Elysium Brigade Space Haris"
	desc = "A brave armored warrior of the Elysium Brigade, armed with a silver SKM, ready to protect his nation."
	rapid = 5
	rapid_fire_delay = 4
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/space/elysium
	armor_base = /obj/item/clothing/suit/space/hardsuit/solfed/elysium
	casingtype = /obj/item/ammo_casing/a762_40
	r_hand = /obj/item/gun/ballistic/automatic/assault/skm/cm24
	projectilesound = 'sound/weapons/gun/rifle/skm.ogg'

/* epic elite space miniboss */

/mob/living/simple_animal/hostile/human/solfed/tank
	name = "SolFed Panzermarine"
	desc = "A SolFed navy veteran, wearing multiple layers of heavy armor, wielding a Terragov Swiss Cheese rifle, ready to make Swiss Cheese out of YOU, terrorist scum."
	ranged = TRUE
	speed = 1
	rapid = 5
	rapid_fire_delay = 3
	rapid_melee = 3
	retreat_distance = 0
	minimum_distance = 1
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0
	casingtype = /obj/item/ammo_casing/a556_42
	projectilesound = 'sound/weapons/gun/rifle/swiss.ogg'
	mob_spawner = /obj/effect/mob_spawn/human/corpse/solfed/elite
	armor_base = /obj/item/clothing/suit/space/hardsuit/solgov
	r_hand = /obj/item/gun/ballistic/automatic/assault/swiss_cheese

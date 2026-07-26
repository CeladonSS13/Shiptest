/mob/living/simple_animal/hostile/human/ussp
	name = "Ussp soldier"
	desc = "An ussp soldier. Unfortunately for them, this one is unarmed."
	icon = 'mod_celadon/_storage_icons/icons/mobs/hostile_mobs.dmi'
	icon_state = "ussp"
	icon_living = "ussp"
	speak_chance = 0
	stat_attack = HARD_CRIT
	atmos_requirements = IMMUNE_ATMOS_REQS
	maxbodytemp = 400
	unsuitable_atmos_damage = 15
	faction = list(FACTION_USSP)
	loot = list()
	check_friendly_fire = TRUE
	dodging = TRUE
	rapid_melee = 2
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ussp

	armor_base = /obj/item/clothing/suit/armor/vest

/mob/living/simple_animal/hostile/human/ussp/ranged
	name = "Ussp soldier"
	desc = "An ussp soldier. They warily glance around, with a compact sidearm held at the ready."
	icon_state = "ussp_ranged"
	icon_living = "ussp_ranged"
	ranged = 1
	rapid = 3
	rapid_fire_delay = 3
	retreat_distance = 5
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c10mm
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	rapid_melee = 2
	l_hand =/obj/item/gun/ballistic/automatic/pistol/ringneck
	armor_base = /obj/item/clothing/suit/armor/vest

/mob/living/simple_animal/hostile/human/ussp/ranged/cargo_tech
	name = "Ussp cargo tech"
	desc = "An ussp cargo tech. Scanning everything around him, with a ringneck ready to fire."
	icon_state = "ussp_cargo_tech_ranged"
	icon_living = "ussp_cargo_tech_ranged"
	rapid = 3
	rapid_fire_delay = 3
	retreat_distance = 5
	minimum_distance = 5
	rapid_melee = 2
	casingtype = /obj/item/ammo_casing/c10mm
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	l_hand =/obj/item/gun/ballistic/automatic/pistol/ringneck
	armor_base = /obj/item/clothing/suit/hazardvest
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ussp/ranged/cargo_tech

/mob/living/simple_animal/hostile/human/ussp/ranged/medium_armor_m11
	name = "Ussp soldier"
	desc = "An ussp soldier. Has a buckmaster, ready to fire."
	icon_state = "ussp_heavy_armor_shotgun_m11"
	icon_living = "ussp_heavy_armor_shotgun_m11"
	ranged = 1
	rapid = 1
	rapid_fire_delay = 6
	retreat_distance = 4
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/shotgun/buckshot //buckshot fired in a two-round burst. This will two-tap unarmored players.
	projectilesound = 'sound/weapons/gun/shotgun/bulldog.ogg'
	l_hand =/obj/item/gun/ballistic/shotgun/automatic/m11
	//shoot_point_blank = TRUE
	//obj/item/gun/ballistic/shotgun/automatic/bulldog
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ranged/ussp_medium_armor

	armor_base = /obj/item/clothing/suit/armor/vest/marine/medium

/mob/living/simple_animal/hostile/human/ussp/cargo_tech_knife
	name = "Ussp cargo tech"
	desc = "An ussp cargo tech. Welding the survival knife in hands, ready to combat."
	icon_state = "ussp_cargo_tech_knife"
	icon_living = "ussp_cargo_tech_knife"
	rapid_melee = 2
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_POINTY
	melee_damage_lower = 20
	melee_damage_upper = 20
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ussp/cargo_tech_knife

	armor_base = /obj/item/clothing/suit/hazardvest
	l_hand = /obj/item/melee/knife/survival

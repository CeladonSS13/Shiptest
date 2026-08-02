/mob/living/simple_animal/hostile/human/commie_rev
	name = "Neo kommunist soldier"
	desc = "A Neo kommunist soldier. Unfortunately for them, this one is unarmed."
	icon = 'mod_celadon/_storage_icons/icons/mobs/hostile_mobs.dmi'
	icon_state = "commie_rev"
	icon_living = "commie_rev"
	speak_chance = 0
	stat_attack = HARD_CRIT
	atmos_requirements = IMMUNE_ATMOS_REQS
	maxbodytemp = 400
	unsuitable_atmos_damage = 15
	faction = list(FACTION_ANTAG_HERMITS)
	loot = list()
	check_friendly_fire = TRUE
	dodging = TRUE
	rapid_melee = 2
	mob_spawner = /obj/effect/mob_spawn/human/corpse/commie_rev

	armor_base = /obj/item/clothing/suit/armor/vest

/mob/living/simple_animal/hostile/human/commie_rev/ranged
	name = "Neo kommunist soldier"
	desc = "A Neo kommunist soldier. They warily glance around, with a compact sidearm held at the ready."
	icon_state = "commie_rev_ranged"
	icon_living = "commie_rev_ranged"
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

/mob/living/simple_animal/hostile/human/commie_rev/ranged/cargo_tech
	name = "Neo kommunist cargo tech"
	desc = "A Neo kommunist cargo tech. Scanning everything around him, with a ringneck ready to fire."
	icon_state = "commie_rev_cargo_tech_ranged"
	icon_living = "commie_rev_cargo_tech_ranged"
	rapid = 3
	rapid_fire_delay = 3
	retreat_distance = 5
	minimum_distance = 5
	rapid_melee = 2
	casingtype = /obj/item/ammo_casing/c10mm
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	l_hand =/obj/item/gun/ballistic/automatic/pistol/ringneck
	armor_base = /obj/item/clothing/suit/hazardvest
	mob_spawner = /obj/effect/mob_spawn/human/corpse/commie_rev/ranged/cargo_tech

/mob/living/simple_animal/hostile/human/commie_rev/ranged/medium_armor_m11
	name = "Neo kommunist soldier"
	desc = "A Neo kommunist soldier. Has a buckmaster, ready to fire."
	icon_state = "ussp_heavy_armor_shotgun_m11"
	icon_living = "ussp_heavy_armor_shotgun_m11"
	rapid = 1
	rapid_fire_delay = 6
	retreat_distance = 4
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/shotgun/buckshot //buckshot fired in a two_round burst. This will two_tap unarmored players.
	projectilesound = 'sound/weapons/gun/shotgun/bulldog.ogg'
	l_hand =/obj/item/gun/ballistic/shotgun/automatic/m11
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ranged/commie_rev_medium_armor

	armor_base = /obj/item/clothing/suit/armor/vest/marine/medium

/mob/living/simple_animal/hostile/human/commie_rev/cargo_tech_knife
	name = "Neo kommunist cargo tech"
	desc = "A Neo kommunist cargo tech. Welding the survival knife in hands, ready to combat."
	icon_state = "ussp_cargo_tech_knife"
	icon_living = "ussp_cargo_tech_knife"
	rapid_melee = 2
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_POINTY
	melee_damage_lower = 20
	melee_damage_upper = 20
	mob_spawner = /obj/effect/mob_spawn/human/corpse/commie_rev/cargo_tech_knife

	armor_base = /obj/item/clothing/suit/hazardvest
	l_hand = /obj/item/melee/knife/survival

/mob/living/simple_animal/hostile/human/commie_rev/ranged/medium_armor_bulldog
	name = "Neo kommunist soldier"
	desc = "A Neo kommunist soldier. Has a bulldog, ready to fire."
	icon_state = "commie_rev_armor_medium_shotgun_bulldog"
	icon_living = "commie_rev_armor_medium_shotgun_bulldog"
	rapid = 2
	rapid_fire_delay = 6
	retreat_distance = 4
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/shotgun/buckshot //buckshot fired in a two_round burst. This will two_tap unarmored players.
	projectilesound = 'sound/weapons/gun/shotgun/bulldog.ogg'
	l_hand =/obj/item/gun/ballistic/shotgun/automatic/bulldog
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ranged/commie_rev_medium_armor

	armor_base = /obj/item/clothing/suit/armor/vest/marine/medium

/mob/living/simple_animal/hostile/human/commie_rev/ranged/medium_armor_skm24
	name = "Neo kommunist soldier"
	desc = "A Neo kommunist soldier. He has an ...skm24!?, where did he get this from?."
	icon_state = "commie_rev_armor_medium_skm_24"
	icon_living = "commie_rev_armor_medium_skm_24"
	rapid = 5
	rapid_fire_delay = 3
	retreat_distance = 4
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/a762_40
	projectilesound = 'sound/weapons/gun/rifle/skm.ogg'
	l_hand =/obj/item/gun/ballistic/automatic/assault/skm
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ranged/commie_rev_medium_armor

	armor_base = /obj/item/clothing/suit/armor/vest/marine/medium

/mob/living/simple_animal/hostile/human/commie_rev/ranged/commander
	name = "Neo kommunist commander"
	desc = "A Neo kommunist commander. Has a viper, ready to shoot."
	icon_state = "commie_rev_commander_viper"
	icon_living = "commie_rev_commander_viper"
	rapid = 3
	rapid_fire_delay = 6
	retreat_distance = 4
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/a357
	projectilesound = 'sound/weapons/gun/revolver/viper.ogg'
	l_hand =/obj/item/gun/ballistic/revolver/viper
	mob_spawner = /obj/effect/mob_spawn/human/corpse/commie_rev/ranged/commie_rev_commander

	armor_base = /obj/item/clothing/suit/armor/vest/inteq

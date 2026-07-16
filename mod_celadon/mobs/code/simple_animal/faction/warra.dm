//возвращает еганы в руки VI мобов и добавляет пару новых
/mob/living/simple_animal/hostile/human/warra/ranged/laser
	desc = "A member of Vigilitas Interstellar, their hands are locked around a laser rifle, actively aiming it at potential threats." //просто на тот случай если оффы решат дергать описание
	projectiletype = /obj/projectile/beam/laser/warra
	r_hand = /obj/item/gun/energy/e_gun/e_old

/mob/living/simple_animal/hostile/human/warra/ranged/trooper/smg
	desc = "A member of Vigilitas Interstellar. Eyes track motion as they saunter confidently, energy SMG at alert."
	projectiletype = /obj/projectile/beam/laser/warra/weak
	r_hand = /obj/item/gun/energy/e_gun/e_old/smg

/mob/living/simple_animal/hostile/human/warra/ranged/trooper/shotgun
	desc = "A member of Vigilitas Interstellar, with their chin high up. They confidently aim around their shotgun, ready to burn away any trespassers."
	casingtype = /obj/item/ammo_casing/energy/laser/shotgun/warra
	projectilesound = 'sound/weapons/laser4.ogg'
	r_hand = /obj/item/gun/energy/e_gun/e_old/iot

/mob/living/simple_animal/hostile/human/warra/ranged/trooper/rifle
	desc = "A well-armed member of Vigilitas Interstellar. They stand at the ready with a Hades energy rifle, smirking underneath their gas mask."
	projectiletype = /obj/projectile/beam/laser/warra/assault
	r_hand = /obj/item/gun/energy/e_gun/e_old/hades

/mob/living/simple_animal/hostile/human/warra/ranged/trooper/sniper
	name = "Vigilitas Ranger"
	desc = "A watchful member of Vigilitas Interstellar. They proudly wield a Parallax energy rifle, always on guard."
	projectiletype = /obj/projectile/beam/laser/warra/dmr
	r_hand = /obj/item/gun/energy/e_gun/e_old/dmr
	casingtype = null
	minimum_distance = 7
	vision_range = 12
	aggro_vision_range = 14
	rapid = 1
	rapid_fire_delay = 3
	rapid_melee = 3
	projectilesound = 'sound/weapons/gun/laser/sharplite-fire.ogg'
	mob_spawner = /obj/effect/mob_spawn/human/corpse/vigilitas_sniper

/mob/living/simple_animal/hostile/human/warra/ranged/trooper/sniper/space
	armor_base = /obj/item/clothing/suit/space/hardsuit/security/hos
	minbodytemp = 0
	maxbodytemp = 1000
	mob_spawner = /obj/effect/mob_spawn/human/corpse/vigilitas_hos

/mob/living/simple_animal/hostile/human/warra/elite
	desc = "A hardened member of Vigilitas Interstellar, clad in well made alloys slathered in red. Their helmet turns, their rifle raises, and they start to move with practiced precision."
	projectiletype = /obj/projectile/beam/laser/warra/assault
	r_hand = /obj/item/gun/energy/e_gun/e_old/hades

/mob/living/simple_animal/hostile/human/warra/elite/shotgun
	desc = "A hardened member of Vigilitas Interstellar, clad in well made alloys slathered in red. Their helmet turns, Their shotgun blinks, and they glare coldly into your eyes."
	casingtype = /obj/item/ammo_casing/energy/laser/shotgun/warra
	projectilesound = 'sound/weapons/laser4.ogg'
	r_hand = /obj/item/gun/energy/e_gun/e_old/iot

/mob/living/simple_animal/hostile/human/warra/elite/sniper
	desc = "A hardened member of Vigilitas Interstellar, clad in well made alloys slathered in red. Their helmet turns, their marksman rifle raises, and they start to take aim at you."
	projectiletype = /obj/projectile/beam/laser/warra/dmr
	r_hand = /obj/item/gun/energy/e_gun/e_old/dmr
	minimum_distance = 7
	vision_range = 12
	aggro_vision_range = 14
	rapid = 3
	rapid_fire_delay = 5
	rapid_melee = 3
	retreat_distance = 0
	minbodytemp = 0
	projectilesound = 'sound/weapons/gun/laser/sharplite-fire.ogg'

/mob/living/simple_animal/hostile/human/warra/elite/heavy
	desc = "A hardened member of Vigilitas Interstellar, clad in well made alloys slathered in red. Their helmet turns, their energy machine gun raises, as they prepare to remove the enemy's direction."
	rapid = 10
	rapid_fire_delay = 2
	rapid_melee = 3
	retreat_distance = 0
	minimum_distance = 1
	projectiletype = /obj/projectile/beam/laser/warra/assault
	projectilesound = 'sound/weapons/gun/laser/e40_las.ogg'
	r_hand = /obj/item/gun/energy/e_gun/e_old/emg
	weapon_drop_chance = 1

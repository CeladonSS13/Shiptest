//возвращает еганы в руки VI мобов
/mob/living/simple_animal/hostile/human/nanotrasen/ranged/laser
	desc = "A member of Vigilitas Interstellar, their hands are locked around a laser rifle, actively aiming it at potential threats." //просто на тот случай если оффы решат дергать описание
	projectiletype = /obj/projectile/beam/laser
	r_hand = /obj/item/gun/energy/e_gun/e_old

/mob/living/simple_animal/hostile/human/nanotrasen/ranged/trooper/smg
	desc = "A member of Vigilitas Interstellar. Eyes track motion as they saunter confidently, energy SMG at alert."
	projectiletype = /obj/projectile/beam/laser/light/smg
	r_hand = /obj/item/gun/energy/e_gun/e_old/smg

/mob/living/simple_animal/hostile/human/nanotrasen/ranged/trooper/shotgun
	desc = "A member of Vigilitas Interstellar, with their chin high up. They confidently aim around their shotgun, ready to burn away any trespassers."
	casingtype = /obj/item/ammo_casing/energy/laser/ultima
	projectilesound = 'sound/weapons/laser4.ogg'
	r_hand = /obj/item/gun/energy/e_gun/e_old/iot

/mob/living/simple_animal/hostile/human/nanotrasen/ranged/trooper/rifle
	desc = "A well-armed member of Vigilitas Interstellar. They stand at the ready with a Hades energy rifle, smirking underneath their gas mask."
	projectiletype = /obj/projectile/beam/laser/assault
	r_hand = /obj/item/gun/energy/e_gun/e_old/hades

/mob/living/simple_animal/hostile/human/nanotrasen/elite
	desc = "A hardened member of Vigilitas Interstellar, clad in well made alloys slathered in red. Their helmet turns, their rifle raises, and they start to move with practiced precision."
	projectiletype = /obj/projectile/beam/laser/assault
	r_hand = /obj/item/gun/energy/e_gun/e_old/hades

/mob/living/simple_animal/hostile/human/nanotrasen/elite/shotgun
	desc = "A hardened member of Vigilitas Interstellar, clad in well made alloys slathered in red. Their helmet turns, Their shotgun blinks, and they glare coldly into your eyes."
	casingtype = /obj/item/ammo_casing/energy/laser/ultima
	projectilesound = 'sound/weapons/laser4.ogg'
	r_hand = /obj/item/gun/energy/e_gun/e_old/iot

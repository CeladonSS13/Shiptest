/obj/projectile/bullet/pellet
	armour_penetration = -15

/obj/item/ammo_casing/shotgun/buckshot
	pellets = 6
	custom_materials = list(/datum/material/iron=6000)

/obj/item/ammo_casing/shotgun/beanbag
	custom_materials = list(/datum/material/iron=2000)

/obj/item/ammo_casing/shotgun/improvised
	custom_materials = list(/datum/material/iron=2000)

/obj/item/ammo_casing/shotgun/stunslug
	custom_materials = list(/datum/material/iron=2000)

/obj/item/gun/ballistic/shotgun/automatic/combat
	fire_delay = 5

/obj/projectile/bullet/pellet/buckshot
	damage = 14
	tile_dropoff = 0.5

/obj/projectile/bullet/pellet/rubbershot
	damage = 2
	stamina = 10
	tile_dropoff_stamina = 1
	armour_penetration = 25

/obj/projectile/bullet/pellet/rubbershot/incapacitate
	armour_penetration = 45

/obj/projectile/bullet/a357
	damage = 45
	armour_penetration = 10 	//Ребаланс по предложке, для усиления револьверов

/obj/projectile/bullet/a44roum
	damage = 35

/obj/projectile/bullet/a44roum/hp
	damage = 50 	//Изменения по предложке, общее увеличение урона у .44 и HP на 10

/obj/projectile/bullet/slug
	armour_penetration = 10 // Усиление слагов, ввиду их бесполезности против брони

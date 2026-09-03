// MARK: AMMO CASINGS

/obj/item/ammo_casing/energy/laser/shotgun/nanotrasen
	projectile_type = /obj/projectile/beam/laser/nanotrasen/shotgun
	fire_sound = 'sound/weapons/laser4.ogg'
	pellets = 6 //now actually working like an eshotgun, and not a shitty bursting egun
	variance = 35
	e_cost = 1428
	select_name = "kill"

/obj/item/ammo_casing/energy/disabler/scatter/shotgun/nanotrasen
	projectile_type = /obj/projectile/beam/disabler/nanotrasen/shotgun
	select_name = "disable"
	pellets = 6
	variance = 35
	e_cost = 1428

/obj/item/ammo_casing/energy/disabler/smg
	projectile_type = /obj/projectile/beam/disabler/nanotrasen/weak
	e_cost = 300

// Тепер етар использует данный снаряд
/obj/item/ammo_casing/energy/laser/smg
	projectile_type = /obj/projectile/beam/laser/nanotrasen/weak
	e_cost = 396 //cheaper to fire but worse projectiles as stated above

/obj/item/ammo_casing/energy/laser/sharplite/smg
	projectile_type = /obj/projectile/beam/weak/sharplite
	e_cost = 396 //25 shots with a normal power cell, 50 with an upgraded

//Ammo casings

/obj/item/ammo_casing/energy/laser/nanotrasen
	projectile_type = /obj/projectile/beam/laser/nanotrasen
	select_name = "kill"
	e_cost = 500
	delay = 0.3 SECONDS //eoehoma type speed

/obj/item/ammo_casing/energy/disabler/nanotrasen
	projectile_type = /obj/projectile/beam/disabler/nanotrasen
	select_name  = "disable"
	e_cost = 500
	delay = 0.3 SECONDS

/obj/item/ammo_casing/energy/laser/nanotrasen/less
	e_cost = 666

/obj/item/ammo_casing/energy/laser/nanotrasen/hos
	projectile_type = /obj/projectile/beam/laser/nanotrasen/hos

/obj/item/ammo_casing/energy/laser/nanotrasen/dmr
	projectile_type = /obj/projectile/beam/laser/nanotrasen/dmr
	fire_sound = 'sound/weapons/laser4.ogg'
	select_name = "kill"
	e_cost = 1000
	delay = 0.7 SECONDS

/obj/item/ammo_casing/energy/electrode/nanotrasen
	projectile_type = /obj/projectile/energy/electrode/nanotrasen
	select_name = "stun"
	e_cost = 5000

/obj/item/ammo_casing/energy/disabler/assault/nanotrasen
	projectile_type = /obj/projectile/beam/disabler/nanotrasen/assault
	fire_sound = 'sound/weapons/pulse2.ogg'
	delay = 2
	e_cost = 500

/obj/item/ammo_casing/energy/laser/assault/nanotrasen
	projectile_type = /obj/projectile/beam/laser/nanotrasen/assault
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	delay = 2
	e_cost = 500 //gives hades 5 more shots to balance out the standart power cell

/obj/item/ammo_casing/energy/laser/accelerator/nanotrasen
	projectile_type = /obj/projectile/beam/laser/nanotrasen/sniper
	select_name = "kill"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	delay = 1 SECONDS
	e_cost = 5000

/obj/item/ammo_casing/energy/laser/nanotrasen/mini
	fire_sound = 'sound/weapons/gun/laser/sharplite-fire_light.ogg'
	projectile_type = /obj/projectile/beam/laser/nanotrasen/weak/mini
	delay = 0.2 SECONDS
	e_cost = 333

/obj/item/ammo_casing/energy/disabler/nanotrasen/mini
	projectile_type = /obj/projectile/beam/disabler/nanotrasen/weak/mini
	delay = 0.2 SECONDS
	e_cost = 333

/obj/item/ammo_casing/energy/laser/antique
	fire_sound = 'sound/weapons/laser.ogg'
	projectile_type = /obj/projectile/beam/laser/nanotrasen/hellfire

// Баланс Ионочек
/obj/item/ammo_casing/energy/ion
	delay = 10

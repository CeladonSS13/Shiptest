// MARK: AMMO CASINGS

/obj/item/ammo_casing/energy/laser/shotgun/warra
	projectile_type = /obj/projectile/beam/laser/warra/shotgun
	fire_sound = 'sound/weapons/laser4.ogg'
	pellets = 6 //now actually working like an eshotgun, and not a shitty bursting egun
	variance = 35
	e_cost = 1428
	select_name = "kill"

/obj/item/ammo_casing/energy/disabler/scatter/shotgun/warra
	projectile_type = /obj/projectile/beam/disabler/warra/shotgun
	select_name = "disable"
	pellets = 6
	variance = 35
	e_cost = 1428

/obj/item/ammo_casing/energy/disabler/smg
	projectile_type = /obj/projectile/beam/disabler/warra/weak
	e_cost = 300

/obj/item/ammo_casing/energy/disabler/smg/ap
	projectile_type = /obj/projectile/beam/disabler/warra/weak/ap
	select_name = "disable"
	delay = 0.1 SECONDS

// Тепер етар использует данный снаряд
/obj/item/ammo_casing/energy/laser/smg
	projectile_type = /obj/projectile/beam/laser/warra/weak
	e_cost = 396 //cheaper to fire but worse projectiles as stated above

/obj/item/ammo_casing/energy/laser/smg/ap
	projectile_type = /obj/projectile/beam/laser/warra/weak/ap
	select_name = "kill"
	delay = 0.1 SECONDS

/obj/item/ammo_casing/energy/laser/sharplite/smg
	projectile_type = /obj/projectile/beam/weak/sharplite
	e_cost = 396 //25 shots with a normal power cell, 50 with an upgraded

//Ammo casings

/obj/item/ammo_casing/energy/laser/warra
	projectile_type = /obj/projectile/beam/laser/warra
	select_name = "kill"
	e_cost = 500
	delay = 0.3 SECONDS //eoehoma type speed

/obj/item/ammo_casing/energy/disabler/warra
	projectile_type = /obj/projectile/beam/disabler/warra
	select_name  = "disable"
	e_cost = 500
	delay = 0.3 SECONDS

/obj/item/ammo_casing/energy/laser/warra/less
	e_cost = 666

/obj/item/ammo_casing/energy/laser/warra/hos
	projectile_type = /obj/projectile/beam/laser/warra/hos

/obj/item/ammo_casing/energy/laser/warra/dmr
	projectile_type = /obj/projectile/beam/laser/warra/dmr
	select_name = "kill"
	e_cost = 1000
	delay = 0.7 SECONDS

/obj/item/ammo_casing/energy/electrode/warra
	projectile_type = /obj/projectile/energy/electrode/warra
	select_name = "stun"
	e_cost = 5000

/obj/item/ammo_casing/energy/disabler/assault/warra
	projectile_type = /obj/projectile/beam/disabler/warra/assault
	fire_sound = 'sound/weapons/pulse2.ogg'
	delay = 2
	e_cost = 500

/obj/item/ammo_casing/energy/laser/assault/warra
	projectile_type = /obj/projectile/beam/laser/warra/assault
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	delay = 2
	e_cost = 500 //gives hades 5 more shots to balance out the standart power cell

/obj/item/ammo_casing/energy/laser/assault/warra/emg
	projectile_type = /obj/projectile/beam/laser/warra/assault
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	delay = 0.15 SECONDS
	e_cost = 714

/obj/item/ammo_casing/energy/laser/accelerator/warra
	projectile_type = /obj/projectile/beam/laser/warra/sniper
	select_name = "kill"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	delay = 1 SECONDS
	e_cost = 5000

/obj/item/ammo_casing/energy/laser/shotgun/warra/burst
	projectile_type = /obj/projectile/beam/laser/warra/shotgun
	pellets = 3
	variance = 30
	e_cost = 1000

/obj/item/ammo_casing/energy/laser/warra/mini
	fire_sound = 'sound/weapons/gun/laser/sharplite-fire_light.ogg'
	projectile_type = /obj/projectile/beam/laser/warra/weak/mini
	delay = 0.2 SECONDS

/obj/item/ammo_casing/energy/disabler/warra/mini
	projectile_type = /obj/projectile/beam/disabler/warra/weak/mini
	delay = 0.2 SECONDS

/obj/item/ammo_casing/energy/laser/antique
	fire_sound = 'sound/weapons/laser.ogg'
	projectile_type = /obj/projectile/beam/laser/warra/hellfire

// Баланс Ионочек
/obj/item/ammo_casing/energy/ion
	delay = 10

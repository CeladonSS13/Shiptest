// MARK: REBALANCE

////////////
//IOT egun
////////////

//Ammo Casings

/obj/item/ammo_casing/energy/laser/ultima
	projectile_type = /obj/projectile/beam/laser/iot
	fire_sound = 'sound/weapons/laser4.ogg'
	pellets = 6 //now actually working like an eshotgun, and not a shitty bursting egun
	variance = 35
	e_cost = 1428
	select_name = "kill"

/obj/item/ammo_casing/energy/disabler/scatter/ultima
	projectile_type = /obj/projectile/beam/disabler/iot
	select_name = "disable"
	pellets = 6
	variance = 35
	e_cost = 1428

////////////
//etar SMG egun
////////////

//Ammo casings

/obj/item/ammo_casing/energy/disabler/smg
	projectile_type = /obj/projectile/beam/disabler/weak/smg
	e_cost = 300

// Тепер етар использует данный снаряд
/obj/item/ammo_casing/energy/laser/smg
	projectile_type = /obj/projectile/beam/laser/light/smg
	e_cost = 396 //cheaper to fire but worse projectiles as stated above

/obj/item/ammo_casing/energy/laser/sharplite/smg
	projectile_type = /obj/projectile/beam/weak/sharplite
	e_cost = 396 //25 shots with a normal power cell, 50 with an upgraded

//Ammo casings

/obj/item/ammo_casing/energy/disabler/assault
	projectile_type = /obj/projectile/beam/disabler/assault
	fire_sound = 'sound/weapons/pulse2.ogg'
	delay = 2
	e_cost = 500

/obj/item/ammo_casing/energy/laser/assault
	e_cost = 500 //gives hades 5 more shots to balance out the standart power cell

/obj/item/ammo_casing/energy/laser/hos
	e_cost = 500

// Баланс Ионочек
/obj/item/ammo_casing/energy/ion
	delay = 10

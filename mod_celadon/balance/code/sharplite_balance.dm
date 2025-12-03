////////////
//IOT egun
////////////

//Iot Projectiles

/obj/projectile/beam/disabler/iot
	icon_state = "blue_laser"
	damage = 15
	range = 15

/obj/projectile/beam/laser/iot
	icon_state = "red_laser"
	damage = 15
	armour_penetration = -10
	range = 15

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
	pellets = 6
	variance = 35
	e_cost = 1428

////////////
//etar SMG egun
////////////
// Здесь были изменения етара. Я их перенёс в
//etar-smg projectiles

/obj/projectile/beam/disabler/weak/smg
	speed = 0.5
	armour_penetration = -15
	range = 40

/obj/projectile/beam/laser/light/smg //makes the gun not too op like it was, but at the same time quite useful
	speed = 0.5 //actual smg speed
	armour_penetration = -15

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

////////////
//NT-SL HADES egun
////////////

// Меняет баланс Хейдеса
// Это трогает ещё эохому e40_laser_secondary

//HADES projectiles

/obj/projectile/beam/disabler/assault
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "heavylaser_blue"
	speed = 0.7 // 0.8 изначально у оффов
	damage = 25
	armour_penetration = 20

/obj/projectile/beam/laser/assault
	speed = 0.7 //makes the ASSAULT lasers go faster to make them not shit
	// 0.8 изначально у оффов.
	// armour_penetration = 20 // У оффов уже изменено до 20

//Ammo casings

/obj/item/ammo_casing/energy/disabler/assault
	projectile_type = /obj/projectile/beam/disabler/assault
	fire_sound = 'sound/weapons/pulse2.ogg'
	delay = 2
	e_cost = 500

/obj/item/ammo_casing/energy/laser/assault
	e_cost = 500 //gives hades 5 more shots to balance out the standart power cell

// Здесь были изменения Хейдеса. Искать его в mod_celadon\return_egun\code\e_gun.dm

//NT ballistics relore - MORE Vigilitas Interstellar!
/*
	name = "VI Commander"
	desc = "A service pistol produced as Vigilitas Interstellar's standard sidearm. Has a reputation for being easy to use, due to its light recoil and high magazine capacity. Chambered in 9x18mm."
	manufacturer = MANUFACTURER_VIGILITAS
	desc = "A modified version of the VI Commander, issued as standard to Inteq Risk Management Group personnel. Features the same excellent handling and high magazine capacity as the original. Chambered in 9x18mm."
*/

/*
/obj/item/gun/ballistic/automatic/smg/vector
	desc = "A police carbine based on an old design originating from earth, Solar Federation. Modified by Vigilitas Interstellar and used as a common security SMG. Chambered in 9x18mm."
	manufacturer = MANUFACTURER_VIGILITAS

/obj/item/gun/ballistic/automatic/smg/skm_carbine/saber
	name = "\improper VI Saber SMG"
	desc = "A full-auto 9x18mm submachine gun, designated 'VI SABR'. Has a threaded barrel for suppressors and a folding stock."
	manufacturer = MANUFACTURER_VIGILITAS
*/
//Honorable mentions

/obj/projectile/beam/disabler/heavylaser
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "heavylaser_blue"
	damage = 40

/obj/projectile/beam/disabler/heavylaser/sharplite //NT-SL turrets
	speed = 0.4

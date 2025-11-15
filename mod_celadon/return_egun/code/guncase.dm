/* VI */

/obj/item/storage/guncase/pistol/commander_old
	gun_type = /obj/item/gun/ballistic/automatic/pistol/commander
	mag_type = /obj/item/ammo_box/magazine/co9mm

/obj/item/storage/guncase/vector_old
	gun_type = /obj/item/gun/ballistic/automatic/smg/vector
	mag_type = /obj/item/ammo_box/magazine/smgm9mm

/obj/item/storage/guncase/cycler_old
	gun_type = /obj/item/gun/ballistic/shotgun/automatic/dual_tube

/* Sharplite */

/obj/item/storage/guncase/pistol/miniegun_old
	gun_type = /obj/item/gun/energy/e_gun/e_old/mini
	mag_type = /obj/item/stock_parts/cell/gun/mini

/obj/item/storage/guncase/energy/laser_old
	gun_type = /obj/item/gun/energy/laser

/obj/item/storage/guncase/energy/egun_old
	gun_type = /obj/item/gun/energy/e_gun/e_old

/obj/item/storage/guncase/energy/ultima_old
	gun_type = /obj/item/gun/energy/e_gun/e_old/iot

/obj/item/storage/guncase/energy/etar_old
	gun_type = /obj/item/gun/energy/e_gun/e_old/smg

/obj/item/storage/guncase/hades_old
	gun_type = /obj/item/gun/energy/e_gun/e_old/hades
	mag_type = /obj/item/stock_parts/cell/gun/upgraded

/* Old NT */

/obj/item/storage/guncase/wt550_old
	gun_type = /obj/item/gun/ballistic/automatic/smg/wt550

/obj/item/storage/guncase/gauss_old
	gun_type = /obj/item/gun/ballistic/automatic/powered/gauss
	mag_type = /obj/item/ammo_box/magazine/gauss

/obj/item/storage/guncase/saber_old
	gun_type = /obj/item/gun/ballistic/automatic/smg/skm_carbine/saber
	mag_type = /obj/item/ammo_box/magazine/smgm9mm

/obj/item/storage/guncase/gauss
/obj/item/storage/guncase/gauss/PopulateContents()
	new /obj/item/gun/ballistic/automatic/powered/gauss/no_mag(src)
	new /obj/item/ammo_box/magazine/gar/empty(src)
	new /obj/item/ammo_box/magazine/gar/empty(src)

/* Inteq */

/obj/item/storage/guncase/commissioner_old
	gun_type = /obj/item/gun/ballistic/automatic/pistol/commander/inteq


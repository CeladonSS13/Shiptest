// Дефайн отвечающий за создание датума с балистическим оружием без магазина
NO_MAG_GUN_HELPER(automatic/powered/gauss/gar)
NO_MAG_GUN_HELPER(automatic/powered/gauss/gar/suns)
NO_MAG_GUN_HELPER(automatic/powered/gauss)
NO_MAG_GUN_HELPER(automatic/smg/skm_carbine/inteq)
NO_MAG_GUN_HELPER(automatic/smg/skm_carbine/saber)
NO_MAG_GUN_HELPER(automatic/pistol/solgov)
NO_MAG_GUN_HELPER(automatic/smg/vector)
NO_MAG_GUN_HELPER(automatic/assault/skm/inteq)
NO_MAG_GUN_HELPER(automatic/marksman/f4/inteq)

// Создаём кучу ганкейсов, чтобы заполнить ими карго

//Solfed guncases

/obj/item/storage/guncase/gauss
/obj/item/storage/guncase/gauss/PopulateContents()
	new /obj/item/gun/ballistic/automatic/powered/gauss/gar/no_mag(src)
	new /obj/item/ammo_box/magazine/gar/empty(src)
	new /obj/item/ammo_box/magazine/gar/empty(src)

/obj/item/ammo_box/magazine/gar/empty
	start_empty = TRUE

/obj/item/storage/guncase/automatic/powered/gauss
/obj/item/storage/guncase/automatic/powered/gauss/PopulateContents()
	new /obj/item/gun/ballistic/automatic/powered/gauss/no_mag(src)
	new /obj/item/ammo_box/magazine/gauss/empty(src)
	new /obj/item/ammo_box/magazine/gauss/empty(src)

/obj/item/ammo_box/magazine/gauss/empty
	start_empty = TRUE

/obj/item/storage/guncase/pistole_c
/obj/item/storage/guncase/pistole_c/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/solgov/no_mag(src)
	new /obj/item/ammo_box/magazine/pistol556mm/empty(src)
	new /obj/item/ammo_box/magazine/pistol556mm/empty(src)

/obj/item/ammo_box/magazine/pistol556mm/empty
	start_empty = TRUE

/obj/item/storage/guncase/vector
/obj/item/storage/guncase/vector/PopulateContents()
	new /obj/item/gun/ballistic/automatic/smg/vector/no_mag(src)
	new /obj/item/ammo_box/magazine/smgm9mm/empty(src)
	new /obj/item/ammo_box/magazine/smgm9mm/empty(src)

//InteQ guncases

/obj/item/storage/guncase/bulldog/inteq
/obj/item/storage/guncase/bulldog/inteq/PopulateContents()
	new /obj/item/gun/ballistic/shotgun/automatic/bulldog/inteq/no_mag(src)
	new /obj/item/ammo_box/magazine/m12g_bulldog/empty(src)
	new /obj/item/ammo_box/magazine/m12g_bulldog/empty(src)

/obj/item/storage/guncase/skm_carabine
/obj/item/storage/guncase/skm_carabine/PopulateContents()
	new /obj/item/gun/ballistic/automatic/smg/skm_carbine/inteq/no_mag(src)
	new /obj/item/ammo_box/magazine/smgm10mm/empty(src)
	new /obj/item/ammo_box/magazine/smgm10mm/empty(src)

/obj/item/ammo_box/magazine/smgm10mm/empty
	start_empty = TRUE

/obj/item/storage/guncase/commander/inteq
/obj/item/storage/guncase/commander/inteq/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/commander/inteq/no_mag(src)
	new /obj/item/ammo_box/magazine/co9mm/empty(src)
	new /obj/item/ammo_box/magazine/co9mm/empty(src)

/obj/item/storage/guncase/horizonx/inteq
/obj/item/storage/guncase/horizonx/inteq/PopulateContents()
	new /obj/item/gun/ballistic/revolver/horizonx(src)
	new /obj/item/ammo_box/magazine/f4_308/empty(src)
	new /obj/item/ammo_box/magazine/f4_308/empty(src)

/obj/item/storage/guncase/f4_308/inteq
/obj/item/storage/guncase/f4_308/inteq/PopulateContents()
	new /obj/item/gun/ballistic/automatic/marksman/f4/inteq/no_mag(src)
	new /obj/item/ammo_box/magazine/f4_308/empty(src)
	new /obj/item/ammo_box/magazine/f4_308/empty(src)

/obj/item/ammo_box/magazine/f4_308/empty
	start_empty = TRUE

/obj/item/storage/guncase/skm44_inteq
/obj/item/storage/guncase/skm44_inteq/PopulateContents()
	new /obj/item/gun/ballistic/automatic/assault/skm/inteq/no_mag(src)
	new /obj/item/ammo_box/magazine/skm_762_40/empty(src)
	new /obj/item/ammo_box/magazine/skm_762_40/empty(src)

/obj/item/ammo_box/magazine/skm_762_40/empty
	start_empty = TRUE

//Syndicate guncases

/obj/item/storage/guncase/bulldog
/obj/item/storage/guncase/bulldog/PopulateContents()
	new /obj/item/gun/ballistic/shotgun/automatic/bulldog/no_mag(src)
	new /obj/item/ammo_box/magazine/m12g_bulldog/empty(src)
	new /obj/item/ammo_box/magazine/m12g_bulldog/empty(src)

/obj/item/ammo_box/magazine/m12g_bulldog/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/m50/empty
	start_empty = TRUE

/obj/item/storage/guncase/gauss/suns
/obj/item/storage/guncase/gauss/suns/PopulateContents()
	new /obj/item/gun/ballistic/automatic/powered/gauss/gar/suns/no_mag(src)
	new /obj/item/ammo_box/magazine/gar/empty(src)
	new /obj/item/ammo_box/magazine/gar/empty(src)

/obj/item/storage/guncase/hydra
/obj/item/storage/guncase/hydra/PopulateContents()
	new /obj/item/gun/ballistic/automatic/assault/hydra/no_mag(src)
	new /obj/item/ammo_box/magazine/m556_42_hydra/empty(src)
	new /obj/item/ammo_box/magazine/m556_42_hydra/empty(src)

/obj/item/ammo_box/magazine/m556_42_hydra/empty
	start_empty = TRUE

/obj/item/storage/guncase/syndicate/sidewinder
/obj/item/storage/guncase/syndicate/sidewinder/PopulateContents()
	new /obj/item/gun/ballistic/automatic/smg/sidewinder/no_mag(src)
	new /obj/item/ammo_box/magazine/m57_39_sidewinder/empty(src)
	new /obj/item/ammo_box/magazine/m57_39_sidewinder/empty(src)

/obj/item/ammo_box/magazine/m57_39_sidewinder/empty
	start_empty = TRUE

/obj/item/storage/guncase/syndicate/cobra
/obj/item/storage/guncase/syndicate/cobra/PopulateContents()
	new /obj/item/gun/ballistic/automatic/smg/cobra/no_mag(src)
	new /obj/item/ammo_box/magazine/m45_cobra/empty(src)
	new /obj/item/ammo_box/magazine/m45_cobra/empty(src)

//Nanotrasen guncases

/obj/item/storage/guncase/etar_smg
/obj/item/storage/guncase/etar_smg/PopulateContents()
	new /obj/item/gun/energy/e_gun/smg(src)
	new /obj/item/stock_parts/cell/gun/empty(src)

/obj/item/storage/guncase/hades
/obj/item/storage/guncase/hades/PopulateContents()
	new /obj/item/gun/energy/e_gun/hades(src)
	new /obj/item/stock_parts/cell/gun/empty(src)

/obj/item/storage/guncase/egun
/obj/item/storage/guncase/egun/PopulateContents()
	new /obj/item/gun/energy/e_gun(src)
	new /obj/item/stock_parts/cell/gun/empty(src)

/obj/item/storage/guncase/miniegun
/obj/item/storage/guncase/miniegun/PopulateContents()
	new /obj/item/gun/energy/e_gun/mini(src)
	new /obj/item/stock_parts/cell/gun/mini/empty(src)

/obj/item/storage/guncase/iot
/obj/item/storage/guncase/iot/PopulateContents()
	new /obj/item/gun/energy/e_gun/iot(src)
	new /obj/item/stock_parts/cell/gun/empty(src)

/obj/item/storage/guncase/ion_carbine
/obj/item/storage/guncase/ion_carbine/PopulateContents()
	new /obj/item/gun/energy/ionrifle/carbine(src)
	new /obj/item/stock_parts/cell/gun/empty(src)

/obj/item/storage/guncase/heavylaser
/obj/item/storage/guncase/heavylaser/PopulateContents()
	new /obj/item/gun/energy/lasercannon(src)
	new /obj/item/stock_parts/cell/gun/large/empty(src)

/obj/item/storage/guncase/sabersmg
/obj/item/storage/guncase/sabersmg/PopulateContents()
	new /obj/item/gun/ballistic/automatic/smg/skm_carbine/saber/no_mag(src)
	new /obj/item/ammo_box/magazine/smgm9mm/empty(src)
	new /obj/item/ammo_box/magazine/smgm9mm/empty(src)

/obj/item/ammo_box/magazine/smgm9mm/empty
	start_empty = TRUE

/obj/item/storage/guncase/cryogelida
/obj/item/storage/guncase/cryogelida/PopulateContents()
	new /obj/item/gun/energy/e_gun/plasmapistol_cryo(src)
	new /obj/item/stock_parts/cell/gun/empty(src)

/obj/item/storage/guncase/pyrogelida
/obj/item/storage/guncase/pyrogelida/PopulateContents()
	new /obj/item/gun/energy/e_gun/plasmapistol_fire(src)
	new /obj/item/stock_parts/cell/gun/empty(src)

/obj/item/storage/guncase/g36/inteq
/obj/item/storage/guncase/g36/inteq/PopulateContents()
	new /obj/item/gun/ballistic/automatic/assault/g36/inteq/no_mag(src)
	new /obj/item/ammo_box/magazine/g36/empty(src)
	new /obj/item/ammo_box/magazine/g36/empty(src)

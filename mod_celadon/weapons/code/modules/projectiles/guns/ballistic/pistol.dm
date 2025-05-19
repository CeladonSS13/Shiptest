/obj/item/gun/ballistic/automatic/pistol/usp45
	name = "\improper USP .45"
	desc = "USP, a really dark sidearm mostly used by syndicate's special agents. Feel like a secret agent! Chambered in .45."
	icon = 'mod_celadon/_storge_icons/icons/guns/usp.dmi'
	icon_state = "usp"
	manufacturer = MANUFACTURER_SCARBOROUGH
	mag_display = TRUE
	show_magazine_on_sprite = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo_type = /obj/item/ammo_box/magazine/usp45_standart
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/usp45_standart,
	)
	fire_sound = 'mod_celadon/_storge_sounds/sound/gun/shot_usp45.wav'
	rack_sound = 'sound/weapons/gun/pistol/candor_cocked.ogg' //На будущее заменить
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg' //На будущее заменить
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg' //На будущее заменить
	load_sound = 'sound/weapons/gun/pistol/candor_reload.ogg' //На будущее заменить
	load_empty_sound = 'sound/weapons/gun/pistol/candor_reload.ogg' //На будущее заменить
	eject_sound = 'sound/weapons/gun/pistol/candor_unload.ogg' //На будущее заменить
	eject_empty_sound = 'sound/weapons/gun/pistol/candor_unload.ogg' //На будущее заменить
	recoil = -2
NO_MAG_GUN_HELPER(automatic/pistol/usp45)
/obj/item/gun/ballistic/automatic/pistol/usp45/Initialize()
	return ..()

// /obj/item/gun/ballistic/automatic/pistol/usp45/no_mag
// 	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/glock
	name = "\improper Glock 17"
	desc = "A really old SolFed 9x18mm pistol. Still used by some solarian police forces. It is also popular as a civilian firearm."
	icon = 'mod_celadon/_storge_icons/icons/guns/glock.dmi'
	icon_state = "glock"
	manufacturer = MANUFACTURER_SOLARARMORIES
	mag_display = TRUE
	show_magazine_on_sprite = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo_type = /obj/item/ammo_box/magazine/glock_standart
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/glock_standart,
	)
	fire_sound = 'mod_celadon/_storge_sounds/sound/gun/shot_glock.wav'
	load_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'//На будущее заменить
	load_empty_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'//На будущее заменить
	eject_sound = 'sound/weapons/gun/pistol/mag_release.ogg'//На будущее заменить
	eject_empty_sound = 'sound/weapons/gun/pistol/mag_release.ogg'//На будущее заменить
NO_MAG_GUN_HELPER(automatic/pistol/glock)
// /obj/item/gun/ballistic/automatic/pistol/glock/no_mag
// 	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/solgov // - Оффы не завезли отображение в руках для этого пистолета, потому фиксим проблему так.
	icon_state = "pistole-c"
	icon = 'mod_celadon/_storge_icons/icons/guns/pistols.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/guns/guns_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/guns/guns_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/guns/back.dmi'

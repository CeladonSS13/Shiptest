/obj/item/ammo_box/shuffler
	name = "ammo shuffler"
	desc = "Default ammo shuffler"

	var/shuffle_sound = 'sound/weapons/gun/shotgun/insert_shell.ogg'

	shuffler = TRUE

/obj/item/ammo_box/shuffler/unique_action(mob/living/user)
	stored_ammo = shuffle(stored_ammo)
	playsound(src, shuffle_sound, 50, TRUE)
	user.visible_message(span_notice("[user] shuffles bullets in [src]."), \
						span_notice("You shuffle bullets in [src]."), \
						span_notice("You hear shuffling sound."))

/obj/item/ammo_box/shuffler/examine(mob/user)
	. = ..()
	. += "You can shuffle [src] by pressing the <b>unique action</b> key. By default, this is <b>space</b>"

/obj/item/ammo_box/shuffler/a12g
	name = "buckshot shuffler"
	desc = "Buckshot magazine with shuffle function. Don't forget your release of liability."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	base_icon_state = "buckshot_shuffler"
	icon_state = "buckshot_shuffler-0"
	caliber = "12ga"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 8
	start_empty = TRUE
	multiple_sprites = AMMO_BOX_PER_BULLET

/obj/item/ammo_box/shuffler/a12g/examine(mob/user)
	. = ..()
	. += "Don't load blanks for roulette. They're painful. Load spent shots"

/datum/design/a12g_shuffler
	name = "Buckshot Shuffler"
	id = "buckshot_shuffler"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/ammo_box/shuffler/a12g
	category = list("initial", "Security")

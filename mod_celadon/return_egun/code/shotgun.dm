//Dual Feed Shotgun

/obj/item/gun/ballistic/shotgun/automatic/dual_tube
	name = "cycler shotgun"
	desc = "An advanced shotgun with two separate magazine tubes, allowing you to quickly toggle between ammo types."

	icon = 'mod_celadon/_storage_icons/icons/items/weapons/48x32_old.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/lefthand_old.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/in_hands/righthand_old.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/overlay/onmob_old.dmi'

	icon_state = "cycler"
	item_state = "shotgun_combat"
	inhand_x_dimension = 64
	inhand_y_dimension = 64

	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/tube
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/tube,
	)
	w_class = WEIGHT_CLASS_BULKY
	var/toggled = FALSE
	var/obj/item/ammo_box/magazine/internal/shot/alternate_magazine
	actions_types = list(/datum/action/item_action/toggle_tube)

	semi_auto = TRUE
	casing_ejector = TRUE

	refused_attachments = list(/obj/item/attachment/gun)

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/secondary_action(user)
	toggle_tube(user)

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/examine(mob/user)
	. = ..()
	. += span_notice("Tube [toggled ? "B" : "A"] is currently loaded.")
	. += "You can change the [src]'s tube by pressing the <b>secondary action</b> key. By default, this is <b>Shift + Space</b>"

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/Initialize(mapload, spawn_empty)
	. = ..()
	if (!alternate_magazine)
		alternate_magazine = new default_ammo_type(src, spawn_empty)

/obj/item/gun/ballistic/shotgun/automatic/dual_tube/proc/toggle_tube(mob/living/user)
	var/current_mag = magazine
	var/alt_mag = alternate_magazine
	magazine = alt_mag
	alternate_magazine = current_mag
	toggled = !toggled
	if(toggled)
		to_chat(user, span_notice("You switch to tube B."))
	else
		to_chat(user, span_notice("You switch to tube A."))
	SEND_SIGNAL(src, COMSIG_UPDATE_AMMO_HUD)
	playsound(src, load_sound, load_sound_volume, load_sound_vary)

/datum/action/item_action/toggle_tube
	name = "Toggle Tube"

/datum/action/item_action/toggle_tube/Trigger()
	if(istype(target, /obj/item/gun/ballistic/shotgun/automatic/dual_tube))
		var/obj/item/gun/ballistic/shotgun/automatic/dual_tube/shotty = target
		shotty.toggle_tube(owner)
		return
	..()

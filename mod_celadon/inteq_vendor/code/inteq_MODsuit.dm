#define COMSIG_MOD_SHIELD_DESTROYED "mod_shield_destroyed"

/obj/item/mod/control
	activation_step_time = 1.5 SECONDS

/datum/mod_theme/inteq
	name = "InteQ"
	desc = "This one is made by InteQ."
	default_skin = "inteq"
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 35, "bomb" = 70, "bio" = 100, "rad" = 50, "fire" = 60, "acid" = 90)
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	siemens_coefficient = 0
	slowdown_inactive = 1
	slowdown_active = 0.3
	ui_theme = "inteq"
	allowed_suit_storage = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	skins = list(
		"inteq" = list(
			HELMET_FLAGS = list(
				UNSEALED_LAYER = null,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEEARS|HIDEHAIR|HIDEHORNS,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
			),
			CHESTPLATE_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDETAIL,
			),
			GAUNTLETS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
			BOOTS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
		),
	)

/obj/item/mod/module/shield
	name = "MOD retractable shield module"
	desc = "A module installed into the forearm of the suit, extending into a sturdy shield as needed. \
		This high-end piece of technology repairs damage done to shield, while it's retracted \
		using a tremendous amount of power supplied from MOD's core."
	icon_state = "injector"
	module_type = MODULE_ACTIVE
	complexity = 3
	active_power_cost = MODULE_CHARGE_DRAIN_LOW
	device = /obj/item/shield/riot/mod
	incompatible_modules = list(/obj/item/mod/module/shield)
	cooldown_time = 0.2 SECONDS
	var/start_time = 0
	var/initial_integrity = 0


/obj/item/mod/module/shield/Destroy()
	. = ..()
	UnregisterSignal(device,COMSIG_MOD_SHIELD_DESTROYED)


/obj/item/mod/module/shield/on_activation()
	RegisterSignal(device, COMSIG_MOD_SHIELD_DESTROYED, PROC_REF(on_deactivation))
	playsound(loc, 'sound/weapons/saberon.ogg', 35, TRUE)
	device.atom_integrity = change_integrity(device)
	var/power_to_drain = (device.max_integrity - change_integrity(device)) * 5 //So that we drain 5 power per RESTORED integrity
	drain_power(power_to_drain)
	. = ..()


/obj/item/mod/module/shield/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	playsound(loc, 'sound/weapons/saberoff.ogg', 35, TRUE)
	update_shield()
	UnregisterSignal(device, COMSIG_MOD_SHIELD_DESTROYED)


/obj/item/mod/module/shield/proc/change_integrity(obj/item/shield/riot/mod/shield)
	var/restored_integrity = ((world.time - start_time) * 10) / 10 //So we regenerate 10 integrity per second
	if(shield.atom_integrity + restored_integrity >= shield.max_integrity) //So we don't return an object with 200 integrity with a 100 max
		return shield.max_integrity
	return shield.atom_integrity + restored_integrity


/obj/item/mod/module/shield/proc/update_shield(shield_integrity)
	SIGNAL_HANDLER

	start_time = world.time
	initial_integrity = shield_integrity
	mod.wearer.transferItemToLoc(device, src, TRUE)


/obj/item/shield/riot/mod
	name = "MOD telescopic shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/eshield.dmi'
	icon_state = "teleriot1"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/weapons/eshield_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/weapons/eshield_righthand.dmi'
	custom_materials = null
	slot_flags = null
	force = 3
	w_class = WEIGHT_CLASS_NORMAL
	slowdown = 0.3
	var/shield_break_sound = 'sound/effects/sparks1.ogg'
	var/shield_break_leftover = /obj/effect/particle_effect/sparks
	max_integrity = 350
	broken_shield = FALSE
	braking_sound = 'sound/effects/sparks1.ogg'
	braking_alert = "Shield's down!"
	integrity_failure = -10000 // So it doesn't become broken

/obj/item/shield/riot/mod/emp_act(severity)
	atom_integrity = 1
	SEND_SIGNAL(src, COMSIG_MOD_SHIELD_DESTROYED, atom_integrity)
	. = ..()


/obj/item/shield/riot/mod/atom_destruction()
	SHOULD_CALL_PARENT(FALSE)
	playsound(loc, shield_break_sound, 35)
	new shield_break_leftover(get_turf(src))
	if(isliving(loc))
		loc.balloon_alert(loc, "Shield's down!")
	atom_integrity = 1
	broken = FALSE
	var/shield_integrity = atom_integrity
	SEND_SIGNAL(src, COMSIG_MOD_SHIELD_DESTROYED, shield_integrity)


/obj/item/shield/riot/mod/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/melee/baton))
		if(COOLDOWN_FINISHED(src, baton_bash))
			user.visible_message(span_warning("[user] bashes [src] with [W]!"))
			playsound(src, shield_bash_sound, 50, TRUE)
			COOLDOWN_START(src, baton_bash, 30)


/obj/item/mod/module/shield/inteq
	name = "InteQ MOD retractable shield module"
	desc = "A module installed into the forearm of the suit, extending into a sturdy shield as needed. \
		This high-end piece of technology repairs damage done to shield, while it's retracted \
		using a tremendous amount of power supplied from MOD's core. \
		This InteQ version has a special spot with powerful magnets to support weapons."
	device = /obj/item/shield/riot/mod/inteq
	incompatible_modules = list(/obj/item/mod/module/shield, /obj/item/mod/module/shield/inteq)


/obj/item/shield/riot/mod/inteq
	name = "InteQ MOD telescopic shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage. \
	This particular modification has some powerful magnets for assisting with weapon's recoil."
	recoil_bonus = -15
	spread_bonus = -5


/datum/mod_theme/inteq/elite
	name = "Elite InteQ"
	desc = "This is an elite version of InteQ MOD suit, featuring better overall protection."
	default_skin = "inteqelite"
	armor = list("melee" = 60, "bullet" = 45, "laser" = 50, "energy" = 45, "bomb" = 90, "bio" = 100, "rad" = 50,"fire" = 100, "acid" = 90) //Пока оставляю резисты такими, ибо модули модсьютов нельзя сделать, тем самым их полный потенциал не реализуется.
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	complexity_max = DEFAULT_MAX_COMPLEXITY + 5
	siemens_coefficient = 0
	slowdown_inactive = 1
	slowdown_active = 0.2
	ui_theme = "inteq"
	allowed_suit_storage = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	skins = list(
		"inteqelite" = list(
			HELMET_FLAGS = list(
				UNSEALED_LAYER = null,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEEARS|HIDEHAIR|HIDEHORNS,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
			),
			CHESTPLATE_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT|HIDETAIL,
			),
			GAUNTLETS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
			BOOTS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
		),
	)

/obj/item/mod/control/pre_equipped/inteq
	theme = /datum/mod_theme/inteq
	applied_cell = /obj/item/stock_parts/cell
	initial_modules = list(
		/obj/item/mod/module/storage,
		/obj/item/mod/module/flashlight_inteq,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/shield,
	)

/obj/item/mod/control/pre_equipped/inteq/elite
	theme = /datum/mod_theme/inteq/elite
	applied_cell = /obj/item/stock_parts/cell
	initial_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight_inteq,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/power_kick,
		/obj/item/mod/module/shield/inteq,
	)


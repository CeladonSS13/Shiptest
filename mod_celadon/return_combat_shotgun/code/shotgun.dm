/obj/item/gun/ballistic/shotgun/automatic/combat
	name = "combat shotgun"
	desc = "A semi-automatic shotgun with tactical furniture and six-shell capacity underneath."
	icon_state = "cshotgun"
	item_state = "shotgun_combat"
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	fire_delay = 0.5 SECONDS
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/com
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/com,
	)
	w_class = WEIGHT_CLASS_BULKY
	casing_ejector = TRUE

/obj/item/gun/ballistic/shotgun/automatic/combat/compact
	name = "compact combat shotgun"
	desc = "A compact version of the semi-automatic combat shotgun. For close encounters."
	icon_state = "cshotgunc"
	default_ammo_type = /obj/item/ammo_box/magazine/internal/shot/com/compact
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/internal/shot/com/compact,
	)
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM

/obj/item/ammo_box/magazine/internal/shot/com
	name = "combat shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/shot/com/compact
	name = "compact combat shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 4

/obj/item/gun/ballistic/shotgun/doublebarrel/improvised
	inhand_x_dimension = 64
	inhand_y_dimension = 64

// MARK: Fix Calibers

/obj/item/ammo_box/a858
	caliber = "a858"

/obj/item/ammo_box/vickland_a8_50r
	caliber = "8x50mmR"

/obj/item/ammo_box/a300
	caliber = "a300"

/obj/item/ammo_box/amagpellet_claris
	caliber = "pellet"

/obj/item/ammo_box/magazine/cm40_762_40_box
	caliber = "7.62x40mm"

/obj/item/ammo_box/magazine/rottweiler_308_box
	caliber = ".308"

// FIXES_PHYSICS_AMMO_CASING
/obj/item/ammo_casing/pickup(mob/user)
	. = ..()
	var/datum/component/movable_physics/physics = GetComponent(/datum/component/movable_physics)
	if(physics)
		qdel(physics)

/obj/structure/closet/supplypod/elysiumpod
	style = STYLE_ELYSIUM
	bluespace = TRUE
	explosionSize = list(0,0,0,0)
	delays = list(POD_TRANSIT = 20, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/cargo
	var/pack_data_cooldown = 0  // [CELADON-ADD] - CELADON_FIXES: Cooldown for generating pack data to prevent FPS drops
	/// Area instance that cargo pods are sent to
	var/area/landingzone
	/// The pod type used to deliver orders
	var/obj/structure/closet/supplypod/pod_type = /obj/structure/closet/supplypod/elysiumpod

/obj/structure/closet/supplypod
	icon = 'mod_celadon/_storage_icons/icons/structures/supplypods.dmi'

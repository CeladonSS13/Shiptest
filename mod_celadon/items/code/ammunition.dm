// Part from "code/modules/projectiles/ammunition/_ammunition.dm"

// Overrides proc to add check if ammo_box is a shuffler. Allows shufflers to pick up spent ammo
/obj/item/ammo_casing/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ammo_box))
		var/obj/item/ammo_box/box = I
		if(isturf(loc))
			var/boolets = 0
			for(var/obj/item/ammo_casing/bullet in loc)
				if (box.stored_ammo.len >= box.max_ammo)
					break
				if (bullet.BB || box.shuffler)
					if (box.give_round(bullet, 0))
						boolets++
						// [CELADON-ADD] - CELADON_BALANCE
						playsound(loc, 'sound/weapons/gun/general/mag_bullet_insert.ogg', 60, TRUE)
						break
						// [/CELADON-ADD]
				else
					continue
			if (boolets > 0)
				box.update_appearance()
				to_chat(user, span_notice("You collect [boolets] shell\s. [box] now contains [box.stored_ammo.len] shell\s."))
			else
				to_chat(user, span_warning("You fail to collect anything!"))
	else
		return ..()

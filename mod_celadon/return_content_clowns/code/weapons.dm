//code/game/mecha/equipment/weapons/weapons.dm
/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/banana_mortar
	name = "banana mortar"
	desc = "Equipment for clown exosuits. Launches banana peels."
	icon_state = "mecha_bananamrtr"
	projectile = /obj/item/grown/bananapeel
	fire_sound = 'sound/items/bikehorn.ogg'
	projectiles = 15
	missile_speed = 1.5
	projectile_energy_cost = 100
	equip_cooldown = 20

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/banana_mortar/can_attach(obj/mecha/combat/honker/M)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/mousetrap_mortar
	name = "mousetrap mortar"
	desc = "Equipment for clown exosuits. Launches armed mousetraps."
	icon_state = "mecha_mousetrapmrtr"
	projectile = /obj/item/assembly/mousetrap/armed
	fire_sound = 'sound/items/bikehorn.ogg'
	projectiles = 15
	missile_speed = 1.5
	projectile_energy_cost = 100
	equip_cooldown = 10

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/mousetrap_mortar/can_attach(obj/mecha/combat/honker/M)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/mousetrap_mortar/proj_init(obj/item/assembly/mousetrap/armed/M)
	M.secured = 1


//Classic extending punching glove, but weaponised!
/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/punching_glove
	name = "\improper Oingo Boingo Punch-face"
	desc = "Equipment for clown exosuits. Delivers fun right to your face!"
	icon_state = "mecha_punching_glove"
	energy_drain = 250
	equip_cooldown = 20
	range = MECHA_MELEE|MECHA_RANGED
	missile_range = 5
	projectile = /obj/item/punching_glove
	fire_sound = 'sound/items/bikehorn.ogg'
	projectiles = 10
	projectile_energy_cost = 500
	diags_first = TRUE

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/punching_glove/can_attach(obj/mecha/combat/honker/M)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/punching_glove/action(target)
	. = ..()
	if(.)
		chassis.occupant_message("<font color='red' size='5'>HONK</font>")

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/punching_glove/proj_init(obj/item/punching_glove/PG)
	if(!istype(PG))
		return
	//has to be low sleep or it looks weird, the beam doesn't exist for very long so it's a non-issue
	chassis.Beam(PG, icon_state = "chain", time = missile_range * 20, maxdistance = missile_range + 2)

/obj/item/punching_glove
	name = "punching glove"
	desc = "INCOMING HONKS"
	throwforce = 35
	icon_state = "punching_glove"

/obj/item/punching_glove/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!..())
		if(ismovable(hit_atom))
			var/atom/movable/AM = hit_atom
			AM.safe_throw_at(get_edge_target_turf(AM,get_dir(src, AM)), 7, 2)
		qdel(src)

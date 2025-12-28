// 410х76mm

/obj/projectile/bullet/pellet/a410
	name = "buckshot"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "pellet"
	damage = 17
	armour_penetration = -15

/obj/projectile/bullet/slug/a410
	name = "slug"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "bullet"
	damage = 70
	armour_penetration = -20

/obj/projectile/bullet/flechette/a410
	name = "flechette"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "rubber"
	damage = 50
	armour_penetration = 25

/obj/projectile/bullet/flechette
	///How much damage is subtracted per tile?
	var/tile_dropoff = 1 //Standard of 10% per tile
	///How much stamina damage is subtracted per tile?
	var/tile_dropoff_stamina = 1.5 //As above

	icon_state = "pellet"
	armour_penetration = -35
	speed = 0.5

/obj/projectile/bullet/flechette // для неё нет ammo_casing btw
	name = "12g shotgun flechette"
	damage = 40
	armour_penetration = -10
	speed = 0.5

/obj/projectile/bullet/flechette/Range() //10% loss per tile = max range of 10, generally
	..()
	if(damage > 0)
		damage -= tile_dropoff
	if(stamina > 0)
		stamina -= tile_dropoff_stamina
	if(damage < 0 && stamina < 0)
		qdel(src)

// пры под номером 861 + 1562
/obj/projectile/bullet/pellet
	armour_penetration = -15

/obj/projectile/bullet/pellet/buckshot
	damage = 14
	tile_dropoff = 0.5

/obj/projectile/bullet/pellet/rubbershot
	damage = 2
	stamina = 10
	tile_dropoff_stamina = 1
	armour_penetration = 25

/obj/projectile/bullet/pellet/rubbershot/incapacitate
	armour_penetration = 45

/obj/projectile/bullet/slug
	armour_penetration = 10 // Усиление слагов, ввиду их бесполезности против брони

// SHOTGUN BUCKSHOT
/obj/projectile/bullet/pellet/bof
	name = "bof pellet"
	damage = 8
	var/bof = 17
	armour_penetration = -10
	tile_dropoff = 0.2

/obj/projectile/bullet/pellet/bof/on_hit(atom/target, blocked)
	var/mob/living/T = target
	if((isminingfauna(T)) && (blocked != 100))
		T.apply_damage(bof, BRUTE, null, FALSE)
	return ..()

/obj/projectile/bullet/pellet/bof/Range() //10% loss per tile = max range of 10, generally
	..()
	if(bof > 0)
		bof -= tile_dropoff * 2

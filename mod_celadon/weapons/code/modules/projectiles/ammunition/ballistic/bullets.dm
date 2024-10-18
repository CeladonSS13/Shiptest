/obj/projectile/bullet/a556_39
	name = "5.56x39mm bullet"
	damage = 25
	armour_penetration = 20

/obj/projectile/bullet/flechette
	///How much damage is subtracted per tile?
	var/tile_dropoff = 1 //Standard of 10% per tile
	///How much stamina damage is subtracted per tile?
	var/tile_dropoff_stamina = 1.5 //As above

	icon_state = "pellet"
	armour_penetration = -35
	speed = 0.5

/obj/projectile/bullet/flechette
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

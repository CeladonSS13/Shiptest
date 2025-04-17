/obj/projectile/beam/hivebot_high
	name = "electrical discharge"
	damage = 20
	damage_type = BURN
	jitter = 20
	armour_penetration = 40
	muzzle_type = /obj/effect/projectile/muzzle/stun
	tracer_type = /obj/effect/projectile/tracer/stun
	impact_type = /obj/effect/projectile/impact/stun

/obj/projectile/beam/hivebot_high/harmless
	name = "harmless electrical discharge"
	damage = 0
	damage_type = STAMINA
	jitter = 20

/obj/projectile/beam/hivebot_high/incendiary
	name = "archaic energy welder"
	damage_type = BURN
	damage = 20
	armour_penetration = 15
	irradiate  = 5
	muzzle_type = /obj/effect/projectile/muzzle/laser/blue
	tracer_type = /obj/effect/projectile/tracer/laser/blue
	impact_type = /obj/effect/projectile/impact/laser/blue

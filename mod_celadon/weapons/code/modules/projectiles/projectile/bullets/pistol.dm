//.22lr (Himehabu, Micro Target, Pounder (uwu))

/*
/obj/projectile/bullet/c22lr
	name = ".22LR bullet"
	damage = 20
	armour_penetration = -40
	ricochet_incidence_leeway = 20
	ricochet_chance = 65
	speed = BULLET_SPEED_HANDGUN
	bullet_identifier = "tiny bullet"

/obj/projectile/bullet/c22lr/hp
	name = ".22LR HP bullet"
	damage = 24
	armour_penetration = -50
	ricochet_chance = 0
	speed_mod = BULLET_SPEED_HP_MOD

/obj/projectile/bullet/c22lr/ap
	name = ".22LR armor piercing bullet"
	damage = 18
	armour_penetration = -20
	ricochet_incidence_leeway = 20
	ricochet_chance = 30
	speed_mod = BULLET_SPEED_AP_MOD

/obj/projectile/bullet/c22lr/rubber
	name = ".22LR rubber bullet"
	damage = 4
	stamina = 15
	armour_penetration = -50
	speed_mod = BULLET_SPEED_HV_MOD //do not do this for other rubber bullets. If you do I will come out of the woodwork and bludgeon you to death with this stick i found.
	ricochets_max = 8 //ding ding ding ding
	ricochet_incidence_leeway = 70
	ricochet_chance = 130
	ricochet_decay_damage = 0.8
	bullet_identifier = "tiny rubber bullet"
	*/

// MARK: 9x18mm (Commander, SABR)

/obj/projectile/bullet/c9mm
	damage = 19
	armour_penetration = -15

/obj/projectile/bullet/c9mm/surplus
	name = "9x18mm surplus bullet"
	speed_mod = BULLET_SPEED_SURPLUS_MOD

/obj/projectile/bullet/c9mm/ap
	damage = 18
	armour_penetration = 10

/obj/projectile/bullet/c9mm/hp
	damage = 29
	armour_penetration = -30

/obj/projectile/bullet/c9mm/rubber
	damage = 5
	armour_penetration = -40
	stamina = 30

// MARK: 10x22mm (Ringneck)

/obj/projectile/bullet/c10mm
	damage = 25
	armour_penetration = -15

/obj/projectile/bullet/c10mm/surplus
	damage = 20
	armour_penetration = -10

/obj/projectile/bullet/c10mm/ap
	damage = 23
	armour_penetration = 10

/obj/projectile/bullet/c10mm/hp
	damage = 33
	armour_penetration = -30

/obj/projectile/bullet/c10mm/rubber
	damage = 7
	stamina = 20
	armour_penetration = -30

// MARK: .45 (Candor, C20r)

/obj/projectile/bullet/c45
	damage = 22
	armour_penetration = -15

/obj/projectile/bullet/c45/surplus
	damage = 18
	armour_penetration = -15

/obj/projectile/bullet/c45/ap
	damage = 20
	armour_penetration = 10

/obj/projectile/bullet/c45/hp
	damage = 32
	armour_penetration = -30

/obj/projectile/bullet/c45/rubber
	damage = 7
	stamina = 20
	armour_penetration = -30

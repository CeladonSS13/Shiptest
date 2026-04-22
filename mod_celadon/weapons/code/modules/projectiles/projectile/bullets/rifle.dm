// MARK: 5.56x42mm CLIP (CM82, Hydra variants)

/obj/projectile/bullet/a556_42
	damage = 22
	armour_penetration = 20
	wound_bonus = -40

/obj/projectile/bullet/a556_42/hp
	damage = 37
	armour_penetration = -30

/obj/projectile/bullet/a556_42/ap
	damage = 20
	armour_penetration = 40

/obj/projectile/bullet/a556_42/rubber
	damage = 5
	stamina = 15
	armour_penetration = -20

// MARK: 8x50mmR (Illestren Rifle)

/obj/projectile/bullet/a8_50r
	damage = 40
	armour_penetration = 30

/obj/projectile/bullet/a8_50r/hp
	damage = 50
	armour_penetration = 0

/obj/projectile/bullet/a8_50r/match
	damage = 35
	armour_penetration = 50

/obj/projectile/bullet/a8_50r/trac
	damage = 10
	armour_penetration = 30
	shrapnel_type = /obj/item/shrapnel/bullet/tracker/a8_50r

// MARK: 7.62x40mm CLIP (SKM Rifles)

/obj/projectile/bullet/a762_40
	damage = 28
	armour_penetration = 20

/obj/projectile/bullet/a762_40/hp
	damage = 40
	armour_penetration = -15

/obj/projectile/bullet/a762_40/ap
	damage = 25
	armour_penetration = 50

/obj/projectile/bullet/a762_40/rubber //"rubber"
	damage = 15
	stamina = 20
	armour_penetration = 10

// MARK: .308 WIN (M514 & GAL DMRs)
/obj/projectile/bullet/a308
	name = ".308 bullet"
	damage = 35
	armour_penetration = 40
	speed = BULLET_SPEED_RIFLE


/obj/projectile/bullet/a308/hp
	name = ".308 hollow point bullet"
	damage = 40
	armour_penetration = 30
	speed_mod = BULLET_SPEED_HP_MOD

/obj/projectile/bullet/a308/ap
	name = ".308 armor piercing bullet"
	damage = 32
	armour_penetration = 60
	speed_mod = BULLET_SPEED_AP_MOD

/obj/projectile/bullet/a308/rubber //"rubber"
	name = ".308 rubber bullet"
	damage = 20
	stamina = 40
	armour_penetration = 20
	speed_mod = BULLET_SPEED_RUBBER_MOD
	bullet_identifier = "large rubber bullet"

// MARK: 8x58mm caseless (SG-669)

/obj/projectile/bullet/a858
	name = "8x58mm caseless bullet"
	speed = 0.3
	damage = 45
	armour_penetration = 30

// MARK:.299 Eoehoma Caseless (E-40)

/obj/projectile/bullet/c299
	name = ".299 Eoehoma caseless bullet"
	damage = 20
	armour_penetration = 20
	speed = BULLET_SPEED_RIFLE
	bullet_identifier = "medium bullet"

// ========================================
// MARK: 5.56x45

/obj/projectile/bullet/a556_45
	name = "5.56x45mm bullet"
	damage = 23
	armour_penetration = 15 // Original: armour_penetration = 20, damage = 25

/obj/projectile/bullet/a556_45/a856
	name = "5.56x45mm A856 bullet"
	damage = 38
	armour_penetration = -30 // Original: armour_penetration = 25, damage = 30

/obj/projectile/bullet/a556_45/m903
	name = "5.56x45mm M903 bullet"
	damage = 20
	armour_penetration = 45 // Original: armour_penetration = 40

/obj/projectile/bullet/a556_45/surplus
	name = "5.56x45mm surplus bullet"
	damage = 20
	armour_penetration = 0

// MARK: .308

/obj/projectile/bullet/a308
	name = ".308"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "bullet"
	speed = 0.3
	damage = 30
	armour_penetration = 25 // Original: armour_penetration = 40
	bullet_identifier = "large bullet"
/obj/projectile/bullet/a308/hp
	name = ".308 hollow point bullet"
	speed = 0.3
	damage = 40
	armour_penetration = -5 // Original: armour_penetration = -10, damage = 60

/obj/projectile/bullet/a308/surplus
	name = ".308 surplus bullet"
	speed = 0.3
	damage = 25
	armour_penetration = 0

/obj/projectile/bullet/a308/ap
	name = ".308 armor piercing bullet"
	speed = 0.3
	damage = 25
	armour_penetration = 60 // Original: damage = 28

/obj/projectile/bullet/a308/rubber
	name = ".308 rubber bullet"
	icon_state = "rubber"
	speed = 0.4
	damage = 5
	armour_penetration = -10
	stamina = 38

// MARK: 7.62x54mmR
/obj/projectile/bullet/x762_54
	name = "crude sniper bullet"
	speed = 0.3
	damage = 30
	armour_penetration = 60

// Antifauna bullets
/obj/projectile/bullet/bof
	name = "4.6x30mm BoF"
	damage = 10

/obj/projectile/bullet/bof/on_hit(atom/target, blocked)
	var/mob/living/T = target
	if((isminingfauna(T)) && (blocked != 100))
		T.apply_damage(50, BRUTE, null, FALSE)
	return ..()

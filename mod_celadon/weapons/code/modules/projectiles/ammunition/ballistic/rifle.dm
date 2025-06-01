/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> 5.56x39mm
> 5.56x45mm
> .308
> 7.62x54mmR

MARK: 5.56x39mm (M-90gl Carbine & P-16)
*/

/obj/item/ammo_casing/a556_39
	name = "5.56x39mm CLIP bullet casing"
	desc = "A 5.56x39mm CLIP bullet casing."
	icon_state = "rifle-brass"
	caliber = "5.56x39mm"
	projectile_type = /obj/projectile/bullet/a556_39
	// bullet_per_box = 80

//
// MARK: 5.56x45mm
//

/obj/item/ammo_casing/a556_45
	name = "5.56x45mm bullet casing"
	desc = "A 5.56x45mm bullet casing."
	icon_state = "rifle-brass"
	caliber = "5.56x45mm"
	projectile_type = /obj/projectile/bullet/a556_45
	// bullet_per_box = 80

/obj/item/ammo_casing/a556_45/a856
	name = "5.56mm A856 bullet casing"
	desc = "A 5.56mm bullet casing."
	icon_state = "rifle-brass-incen"
	caliber = "5.56x45mm"
	projectile_type = /obj/projectile/bullet/a556_45/a856
	// bullet_per_box = 80 // Хрен знает зачем это , ставим пока одинаковые значения везде

/obj/item/ammo_casing/a556_45/m903
	name = "5.56mm M903 bullet casing"
	desc = "A 5.56mm bullet casing."
	icon_state = "rifle-brass-ap"
	caliber = "5.56x45mm"
	projectile_type = /obj/projectile/bullet/a556_45/m903
	// bullet_per_box = 80

/obj/item/ammo_casing/a556_45/surplus
	name = "5.56mm surplus bullet casing"
	desc = "A 5.56mm bullet casing."
	icon_state = "rifle-brass-surplus"
	caliber = "5.56x45mm"
	projectile_type = /obj/projectile/bullet/a556_45/surplus
	// bullet_per_box = 80

//
// MARK: .308
//

/obj/item/ammo_casing/a308
	name = ".308 bullet casing"
	desc = "A .308 bullet casing."
	icon_state = "rifle-brass"
	caliber = ".308"
	projectile_type = /obj/projectile/bullet/a308
	// bullet_per_box = 80

/obj/item/ammo_casing/a308/hp
	name = ".308 HP bullet casing"
	desc = "A .308 HP bullet casing."
	icon_state = "rifle-brass-hollow"
	projectile_type = /obj/projectile/bullet/a308/hp
	// bullet_per_box = 80

/obj/item/ammo_casing/a308/surplus
	name = ".308 surplus bullet casing"
	desc = "A .308 surplus bullet casing."
	icon_state = "rifle-brass-surplus"
	projectile_type = /obj/projectile/bullet/a308/surplus
	// bullet_per_box = 80

/obj/item/ammo_casing/a308/ap
	name = ".308 AP bullet casing"
	desc = "A .308 AP bullet casing."
	icon_state = "rifle-brass-ap"
	projectile_type = /obj/projectile/bullet/a308/ap
	// bullet_per_box = 80

/obj/item/ammo_casing/a308/rubber
	name = ".308 rubber bullet casing"
	desc = "A .308 rubber bullet casing."
	icon_state = "rifle-brass-rubber"
	projectile_type = /obj/projectile/bullet/a308/rubber
	// bullet_per_box = 80

//
// MARK: 7.62x54mmR
//

/obj/item/ammo_casing/x762
	name = "7,62x54 Winchester bullet casing"
	desc = "A 7,62x54 Winchester bullet casing."
	icon_state = "big-steel"
	caliber = "7.62x54"
	projectile_type = /obj/projectile/bullet/x762x54
	// bullet_per_box = 80

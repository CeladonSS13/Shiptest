// 410mm (Saiga)
/obj/item/ammo_casing/a410
	name = "410mm buckshot casing"
	desc = "Дробь он же бакшот 8 металлических шаров, сняражённых в патрон, урон большой по целям в малой броне и без брони, при средних и больших показателях брони урон ниже. В коробке 75 пуль."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_bullet.dmi'
	icon_state = "backshot_410"
	caliber = "410x76mm"
	projectile_type = /obj/projectile/bullet/pellet/a410
	pellets = 8
	variance = 25
	// bullet_per_box = 75

/obj/item/ammo_casing/a410/a410_slug
	name = "410mm bullet casing"
	desc = "Жакан - пулевой патрон - slug, повышенный урон по не бронированным целям и немного пониженный по целям в броне. В коробке 65 пуль."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_bullet.dmi'
	icon_state = "slug_410"
	caliber = "410x76mm"
	pellets = 1
	variance = 1
	projectile_type = /obj/projectile/bullet/slug/a410
	// bullet_per_box = 65

/obj/item/ammo_casing/a410/a410_flechette
	name = "410mm bullet casing"
	desc = "Флешшет - дротик с повышенной пробиваемостью из-за своей формы, но меньшим уроном, чем пулевой патрон. В коробке 55 пуль."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_bullet.dmi'
	icon_state = "flechette_410"
	caliber = "410x76mm"
	pellets = 1
	variance = 1
	projectile_type = /obj/projectile/bullet/flechette/a410
	// bullet_per_box = 55

/obj/item/ammo_box/magazine/internal/shot/com
	name = "combat shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 6

/obj/item/ammo_box/magazine/internal/shot/com/compact
	name = "compact combat shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 4

/obj/item/ammo_casing/shotgun/bof
	name = "fauna-hunting buckshot shell"
	desc = "An anti-fauna buckshot shell for exotic hunting."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/bof_bullets.dmi'
	icon_state = "bof"
	pellets = 5
	variance = 20
	custom_materials = list(/datum/material/titanium=4000, /datum/material/plasma=2000, /datum/material/gold=2000)
	projectile_type = /obj/projectile/bullet/pellet/bof

/obj/item/ammo_casing/shotgun/bof/update_icon_state()
	. = ..()
	if(icon_state == "[initial(icon_state)]-empty")
		custom_materials = list(/datum/material/titanium=500)


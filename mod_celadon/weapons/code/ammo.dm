// Antifauna bullets
/obj/projectile/bullet/bof
	name = "4.6x30mm BoF"
	damage = 10

/obj/projectile/bullet/bof/on_hit(atom/target, blocked)
	var/mob/living/T = target
	if((isminingfauna(T)) && (blocked != 100))
		T.apply_damage(50, BRUTE, null, FALSE)
	return ..()

/obj/item/ammo_casing/c46x30mm/bof
	name = "4.6x30mm Bane of Fauna"
	desc = "A 4.6x30mm fauna hunting bullets"
	bullet_skin = "ap"
	projectile_type = /obj/projectile/bullet/bof

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

/obj/item/disk/design_disk/bof_disk/bof_buckshot
	name = "Fauna hunting bullet design disk"
	var/design = /datum/design/bane_of_fauna/bof_buckshot

/obj/item/disk/design_disk/bof_disk/bof_buckshot/Initialize()
	. = ..()
	blueprints[1] = new design

/datum/design/bane_of_fauna/bof_buckshot
	name = "Fauna hunting bullet"
	id = "bof-bullet"
	desc = "A rather odd bullet design that works well against most fauna."
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_casing/shotgun/bof
	materials = list(
		/datum/material/titanium = 4000,
		/datum/material/plasma = 2000,
		/datum/material/gold = 2000,
	)

/obj/item/disk/design_disk/a556_42
	name = "Design Disk 5.56x42mm Ammo"
	design_name = "5.56x42mm Ammo"
	desc = "A design disk containing the pattern for a refill box of standard 5.56x42mm ammo."
	starting_blueprints = (/datum/design/a556_42)

/obj/item/disk/design_disk/a762_40
	name = "Design Disk 7.62x40mm Ammo"
	design_name = "7.62x40mm Ammo"
	desc = "A design disk containing the pattern for a refill box of standard 7.62x40mm ammo."
	starting_blueprints = (/datum/design/a762_40)

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

/obj/item/ammo_box/magazine/m57_39_sidewinder
	icon_state = "sidewinder_mag-30"

/obj/item/ammo_box/magazine/m57_39_sidewinder/update_icon_state()
	. = ..()
	switch(ammo_count())
		if(30)
			icon_state = "[base_icon_state]-30"
		if(24 to 29)
			icon_state = "[base_icon_state]-26"
		if(20 to 23)
			icon_state = "[base_icon_state]-22"
		if(16 to 19)
			icon_state = "[base_icon_state]-18"
		if(12 to 15)
			icon_state = "[base_icon_state]-14"
		if(8 to 11)
			icon_state = "[base_icon_state]-10"
		if(6 to 7)
			icon_state = "[base_icon_state]-6"
		if(1 to 5)
			icon_state = "[base_icon_state]-2"
		if(0)
			icon_state = "[base_icon_state]-0"

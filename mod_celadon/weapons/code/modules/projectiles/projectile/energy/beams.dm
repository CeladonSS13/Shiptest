// MARK: PLASMA PROJECTILES

/obj/projectile/temp/cryo/plasmadisable
	name = "supercooled plasma blast"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ntsl_lasers.dmi'
	icon_state = "plasmaice"
	damage = 25
	armour_penetration = -20
	damage_type = STAMINA
	range = 10
	speed = 0.6
	temperature = 0

/obj/projectile/temp/cryo/plasmadisable/on_hit(atom/target, blocked = FALSE)
	var/turf/targets_turf = target.loc
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(M.bodytemperature > M.get_body_temp_normal() + 10)
			M.adjustBruteLoss((M.bodytemperature - 310) / 5)
			M.bodytemperature = M.get_body_temp_normal()
			to_chat(M, span_userdanger("Your veins feel like they are exploding!"))
			M.reagents.remove_any(50)
			M.force_scream()
			if(M.blood_volume > 0)
				var/amount_to_drain = 40
				M.blood_volume = M.blood_volume - amount_to_drain
			new /obj/effect/decal/cleanable/blood(targets_turf)
		M.adjust_blurriness(5)
		M.adjust_bodytemperature(-20)
		M.adjustFireLoss(3)

/obj/item/ammo_casing/energy/disabler/plasmadisable
	projectile_type = /obj/projectile/temp/cryo/plasmadisable
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	delay = 8
	select_name = "freeze"
	e_cost = 1000 //20 per upgraded cell





/obj/projectile/temp/cryo/plasmalaserweak
	name = "chilly plasma blast"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ntsl_lasers.dmi'
	icon_state = "plasmaice"
	damage = 20
	armour_penetration = -10
	eyeblur = 1
	range = 10
	speed = 0.5
	temperature = 0

/obj/projectile/temp/cryo/plasmalaserweak/on_hit(atom/target, blocked = FALSE)
	var/turf/targets_turf = target.loc
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(M.bodytemperature > M.get_body_temp_normal() + 10)
			M.adjustBruteLoss((M.bodytemperature - 310) / 5)
			M.bodytemperature = M.get_body_temp_normal()
			to_chat(M, span_userdanger("Your veins feel like they are exploding!"))
			M.reagents.remove_any(50)
			M.force_scream()
			if(M.blood_volume > 0)
				var/amount_to_drain = 80
				M.blood_volume = M.blood_volume - amount_to_drain
			new /obj/effect/decal/cleanable/blood(targets_turf)
		M.adjust_blurriness(5)
		M.adjust_bodytemperature(-25)

/obj/item/ammo_casing/energy/laser/plasmalaserweak
	projectile_type = /obj/projectile/temp/cryo/plasmalaserweak
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	delay = 7
	select_name = "frostbite"
	e_cost = 1000 //20 per upgraded cell



/obj/projectile/temp/hot/burn_plasmalaserweak
	name = "hot plasma blast"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ntsl_lasers.dmi'
	icon_state = "plasmafire"
	damage = 20
	armour_penetration = -5
	range = 10
	speed = 0.5
	temperature = 0

/obj/projectile/temp/hot/burn_plasmalaserweak/on_hit(atom/target)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(M.bodytemperature < M.get_body_temp_normal() - 10)
			M.adjustBruteLoss((310 - M.bodytemperature) / 10)
			M.adjustStaminaLoss((310 - M.bodytemperature) / 10)
			M.adjust_blurriness(5)
			M.bodytemperature = M.get_body_temp_normal()
			to_chat(src, span_userdanger("Your flesh feels like it's shrinking!."))
			M.force_scream()


/obj/item/ammo_casing/energy/laser/burn_plasmalaserweak
	projectile_type = /obj/projectile/temp/hot/burn_plasmalaserweak
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	delay = 7
	select_name = "burn"
	e_cost = 1000 //20 per upgraded cell




/obj/projectile/temp/hot/burn_plasmalaser
	name = "superheated plasma blast"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ntsl_lasers.dmi'
	icon_state = "plasmafire"
	damage = 30
	armour_penetration = 0
	range = 10
	speed = 0.5
	temperature = 0


/obj/projectile/temp/hot/burn_plasmalaser/on_hit(atom/target)
	var/turf/targets_turf = target.loc
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(M.bodytemperature < M.get_body_temp_normal() - 10)
			M.adjustBruteLoss((310 - M.bodytemperature) / 10)
			M.adjustStaminaLoss((310 - M.bodytemperature) / 10)
			M.adjust_blurriness(5)
			M.bodytemperature = M.get_body_temp_normal()
			to_chat(src, span_userdanger("Your flesh feels like it's shrinking!."))
			M.force_scream()
		M.adjust_bodytemperature(333)
		M.adjust_fire_stacks(5)
		M.ignite_mob()
	if(!isopenturf(targets_turf))
		return
	targets_turf.ignite_turf(rand(4,11), "red")

/obj/item/ammo_casing/energy/laser/burn_plasmalaser
	projectile_type = /obj/projectile/temp/hot/burn_plasmalaser
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	select_name = "immolate"
	delay = 12
	e_cost = 3333 //6 per upgraded cell


// MARK: LASER PROJECTILES

//Base NT-SL Laser
/obj/projectile/beam/laser/nanotrasen //таким образом еоехома не словит бесплатный бафф + удобнее редачить древний код
	speed = 0.3 //egun buff - просто мувспид с плазмапушек

//Base NT-SL Disabler beam

/obj/projectile/beam/laser/nanotrasen/weak
	damage = 15

/obj/projectile/beam/disabler/nanotrasen
	speed = 0.3

/obj/projectile/beam/disabler/nanotrasen/weak
	damage = 15

//HADES projectiles
// Меняет баланс Хейдеса

/obj/projectile/beam/laser/nanotrasen/assault
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "heavylaser"
	damage = 25
	armour_penetration = 20

/obj/projectile/beam/disabler/nanotrasen/assault
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "heavylaser_blue"
	damage = 25
	armour_penetration = 20

// Здесь были изменения Хейдеса. Искать его в mod_celadon\return_egun\code\e_gun.dm

//Honorable mentions

/obj/projectile/beam/laser/nanotrasen/heavylaser //NT-SL turrets
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "heavylaser"
	damage = 40
	speed = 0.4

/obj/projectile/beam/disabler/nanotrasen/heavylaser
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "heavylaser_blue"
	damage = 40
	speed = 0.4

//Iot Projectiles

/obj/projectile/beam/disabler/nanotrasen/iot
	icon_state = "blue_laser"
	damage = 15
	range = 15
	speed = 0.5 //just to make it a bit more fair

/obj/projectile/beam/laser/nanotrasen/iot
	icon_state = "red_laser"
	damage = 15
	armour_penetration = -10
	range = 15
	speed = 0.5

//etar-smg projectiles

/obj/projectile/beam/disabler/nanotrasen/weak/smg
	armour_penetration = -15
	range = 40

/obj/projectile/beam/laser/nanotrasen/weak/smg //makes the gun not too op like it was, but at the same time quite useful
	armour_penetration = -15

//lascannon projectiles

/obj/projectile/beam/laser/nanotrasen/sniper
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	name = "accelerator laser"
	icon_state = "weaklaser"
	range = 255
	damage = 20
	armour_penetration = 50

/obj/projectile/beam/laser/nanotrasen/sniper/Range()
	..()
	damage += 4
	transform *= 1 + ((damage/4) * 0.2)

//mini egun projectiles

/obj/projectile/beam/laser/nanotrasen/weak/mini
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "weaklaser"
	armour_penetration = 5

/obj/projectile/beam/disabler/nanotrasen/weak/mini
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "weaklaser_blue"
	armour_penetration = 10

//antique lasgun projectiles

/obj/projectile/beam/laser/nanotrasen/hellfire
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "heavylaser"
	damage = 30
	armour_penetration = 40

// MARK: Ion balance

/obj/projectile/ion
	damage = 10
	damage_type = BURN
	nodamage = FALSE

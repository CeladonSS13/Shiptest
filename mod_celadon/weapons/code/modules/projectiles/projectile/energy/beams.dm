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
/obj/projectile/beam/laser/warra //таким образом еоехома не словит бесплатный бафф + удобнее редачить древний код
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "sl_laser"
	speed = 0.3 //egun buff - просто мувспид с плазмапушек

/obj/projectile/beam/laser/warra/weak
	icon_state = "sl_laser_light"
	damage = 15
	armour_penetration = -15

//Base NT-SL Disabler beam

/obj/projectile/beam/disabler/warra
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "sl_disabler"
	speed = 0.3

/obj/projectile/beam/disabler/warra/weak
	icon_state = "sl_disabler_light"
	damage = 18
	armour_penetration = -10

// /obj/item/gun/energy/e_gun/e_old/hos

/obj/projectile/beam/laser/warra/hos
	damage = 20

/obj/projectile/beam/laser/warra/weak
	damage = 15
	armour_penetration = -15

// /obj/item/gun/energy/e_gun/e_old/dmr

/obj/projectile/beam/laser/warra/dmr
	icon_state = "sl_laser_hellfire"
	damage = 35
	armour_penetration = 30

// /obj/item/gun/energy/e_gun/e_old/smg/sunbeam

/obj/projectile/beam/laser/warra/weak/ap //more armorpen, less damage
	damage = 12
	armour_penetration = 10

/obj/projectile/beam/disabler/warra/weak/ap
	damage = 15
	armour_penetration = 20

// /obj/item/gun/energy/e_gun/e_old/hades
// /obj/item/gun/energy/e_gun/e_old/emg

/obj/projectile/beam/laser/warra/assault
	icon_state = "sl_laser_heavy"
	damage = 25
	armour_penetration = 20

/obj/projectile/beam/disabler/warra/assault
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	icon_state = "sl_disabler_heavy"
	damage = 25
	armour_penetration = 20

// /obj/item/gun/energy/e_gun/e_old/hos

/obj/projectile/energy/electrode/warra
	damage = 80 //по сути даже за берст ты навешаешь лишь слоудаун человеку в броне
	range = 8

//Honorable mentions

/obj/projectile/beam/laser/warra/heavylaser //NT-SL turrets
	icon_state = "sl_laser_heavy"
	damage = 40
	speed = 0.4

/obj/projectile/beam/disabler/warra/heavylaser
	icon_state = "sl_disabler_heavy"
	damage = 40
	speed = 0.4

// /obj/item/gun/energy/e_gun/e_old/iot
// /obj/item/gun/energy/e_gun/e_old/iot/blaze

/obj/projectile/beam/disabler/warra/shotgun
	icon_state = "sl_disabler_light"
	damage = 15
	range = 15
	armour_penetration = -10
	speed = 0.5 //just to make it a bit more fair

/obj/projectile/beam/laser/warra/shotgun
	icon_state = "sl_laser_light"
	damage = 15
	armour_penetration = -10
	range = 15
	speed = 0.5

// /obj/item/gun/energy/lasercannon

/obj/projectile/beam/laser/warra/sniper
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	name = "accelerator laser"
	icon_state = "sl_laser_light"
	range = 255
	damage = 10
	armour_penetration = 30
	var/damage_cap = 60

/obj/projectile/beam/laser/warra/sniper/Range()
	..()
	damage += 4
	transform *= 1 + ((damage/4) * 0.2)
	if(damage_cap < damage)
		damage = damage_cap

// /obj/item/gun/energy/e_gun/e_old/mini

/obj/projectile/beam/laser/warra/weak/mini
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	armour_penetration = 5

/obj/projectile/beam/disabler/warra/weak/mini
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/projectiles.dmi'
	armour_penetration = 10

// /obj/item/gun/energy/laser/captain

/obj/projectile/beam/laser/warra/hellfire
	icon_state = "sl_laser_hellfire"
	damage = 30
	armour_penetration = 25

// MARK: Ion balance

/obj/projectile/ion
	damage = 10
	damage_type = BURN
	nodamage = FALSE

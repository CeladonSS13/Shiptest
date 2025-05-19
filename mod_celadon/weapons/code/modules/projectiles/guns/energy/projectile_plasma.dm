/obj/projectile/temp/cryo/plasmadisable
	name = "supercooled plasma blast"
	icon = 'mod_celadon/_storge_icons/icons/guns/ntsl_lasers.dmi'
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
	icon = 'mod_celadon/_storge_icons/icons/guns/ntsl_lasers.dmi'
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
	icon = 'mod_celadon/_storge_icons/icons/guns/ntsl_lasers.dmi'
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
	icon = 'mod_celadon/_storge_icons/icons/guns/ntsl_lasers.dmi'
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
		M.IgniteMob()
	if(!isopenturf(targets_turf))
		return
	targets_turf.ignite_turf(rand(4,11), "red")

/obj/item/ammo_casing/energy/laser/burn_plasmalaser
	projectile_type = /obj/projectile/temp/hot/burn_plasmalaser
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	select_name = "immolate"
	delay = 12
	e_cost = 3333 //6 per upgraded cell

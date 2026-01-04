// Добавляем поддержку крашера ибо прикольно.
// Переопределяет прок. Ктрл клик с расширениями вскода чтобы узнать где
/obj/item/mod/module/magnetic_harness/Initialize(mapload)
	. = ..()
	if(!guns_typecache)
		guns_typecache = typecacheof(list(
			/obj/item/gun/ballistic,
			/obj/item/gun/energy,
			/obj/item/gun/grenadelauncher,
			/obj/item/gun/chem,
			/obj/item/gun/syringe,
			/obj/item/kinetic_crusher,
		))

/obj/item/mod/module/anomaly_locked/antigrav
	active_power_cost = DEFAULT_CHARGE_DRAIN * 4

// MARK: Mirage
///Mirage grenade dispenser - Dispenses grenades that copy the user's appearance.
/obj/item/mod/module/dispenser/mirage
	name = "MOD mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create holographic copies of the user."
	icon_state = "mirage_grenade"
	cooldown_time = 20 SECONDS
	use_power_cost = DEFAULT_CHARGE_DRAIN * 30
	overlay_state_inactive = "module_mirage_grenade"
	dispense_type = /obj/item/grenade/mirage

/obj/item/mod/module/dispenser/mirage/on_use(mob/activator)
	var/obj/item/grenade/mirage/grenade = ..()
	grenade.preprime(mod.wearer)

/obj/item/grenade/mirage
	name = "mirage grenade"
	desc = "A special device that, when activated, produces a small stray of active mesh in form of a grenade that creates a static copy of the user."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/grenade.dmi'
	icon_state = "mirage"
	item_state = "flashbang"
	det_time = 3 SECONDS
	/// Mob that threw the grenade.
	var/mob/living/thrower
	var/spawned_mob = /mob/living/simple_animal/hostile/illusion/mirage
	var/spawn_time = 15 SECONDS

/obj/item/mod/module/dispenser/mirage/moving
	dispense_type = /obj/item/grenade/mirage/moving

/obj/item/grenade/mirage/moving
	name = "mirage grenade"
	desc = "A special device that, when activated, produces a small stray of active mesh in form of a grenade that creates a moving copy of the user."
	spawned_mob = /mob/living/simple_animal/hostile/illusion/escape/mirage

/obj/item/grenade/mirage/preprime(mob/user, delayoverride, msg = TRUE, volume = 60)
	. = ..()
	thrower = user

/obj/item/grenade/mirage/prime()
	. = ..()
	do_sparks(rand(3, 6), FALSE, src)
	if(thrower)
		var/mob/living/simple_animal/hostile/illusion/mirage = new spawned_mob(get_turf(src))
		mirage.Copy_Parent(thrower, spawn_time)
	qdel(src)

/mob/living/simple_animal/hostile/illusion/mirage
	AIStatus = AI_OFF
	density = FALSE

/mob/living/simple_animal/hostile/illusion/escape/mirage
	retreat_distance = 5
	minimum_distance = 5
	density = FALSE

/mob/living/simple_animal/hostile/illusion/escape/mirage/death(gibbed)
	do_sparks(rand(3, 6), FALSE, src)
	return ..()

/mob/living/simple_animal/hostile/illusion/mirage/death(gibbed)
	do_sparks(rand(3, 6), FALSE, src)
	return ..()


// MARK: DASH
/// Новый модуль дэша. По умолчанию есть в вендоре интеков
/obj/item/mod/module/dash
	name = "MOD D.A.S.H. module"
	desc = "Directional Acceleration Surge Hardware module utilizes magnetized self-recoiling hydraulics\
	to rapidly extend and launch MOD operator forward. Hydraulics quickly recoil back with the help of magnets,\
	which allows for quick consequent charges, but the power drain increases with each one due to ever increasing heat."
	module_type = MODULE_ACTIVE
	complexity = 3
	var/charge_distance = 8
	var/charge_power = 400
	var/charging = FALSE
	var/charge_windup = 0.2
	var/charge_ready = TRUE
	var/charge_cooldown = 1.5 SECONDS
	var/consequent_charges_count = 0
	COOLDOWN_DECLARE(mod_charge_cooldown)

/obj/item/mod/module/dash/on_select_use(atom/target)
	. = ..()
	if(!.)
		return
	if(charge_ready)
		charge_ready = FALSE
		addtimer(VARSET_CALLBACK(src, charge_ready, TRUE), charge_cooldown)
		start_charge(target)
	else
		to_chat(mod.wearer,span_danger("D.A.S.H. hydraulics are still recoiling back in place!"))

/obj/item/mod/module/dash/proc/start_charge(atom/target)
	if(consequent_charges_count > 0)
		to_chat(mod.wearer,span_danger("D.A.S.H. hydraulics start to heat up, increasing the power waste!"))
	mod.wearer.Shake(15, 15, 1 SECONDS)
	var/obj/effect/temp_visual/decoy/new_decoy = new /obj/effect/temp_visual/decoy(mod.wearer.loc,mod.wearer)
	animate(new_decoy, alpha = 0, color = "#5a5858", transform = matrix()*2, time = 2)
	addtimer(CALLBACK(src,PROC_REF(handle_charge),target), charge_windup SECONDS, TIMER_STOPPABLE)

	if(COOLDOWN_FINISHED(src, mod_charge_cooldown))
		if(consequent_charges_count > 0)
			consequent_charges_count -= 1
		COOLDOWN_START(src, mod_charge_cooldown,10 SECONDS)
	else
		consequent_charges_count += 1
		COOLDOWN_START(src, mod_charge_cooldown,10 SECONDS)
	addtimer(CALLBACK(src,PROC_REF(handle_power_drain)),10 SECONDS)

/obj/item/mod/module/dash/proc/handle_power_drain()
	if(COOLDOWN_FINISHED(src, mod_charge_cooldown))
		if(consequent_charges_count > 0)
			consequent_charges_count -= 1
			// update_steam_particles()
			playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 10, TRUE, frequency = 0.5)
			if(consequent_charges_count == 0)
				to_chat(mod.wearer,span_danger("D.A.S.H. returns to ambient temperature."))
				//QDEL_NULL(part_hold)
			else
				to_chat(mod.wearer,span_danger("D.A.S.H. radiators unleash a burst of hot gas, reducing the power waste!"))
		else
			return
	addtimer(CALLBACK(src,PROC_REF(handle_power_drain)),10 SECONDS)

/obj/item/mod/module/dash/proc/handle_charge(atom/target)
	new /obj/effect/temp_visual/mook_dust(get_turf(mod.wearer))
	playsound(src, 'sound/effects/gravhit.ogg', 50)

	charging = TRUE
	var/turf/charge_target = get_turf(target)
	if(!charge_target)
		charging = FALSE
		return

	//Handling range restrictions
	if(get_dist(get_turf(mod.wearer),charge_target) > charge_distance)
		var/actual_charge_distance = get_dist(get_turf(mod.wearer),target) - charge_distance
		walk_to(mod.wearer,charge_target,actual_charge_distance,0.7)
	else
		walk_to(mod.wearer,charge_target,0,0.7)

	drain_power(charge_power*consequent_charges_count,TRUE)
	sleep(get_dist(mod.wearer, charge_target) * 0.7)
	charge_end()

/obj/item/mod/module/dash/proc/charge_end()
	walk(mod.wearer,0)
	charging = FALSE

// /obj/item/mod/module/dash/proc/update_steam_particles()
// 	if(!part_hold)
// 		part_hold = new(mod.wearer, particle_to_spawn, PARTICLE_ATTACH_MOB)
// 	//addtimer(CALLBACK(part_hold,PROC_REF(QDEL_NULL)),10 SECONDS)
/*
/obj/item/mod/module/shock_absorber
	name = "MOD shock absorption module"
	desc = "A module that makes the user resistant to the knockdown inflicted by Stun Batons."
	icon_state = "no_baton"
	complexity = 1
	use_power_cost = DEFAULT_CHARGE_DRAIN
	incompatible_modules = list(/obj/item/mod/module/shock_absorber)
	required_slots = list(ITEM_SLOT_BACK|ITEM_SLOT_BELT)

/obj/item/mod/module/shock_absorber/on_part_activation()
	. = ..()
	ADD_TRAIT(mod.wearer, TRAIT_BATON_RESISTANCE, REF(src))
	RegisterSignal(mod.wearer, COMSIG_MOB_BATONED, PROC_REF(mob_batoned))

/obj/item/mod/module/shock_absorber/on_part_deactivation(deleting)
	. = ..()
	REMOVE_TRAIT(mod.wearer, TRAIT_BATON_RESISTANCE, REF(src))
	UnregisterSignal(mod.wearer, COMSIG_MOB_BATONED)

/obj/item/mod/module/shock_absorber/proc/mob_batoned(datum/source)
	SIGNAL_HANDLER
	drain_power(use_power_cost)
	var/datum/effect_system/lightning_spread/sparks = new /datum/effect_system/lightning_spread
	sparks.set_up(number = 5, cardinals_only = TRUE, location = mod.wearer.loc)
	sparks.start()
*/

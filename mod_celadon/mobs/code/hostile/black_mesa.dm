/mob/living/simple_animal/hostile/blackmesa
	var/list/alert_sounds
	var/alert_cooldown = 3 SECONDS
	var/alert_cooldown_time

/mob/living/simple_animal/hostile/blackmesa/xen
	faction = list(FACTION_XEN)
	atmos_requirements = null
	minbodytemp = 0
	maxbodytemp = 1500

/mob/living/simple_animal/hostile/blackmesa/Aggro()
	if(alert_sounds)
		if(!(world.time <= alert_cooldown_time))
			playsound(src, pick(alert_sounds), 70)
			alert_cooldown_time = world.time + alert_cooldown


#define MOB_PLACER_RANGE 16 // One more tile than the biggest viewrange we have.

/obj/effect/random_mob_placer
	name = "mob placer"
	icon = 'mod_celadon/_storge_icons/icons/mobs/hostile/mapping_helpers.dmi'
	icon_state = "mobspawner"
	var/list/possible_mobs = list(/mob/living/simple_animal/hostile/blackmesa/xen/headcrab)

/obj/effect/random_mob_placer/Initialize(mapload)
	. = ..()
	for(var/turf/iterating_turf in range(MOB_PLACER_RANGE, src))
		RegisterSignal(iterating_turf, COMSIG_ATOM_ENTERED, PROC_REF(trigger))

/obj/effect/random_mob_placer/proc/trigger(datum/source, atom/movable/entered_atom)
	SIGNAL_HANDLER
	if(!isliving(entered_atom))
		return
	var/mob/living/entered_mob = entered_atom

	if(!entered_mob.client)
		return

	var/mob/picked_mob = pick(possible_mobs)
	new picked_mob(loc)
	qdel(src)

#undef MOB_PLACER_RANGE

/obj/effect/random_mob_placer/xen
	icon_state = "spawn_xen"
	possible_mobs = list(
		/mob/living/simple_animal/hostile/blackmesa/xen/headcrab,
		/mob/living/simple_animal/hostile/blackmesa/xen/houndeye,
		/mob/living/simple_animal/hostile/blackmesa/xen/bullsquid,
	)

/obj/effect/random_mob_placer/xen/zombie
	icon_state = "spawn_zombie"
	possible_mobs = list(
		/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/scientist,
		/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/guard,
		/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/hecu,
	)

/obj/effect/random_mob_placer/blackops
	icon_state = "spawn_blackops"
	possible_mobs = list(
		/mob/living/simple_animal/hostile/blackmesa/blackops,
		/mob/living/simple_animal/hostile/blackmesa/blackops/ranged,
	)

/obj/effect/random_mob_placer/hev_zombie
	icon_state = "spawn_hev"
	possible_mobs = list(/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/hev)

/obj/effect/random_mob_placer/scientist_zombie
	icon_state = "spawn_zombiescientist"
	possible_mobs = list(/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/scientist)

/obj/effect/random_mob_placer/scientist_zombie
	icon_state = "spawn_zombiesec"
	possible_mobs = list(/mob/living/simple_animal/hostile/blackmesa/xen/headcrab_zombie/guard)

/obj/effect/random_mob_placer/security_guard
	icon_state = "spawn_guard"
	possible_mobs = list(/mob/living/simple_animal/hostile/blackmesa/sec, /mob/living/simple_animal/hostile/blackmesa/sec/ranged)

/obj/effect/random_mob_placer/vortigaunt_hostile
	icon_state = "spawn_vortigaunt_slave"
	possible_mobs = list(/mob/living/simple_animal/hostile/blackmesa/xen/vortigaunt/slave)

/obj/effect/random_mob_placer/vortigaunt
	icon_state = "spawn_vortigaunt"
	possible_mobs = list(/mob/living/simple_animal/hostile/blackmesa/xen/vortigaunt)

/obj/effect/mob_spawn/corpse/human/hecu_zombie
	name = "HECU"
	outfit = /datum/outfit/hecucorpse
	icon_state = "corpsebartender" /// It 'vaguely' looks like HECU
	brute_damage = 1000

/datum/outfit/hecucorpse
	name = "BMRF HECU Corpse"
	uniform = /obj/item/clothing/under/rank/security/officer/hecu
	head = /obj/item/clothing/head/helmet
	suit = /obj/item/clothing/suit/armor/vest
	mask = /obj/item/clothing/mask/gas/hecu2
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/assault/hecu
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/storage/belt/bowie_sheath
	r_pocket = /obj/item/flashlight/flare

/obj/effect/mob_spawn/corpse/human/scientist_zombie
	name = "Science Team"
	outfit = /datum/outfit/sciteamcorpse
	icon_state = "corpsescientist"
	brute_damage = 1000

/datum/outfit/sciteamcorpse
	name = "BMRF Science Team Corpse"
	uniform = /obj/item/clothing/under/rank/rnd/scientist/nova/hlscience
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/latex

/obj/effect/mob_spawn/corpse/human/guard_zombie
	name = "Security Guard"
	outfit = /datum/outfit/barneycorpse
	icon_state = "corpsedoctor" /// It 'vaguely' looks like the guard
	brute_damage = 1000

/datum/outfit/barneycorpse
	name = "BMRF Security Guard Corpse"
	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt
	head = /obj/item/clothing/head/helmet/blueshirt
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/color/black
	belt = /obj/item/storage/belt/security


/*
*	HECU
*/

/mob/living/simple_animal/hostile/blackmesa/hecu
	name = "HECU Grunt"
	desc = "I didn't sign on for this shit. Monsters, sure, but civilians? Who ordered this operation anyway?"
	icon = 'mod_celadon/_storge_icons/icons/mobs/hostile/blackmesa.dmi'
	icon_state = "hecu_melee"
	icon_living = "hecu_melee"
	icon_dead = "hecu_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speak_chance = 10
	speak = list("Stop right there!")
	turns_per_move = 5
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	maxHealth = 150
	health = 150
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	combat_mode = TRUE
	loot = list(/obj/effect/gibspawner/human, /obj/item/melee/baton)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 7.5
	faction = list(FACTION_HECU)
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	dodging = TRUE
	rapid_melee = 2
	footstep_type = FOOTSTEP_MOB_SHOE
	alert_sounds = list(
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert04.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert05.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert06.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert07.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert08.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/hecu/hg_alert10.ogg'
	)


/mob/living/simple_animal/hostile/blackmesa/hecu/ranged
	ranged = TRUE
	retreat_distance = 5
	minimum_distance = 5
	icon_state = "hecu_ranged"
	icon_living = "hecu_ranged"
	casingtype = /obj/item/ammo_casing/a50ae
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	loot = list(/obj/effect/gibspawner/human, /obj/effect/spawner/random/hecu_deagle)
	dodging = TRUE
	rapid_melee = 1

/mob/living/simple_animal/hostile/blackmesa/hecu/ranged/smg
	rapid = 3
	icon_state = "hecu_ranged_smg"
	icon_living = "hecu_ranged_smg"
	casingtype = /obj/item/ammo_casing/c38
	projectilesound = 'sound/weapons/gun/smg/shot.ogg'
	loot = list(/obj/effect/gibspawner/human, /obj/effect/spawner/random/hecu_smg)

/mob/living/simple_animal/hostile/blackmesa/sec
	name = "Security Guard"
	desc = "About that beer I owe'd ya!"
	icon = 'mod_celadon/_storge_icons/icons/mobs/hostile/blackmesa.dmi'
	icon_state = "security_guard_melee"
	icon_living = "security_guard_melee"
	icon_dead = "security_guard_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	turns_per_move = 5
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 7
	melee_damage_upper = 7
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	loot = list(/obj/effect/gibspawner/human, /obj/item/clothing/suit/armor/vest/blueshirt)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 7.5
	faction = list(FACTION_STATION, FACTION_NEUTRAL)
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = TRUE
	combat_mode = TRUE
	dodging = TRUE
	rapid_melee = 2
	footstep_type = FOOTSTEP_MOB_SHOE
	alert_sounds = list(
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance04.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance05.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance06.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance07.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance08.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance09.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/annoyance10.ogg'
	)
	var/list/follow_sounds = list(
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadon01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadon02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadon03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway04.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway05.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway06.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway07.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/leadtheway08.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/letsgo01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/letsgo02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/letsgo03.ogg',
		)
	var/list/unfollow_sounds = list(
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/holddownspot01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/holddownspot02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/holddownspot03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/holddownspot04.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/holddownspot05.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/illstayhere01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/illstayhere02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/illstayhere03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/imstickinghere01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/imstickinghere02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/imstickinghere03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/imstickinghere04.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/security_guard/imstickinghere05.ogg',
	)
	var/follow_speed = 2
	var/follow_distance = 2

/mob/living/simple_animal/hostile/blackmesa/sec/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/follow, follow_sounds, unfollow_sounds, follow_distance, follow_speed)


/mob/living/simple_animal/hostile/blackmesa/sec/ranged
	ranged = TRUE
	retreat_distance = 5
	minimum_distance = 5
	icon_state = "security_guard_ranged"
	icon_living = "security_guard_ranged"
	casingtype = /obj/item/ammo_casing/c9mm
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	loot = list(/obj/effect/gibspawner/human, /obj/item/clothing/suit/armor/vest/blueshirt, /obj/item/gun/ballistic/automatic/pistol/sol)
	rapid_melee = 1

/mob/living/simple_animal/hostile/blackmesa/blackops
	name = "black operative"
	desc = "Why do we always have to clean up a mess the grunts can't handle?"
	icon = 'mod_celadon/_storge_icons/icons/mobs/hostile/blackmesa.dmi'
	icon_state = "blackops"
	icon_living = "blackops"
	icon_dead = "blackops"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speak_chance = 10
	speak = list("Got a visual!")
	turns_per_move = 5
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	maxHealth = 200
	health = 200
	harm_intent_damage = 25
	melee_damage_lower = 30
	melee_damage_upper = 30
	attack_verb_continuous = "strikes"
	attack_verb_simple = "strikes"
	attack_sound = 'sound/effects/woodhit.ogg'
	combat_mode = TRUE
	loot = list(/obj/effect/gibspawner/human)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 7.5
	faction = list(FACTION_BLACKOPS)
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	dodging = TRUE
	rapid_melee = 2
	footstep_type = FOOTSTEP_MOB_SHOE
	alert_sounds = list(
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert01.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert02.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert03.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert04.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert05.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert06.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert07.ogg',
		'mod_celadon/_storge_sounds/sound/mobs/blackops/bo_alert08.ogg'
	)


/mob/living/simple_animal/hostile/blackmesa/blackops/ranged
	ranged = TRUE
	rapid = 2
	retreat_distance = 5
	minimum_distance = 5
	icon_state = "blackops_ranged"
	icon_living = "blackops_ranged"
	casingtype = /obj/item/ammo_casing/c40sol
	projectilesound = 'mod_celadon/_storge_sounds/sound/effects/rifle_heavy.ogg'
	attack_sound = 'sound/weapons/punch1.ogg'
	loot = list(/obj/effect/gibspawner/human, /obj/item/ammo_box/magazine/c40sol_rifle/standard)
	rapid_melee = 1

// .40 Sol rifle magazines

/obj/item/ammo_box/magazine/c40sol_rifle
	name = "\improper Sol rifle short magazine"
	desc = "A shortened magazine for SolFed rifles, holds fifteen rounds."

	icon = 'mod_celadon/_storge_icons/icons/guns/ammo_black_mesa.dmi'
	icon_state = "rifle_short"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_TINY

	ammo_type = /obj/item/ammo_casing/c40sol
	caliber = CALIBER_SOL40LONG
	max_ammo = 15

/obj/item/ammo_box/magazine/c40sol_rifle/starts_empty

	start_empty = TRUE

/obj/item/ammo_box/magazine/c40sol_rifle/standard
	name = "\improper Sol rifle magazine"
	desc = "A standard size magazine for SolFed rifles, holds thirty rounds."

	icon_state = "rifle_standard"

	w_class = WEIGHT_CLASS_SMALL

	max_ammo = 30

/obj/item/ammo_box/magazine/c40sol_rifle/standard/starts_empty
	start_empty = TRUE

// Rifle ammo

// .40 sol long

/obj/item/ammo_casing/c40sol
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c40_sol

/obj/item/ammo_box/magazine/ammo_stack/c40_sol
	name = ".40 Sol Long casings"
	desc = "A stack of .40 Sol Long cartridges."
	caliber = CALIBER_SOL40LONG
	ammo_type = /obj/item/ammo_casing/c40sol
	max_ammo = 15
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled/frag
	name = ".40 Sol Long fragmentation casings"
	ammo_type = /obj/item/ammo_casing/c40sol/fragmentation
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled/incendiary
	name = ".40 Sol Long incendiary casings"
	ammo_type = /obj/item/ammo_casing/c40sol/incendiary
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled/match
	name = ".40 Sol Long match casings"
	ammo_type = /obj/item/ammo_casing/c40sol/pierce
	icon_state = "stack_spec"

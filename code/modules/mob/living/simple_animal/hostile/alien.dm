/mob/living/simple_animal/hostile/alien
	name = "alien hunter"
	desc = "Hiss!"
	icon = 'icons/mob/alien.dmi'
	icon_state = "alienh"
	icon_living = "alienh"
	icon_dead = "alienh_dead"
	icon_gib = "syndicate_gib"
	gender = FEMALE
	speed = 0
	butcher_results = list(/obj/item/food/meat/slab/xeno = 4,
							/obj/item/stack/sheet/animalhide/xeno = 1)
	// [CELADON-EDIT] - ALIEN_BALANCE
	// maxHealth = 125
	// health = 125
	maxHealth = 250
	health = 250
	// [/CELADON-EDIT]
	harm_intent_damage = 5
	obj_damage = 60
	// [CELADON-EDIT] - ALIEN_BALANCE
	// melee_damage_lower = 25
	// melee_damage_upper = 25
	melee_damage_lower = 8
	melee_damage_upper = 8
	armour_penetration = 30
	// [/CELADON-EDIT]
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	speak_emote = list("hisses")
	bubble_icon = "alien"
	a_intent = INTENT_HARM
	attack_sound = 'sound/weapons/bladeslice.ogg'
	atmos_requirements = IMMUNE_ATMOS_REQS
	unsuitable_atmos_damage = 15
	faction = list(ROLE_ALIEN)
	status_flags = CANPUSH
	minbodytemp = 0
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	unique_name = 1
	deathsound = 'sound/voice/hiss6.ogg'
	deathmessage = "lets out a waning guttural screech, green blood bubbling from its maw..."
	// [CELADON-ADD] - ALIEN_BALANCE
	sharpness = SHARP_EDGED
	check_friendly_fire = TRUE
	dodging = TRUE
	rapid_melee = 3
	turns_per_move = 10
	move_to_delay = 5 // 0.05
	charger = TRUE
	charge_distance = 8
	charge_cooldown = 8 SECONDS
	armor = list("melee" = 20, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = -100, "acid" = 80)
	speed = 0.5
	// [/CELADON-ADD]

/mob/living/simple_animal/hostile/alien/asteroid
	faction = list("mining")

/mob/living/simple_animal/hostile/alien/Initialize()
	. = ..()
	AddComponent(/datum/component/footstep, FOOTSTEP_MOB_CLAW)

/mob/living/simple_animal/hostile/alien/drone
	name = "alien drone"
	icon_state = "aliend"
	icon_living = "aliend"
	icon_dead = "aliend_dead"
	melee_damage_lower = 15
	melee_damage_upper = 15
	var/plant_cooldown = 30
	var/plants_off = 0
	charger = FALSE // [CELADON-ADD] - ALIEN_BALANCE

/mob/living/simple_animal/hostile/alien/drone/handle_automated_action()
	if(!..()) //AIStatus is off
		return
	plant_cooldown--
	if(AIStatus == AI_IDLE)
		if(!plants_off && prob(10) && plant_cooldown<=0)
			plant_cooldown = initial(plant_cooldown)
			SpreadPlants()

/mob/living/simple_animal/hostile/alien/sentinel
	name = "alien sentinel"
	icon_state = "aliens"
	icon_living = "aliens"
	icon_dead = "aliens_dead"
	health = 150
	maxHealth = 150
	melee_damage_lower = 15
	melee_damage_upper = 15
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	projectiletype = /obj/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'
	// [CELADON-ADD] - ALIEN_BALANCE
	charger = FALSE
	alpha = 100
	armour_penetration = 25
	armor = list("melee" = 40, "bullet" = 40, "laser" = 20, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 100, "fire" = -100, "acid" = 80)
	// [/CELADON-ADD]

/mob/living/simple_animal/hostile/alien/queen
	name = "alien queen"
	icon_state = "alienq"
	icon_living = "alienq"
	icon_dead = "alienq_dead"
	// [CELADON-EDIT] - ALIEN_BALANCE
	// health = 250
	// maxHealth = 250
	health = 600
	maxHealth = 600
	// [CELADON-ADD] - ALIEN_BALANCE
	armour_penetration = 30
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 100, "fire" = -100, "acid" = 80)
	charger = FALSE
	rapid_melee = 1
	// [/CELADON-ADD]
	// [CELADON-EDIT] - ALIEN_BALANCE
	// melee_damage_lower = 15
	// melee_damage_upper = 15
	melee_damage_lower = 40
	melee_damage_upper = 40
	// [/CELADON-EDIT]
	ranged = 1
	// [CELADON-DELETE] - ALIEN_BALANCE
	// retreat_distance = 5
	// minimum_distance = 5
	// [/CELADON-DELETE]
	move_to_delay = 4
	butcher_results = list(/obj/item/food/meat/slab/xeno = 4,
							/obj/item/stack/sheet/animalhide/xeno = 1)
	projectiletype = /obj/projectile/neurotox
	projectilesound = 'sound/weapons/pierce.ogg'
	status_flags = 0
	unique_name = 0
	var/sterile = 1
	var/plants_off = 0
	var/egg_cooldown = 30
	var/plant_cooldown = 30

/mob/living/simple_animal/hostile/alien/queen/handle_automated_action()
	if(!..()) //AIStatus is off
		return
	egg_cooldown--
	plant_cooldown--
	if(AIStatus == AI_IDLE)
		if(!plants_off && prob(10) && plant_cooldown<=0)
			plant_cooldown = initial(plant_cooldown)
			SpreadPlants()
		if(!sterile && prob(10) && egg_cooldown<=0)
			egg_cooldown = initial(egg_cooldown)
			LayEggs()

/mob/living/simple_animal/hostile/alien/proc/SpreadPlants()
	if(!isturf(loc) || isspaceturf(loc))
		return
	if(locate(/obj/structure/alien/weeds/node) in get_turf(src))
		return
	visible_message(span_alertalien("[src] plants some alien weeds!"))
	new /obj/structure/alien/weeds/node(loc)

/mob/living/simple_animal/hostile/alien/proc/LayEggs()
	if(!isturf(loc) || isspaceturf(loc))
		return
	if(locate(/obj/structure/alien/egg) in get_turf(src))
		return
	visible_message(span_alertalien("[src] lays an egg!"))
	new /obj/structure/alien/egg(loc)

/mob/living/simple_animal/hostile/alien/queen/large
	name = "alien empress"
	icon = 'icons/mob/alienqueen.dmi'
	icon_state = "alienq"
	icon_living = "alienq"
	icon_dead = "alienq_dead"
	health_doll_icon = "alienq"
	bubble_icon = "alienroyal"
	// [CELADON-EDIT] - ALIEN_BALANCE
	// maxHealth = 400
	// health = 400
	health = 800
	maxHealth = 800
	// [/CELADON-EDIT]
	move_to_delay = 4
	// [CELADON-ADD] - ALIEN_BALANCE
	armour_penetration = 35
	armor = list("melee" = 50, "bullet" = 50, "laser" = 20, "energy" = 50, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = -100, "acid" = 80)
	// [CELADON-ADD]
	butcher_results = list(/obj/item/food/meat/slab/xeno = 10,
							/obj/item/stack/sheet/animalhide/xeno = 2)
	mob_size = MOB_SIZE_LARGE

/obj/projectile/neurotox
	name = "neurotoxin"
	damage = 30
	icon_state = "toxin"
	// [CELADON-ADD] - ALIEN_BALANCE
	slur = 10
	eyeblur = 10
	jitter = 5
	// [/CELADON-ADD]

/mob/living/simple_animal/hostile/alien/handle_temperature_damage()
	if(bodytemperature < minbodytemp)
		adjustBruteLoss(2)
		throw_alert("temp", /atom/movable/screen/alert/cold, 1)
	else if(bodytemperature > maxbodytemp)
		adjustBruteLoss(20)
		throw_alert("temp", /atom/movable/screen/alert/hot, 3)
	else
		clear_alert("temp")

/mob/living/simple_animal/hostile/alien/maid
	name = "lusty xenomorph maid"
	melee_damage_lower = 0
	melee_damage_upper = 0
	a_intent = INTENT_HELP
	friendly_verb_continuous = "caresses"
	friendly_verb_simple = "caress"
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	icon_state = "maid"
	icon_living = "maid"
	icon_dead = "maid_dead"

/mob/living/simple_animal/hostile/alien/maid/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/cleaning)

/mob/living/simple_animal/hostile/alien/maid/AttackingTarget()
	if(ismovable(target))
		target.wash(CLEAN_WASH)
		if(istype(target, /obj/effect/decal/cleanable))
			visible_message(span_notice("[src] cleans up \the [target]."))
		else
			visible_message(span_notice("[src] polishes \the [target]."))
		return TRUE

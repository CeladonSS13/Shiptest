// СПРАВОЧНИК ПО АТРИБУТАМ МОБОВ
/*
	faction = list("hostile")
	stop_automated_movement_when_pulled = 0
	obj_damage = 40
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES //Bitflags. Set to ENVIRONMENT_SMASH_STRUCTURES to break closets,tables,racks, etc; ENVIRONMENT_SMASH_WALLS for walls; ENVIRONMENT_SMASH_RWALLS for rwalls
	///The current target of our attacks, use GiveTarget and LoseTarget to set this var
	atom/target
	ranged = FALSE
	rapid = 0 //How many shots per volley.
	rapid_fire_delay = 2 //Time between rapid fire shots

	dodging = FALSE
	approaching_target = FALSE //We should dodge now
	in_melee = FALSE	//We should sidestep now
	dodge_prob = 30
	sidestep_per_cycle = 1 //How many sidesteps per npcpool cycle when in melee

	projectiletype	//set ONLY it and NULLIFY casingtype var, if we have ONLY projectile
	projectilesound
	casingtype		//set ONLY it and NULLIFY projectiletype, if we have projectile IN CASING
	move_to_delay = 3 //delay for the automated movement.
	friends = list()
	emote_taunt = list()
	taunt_chance = 0

	rapid_melee = 1			 //Number of melee attacks between each npc pool tick. Spread evenly.
	melee_queue_distance = 4 //If target is close enough start preparing to hit them if we have rapid_melee enabled

	ranged_message = "fires" //Fluff text for ranged mobs
	ranged_cooldown = 0 //What the current cooldown on ranged attacks is, generally world.time + ranged_cooldown_time
	ranged_cooldown_time = 30 //How long, in deciseconds, the cooldown of ranged attacks is
	ranged_ignores_vision = FALSE //if it'll fire ranged attacks even if it lacks vision on its target, only works with environment smash
	check_friendly_fire = FALSE // Should the ranged mob check for friendlies when shooting
	retreat_distance = null //If our mob runs from players when they're too close, set in tile distance. By default, mobs do not retreat.
	minimum_distance = 1 //Minimum approach distance, so ranged mobs chase targets down, but still keep their distance set in tiles to the target, set higher to make mobs keep distance


//These vars are related to how mobs locate and target
	robust_searching = 0 //By default, mobs have a simple searching method, set this to 1 for the more scrutinous searching (stat_attack, stat_exclusive, etc), should be disabled on most mobs
	vision_range = 9 //How big of an area to search for targets in, a vision of 9 attempts to find targets as soon as they walk into screen view
	aggro_vision_range = 9 //If a mob is aggro, we search in this radius. Defaults to 9 to keep in line with original simple mob aggro radius
	search_objects = 0 //If we want to consider objects when searching around, set this to 1. If you want to search for objects while also ignoring mobs until hurt, set it to 2. To completely ignore mobs, even when attacked, set it to 3
	search_objects_timer_id //Timer for regaining our old search_objects value after being attacked
	search_objects_regain_time = 30 //the delay between being attacked and gaining our old search_objects value back
	wanted_objects = list() //A typecache of objects types that will be checked against to attack, should we have search_objects enabled
	///Mobs ignore mob/living targets with a stat lower than that of stat_attack. If set to DEAD, then they'll include corpses in their targets, if to HARD_CRIT they'll keep attacking until they kill, and so on.
	stat_attack = CONSCIOUS
	stat_exclusive = FALSE //Mobs with this set to TRUE will exclusively attack things defined by stat_attack, stat_attack DEAD means they will only attack corpses
	attack_same = 0 //Set us to 1 to allow us to attack our own faction
	//Use GET_TARGETS_FROM(mob) to access this
	//Attempting to call GET_TARGETS_FROM(mob) when this var is null will just return mob as a base
	datum/weakref/targets_from //all range/attack/etc. calculations should be done from the atom this weakrefs, useful for Vehicles and such.
	attack_all_objects = FALSE //if true, equivalent to having a wanted_objects list containing ALL objects.

	lose_patience_timer_id //id for a timer to call LoseTarget(), used to stop mobs fixating on a target they can't reach
	lose_patience_timeout = 300 //30 seconds by default, so there's no major changes to AI behaviour, beyond actually bailing if stuck forever

///When a target is found, will the mob attempt to charge at it's target?
	charger = FALSE
	///Tracks if the target is actively charging.
	charge_state = FALSE
	///In a charge, how many tiles will the charger travel?
	charge_distance = 3
	///How often can the charging mob actually charge? Effects the cooldown between charges.
	charge_frequency = 6 SECONDS
	///If the mob is charging, how long will it stun it's target on success, and itself on failure?
	knockdown_time = 3 SECONDS
	///Declares a cooldown for potential charges right off the bat.
*/

// Поднимаем разнообразие мобам
GLOBAL_LIST_INIT(onecardinalnorth, NORTH) // Патерн атаки для одного щупальца голиафам
GLOBAL_LIST_INIT(onecardinalsouth, SOUTH)
GLOBAL_LIST_INIT(onecardinaleast, EAST)
GLOBAL_LIST_INIT(onecardinalwest, WEST)

/mob/living/simple_animal/hostile
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/mob/living/simple_animal/hostile/asteroid
	vision_range = 15
	aggro_vision_range = 15
	see_in_dark = 15
	armour_penetration = 0
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10)

/mob/living/simple_animal/hostile/asteroid/goliath
	move_to_delay = 20
	ranged_cooldown_time = 60
	armour_penetration = 20

/mob/living/simple_animal/hostile/asteroid/goliath/pup
	maxHealth = 30
	health = 30
	armour_penetration = 5
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/mob/living/simple_animal/hostile/asteroid/goliath/beast
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 20, "bomb" = 20, "bio" = 20, "rad" = 20, "fire" = 40, "acid" = 10)

// /mob/living/simple_animal/hostile/asteroid/goliath/beast

// /mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient

// /mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient/crystal

// /obj/effect/temp_visual/goliath_tentacle
// 	// difficulty = rand(3, 4)

// /obj/effect/temp_visual/goliath_tentacle/crystal

// /mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet


/mob/living/simple_animal/hostile/asteroid/basilisk
	move_to_delay = 10
	ranged_cooldown_time = 15
	armour_penetration = 7
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 35, "bomb" = 50, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10)

// /mob/living/simple_animal/hostile/asteroid/basilisk/whitesands

// /mob/living/simple_animal/hostile/asteroid/basilisk/watcher

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/magmawing
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 35, "bomb" = 50, "bio" = 10, "rad" = 10, "fire" = 100, "acid" = 10)

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 35, "bomb" = 50, "bio" = 100, "rad" = 10, "fire" = 0, "acid" = 10)

// /mob/living/simple_animal/hostile/asteroid/basilisk/watcher/nest

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/forgotten
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 25, "bomb" = 50, "bio" = 50, "rad" = 50, "fire" = 50, "acid" = 50)


/mob/living/simple_animal/hostile/asteroid/brimdemon
	armour_penetration = 10
	armor = list("melee" = 30, "bullet" = 30, "laser" = 40, "energy" = 30, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 50, "acid" = 20)


// /mob/living/simple_animal/hostile/asteroid/curseblob


// /mob/living/simple_animal/hostile/asteroid/goldgrub


// /mob/living/simple_animal/hostile/asteroid/gutlunch


/mob/living/simple_animal/hostile/asteroid/hivelord
	move_to_delay = 7
	armor = list("melee" = -10, "bullet" = 10, "laser" = 10, "energy" = 0, "bomb" = 50, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 20)
	deathmessage = "telepathically cries."

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion/nest

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf/nest

//Legion skull
/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion
	armor = list("melee" = 70, "bullet" = 70, "laser" = 70, "energy" = 70, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 0)

// /mob/living/simple_animal/hostile/asteroid/hivelordbrood

// /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/staff

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion/advanced

// /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/advanced

// /mob/living/simple_animal/hostile/big_legion

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow

// Snow Legion skull
/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/snow
	armor = list("melee" = 70, "bullet" = 70, "laser" = 70, "energy" = 70, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 0)

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow/nest

// /mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal

// /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/crystal


/mob/living/simple_animal/hostile/asteroid/ice_demon
	move_to_delay = 4
	ranged_cooldown_time = 15
	armour_penetration = 15
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 10, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10)


/mob/living/simple_animal/hostile/asteroid/old_demon
	ranged_cooldown_time = 7
	armour_penetration = 25
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 35, "bomb" = 70, "bio" = 70, "rad" = 70, "fire" = 20, "acid" = 70)


/mob/living/simple_animal/hostile/asteroid/ice_whelp
	move_to_delay = 10
	ranged_cooldown_time = 100
	armour_penetration = 20
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 50, "bio" = 50, "rad" = 50, "fire" = 10, "acid" = 50)


/mob/living/simple_animal/hostile/asteroid/lobstrosity
	move_to_delay = 5
	armour_penetration = 15
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 50, "bio" = 20, "rad" = 20, "fire" = 20, "acid" = 20)

// /mob/living/simple_animal/hostile/asteroid/lobstrosity/beach


/mob/living/simple_animal/hostile/asteroid/polarbear
	move_to_delay = 6
	armour_penetration = 25
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 50, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10)

// /mob/living/simple_animal/hostile/asteroid/polarbear/lesser

/mob/living/simple_animal/hostile/asteroid/polarbear/warrior
	move_to_delay = 4
	maxHealth = 200
	health = 200
	armour_penetration = 35
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 10, "bomb" = 50, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10)


/mob/living/simple_animal/hostile/asteroid/wolf
	move_to_delay = 13
	ranged_cooldown_time = 45
	armour_penetration = 7
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10)

/mob/living/simple_animal/hostile/asteroid/wolf/alpha
	move_to_delay = 6
	ranged_cooldown_time = 22
	armour_penetration = 10
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 20, "bomb" = 20, "bio" = 20, "rad" = 20, "fire" = 20, "acid" = 20)


/mob/living/simple_animal/hostile/retaliate
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

// /mob/living/simple_animal/hostile/retaliate/bat

/mob/living/simple_animal/hostile/retaliate/clown
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

// /mob/living/simple_animal/hostile/retaliate/clown/lube

// /mob/living/simple_animal/hostile/retaliate/clown/banana

// /mob/living/simple_animal/hostile/retaliate/clown/honkling

// /mob/living/simple_animal/hostile/retaliate/clown/fleshclown

// /mob/living/simple_animal/hostile/retaliate/clown/longface

/mob/living/simple_animal/hostile/retaliate/clown/clownhulk
	armour_penetration = 20
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 30, "fire" = 30, "acid" = 0)

/mob/living/simple_animal/hostile/retaliate/clown/clownhulk/chlown

/mob/living/simple_animal/hostile/retaliate/clown/clownhulk/honcmunculus
	armour_penetration = 50
	armor = list("melee" = 60, "bullet" = 60, "laser" = 60, "energy" = 50, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 0)

/mob/living/simple_animal/hostile/retaliate/clown/clownhulk/destroyer
	armour_penetration = 50
	armor = list("melee" = 70, "bullet" = 70, "laser" = 70, "energy" = 30, "bomb" = 90, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 90)

/mob/living/simple_animal/hostile/retaliate/clown/mutant
	armour_penetration = 50
	armor = list("melee" = 80, "bullet" = 80, "laser" = 80, "energy" = 10, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 20, "acid" = 0)

// /mob/living/simple_animal/hostile/retaliate/clown/mutant/blob

// /mob/living/simple_animal/hostile/retaliate/frog

// /mob/living/simple_animal/hostile/retaliate/ghost

// /mob/living/simple_animal/hostile/retaliate/spaceman

/mob/living/simple_animal/hostile/retaliate/nanotrasenpeace
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 10, "fire" = 25, "acid" = 25)

/mob/living/simple_animal/hostile/retaliate/nanotrasenpeace/ranged
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 10, "fire" = 25, "acid" = 25)


// Custom
/mob/living/simple_animal/hostile/abandoned_minebot
	move_to_delay = 5
	armour_penetration = 15

/mob/living/simple_animal/hostile/alien
	move_to_delay = 8
	ranged_cooldown_time = 15
	armour_penetration = 25
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 80)

// /mob/living/simple_animal/hostile/alien/asteroid

// /mob/living/simple_animal/hostile/alien/drone

/mob/living/simple_animal/hostile/alien/sentinel
	armour_penetration = 25
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 100, "fire" = 20, "acid" = 80)

/mob/living/simple_animal/hostile/alien/queen
	move_to_delay = 6
	armour_penetration = 30
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 100, "fire" = 20, "acid" = 80)

/mob/living/simple_animal/hostile/alien/queen/large
	move_to_delay = 4
	armour_penetration = 35
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 20, "acid" = 80)

// /mob/living/simple_animal/hostile/alien/maid


/mob/living/simple_animal/hostile/bear
	armour_penetration = 20
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10)

/mob/living/simple_animal/hostile/bear/Hudson

/mob/living/simple_animal/hostile/bear/snow
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 10)

/mob/living/simple_animal/hostile/bear/frontier
	armour_penetration = 35
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 30, "bio" = 10, "rad" = 15, "fire" = 30, "acid" = 30)

// /mob/living/simple_animal/hostile/bear/cave

// /mob/living/simple_animal/hostile/bear/butter


// /mob/living/simple_animal/hostile/poison/bees

// /mob/living/simple_animal/hostile/poison/bees/queen

// /mob/living/simple_animal/hostile/poison/bees/short


/mob/living/simple_animal/hostile/carp
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 20)

// /mob/living/simple_animal/hostile/carp/holocarp

/mob/living/simple_animal/hostile/carp/megacarp
	armour_penetration = 20
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 20, "bomb" = 20, "bio" = 100, "rad" = 100, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/carp/cayenne


/mob/living/simple_animal/hostile/clown
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

// /mob/living/simple_animal/hostile/clown/lube

// /mob/living/simple_animal/hostile/clown/banana

// /mob/living/simple_animal/hostile/clown/honkling

// /mob/living/simple_animal/hostile/clown/fleshclown

// /mob/living/simple_animal/hostile/clown/longface

/mob/living/simple_animal/hostile/clown/clownhulk
	armour_penetration = 20
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 30, "fire" = 30, "acid" = 0)

// /mob/living/simple_animal/hostile/clown/clownhulk/chlown

/mob/living/simple_animal/hostile/clown/clownhulk/honcmunculus
	armour_penetration = 50
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 0)

/mob/living/simple_animal/hostile/clown/clownhulk/destroyer
	armour_penetration = 50
	armor = list("melee" = 60, "bullet" = 60, "laser" = 60, "energy" = 30, "bomb" = 90, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 90)

/mob/living/simple_animal/hostile/clown/mutant
	armour_penetration = 50
	armor = list("melee" = 70, "bullet" = 70, "laser" = 70, "energy" = 10, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 20, "acid" = 0)


// /mob/living/simple_animal/hostile/clown/mutant/blob

// /mob/living/simple_animal/hostile/clown/stacked


// /mob/living/simple_animal/hostile/cockroach

// /mob/living/simple_animal/hostile/cockroach/glockroach


// /mob/living/simple_animal/hostile/eyeball


// /mob/living/simple_animal/hostile/faithless


/mob/living/simple_animal/hostile/poison/giant_spider
	armour_penetration = 10
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 10, "fire" = 10, "acid" = 10)

// /mob/living/simple_animal/hostile/poison/giant_spider/nurse

// /mob/living/simple_animal/hostile/poison/giant_spider/nurse/midwife

/mob/living/simple_animal/hostile/poison/giant_spider/hunter
	armour_penetration = 20
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 30, "fire" = 30, "acid" = 30)

/mob/living/simple_animal/hostile/poison/giant_spider/hunter/viper
	armour_penetration = 8
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 15, "bomb" = 15, "bio" = 100, "rad" = 15, "fire" = 15, "acid" = 15)

/mob/living/simple_animal/hostile/poison/giant_spider/tarantula
	armour_penetration = 20
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 40, "bomb" = 40, "bio" = 100, "rad" = 30, "fire" = 30, "acid" = 30)

// /mob/living/simple_animal/hostile/poison/giant_spider/ice

// /mob/living/simple_animal/hostile/poison/giant_spider/nurse/ice

/mob/living/simple_animal/hostile/poison/giant_spider/hunter/ice
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 30, "fire" = 30, "acid" = 30)


// /mob/living/simple_animal/hostile/retaliate/goose

// /mob/living/simple_animal/hostile/retaliate/goose/vomit


// /mob/living/simple_animal/hostile/headcrab


/mob/living/simple_animal/hostile/hivebot
	armour_penetration = 8
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)

/mob/living/simple_animal/hostile/hivebot/range
	armour_penetration = 10
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)

/mob/living/simple_animal/hostile/hivebot/range/rockplanet

/mob/living/simple_animal/hostile/hivebot/rapid
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)

/mob/living/simple_animal/hostile/hivebot/rapid/rockplanet

/mob/living/simple_animal/hostile/hivebot/strong
	armour_penetration = 20
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 100, "fire" = 70, "acid" = 70)

// /mob/living/simple_animal/hostile/hivebot/strong/rockplanet

// /mob/living/simple_animal/hostile/hivebot/mechanic

/mob/living/simple_animal/hostile/hivebot/wasteplanet
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)

/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)

/mob/living/simple_animal/hostile/hivebot/wasteplanet/ranged/rapid
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)

/mob/living/simple_animal/hostile/hivebot/wasteplanet/strong
	armour_penetration = 20
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 30, "bomb" = 30, "bio" = 100, "rad" = 100, "fire" = 70, "acid" = 70)


// /mob/living/simple_animal/hostile/illusion

// /mob/living/simple_animal/hostile/illusion/escape


// /mob/living/simple_animal/hostile/killertomato


/mob/living/simple_animal/hostile/human/ramzi/mecha_pilot
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 10, "fire" = 10, "acid" = 10)

// /mob/living/simple_animal/hostile/human/ramzi/mecha_pilot/no_mech

// /mob/living/simple_animal/hostile/human/ramzi/mecha_pilot/nanotrasen

// /mob/living/simple_animal/hostile/human/ramzi/mecha_pilot/no_mech/nanotrasen


/mob/living/simple_animal/hostile/mimic
	armour_penetration = 12
	armor = list("melee" = 20, "bullet" = 20, "laser" = 20, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 10, "fire" = 10, "acid" = 10)

/mob/living/simple_animal/hostile/mimic/crate
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 20, "bomb" = 30, "bio" = 100, "rad" = 100, "fire" = 30, "acid" = 30)

// /mob/living/simple_animal/hostile/mimic/copy

// /mob/living/simple_animal/hostile/mimic/copy/machine

// /mob/living/simple_animal/hostile/mimic/copy/ranged

// /mob/living/simple_animal/hostile/mimic/xenobio


// /mob/living/simple_animal/hostile/mushroom


// /mob/living/simple_animal/hostile/netherworld

// /mob/living/simple_animal/hostile/netherworld/asteroid

// /mob/living/simple_animal/hostile/netherworld/migo

// /mob/living/simple_animal/hostile/netherworld/migo/asteroid

// /mob/living/simple_animal/hostile/netherworld/blankbody


/mob/living/simple_animal/hostile/regalrat
	armour_penetration = 15
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 15, "bomb" = 15, "bio" = 100, "rad" = 100, "fire" = 15, "acid" = 30)


// /mob/living/simple_animal/hostile/rat


/mob/living/simple_animal/hostile/space_dragon
	maxHealth = 777
	health = 777
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 15, "bomb" = 15, "bio" = 100, "rad" = 100, "fire" = 15, "acid" = 30)


/mob/living/simple_animal/hostile/statue
	armour_penetration = 60
	armor = list("melee" = 90, "bullet" = 90, "laser" = 90, "energy" = 90, "bomb" = 90, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)


/mob/living/simple_animal/hostile/tree
	armour_penetration = 12
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 50, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 0)

// /mob/living/simple_animal/hostile/tree/festivus


// /mob/living/simple_animal/hostile/venus_human_trap


/mob/living/simple_animal/hostile/asteroid/fugu
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 30, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/asteroid/whitesands
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 30, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 35, "acid" = 30)

/mob/living/simple_animal/hostile/construct
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 5, "bomb" = 5, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 80)

/mob/living/simple_animal/hostile/construct/juggernaut
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 35, "bomb" = 35, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 80)

// /mob/living/simple_animal/hostile/construct/juggernaut/hostile

// /mob/living/simple_animal/hostile/construct/juggernaut/angelic

/mob/living/simple_animal/hostile/construct/wraith
	armour_penetration = 15
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 5, "bomb" = 5, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 80)

// /mob/living/simple_animal/hostile/construct/wraith/hostile

// /mob/living/simple_animal/hostile/construct/wraith/angelic

/mob/living/simple_animal/hostile/construct/artificer
	armour_penetration = 10
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 5, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 80)

// /mob/living/simple_animal/hostile/construct/artificer/hostile

// /mob/living/simple_animal/hostile/construct/artificer/angelic

// /mob/living/simple_animal/hostile/construct/artificer/noncult

/mob/living/simple_animal/hostile/construct/harvester
	armour_penetration = 15
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 15, "bomb" = 15, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 80)

/*
Вынесена в mod_celadon/balance/code/elite.dm

/mob/living/simple_animal/hostile/asteroid/elite
/mob/living/simple_animal/hostile/asteroid/elite/broodmother
/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child
/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet
/mob/living/simple_animal/hostile/asteroid/elite/herald
/mob/living/simple_animal/hostile/asteroid/elite/herald/mirror
/mob/living/simple_animal/hostile/asteroid/elite/legionnaire
/mob/living/simple_animal/hostile/asteroid/elite/legionnairehead
/mob/living/simple_animal/hostile/asteroid/elite/pandora
/mob/living/simple_animal/hostile/asteroid/elite/pandora/dungeon
*/

/mob/living/simple_animal/hostile/gorilla
	armour_penetration = 18
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 10, "bomb" = 50, "bio" = 50, "rad" = 0, "fire" = 20, "acid" = 10)


// /mob/living/simple_animal/hostile/human

// /mob/living/simple_animal/hostile/human/cat_butcherer


/mob/living/simple_animal/hostile/human/nanotrasen
	armour_penetration = 10
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 60, "fire" = 20, "acid" = 20)

// /mob/living/simple_animal/hostile/human/nanotrasen/screaming

// /mob/living/simple_animal/hostile/human/nanotrasen/ranged

// /mob/living/simple_animal/hostile/human/nanotrasen/ranged/smg

// /mob/living/simple_animal/hostile/human/nanotrasen/ranged/assault

/mob/living/simple_animal/hostile/human/nanotrasen/elite
	armour_penetration = 15
	armor = list("melee" = 40, "bullet" = 40, "laser" = 20, "energy" = 60, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 80)


/mob/living/simple_animal/hostile/human/pirate
	armour_penetration = 10
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 20, "bomb" = 10, "bio" = 100, "rad" = 60, "fire" = 20, "acid" = 20)

// /mob/living/simple_animal/hostile/human/pirate/melee

/mob/living/simple_animal/hostile/human/pirate/melee/space
	armour_penetration = 15
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 40, "bomb" = 30, "bio" = 100, "rad" = 100, "fire" = 60, "acid" = 60)

// /mob/living/simple_animal/hostile/human/pirate/ranged

/mob/living/simple_animal/hostile/human/pirate/ranged/space
	armour_penetration = 15
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 40, "bomb" = 30, "bio" = 100, "rad" = 100, "fire" = 60, "acid" = 60)


/mob/living/simple_animal/hostile/human/skeleton
	armor = list("melee" = 5, "bullet" = 5, "laser" = 5, "energy" = 100, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 5)

/mob/living/simple_animal/hostile/human/skeleton/templar
	armor = list("melee" = 41, "bullet" = 41, "laser" = 41, "energy" = 5, "bomb" = 5, "bio" = 2, "rad" = 0, "fire" = 0, "acid" = 50)

/mob/living/simple_animal/hostile/human/skeleton/ice
	armor = list("melee" = 5, "bullet" = 5, "laser" = 5, "energy" = 100, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 5)

/mob/living/simple_animal/hostile/human/skeleton/plasmaminer
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 5, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 75)

/mob/living/simple_animal/hostile/human/skeleton/plasmaminer/jackhammer


/mob/living/simple_animal/hostile/human/hermit
	armour_penetration = 10
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 50)

// /mob/living/simple_animal/hostile/human/hermit/survivor

// /mob/living/simple_animal/hostile/human/hermit/ranged

// /mob/living/simple_animal/hostile/human/hermit/ranged/hunter

// /mob/living/simple_animal/hostile/human/hermit/ranged/gunslinger


/mob/living/simple_animal/hostile/human/ramzi
	armour_penetration = 10
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/human/ramzi/space
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)

/mob/living/simple_animal/hostile/human/ramzi/space/stormtrooper
	armour_penetration = 20
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 25, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)

/mob/living/simple_animal/hostile/human/ramzi/melee
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/human/ramzi/melee/space
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)

/mob/living/simple_animal/hostile/human/ramzi/melee/space/stormtrooper
	armour_penetration = 20
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 25, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)

/mob/living/simple_animal/hostile/human/ramzi/melee/sledge
	armor = list("melee" = 25, "bullet" = 10, "laser" = 100, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/human/ramzi/melee/space/sledge
	armor = list("melee" = 55, "bullet" = 50, "laser" = 100, "energy" = 15, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)

/mob/living/simple_animal/hostile/human/ramzi/melee/space/stormtrooper/sledge
	armour_penetration = 30
	armor = list("melee" = 75, "bullet" = 60, "laser" = 100, "energy" = 25, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)

/mob/living/simple_animal/hostile/human/ramzi/ranged
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/human/ramzi/ranged/infiltrator

/mob/living/simple_animal/hostile/human/ramzi/ranged/space
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)

/mob/living/simple_animal/hostile/human/ramzi/ranged/space/stormtrooper
	armour_penetration = 20
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 25, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)

/mob/living/simple_animal/hostile/human/ramzi/ranged/smg
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/human/ramzi/ranged/space/smg
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)

/mob/living/simple_animal/hostile/human/ramzi/ranged/space/stormtrooper/smg
	armour_penetration = 20
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 25, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)

/mob/living/simple_animal/hostile/human/ramzi/ranged/shotgun
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 20, "fire" = 20, "acid" = 20)

/mob/living/simple_animal/hostile/human/ramzi/ranged/space/shotgun
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)

/mob/living/simple_animal/hostile/human/ramzi/ranged/space/stormtrooper/shotgun
	armour_penetration = 20
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 25, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)

/mob/living/simple_animal/hostile/human/ramzi/civilian


// /mob/living/simple_animal/hostile/viscerator


/mob/living/simple_animal/hostile/human/zombie
	armour_penetration = 21
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 90)

/mob/living/simple_animal/hostile/human/zombie/kudzu


// /mob/living/simple_animal/hostile/jungle

// /mob/living/simple_animal/hostile/jungle/leaper

/mob/living/simple_animal/hostile/jungle/mega_arachnid
	maxHealth = 300
	health = 300
	move_to_delay = 5
	armour_penetration = 30
	armor = list("melee" = 90, "bullet" = 70, "laser" = 70, "energy" = 70, "bomb" = 15, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 90)

/mob/living/simple_animal/hostile/jungle/mook
	ranged_cooldown_time = 5

/mob/living/simple_animal/hostile/jungle/seedling
	move_to_delay = 10
	ranged_cooldown_time = 5


// /mob/living/simple_animal/hostile/boss


/mob/living/simple_animal/hostile/megafauna
	vision_range = 20
	aggro_vision_range = 20
	see_in_dark = 20
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 100, "bomb" = 50, "bio" = 50, "rad" = 50, "fire" = 100, "acid" = 20)

/mob/living/simple_animal/hostile/megafauna/blood_drunk_miner
	health = 1750
	maxHealth = 1750
	speed = 1
	move_to_delay = 2
	armor = list("melee" = 10, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 50, "bio" = 50, "rad" = 50, "fire" = 20, "acid" = 20)
	crusher_loot = list(/obj/item/gun/energy/kinetic_accelerator,
						/obj/item/crusher_trophy/miner_eye,
						/obj/item/disk/design_disk/modkit_disc/mob_and_turf_aoe,
						/obj/item/disk/design_disk/modkit_disc/bounty,
						/obj/item/disk/design_disk/modkit_disc/resonator_blast,
						/obj/item/disk/design_disk/modkit_disc/rapid_repeater)
	loot = list(/obj/item/gun/energy/kinetic_accelerator,
				/obj/item/disk/design_disk/modkit_disc/mob_and_turf_aoe,
				/obj/item/disk/design_disk/modkit_disc/bounty,
				/obj/item/disk/design_disk/modkit_disc/resonator_blast,
				/obj/item/disk/design_disk/modkit_disc/rapid_repeater)
// /obj/item/melee/transforming/cleaving_saw,
// /mob/living/simple_animal/hostile/megafauna/blood_drunk_miner/guidance

/mob/living/simple_animal/hostile/megafauna/blood_drunk_miner/doom
	ranged_cooldown_time = 8
	dash_cooldown = 8

/mob/living/simple_animal/hostile/megafauna/bubblegum
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 100, "bomb" = 50, "bio" = 50, "rad" = 50, "fire" = 100, "acid" = 20)
	armour_penetration = 75
	speed = 1
	move_to_delay = 10
	crusher_loot = list(/obj/structure/closet/crate/necropolis/bubblegum/crusher)
	loot = list(/obj/structure/closet/crate/necropolis/bubblegum)

/mob/living/simple_animal/hostile/megafauna/bubblegum/hallucination
	crusher_loot = null

/mob/living/simple_animal/hostile/megafauna/claw
	armour_penetration = 30
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 60, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)
	crusher_loot = list(/obj/item/light_eater)

/mob/living/simple_animal/hostile/megafauna/claw/phase2 //75% of the health this thing has is here
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 0)
	crusher_loot = list(/obj/structure/closet/crate/necropolis/claw_phase_2)
	loot = list(/obj/structure/closet/crate/necropolis/claw_phase_2)

/mob/living/simple_animal/hostile/megafauna/colossus
	armor = list("melee" = 0, "bullet" = 30, "laser" = 30, "energy" = 100, "bomb" = 50, "bio" = 50, "rad" = 50, "fire" = 100, "acid" = 20)
	speed = 1
	crusher_loot = list(/obj/structure/closet/crate/necropolis/colossus/crusher)
	loot = list(/obj/structure/closet/crate/necropolis/colossus)

// /mob/living/simple_animal/hostile/lightgeist

/mob/living/simple_animal/hostile/megafauna/cult_templar
	move_to_delay = 3
	ranged_cooldown_time = 10
	armour_penetration = 20
	armor = list("melee" = 40, "bullet" = 15, "laser" = 5, "energy" = 20, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 40)

/mob/living/simple_animal/hostile/cult_demon
	armour_penetration = 8
	armor = list("melee" = 10, "bullet" = 25, "laser" = 25, "energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100)

// /mob/living/simple_animal/hostile/cult_demon/greater

/mob/living/simple_animal/hostile/megafauna/demonic_frost_miner
	crusher_loot = list(/obj/effect/decal/remains/plasma,
						/obj/item/crusher_trophy/ice_block_talisman,
						/obj/item/disk/design_disk/modkit_disc/mob_and_turf_aoe,
						/obj/item/disk/design_disk/modkit_disc/bounty,
						/obj/item/disk/design_disk/modkit_disc/resonator_blast,
						/obj/item/disk/design_disk/modkit_disc/rapid_repeater)
	loot = list(/obj/effect/decal/remains/plasma,
				/obj/item/disk/design_disk/modkit_disc/mob_and_turf_aoe,
				/obj/item/disk/design_disk/modkit_disc/bounty,
				/obj/item/disk/design_disk/modkit_disc/resonator_blast,
				/obj/item/disk/design_disk/modkit_disc/rapid_repeater)


/mob/living/simple_animal/hostile/megafauna/dragon
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 100, "bomb" = 50, "bio" = 50, "rad" = 90, "fire" = 100, "acid" = 100)
	speed = 1
	crusher_loot = list(/obj/structure/closet/crate/necropolis/dragon/crusher)
	loot = list(/obj/structure/closet/crate/necropolis/dragon)


/mob/living/simple_animal/hostile/megafauna/dragon/lesser
	maxHealth = 800
	health = 800
	crusher_loot = list()

// /mob/living/simple_animal/hostile/megafauna/dragon/icemoon // Отсутствует

/mob/living/simple_animal/hostile/megafauna/hierophant
	armour_penetration = 75
	melee_damage_lower = 25
	melee_damage_upper = 50
	speed = 1
	move_to_delay = 11
	loot = list(/obj/item/hierophant_club)
	crusher_loot = list(/obj/item/hierophant_club, /obj/item/crusher_trophy/vortex_talisman)

/mob/living/simple_animal/hostile/megafauna/legion
	speed = 1
	move_to_delay = 2

// /mob/living/simple_animal/hostile/megafauna/swarmer_swarm_beacon

/mob/living/simple_animal/hostile/megafauna/wendigo
	loot = list(/obj/item/wendigo_blood)
	crusher_loot = list(/obj/item/wendigo_blood, /obj/item/crusher_trophy/demon_claws)


// /mob/living/simple_animal

// /mob/living/simple_animal/parrot

// /mob/living/simple_animal/parrot/Polly

// /mob/living/simple_animal/slime

// /mob/living/simple_animal/slime/pet

// /mob/living/simple_animal/shade

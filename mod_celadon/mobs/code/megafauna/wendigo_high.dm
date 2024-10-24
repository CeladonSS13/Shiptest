/mob/living/simple_animal/hostile/megafauna/wendigo
	var/datum/armor/armor

/mob/living/simple_animal/hostile/megafauna/wendigo/normal
	icon_state = "wendigo_noblood"
	icon_living = "wendigo_noblood"
	icon_dead = "wendigo_dead"
	icon = 'mod_celadon/_storge_icons/icons/mobs/megafauna/64x64megafauna.dmi'
/*

Difficulty: VERY Hard

*/

/mob/living/simple_animal/hostile/megafauna/wendigo/blood
	name = "wendigo"
	desc = "A mythological man-eating legendary creature, you probably aren't going to survive this."
	health = 2500
	maxHealth = 2500
	armor = list("melee" = 40, "bullet" = 40, "laser" = 25, "energy" = 10, "bomb" = 50, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10)
	icon_state = "wendigo"
	icon_living = "wendigo"
	icon_dead = "wendigo_dead"
	icon = 'mod_celadon/_storge_icons/icons/mobs/megafauna/64x64megafauna.dmi'
	armour_penetration = 60
	melee_damage_lower = 60
	melee_damage_upper = 60
	vision_range = 12
	aggro_vision_range = 20
	speed = 12
	move_to_delay = 6
	rapid_melee = 18
	melee_queue_distance = 24
	guaranteed_butcher_results = list(/obj/item/wendigo_blood = 1, /obj/item/wendigo_skull = 1)
	/// Range for wendigo stomping when it moves
	stomp_range = 2
	/// Stores directions the mob is moving, then calls that a move has fully ended when these directions are removed in moved
	stored_move_dirs = 0		//WS edit - Whitesands

/mob/living/simple_animal/hostile/megafauna/wendigo/blood/Initialize(mapload)
	if (islist(armor))		//WS edit begin - Whitesands
		armor = getArmor(arglist(armor))
	else if (!armor)
		armor = getArmor()
	else if (!istype(armor, /datum/armor))
		stack_trace("Invalid type [armor.type] found in .armor during [src.type] Initialize()")		//WS edit begin - Whitesands

	. = ..()
	apply_status_effect(STATUS_EFFECT_CRUSHERDAMAGETRACKING)

/obj/item/wendigo_skull
	name = "wendigo skull"
	desc = "A bloody skull torn from a murderous beast, the soulless eye sockets seem to constantly track your movement."
	icon = 'mod_celadon/_storge_icons/icons/items/obj/artefacts.dmi'
	icon_state = "wendigo_skull"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0

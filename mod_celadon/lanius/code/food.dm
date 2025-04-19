// ration menu list for no reason
var/ration = list( /obj/item/stack/sheet/metal,
			/obj/item/stack/rods,
			/obj/item/stack/sheet/plasteel,
			/datum/reagent/iron,
			)

/datum/species/lanius/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	if(chem.type == /datum/reagent/iron)
		H.reagents.remove_reagent(chem.type, REAGENTS_METABOLISM)
		H.reagents.add_reagent(/datum/reagent/consumable/laniusin, REAGENTS_METABOLISM)
		return TRUE
	return ..()

/datum/reagent/consumable/laniusin // laniuses` nutirment only
	name = "Iron"
	description = "Pure iron is a metal."
	reagent_state = SOLID
	taste_description = "iron"
	material = /datum/material/iron
	color = "#606060"

	taste_mult = 1.5 // stop sugar drowning out other flavours
	nutriment_factor = 10 * REAGENTS_METABOLISM
	metabolization_rate = 2 * REAGENTS_METABOLISM
	taste_description = "sweetness"


/obj/item/stack/sheet/metal/attack(mob/living/M, mob/living/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(islanius(M))
		if(M.nutrition > (600))	// The more you eat - the more you can eat
			user.visible_message(span_warning("[user] cannot force any more of \the [src] to go down [user.p_their()] throat!"), span_warning("You cannot force any more of \the [src] to go down your throat!"))
			return FALSE
		playsound(M.loc,pick('mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud1_01.ogg',
		'mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud2_01.ogg',
		'mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud3_01.ogg'), rand(10,50), TRUE)
		SEND_SIGNAL(src, COMSIG_FOOD_EATEN, M, user)
		M.reagents.add_reagent(/datum/reagent/consumable/laniusin, 10)
		if(amount > 1)
			amount -= 1
			update_weight()
			update_appearance()
		else
			qdel(src)
		return TRUE


/obj/item/stack/rods/attack(mob/living/M, mob/living/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(islanius(M))
		if(M.nutrition > (600))	// The more you eat - the more you can eat
			user.visible_message(span_warning("[user] cannot force any more of \the [src] to go down [user.p_their()] throat!"), span_warning("You cannot force any more of \the [src] to go down your throat!"))
			return FALSE
		playsound(M.loc,pick('mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud1_01.ogg',
		'mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud2_01.ogg',
		'mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud3_01.ogg'), rand(10,50), TRUE)
		SEND_SIGNAL(src, COMSIG_FOOD_EATEN, M, user)
		M.reagents.add_reagent(/datum/reagent/consumable/laniusin, 5)
		if(amount > 1)
			amount -= 1
			update_weight()
			update_appearance()
		else
			qdel(src)
		return TRUE

/obj/item/stack/sheet/plasteel/attack(mob/living/M, mob/living/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()
	if(islanius(M))
		if(M.nutrition > (600))	// The more you eat - the more you can eat
			user.visible_message(span_warning("[user] cannot force any more of \the [src] to go down [user.p_their()] throat!"), span_warning("You cannot force any more of \the [src] to go down your throat!"))
			return FALSE
		playsound(M.loc,pick('mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud1_01.ogg',
		'mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud2_01.ogg',
		'mod_celadon/_storge_sounds/sound/lanius/bp_sfx_RockMan_Thud3_01.ogg'), rand(10,50), TRUE)
		SEND_SIGNAL(src, COMSIG_FOOD_EATEN, M, user)
		M.reagents.add_reagent(/datum/reagent/consumable/laniusin, 30)
		if(amount > 1)
			amount -= 1
			update_weight()
			update_appearance()
		else
			qdel(src)
		return TRUE


// АХТУНГИ!

/atom/movable/screen/alert/hungry/lanius
	icon = 'mod_celadon/_storge_icons/icons/lanius/screen_alert.dmi'
	name = "Hungry"
	desc = "Some food would be good right about now."
	icon_state = "hungry"


/atom/movable/screen/alert/starving/lanius
	icon = 'mod_celadon/_storge_icons/icons/lanius/screen_alert.dmi'
	name = "Starving"
	desc = "You're severely malnourished. The hunger pains make moving around a chore."
	icon_state = "starving"



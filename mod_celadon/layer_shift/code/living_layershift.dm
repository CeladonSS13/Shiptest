#define MOB_LAYER_SHIFT_INCREMENT 1
#define MOB_LAYER_MULTIPLIER 100
#define MOB_LAYER_SHIFT_MIN 3.95
#define MOB_LAYER_SHIFT_MAX 4.05
#define MOB_LAYER_BASE 4

/**
 * Shift the visual layer of the mob upwards
 */
/mob/living/proc/do_shift_layer_up()
	if(incapacitated(ignore_grab=TRUE))
		to_chat(src, span_warning("You can't do that right now!"))
		return FALSE

	if(layer >= MOB_LAYER_SHIFT_MAX)
		to_chat(src, span_warning("You cannot increase your layer priority any further."))
		return FALSE

	layer = min(((layer * MOB_LAYER_MULTIPLIER) + MOB_LAYER_SHIFT_INCREMENT) / MOB_LAYER_MULTIPLIER, MOB_LAYER_SHIFT_MAX)
	to_chat(src, span_notice("Your layer is now [layer]."))
	return TRUE

/**
 * Shift the visual layer of the mob downwards
 */
/mob/living/proc/do_shift_layer_down()
	if(incapacitated(ignore_grab=TRUE))
		to_chat(src, span_warning("You can't do that right now!"))
		return FALSE

	if(layer <= MOB_LAYER_SHIFT_MIN)
		to_chat(src, span_warning("You cannot decrease your layer priority any further."))
		return FALSE

	layer = max(((layer * MOB_LAYER_MULTIPLIER) - MOB_LAYER_SHIFT_INCREMENT) / MOB_LAYER_MULTIPLIER, MOB_LAYER_SHIFT_MIN)
	to_chat(src, span_notice("Your layer is now [layer]."))
	return TRUE

/**
 * Reset the visual layer of the mob to default
 */
/mob/living/proc/do_shift_layer_reset()
	if(incapacitated(ignore_grab=TRUE))
		to_chat(src, span_warning("You can't do that right now!"))
		return FALSE

	layer = initial(layer)
	to_chat(src, span_notice("Your layer has been reset to [layer]."))
	return TRUE

/mob/verb/shift_layer_up()
	set name = "Shift Layer Up"
	set category = "IC"
	if(isliving(src))
		var/mob/living/L = src
		L.do_shift_layer_up()

/mob/verb/shift_layer_down()
	set name = "Shift Layer Down"
	set category = "IC"
	if(isliving(src))
		var/mob/living/L = src
		L.do_shift_layer_down()

/mob/verb/shift_layer_reset()
	set name = "Shift Layer Reset"
	set category = "IC"
	if(isliving(src))
		var/mob/living/L = src
		L.do_shift_layer_reset()

// Emotes для быстрого доступа
/datum/emote/living/shift_layer_up
	key = "shiftlayerup"
	key_third_person = "shiftlayerup"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)
	cooldown = 0.25 SECONDS

/datum/emote/living/shift_layer_up/run_emote(mob/user, params, type_override, intentional)
	if(!can_run_emote(user))
		to_chat(user, span_warning("You can't change layer at this time."))
		return FALSE

	var/mob/living/layer_shifter = user
	return layer_shifter.do_shift_layer_up()

/datum/emote/living/shift_layer_down
	key = "shiftlayerdown"
	key_third_person = "shiftlayerdown"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)
	cooldown = 0.25 SECONDS

/datum/emote/living/shift_layer_down/run_emote(mob/user, params, type_override, intentional)
	if(!can_run_emote(user))
		to_chat(user, span_warning("You can't change layer at this time."))
		return FALSE

	var/mob/living/layer_shifter = user
	return layer_shifter.do_shift_layer_down()

/datum/emote/living/shift_layer_reset
	key = "resetlayer"
	key_third_person = "resetlayer"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)
	cooldown = 0.25 SECONDS

/datum/emote/living/shift_layer_reset/run_emote(mob/user, params, type_override, intentional)
	if(!can_run_emote(user))
		to_chat(user, span_warning("You can't change layer at this time."))
		return FALSE

	var/mob/living/layer_shifter = user
	return layer_shifter.do_shift_layer_reset()

#undef MOB_LAYER_SHIFT_INCREMENT
#undef MOB_LAYER_MULTIPLIER
#undef MOB_LAYER_SHIFT_MIN
#undef MOB_LAYER_SHIFT_MAX
#undef MOB_LAYER_BASE

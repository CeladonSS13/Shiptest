// Firebot
/mob/living/simple_animal/bot/firebot/firebotmk2
	icon = 'mod_celadon/_storge_icons/icons/mobs/aibots.dmi'

//Cleanbot
/mob/living/simple_animal/bot/cleanbot/cleanbotmk2
	icon = 'mod_celadon/_storge_icons/icons/mobs/aibots.dmi'

//Floorbot
/mob/living/simple_animal/bot/floorbot/floorbotmk2
	icon = 'mod_celadon/_storge_icons/icons/mobs/aibots.dmi'

// Medcat
/mob/living/simple_animal/bot/medbot/catmedbot
	name = "\improper MediKitty"
	desc = "A little medical feline. He meows as he swings his syringe."
	icon = 'mod_celadon/_storge_icons/icons/mobs/catmedbot.dmi'

/mob/living/simple_animal/bot/medbot/catmedbot/update_icon()
	. = ..()
	cut_overlays()
	if(stationary_mode)//we add the stationary_suffix to the screen state name, if not dont add anythiung
		stationary_suffix = "_stationary"

	icon_state = "[base_icon_state][stationary_suffix]"

	if(on)
		icon_state = "[base_icon_state][stationary_suffix]_idle"

	if(HAS_TRAIT(src, TRAIT_INCAPACITATED))
		icon_state = "[base_icon_state][stationary_suffix]_stunned"

	if(mode == BOT_HEALING)
		icon_state = "[base_icon_state][stationary_suffix]_base_healing"

		if(declare_cooldown > world.time) //when the crit patient alert cooldown is going on, we show the other healing screen
			icon_state = "[base_icon_state][stationary_suffix]_critical"
		else
			icon_state = "[base_icon_state][stationary_suffix]_healing"

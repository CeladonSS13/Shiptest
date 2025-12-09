/datum/emote/living/carbon/human/riol/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE

	if (!isriol(user))
		return FALSE

	return TRUE

/datum/emote/living/carbon/human/riol/purr
	key = "fox_purr"
	key_third_person = "fox_purr"
	message = "урчит."
	message_param = "урчит на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	vary = TRUE
	cooldown = 2 SECONDS

/datum/emote/living/carbon/human/riol/purr/get_sound(mob/living/user)
	return 'mod_celadon/_storage_sounds/sound/fox_purr.ogg'

/datum/emote/living/carbon/human/riol/yip
	key = "yip"
	key_third_person = "yips"
	message = "тявкает!"
	message_param = "тявкает на %t."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/human/riol/yip/get_sound(mob/living/user)
	return 'mod_celadon/_storage_sounds/sound/fox_squeak.ogg'

/datum/emote/living/carbon/human/riol/fwhine
	key = "fwhine"
	key_third_person = "whines"
	message = "скулит."
	message_param = "скулит на %t."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)
	cooldown = 5 SECONDS

/datum/emote/living/carbon/human/riol/fwhine/get_sound(mob/living/user)
	return pick('mod_celadon/_storage_sounds/sound/fox1.ogg',
				'mod_celadon/_storage_sounds/sound/fox2.ogg',
				'mod_celadon/_storage_sounds/sound/fox3.ogg',
				'mod_celadon/_storage_sounds/sound/fox4.ogg',
				'mod_celadon/_storage_sounds/sound/fox5.ogg',
				'mod_celadon/_storage_sounds/sound/fox6.ogg',
				'mod_celadon/_storage_sounds/sound/fox7.ogg',
				'mod_celadon/_storage_sounds/sound/fox8.ogg',
				'mod_celadon/_storage_sounds/sound/fox9.ogg',
				'mod_celadon/_storage_sounds/sound/fox10.ogg',
				'mod_celadon/_storage_sounds/sound/fox11.ogg',
				'mod_celadon/_storage_sounds/sound/fox12.ogg',
				'mod_celadon/_storage_sounds/sound/fox13.ogg')

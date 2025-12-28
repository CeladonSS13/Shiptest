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
	return 'mod_celadon/_storage_sounds/sound/voice/riol/riol_purr.ogg'

/datum/emote/living/carbon/human/riol/yip
	key = "yip"
	key_third_person = "yips"
	message = "тявкает!"
	message_param = "тявкает на %t."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/human/riol/yip/get_sound(mob/living/user)
	return 'mod_celadon/_storage_sounds/sound/voice/riol/riol_squeak.ogg'

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
	return pick('mod_celadon/_storage_sounds/sound/voice/riol/riol1.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol2.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol3.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol4.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol5.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol6.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol7.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol8.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol9.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol10.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol11.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol12.ogg',
				'mod_celadon/_storage_sounds/sound/voice/riol/riol13.ogg')

/datum/emote/living/carbon/human/riol/howl
	key = "howl"
	key_third_person = "howls"
	message = "воет."
	message_mime = "делает вид, что воет."
	message_param = "воет на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE
	cooldown = 10 SECONDS

/datum/emote/living/carbon/human/riol/howl/get_sound(mob/living/user)
	return 'mod_celadon/_storage_sounds/sound/riol/howl.ogg'

/datum/emote/living/carbon/human/riol/growl
	key = "growl"
	key_third_person = "growls"
	message = "рычит."
	message_mime = "бусшумно рычит."
	message_param = "рычит на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_VISIBLE

/datum/emote/living/carbon/human/riol/growl/get_sound(mob/living/user)
	return pick(
		'mod_celadon/_storage_sounds/sound/riol/growl1.ogg',
		'mod_celadon/_storage_sounds/sound/riol/growl2.ogg',
		'mod_celadon/_storage_sounds/sound/riol/growl3.ogg',
	)

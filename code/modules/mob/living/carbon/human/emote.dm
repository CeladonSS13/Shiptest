/datum/emote/living/carbon/human
	mob_type_allowed_typecache = list(/mob/living/carbon/human)

/datum/emote/living/carbon/human/cry
	key = "cry"
	key_third_person = "cries"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "cries." // CELADON-EDIT - ORIGINAL
	message = "плачет."
	// [/CELADON-EDIT]
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/dap
	key = "dap"
	key_third_person = "daps"
	message = "sadly can't find anybody to give daps to, and daps themself. Shameful."
	message_param = "give daps to %t."
	hands_use_check = TRUE

/datum/emote/living/carbon/human/eyebrow
	key = "eyebrow"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "raises an eyebrow." // CELADON-EDIT - ORIGINAL
	message = "приподнимает бровь."
	// [/CELADON-EDIT]

/datum/emote/living/carbon/human/grumble
	key = "grumble"
	key_third_person = "grumbles"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "grumbles!" // CELADON-EDIT - ORIGINAL
	message = "ворчит!"
	// [/CELADON-EDIT]
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/handshake
	key = "handshake"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "shakes their own hands."
	// message_param = "shakes hands with %t." // CELADON-EDIT - ORIGINAL
	message = "пожимает руку."
	message_param = "пожимает руку %t."
	// [/CELADON-EDIT]
	hands_use_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/hug
	key = "hug"
	key_third_person = "hugs"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "hugs themself." // CELADON-EDIT - ORIGINAL
	// message_param = "hugs %t." // CELADON-EDIT - ORIGINAL
	message = "обнимает себя."
	message_param = "обнимает %t."
	// [/CELADON-EDIT]
	hands_use_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/mumble
	key = "mumble"
	key_third_person = "mumbles"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "mumbles!" // CELADON-EDIT - ORIGINAL
	message = "бормочет!"
	// [/CELADON-EDIT]
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/scream
	key = "scream"
	key_third_person = "screams"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "screams!" // CELADON-EDIT - ORIGINAL
	message = "кричит!"
	// [/CELADON-EDIT]
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/human/scream/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.mind?.miming)
		return
	if(ishumanbasic(H))
		if(user.gender == FEMALE)
			return pick('sound/voice/human/femalescream_1.ogg', 'sound/voice/human/femalescream_2.ogg', 'sound/voice/human/femalescream_3.ogg', 'sound/voice/human/femalescream_4.ogg', 'sound/voice/human/femalescream_5.ogg')
		else
			if(prob(1))
				return 'sound/voice/human/wilhelm_scream.ogg'
			return pick('sound/voice/human/malescream_1.ogg', 'sound/voice/human/malescream_2.ogg', 'sound/voice/human/malescream_3.ogg', 'sound/voice/human/malescream_4.ogg', 'sound/voice/human/malescream_5.ogg', 'sound/voice/human/malescream_6.ogg')
	else if(ismoth(H))
		return 'sound/voice/moth/scream_moth.ogg'
	else if(isvox(H))
		return 'sound/voice/vox/vox_scream_1.ogg'
	else if(islizard(H))
		return pick('sound/voice/lizard/lizard_scream_1.ogg', 'sound/voice/lizard/lizard_scream_2.ogg', 'sound/voice/lizard/lizard_scream_3.ogg', 'sound/voice/lizard/lizard_scream_4.ogg')

// [CELADON-REMOVE] - CELADON_EMOTES - Перемещено в пак Эмоутов
// /datum/emote/living/carbon/human/hiss //lizard
// 	key = "hiss"
// 	key_third_person = "hisses"
// 	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
// 	// message = "hisses!" // CELADON-EDIT - ORIGINAL
// 	message = "шипит!"
// 	// [/CELADON-EDIT]
// 	emote_type = EMOTE_AUDIBLE
// 	vary = TRUE

// /datum/emote/living/carbon/human/hiss/get_sound(mob/living/user)
// 	if(!ishuman(user))
// 		return
// 	if(islizard(user))
// 		return 'sound/voice/lizard/hiss.ogg'
// [/CELADON-REMOVE]

/datum/emote/living/carbon/human/squeal //lizard
	key = "squeal"
	key_third_person = "squeals"
	message = "squeals!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/human/squeal/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(islizard(user))
		return 'sound/voice/lizard/squeal.ogg' //This is from Bay

/datum/emote/living/carbon/human/tailthump //lizard + vox
	key = "thump"
	key_third_person = "thumps their tail"
	message = "thumps their tail!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/human/tailthump/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(!isnull(user.getorgan(/obj/item/organ/tail)) || (isvox(user)))
		return 'sound/voice/lizard/tailthump.ogg' //https://freesound.org/people/TylerAM/sounds/389665/

/datum/emote/living/carbon/human/weh //lizard
	key = "weh"
	key_third_person = "lets out a weh"
	message = "lets out a weh!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/human/weh/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(islizard(user))
		return 'sound/voice/lizard/weh.ogg'

/datum/emote/living/carbon/human/pale
	key = "pale"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "goes pale for a second." // CELADON-EDIT - ORIGINAL
	message = "бледнеет."
	// [/CELADON-EDIT]

/datum/emote/living/carbon/human/raise
	key = "raise"
	key_third_person = "raises"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "raises a hand." // CELADON-EDIT - ORIGINAL
	message = "поднимает руку."
	// [/CELADON-EDIT]
	hands_use_check = TRUE

/datum/emote/living/carbon/human/salute
	key = "salute"
	key_third_person = "salutes"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "salutes." // CELADON-EDIT - ORIGINAL
	// message_param = "salutes to %t." // CELADON-EDIT - ORIGINAL
	message = "салютует."
	message_param = "салютует %t."
	var/list/serious_shoes = list(
								/obj/item/clothing/shoes/jackboots,
								/obj/item/clothing/shoes/combat,
								/obj/item/clothing/shoes/laceup)
								// /obj/item/clothing/shoes/centcom,
	var/list/funny_shoes = list(
								/obj/item/clothing/shoes/magboots/clown,
								/obj/item/clothing/shoes/clown_shoes)
								// /obj/item/clothing/shoes/cursedclown,
								// /obj/item/clothing/shoes/ducky)
	// [/CELADON-EDIT]
	hands_use_check = TRUE

/datum/emote/living/carbon/human/shrug
	key = "shrug"
	key_third_person = "shrugs"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "shrugs." // CELADON-EDIT - ORIGINAL
	message = "пожимает плечами."
	// [/CELADON-EDIT]

/datum/emote/living/carbon/human/wag
	key = "wag"
	key_third_person = "wags"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "wags their tail." // CELADON-EDIT - ORIGINAL
	message = "начинает махать хвостом."
	// [/CELADON-EDIT]

// [CELADON-ADD] - CELADON_EMOTES
/datum/emote/living/carbon/human/proc/can_wag(mob/user)
	var/mob/living/carbon/human/H = user
	if(!(H.dna.species.bodyflags & TAIL_WAGGING))
		return FALSE
	var/obscured = H.wear_suit && (H.wear_suit.flags_inv & HIDETAIL)
	if(!istype(H))
		return FALSE
	// if(istype(H.sprite, /datum/sprite_accessory/tails)) // Требуется реализовать маркинги хвостов для этого
	// 	if(!H.body_accessory.try_restrictions(user))
	// 		return FALSE

	if(H.dna.species.bodyflags & TAIL_WAGGING && obscured)
		return FALSE

	return TRUE
// [/CELADON-ADD]

/datum/emote/living/carbon/human/wag/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/H = user
	if(!istype(H) || !H.dna || !H.dna.species || !H.dna.species.can_wag_tail(H))
		return
	// [CELADON-ADD] - CELADON_FIX_TAIL
	if(H.wear_suit && (H.wear_suit.flags_inv & HIDETAIL))
		return
	// [/CELADON-ADD]
	if(!H.dna.species.is_wagging_tail())
		H.dna.species.start_wagging_tail(H)
	else
		H.dna.species.stop_wagging_tail(H)

/datum/emote/living/carbon/human/wag/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	return H.dna && H.dna.species && H.dna.species.can_wag_tail(user)

/datum/emote/living/carbon/human/wag/select_message_type(mob/user, intentional)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.dna || !H.dna.species)
		return
	if(H.dna.species.is_wagging_tail())
		. = null

/datum/emote/living/carbon/human/wing
	key = "wing"
	key_third_person = "wings"
	message = "their wings."

/datum/emote/living/carbon/human/wing/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(.)
		var/mob/living/carbon/human/H = user
		if(findtext(select_message_type(user,intentional), "open"))
			H.OpenWings()
		else
			H.CloseWings()

/datum/emote/living/carbon/human/wing/select_message_type(mob/user, intentional)
	. = ..()
	var/mob/living/carbon/human/H = user
	if("wings" in H.dna.species.mutant_bodyparts)
		. = "opens " + message
	else
		. = "closes " + message

/datum/emote/living/carbon/human/wing/can_run_emote(mob/user, status_check = TRUE, intentional)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	if(H.dna && H.dna.species && (H.dna.features["wings"] != "None"))
		return TRUE

/mob/living/carbon/human/proc/OpenWings()
	if(!dna || !dna.species)
		return
	if("wings" in dna.species.mutant_bodyparts)
		dna.species.mutant_bodyparts -= "wings"
		dna.species.mutant_bodyparts |= "wingsopen"
	update_body()

/mob/living/carbon/human/proc/CloseWings()
	if(!dna || !dna.species)
		return
	if("wingsopen" in dna.species.mutant_bodyparts)
		dna.species.mutant_bodyparts -= "wingsopen"
		dna.species.mutant_bodyparts |= "wings"
	update_body()
	if(isturf(loc))
		var/turf/T = loc
		T.Entered(src)

// Robotic Tongue emotes. Beep!

/datum/emote/living/carbon/human/robot_tongue/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE
	var/obj/item/organ/tongue/T = user.getorganslot("tongue")
	if(T.status == ORGAN_ROBOTIC)
		return TRUE

/datum/emote/living/carbon/human/robot_tongue/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "beeps at %t."

/datum/emote/living/carbon/human/robot_tongue/beep/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/twobeep.ogg', 50)

/datum/emote/living/carbon/human/robot_tongue/buzz
	key = "buzz"
	key_third_person = "buzzes"
	message = "buzzes."
	message_param = "buzzes at %t."

/datum/emote/living/carbon/human/robot_tongue/buzz/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/buzz-sigh.ogg', 50)

/datum/emote/living/carbon/human/robot_tongue/buzz2
	key = "buzz2"
	message = "buzzes twice."

/datum/emote/living/carbon/human/robot_tongue/buzz2/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/buzz-two.ogg', 50)

/datum/emote/living/carbon/human/robot_tongue/chime
	key = "chime"
	key_third_person = "chimes"
	message = "chimes."

/datum/emote/living/carbon/human/robot_tongue/chime/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/chime.ogg', 50)

/datum/emote/living/carbon/human/robot_tongue/no
	key = "no"
	key_third_person = "no"
	message = "emits an negative blip."

/datum/emote/living/carbon/human/robot_tongue/no/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/synth_no.ogg', 50)

/datum/emote/living/carbon/human/robot_tongue/ping
	key = "ping"
	key_third_person = "pings"
	message = "pings."
	message_param = "pings at %t."

/datum/emote/living/carbon/human/robot_tongue/ping/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/ping.ogg', 50)

/datum/emote/living/carbon/human/robot_tongue/warn
	key = "warn"
	key_third_person = "warn"
	message = "blares an alarm!"

/datum/emote/living/carbon/human/robot_tongue/warn/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/warning-buzzer.ogg', 50)

/datum/emote/living/carbon/human/robot_tongue/yes
	key = "yes"
	key_third_person = "yes"
	message = "emits an affirmative blip."

/datum/emote/living/carbon/human/robot_tongue/yes/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/machines/synth_yes.ogg', 50)

// the following emote were originally clown-locked and synthetic exclusive
// since clowns have been removed I see no reason to let it collect dust

/datum/emote/living/carbon/human/robot_tongue/sad
	key = "sad"
	key_third_person = "plays a sad trombone..."
	message = "plays a sad trombone..."

/datum/emote/living/carbon/human/robot_tongue/sad/run_emote(mob/user, params)
	. = ..()
	if(.)
		playsound(user.loc, 'sound/misc/sadtrombone.ogg', 50)

//kepi (plus one vox i guess)

/datum/emote/living/carbon/human/kepiclick
	key = "click"
	key_third_person = "clicks"
	message = "clicks."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/kepiclick/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(iskepori(user) || (isvox(user)))
		return 'sound/voice/kepori/kepiclick.ogg' //https://freesound.org/people/Ambiabstract/sounds/584212/

/datum/emote/living/carbon/human/kepiwhistle
	key = "whistle"
	key_third_person = "whistles"
	// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
	// message = "whistles!"	// CELADON-EDIT - ORIGINAL
	message = "свистит!"
	// [/CELADON-EDIT]
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/human/kepiwhistle/get_sound(mob/living/user)
	if(!ishuman(user))
		// [CELADON-EDIT] - CELADON_COMPONENTS_EMOTE - Эмоции
		// return	// CELADON-EDIT - ORIGINAL
		return 'mod_celadon/_storge_sounds/sound/emotes/whistle.ogg'
		// [/CELADON-EDIT]
	if(iskepori(user))
		return 'sound/voice/kepori/kepiwhistle.ogg' //https://freesound.org/people/Andreas.Mustola/sounds/338277/

/datum/emote/living/carbon/human/kepiwoop // i have yet to find a woop sound that doesnt suck i will do it later
	key = "woop"
	key_third_person = "woops"
	message = "woops!"
	emote_type = EMOTE_AUDIBLE

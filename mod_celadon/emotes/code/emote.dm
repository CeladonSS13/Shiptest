/datum/emote
	cooldown = 1.5 SECONDS
	// audio_cooldown = 3 SECONDS

//////////////////////
/// Living Emotes ///
////////////////////


/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = /mob/living
	mob_type_blacklist_typecache = list(/mob/living/simple_animal/slime, /mob/living/brain)
	message_postfix = "at %t."


/// The time it takes for the blush visual to be removed
#define BLUSH_DURATION 5.2 SECONDS

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "краснеет."
	emote_type = EMOTE_VISIBLE
	/// Timer for the blush visual to wear off
	var/blush_timer = TIMER_ID_NULL

/datum/emote/living/blush/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/living_user = user
		ADD_TRAIT(living_user, TRAIT_BLUSHING, "[type]")
		living_user.update_body()

		// Use a timer to remove the blush effect after the BLUSH_DURATION has passed
		var/list/key_emotes = GLOB.emote_list["blush"]
		for(var/datum/emote/living/blush/living_emote in key_emotes)
			// The existing timer restarts if it's already running
			blush_timer = addtimer(CALLBACK(living_emote, PROC_REF(end_blush), living_user), BLUSH_DURATION, TIMER_UNIQUE | TIMER_OVERRIDE)

/datum/emote/living/blush/proc/end_blush(mob/living/living_user)
	if(!QDELETED(living_user))
		REMOVE_TRAIT(living_user, TRAIT_BLUSHING, "[type]")
		living_user.update_body()

#undef BLUSH_DURATION

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "кланяется."
	message_param = "делает поклон в сторону %t."
	emote_type = EMOTE_VISIBLE
	hands_use_check = TRUE

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "рыгает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "давится!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "скрещивает руки перед собой."
	emote_type = EMOTE_VISIBLE
	hands_use_check = TRUE

/datum/emote/living/carbon/mothchitter
	key = "chitter"
	key_third_person = "chitters"
	message = "жужит."
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/mothchitter/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(ismoth(H) | (istype(H, /mob/living/simple_animal/pet/mothroach)))
		return 'mod_celadon/_storge_sounds/sound/voice/moth/mothchitter.ogg'

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "усмехается."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "спотыкается и падает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашляет!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE , intentional)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_SOOTHED_THROAT))
		return FALSE

/datum/emote/living/cough/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/cough_female_1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/cough_female_2.ogg')
		return pick(
			'mod_celadon/_storge_sounds/sound/voice/cough_male_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/cough_male_2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/cough_male_3.ogg')
	return ..()

// /datum/emote/living/carbon/human/cry/get_sound(mob/living/user)
// 	if(!ishuman(user))
// 		return
// 	if(ishuman(user))
// 		if(user.gender == FEMALE)
// 			return pick(
// 				'mod_celadon/_storge_sounds/sound/voice/cry_female_1.ogg',
// 				'mod_celadon/_storge_sounds/sound/voice/cry_female_2.ogg',
// 				'mod_celadon/_storge_sounds/sound/voice/cry_female_3.ogg')
// 		return pick(
// 			'mod_celadon/_storge_sounds/sound/voice/cry_male_1.ogg',
// 			'mod_celadon/_storge_sounds/sound/voice/cry_male_1.ogg')
// 	return ..()

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "счастливо танцует."
	emote_type = EMOTE_VISIBLE
	hands_use_check = TRUE
	cooldown = 5 SECONDS

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "seizes up and falls limp, their eyes dead and lifeless..."
	message_robot = "shudders violently for a moment before falling still, its eyes slowly darkening."
	message_AI = "screeches, its screen flickering as its systems slowly halt."
	message_alien = "lets out a waning guttural screech, and collapses onto the floor..."
	message_larva = "lets out a sickly hiss of air and falls limply to the floor..."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_ipc = "gives one shrill beep before falling limp, their monitor flashing blue before completely shutting off..."
	message_simple =  "stops moving..."
	cooldown = (15 SECONDS)
	stat_allowed = HARD_CRIT

/datum/emote/living/deathgasp/run_emote(mob/user, params, type_override, intentional)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)

	if(. && user.deathsound)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || L.oxyloss >= 50)
				return //stop the sound if oxyloss too high/cant speak
		playsound(user, user.deathsound, 200, TRUE, TRUE)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "пускает слюни."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "теряет сознание и падает!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/faint/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.set_sleeping(200)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "взмахивает крыльями."
	emote_type = EMOTE_AUDIBLE
	hands_use_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if("wingsopen" in H.dna.species.mutant_bodyparts)
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? TYPE_PROC_REF(/mob/living/carbon/human, OpenWings) : TYPE_PROC_REF(/mob/living/carbon/human, CloseWings)), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "яростно взмахивает крыльями!"
	emote_type = EMOTE_AUDIBLE
	hands_use_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "смотрит в недоумении."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "давится."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gag/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/gag/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user
	if(!H.mind || !H.mind.miming)
		if(user.gender == FEMALE)
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female2.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female3.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female4.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female5.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female6.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female7.ogg')
		else
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male2.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male3.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male4.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male5.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male6.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male7.ogg')
	if(ismoth(H))
		return 'mod_celadon/_storge_sounds/sound/voice/human/gasp_female3.ogg'


/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "задыхается!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = HARD_CRIT

/datum/emote/living/gasp/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/gasp/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user
	if(!H.mind || !H.mind.miming)
		if(user.gender == FEMALE)
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female2.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female3.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female4.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female5.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female6.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_female7.ogg')
		else
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male2.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male3.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male4.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male5.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male6.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/gasp_male7.ogg')
	if(ismoth(H))
		return 'mod_celadon/_storge_sounds/sound/voice/human/gasp_female3.ogg'

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "хихикает."
	message_mime = "тихо хихикает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/giggle/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/giggle_female_1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/giggle_female_2.ogg',
				'mod_celadon/_storge_sounds/sound/voice/giggle_female_3.ogg')
		return pick(
			'mod_celadon/_storge_sounds/sound/voice/giggle_male_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/giggle_male_2.ogg')
	return ..()

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "смотрит с ненавистью."
	message_param = "смотрит с ненавистью на %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "оскаливается в улыбке."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "болезненно вздыхает!"
	message_mime = "издаёт болезненный вздох!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/groan/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/moan_female_1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/moan_female_2.ogg',
				'mod_celadon/_storge_sounds/sound/voice/moan_female_3.ogg')
		return pick(
			'mod_celadon/_storge_sounds/sound/voice/moan_male_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/moan_male_2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/moan_male_3.ogg')
	return ..()

/datum/emote/living/growl
	key = "growl"
	key_third_person = "growls"
	message = "рычит!"
	message_mime = "тихо рычит!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "корчит рожу."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "прыгает!"
	emote_type = EMOTE_AUDIBLE
	hands_use_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/kiss/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/kiss_type = /obj/item/kisser

	if(HAS_TRAIT(user, TRAIT_KISS_OF_DEATH))
		kiss_type = /obj/item/kisser/death

	var/obj/item/kiss_blower = new kiss_type(user)
	if(user.put_in_hands(kiss_blower))
		to_chat(user, span_notice("Вы приготовили свою руку для воздушного поцелуя."))
	else
		qdel(kiss_blower)
		to_chat(user, span_warning("В таком состоянии ты не можешь послать воздушный поцелуй."))

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "смеётся."
	message_mime = "тихо смеётся!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/laugh/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user
	if(!H.mind || !H.mind.miming)
		if(user.gender == FEMALE)
			return 'mod_celadon/_storge_sounds/sound/voice/human/womanlaugh.ogg'
		else
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/human/manlaugh1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/human/manlaugh2.ogg')
	if(ismoth(H))
		return 'mod_celadon/_storge_sounds/sound/voice/moth/mothlaugh.ogg'

/datum/emote/living/laugh_evil
	key = "laugh_evil"
	key_third_person = "laughs_evil"
	message = "Злорадно смеётся."
	message_mime = "тихо злорадно смеётся!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/laugh_evil/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh_evil/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user
	if(ismoth(H))
		return 'mod_celadon/_storge_sounds/sound/voice/moth/mothlaugh.ogg'
	if(!H.mind || !H.mind.miming)
		if(user.gender == FEMALE)
			return pick(
				'mod_celadon/_storge_sounds/sound/emotes/female/laugh_f1.ogg',
				'mod_celadon/_storge_sounds/sound/emotes/female/laugh_f2.ogg')
		else
			return pick(
				'mod_celadon/_storge_sounds/sound/emotes/male/laugh_m1.ogg',
				'mod_celadon/_storge_sounds/sound/emotes/male/laugh_m2.ogg')


/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "смотрит."
	message_param = "смотрит на %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "кивает."
	message_param = "кивает в сторону %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/carbon/mothsqueak
	key = "msqueak"
	key_third_person = "lets out a tiny squeak"
	message = "издает тихий писк!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/carbon/mothsqueak/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(ismoth(H) | (istype(H, /mob/living/simple_animal/pet/mothroach)))
		return 'mod_celadon/_storge_sounds/sound/voice/moth/mothsqueak.ogg'

/datum/emote/living/peace
	key = "peace"
	key_third_person = "peaces"
	message = "выставляет два пальца перед собой, символизируя Знак Мира!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "показывает."
	message_param = "показывает на %t."
	emote_type = EMOTE_VISIBLE
	hands_use_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params, type_override, intentional)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.usable_hands == 0)
			if(H.usable_legs != 0)
				message_param = "пытается показать на %t с помощью ноги, но теряет баланс и <span class='userdanger'>падает на землю</span>!"
				H.Paralyze(20)
			else
				message_param = "<span class='userdanger'>[user.p_their()] ударяется головой об землю</span> пытаясь двигаться в сторону %t."
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "обижено дуется."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит."
	message_mime = "пытается крикнуть!"
	emote_type = EMOTE_AUDIBLE
	mob_type_blacklist_typecache = list(/mob/living/carbon/human) //Humans get specialized scream.

/datum/emote/living/scream/select_message_type(mob/user, intentional)
	. = ..()
	if(!intentional && isanimal(user))
		return "издает болезненное хныканье."

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "хмурится."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "мотает головой."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/shame
	key = "shame"
	key_third_person = "shames"
	message = "испытывает сильный стыд."

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "дрожит!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick('mod_celadon/_storge_sounds/sound/voice/sigh_female.ogg')
		return pick('mod_celadon/_storge_sounds/sound/voice/sigh_male.ogg', 'mod_celadon/_storge_sounds/sound/voice/sigh_male.ogg')
	return ..()

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "присаживается."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/surprised
	key = "surprised"
	key_third_person = "surpriseds"
	message = "удивлённо смотрит."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбается."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "чихает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sneeze/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick('mod_celadon/_storge_sounds/sound/voice/sneeze_female.ogg')
		return pick('mod_celadon/_storge_sounds/sound/voice/sneeze.ogg')
	return ..()

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "гордо откидывает голову в сторону, выражая самодовольство."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "Шмыгает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sniff/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick('mod_celadon/_storge_sounds/sound/emotes/female/sniff_female.ogg')
		else
			return pick('mod_celadon/_storge_sounds/sound/emotes/male/male_sniff.ogg')

	// if(ishuman(user))
	// 	if(user.gender == FEMALE)
	// 		return pick('mod_celadon/_storge_sounds/sound/voice/sniff_female.ogg')
	// 	return pick('mod_celadon/_storge_sounds/sound/voice/sniff_male.ogg')
	return ..()

#define SNORE_DURATION 5.2 SECONDS

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "храпит."
	message_mime = "крепко спит."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS
	/// Timer for the blink to wear off
	var/snore_timer = TIMER_ID_NULL

/datum/emote/living/snore/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/living_user = user
		ADD_TRAIT(living_user, TRAIT_SNORE, "[type]")
		living_user.update_body()

		// Use a timer to remove the closed eyes after the SNORE_DURATION has passed
		var/list/key_emotes = GLOB.emote_list["snore"]
		for(var/datum/emote/living/snore/living_emote in key_emotes)
			// The existing timer restarts if it's already running
			snore_timer = addtimer(CALLBACK(living_emote, PROC_REF(end_snore), living_user), SNORE_DURATION, TIMER_UNIQUE | TIMER_OVERRIDE)

/datum/emote/living/snore/proc/end_snore(mob/living/living_user)
	if(!QDELETED(living_user))
		REMOVE_TRAIT(living_user, TRAIT_SNORE, "[type]")
		living_user.update_body()

/datum/emote/living/snore/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		return pick(
			'mod_celadon/_storge_sounds/sound/voice/snore_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/snore_2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/snore_3.ogg',
			'mod_celadon/_storge_sounds/sound/voice/snore_4.ogg',
			'mod_celadon/_storge_sounds/sound/voice/snore_5.ogg',
			'mod_celadon/_storge_sounds/sound/voice/snore_6.ogg',
			'mod_celadon/_storge_sounds/sound/voice/snore_7.ogg')
	return ..()

#undef SNORE_DURATION

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "пялится."
	message_param = "пялится на %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/strech
	key = "strech"
	key_third_person = "strechs"
	message = "потягивается."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "сильно сердится."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "сдаётся! Падает на землю, закидывая руки за свою голову."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Paralyze(200)
		L.remove_status_effect(STATUS_EFFECT_SURRENDER)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "головокружительно кружится."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "дрожит в ужасе!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "сильно дёргается."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "дёргается."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "машет."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "хнычет."
	message_mime = "делает вид, словно плачет."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "слегка улыбается."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/wing
	key = "wing"
	key_third_person = "wings"
	message = "подмигивает."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/yawn/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick(
				'mod_celadon/_storge_sounds/sound/voice/yawn_female_1.ogg',
				'mod_celadon/_storge_sounds/sound/voice/yawn_female_2.ogg',
				'mod_celadon/_storge_sounds/sound/voice/yawn_female_3.ogg')
		return pick(
			'mod_celadon/_storge_sounds/sound/voice/yawn_male_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/yawn_male_2.ogg')
	return ..()

/datum/emote/living/gurgle
	key = "gurgle"
	key_third_person = "gurgles"
	message = "издает неприятное хлюпанье."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/can_run_emote(mob/user, status_check, intentional)
	. = ..() && intentional

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null, intentional = FALSE)
	if(!can_run_emote(user, TRUE, intentional))
		return FALSE
	if(is_banned_from(user.ckey, "Emote"))
		to_chat(user, "<span class='boldwarning'>You cannot send custom emotes (banned).</span>")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "<span class='boldwarning'>You cannot send IC messages (muted).</span>")
		return FALSE
	else if(params == ".")
		var/custom_emote = copytext(sanitize(input("Choose an emote to display.") as text|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Unable to use this emote, must be either hearable or visible.")
					return
			message = user.say_emphasis(custom_emote)
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params, type_override, intentional)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	for(var/key in GLOB.emote_list)
		for(var/datum/emote/P in GLOB.emote_list[key])
			if(P.key in keys)
				continue
			if(P.can_run_emote(user, status_check = FALSE , intentional = TRUE))
				keys += P.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "beeps at %t."
	sound = 'sound/machines/twobeep.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon)

/datum/emote/inhale
	key = "inhale"
	key_third_person = "inhales"
	message = "делает вдох."

/datum/emote/exhale
	key = "exhale"
	key_third_person = "exhales"
	message = "выдыхает."

/datum/emote/living/clack
	key = "clack"
	key_third_person = "clacks"
	message = "щёлкает челюстью."
	emote_type = EMOTE_AUDIBLE

// /datum/emote/living/hoot
// 	key = "hoot"
// 	key_third_person = "hoots"
// 	message = "свистит!"
// 	message_mime = "издаёт тихий свист!"
// 	emote_type = EMOTE_AUDIBLE

// /datum/emote/living/hoot/get_sound(mob/living/user)
// 	if(!ishuman(user))
// 		return pick('mod_celadon/_storge_sounds/sound/emotes/whistle.ogg')
// 	// if(ishuman(user))
// 	return pick('mod_celadon/_storge_sounds/sound/voice/whistle.ogg')
// 	// return ..()

/datum/emote/living/warcray
	key = "warcray"
	key_third_person = "warcray"
	message = "издаёт вдохновляющий крик!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/warcray/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/warcray/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user
	if(!H.mind || !H.mind.miming)
		if(user.gender == FEMALE)
			return pick(
			'mod_celadon/_storge_sounds/sound/voice/human_female_warcry_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_female_warcry_2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_female_warcry_3.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_female_warcry_4.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_female_warcry_5.ogg')
		else
			return pick(
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_3.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_4.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_5.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_6.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_7.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_8.ogg',
			'mod_celadon/_storge_sounds/sound/voice/human_male_warcry_9.ogg')
	if(ismoth(H))
		if(prob(3))
			message = "издаёт вдохновляющий крик!"
			return 'mod_celadon/_storge_sounds/sound/voice/alastor_attack1-attackvoice.ogg'
		else
			message = "издаёт вдохновляющий крик!"
			return pick(
			'mod_celadon/_storge_sounds/sound/voice/alastor_wing1.ogg',
			'mod_celadon/_storge_sounds/sound/voice/alastor_wing1_2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/alastor_wing2.ogg',
			'mod_celadon/_storge_sounds/sound/voice/alastor_wing2_2.ogg')

/**
 * Perform a custom emote.
 *
 * * m_type: Type of message to send.
 * * message: Content of the message. If none is provided, the user will be prompted to choose the input.
 * * intentional: Whether or not the user intendeded to perform the emote.
 */
/mob/proc/custom_emote(m_type = EMOTE_VISIBLE, message = null, intentional = FALSE)
	var/input = ""
	if(!message && !client)
		CRASH("An empty custom emote was called from a client-less mob.")
	else if(!message)
		input = sanitize(copytext_char(input(src,"Choose an emote to display.") as text|null, 1, MAX_MESSAGE_LEN))
	else
		input = message

	emote("me", m_type, input, intentional)

/datum/emote/living/dance
	cooldown = 5 SECONDS
	var/dance_time = 3 SECONDS

/datum/emote/living/dance/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	user.spin(dance_time, pick(0.1 SECONDS, 0.2 SECONDS))
	user.do_jitter_animation(rand(8 SECONDS, 16 SECONDS), dance_time / 4)
	var/obj/structure/table/danced_on = locate() in user.loc
	if(danced_on)
		SEND_SIGNAL(danced_on, COMSIG_DANCED_ON, user)


/datum/emote/living/choke/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// . = ..()
	if(user.gender == FEMALE)
		return pick(
			'mod_celadon/_storge_sounds/sound/emotes/female/choke_female_1.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/female/choke_female_2.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/female/choke_female_3.ogg')
	else
		return pick(
			'mod_celadon/_storge_sounds/sound/emotes/male/choke_male_1.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/male/choke_male_2.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/male/choke_male_3.ogg')

/datum/emote/living/sigh/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_sigh_sound)
	else
		return pick(H.dna.species.male_sigh_sound)

/datum/emote/living/sniff/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// . = ..()
	if(user.gender == FEMALE)
		return 'mod_celadon/_storge_sounds/sound/emotes/female/sniff_female.ogg'
	else
		return 'mod_celadon/_storge_sounds/sound/emotes/male/sniff_male.ogg'

// /datum/emote/living/snore/get_sound(mob/living/user)
// 	. = ..()
// 	if(iscarbon(user))
// 		return pick(
// 			'mod_celadon/_storge_sounds/sound/emotes/snore_1.ogg',
// 			'mod_celadon/_storge_sounds/sound/emotes/snore_2.ogg',
// 			'mod_celadon/_storge_sounds/sound/emotes/snore_3.ogg',
// 			'mod_celadon/_storge_sounds/sound/emotes/snore_4.ogg',
// 			'mod_celadon/_storge_sounds/sound/emotes/snore_5.ogg',
// 			'mod_celadon/_storge_sounds/sound/emotes/snore_6.ogg',
// 			'mod_celadon/_storge_sounds/sound/emotes/snore_7.ogg')

//////////////////////
/// Carbon Emotes ///
////////////////////

/datum/emote/living/carbon/moan/get_sound(mob/living/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_groan_sound)
	else
		return pick(H.dna.species.male_groan_sound)

/datum/emote/living/carbon/giggle/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_giggle_sound)
	else
		return pick(H.dna.species.male_giggle_sound)

/datum/emote/living/carbon/yawn/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// . = ..()
	if(user.gender == FEMALE)
		return pick(
			'mod_celadon/_storge_sounds/sound/emotes/female/yawn_female_1.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/female/yawn_female_2.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/female/yawn_female_3.ogg')
	else
		return pick(
			'mod_celadon/_storge_sounds/sound/emotes/male/yawn_male_1.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/male/yawn_male_2.ogg')

/datum/emote/living/carbon/laugh/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_laugh_sound)
	else
		return pick(H.dna.species.male_laugh_sound)

/////////////////////
/// Human Emotes ///
///////////////////

/datum/emote/living/carbon/human/scream/select_message_type(mob/user, msg, intentional)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(H.dna.species?.scream_verb)
		if(H.mind?.miming)
			return "как будто [H.dna.species?.scream_verb]!"
		else
			return "[H.dna.species?.scream_verb]!"

/datum/emote/living/carbon/human/scream/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/human = user
	if(human.mind?.miming || !istype(human))
		return
	if(human.gender == FEMALE)
		return pick(human.dna.species.female_scream_sound)
	return pick(human.dna.species.male_scream_sound)

/datum/emote/living/carbon/human/gasp/get_sound(mob/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user

	if(H.is_muzzled())
		// If you're muzzled you're not making noise
		return

	if(H.health > 0)
		if(H.gender == FEMALE)
			return pick(H.dna.species.female_gasp_sound)
		else
			return pick(H.dna.species.gasp_sound)

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_dying_gasp_sounds)
	else
		return pick(H.dna.species.male_dying_gasp_sounds)

/datum/emote/living/carbon/human/salute/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(!is_type_in_list(H.shoes, funny_shoes))
		return 'mod_celadon/_storge_sounds/sound/emotes/salute.ogg'
	if(is_type_in_list(H.shoes, funny_shoes))
		return 'mod_celadon/_storge_sounds/sound/emotes/toysqueak1.ogg'

/datum/emote/living/carbon/human/cry
	key = "cry"
	key_third_person = "cries"
	message = "Плачет."
	muzzled_noises = list("слабо", "жалко", "грустно")
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/cry/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_cry_sound)
	else
		return pick(H.dna.species.male_cry_sound)
	// return ..()

/datum/emote/living/carbon/human/sniff/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	// . = ..()
	if(user.gender == FEMALE)
		return 'mod_celadon/_storge_sounds/sound/emotes/female/sniff_female.ogg'
	else
		return 'mod_celadon/_storge_sounds/sound/emotes/male/sniff_male.ogg'

/datum/emote/living/carbon/human/sneeze/get_sound(mob/user)
	if(!ishuman(user))
		return
	// if(!ishuman(user))
	// 	return
	var/mob/living/carbon/human/H = user

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_sneeze_sound)
	else
		return pick(H.dna.species.male_sneeze_sound)

/datum/emote/living/carbon/human/fart
	vary = TRUE
	muzzle_ignore = TRUE
	only_forced_audio = TRUE
	bypass_unintentional_cooldown = TRUE
	sound = 'mod_celadon/_storge_sounds/sound/emotes/fart.ogg'

/////////////////////
/// New Emotes ///
///////////////////

/datum/emote/living/carbon/human/whistle
	key = "whistle"
	key_third_person = "whistles"
	message = "свистит."
	message_param = "свистит на %t."
	emote_type = EMOTE_AUDIBLE | EMOTE_MOUTH | EMOTE_VISIBLE
	sound = 'mod_celadon/_storge_sounds/sound/emotes/whistle.ogg'

/datum/emote/living/carbon/human/whistle/get_sound(mob/living/user)
	if(!ishuman(user))
		return pick('mod_celadon/_storge_sounds/sound/emotes/whistle.ogg')
	if(ishuman(user))
		return pick('mod_celadon/_storge_sounds/sound/emotes/whistle.ogg')

/datum/emote/living/carbon/human/snuffle
	key = "snuffle"
	key_third_person = "snuffles"
	message = "нюхает."
	message_param = "нюхает %t."

/datum/emote/living/carbon/human/snuffle/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(ishuman(user))
		if(user.gender == FEMALE)
			return pick('mod_celadon/_storge_sounds/sound/emotes/female/female_sniff.ogg')
		else
			return pick('mod_celadon/_storge_sounds/sound/emotes/male/male_sniff.ogg')

/datum/emote/living/carbon/human/hem
	key = "hem"
	key_third_person = "hems"
	message = "хмыкает."
	message_param = "хмыкает %t."

/datum/emote/living/carbon/human/scratch
	key = "scratch"
	key_third_person = "scratch"
	message = "чешется."
	message_param = "чешет %t."

/datum/emote/living/carbon/human/roar
	key = "roar"
	key_third_person = "roar"
	message = "рычит."
	message_mime = "бесшумно рычит."
	message_param = "рычит на %t."
	// species_type_whitelist_typecache = list(/datum/species/unathi)
	volume = 50
	muzzled_noises = list("раздражённый")
	emote_type = EMOTE_VISIBLE | EMOTE_MOUTH | EMOTE_AUDIBLE
	age_based = TRUE

/datum/emote/living/carbon/human/roar/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	return pick(
		'mod_celadon/_storge_sounds/sound/emotes/unathi/roar_unathi_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/unathi/roar_unathi_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/unathi/roar_unathi_3.ogg')

/datum/emote/living/carbon/human/rumble
	key = "rumble"
	key_third_person = "rumble"
	message = "урчит."
	message_param = "урчит на %t."
	// species_type_whitelist_typecache = list(/datum/species/unathi)
	emote_type = EMOTE_VISIBLE | EMOTE_MOUTH | EMOTE_AUDIBLE
	age_based = TRUE
	volume = 50
	muzzled_noises = list("слабо урчащий")

/datum/emote/living/carbon/human/rumble/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(islizard(user))
		return pick(
			'mod_celadon/_storge_sounds/sound/emotes/unathi/rumble_unathi_1.ogg',
			'mod_celadon/_storge_sounds/sound/emotes/unathi/rumble_unathi_2.ogg')

/datum/emote/living/carbon/human/threat
	key = "threat"
	key_third_person = "threat"
	message = "угрожающе рычит."
	message_param = "угрожающе рычит на %t."
	// species_type_whitelist_typecache = list(/datum/species/unathi)
	emote_type = EMOTE_VISIBLE | EMOTE_MOUTH | EMOTE_AUDIBLE
	age_based = TRUE
	volume = 80
	muzzled_noises = list("очень раздражённый")

/datum/emote/living/carbon/human/threat/get_sound(mob/living/user)
	return pick(
		'mod_celadon/_storge_sounds/sound/emotes/unathi/threat_unathi_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/unathi/threat_unathi_2.ogg')

/datum/emote/living/carbon/human/purr
	key = "purr"
	key_third_person = "purr"
	message = "мурчит."
	message_param = "мурчит из-за %t."
	// species_type_whitelist_typecache = list(/datum/species/tajaran)
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	age_based = TRUE
	vary = TRUE
	sound = 'mod_celadon/_storge_sounds/sound/emotes/tajaran/purr_tajaran.ogg'
	volume = 80
	muzzled_noises = list("слабо")

/datum/emote/living/carbon/human/purr/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE

	if (!istajara(user))
		return FALSE

	return TRUE

/datum/emote/living/carbon/human/purrl
	key = "purrl"
	key_third_person = "purrl"
	message = "мурчит."
	message_param = "мурчит из-за %t."
	cooldown = 5 SECONDS
	// species_type_whitelist_typecache = list(/datum/species/tajaran)
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	age_based = TRUE
	vary = TRUE
	sound = 'mod_celadon/_storge_sounds/sound/emotes/tajaran/purr_tajaran_long.ogg'
	volume = 80
	muzzled_noises = list("слабо")

/datum/emote/living/carbon/human/purrl/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE

	if (!istajara(user))
		return FALSE

	return TRUE

/datum/emote/living/carbon/human/mrowss
	key = "mrowss"
	key_third_person = "mrowss"
	message = "мурчит коротко."
	message_param = "коротко мурчит на %t."
	sound = 'mod_celadon/_storge_sounds/sound/emotes/tajaran/mrowss.ogg'
	// species_type_whitelist_typecache = list(/datum/species/tajaran)
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	vary = TRUE
	cooldown = 5 SECONDS
	volume = 50
	muzzled_noises = list("слабо")

/datum/emote/living/carbon/human/mrowss/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE

	if (!istajara(user))
		return FALSE

	return TRUE

/datum/emote/living/carbon/human/hiss/tajara
	message_mime = "hisses silently."
	// species_type_whitelist_typecache = list(/datum/species/tajaran)
	sound = 'mod_celadon/_storge_sounds/sound/emotes/tajaran/hiss_tajaran.ogg'
	volume = 80
	muzzled_noises = list("irritated")

/datum/emote/living/carbon/human/hiss
	key = "hiss"
	key_third_person = "hisses"
	message_param = "шипит на %t."
	message = "шипит!"
	cooldown = 5 SECONDS
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	age_based = TRUE
	vary = TRUE
	sound = 'mod_celadon/_storge_sounds/sound/emotes/tajaran/hiss_tajaran.ogg'
	volume = 80
	muzzled_noises = list("слабо")

/datum/emote/living/carbon/human/hiss/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE

	if(!istajara(user))
		return FALSE

	return TRUE

/datum/emote/living/carbon/human/hiss/get_sound(mob/living/user)
	if(!ishuman(user))
		return
	if(istajara(user))
		return 'mod_celadon/_storge_sounds/sound/emotes/tajaran/hiss_tajaran.ogg'
	if(islizard(user))
		return 'sound/voice/lizard/hiss.ogg'


/datum/emote/living/carbon/human/whip
	key = "whip"
	key_third_person = "whip"
	message = "ударяет хвостом."
	message_mime = "взмахивает хвостом и бесшумно опускает его на пол."
	message_postfix = ", грозно смотря на %t."
	message_param = EMOTE_PARAM_USE_POSTFIX
	// species_type_whitelist_typecache = list(/datum/species/unathi)
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	volume = 75
	// audio_cooldown = 3 SECONDS
	sound = 'mod_celadon/_storge_sounds/sound/emotes/unathi/whip_short_unathi.ogg'

/datum/emote/living/carbon/human/whip/whip_l
	key = "whips"
	key_third_person = "whips"
	message = "хлестает хвостом."
	// species_type_whitelist_typecache = list(/datum/species/unathi)
	// audio_cooldown = 6 SECONDS
	sound = 'mod_celadon/_storge_sounds/sound/emotes/unathi/whip_unathi.ogg'

/datum/emote/living/carbon/human/whip/can_run_emote(mob/user, status_check = TRUE, intentional)
	if(!..())
		return FALSE

	if(!can_wag(user))
		return FALSE

	return TRUE


// /datum/emote/living/carbon/human/bark
// 	key = "bark"
// 	key_third_person = "bark"
// 	message = "гавкает."
// 	message_param = "гавкает на %t."
// 	sound = 'mod_celadon/_storge_sounds/sound/emotes/bark.ogg'
// 	// species_type_whitelist_typecache = list(/datum/species/vulpkanin)
// 	emote_type = EMOTE_AUDIBLE
// 	age_based = TRUE
// 	vary = TRUE
// 	cooldown = 10 SECONDS
// 	volume = 30

// /datum/emote/living/carbon/human/wbark
// 	key = "wbark"
// 	key_third_person = "wbark"
// 	message = "дважды гавкает."
// 	message_param = "дважды гавкает на %t."
// 	sound = 'mod_celadon/_storge_sounds/sound/emotes/wbark.ogg'
// 	// species_type_whitelist_typecache = list(/datum/species/vulpkanin)
// 	emote_type = EMOTE_AUDIBLE
// 	age_based = TRUE
// 	vary = TRUE
// 	cooldown = 10 SECONDS
// 	volume = 30

/datum/emote/living/carbon/human/ururu
	key = "ururu"
	key_third_person = "ururu"
	message = "урчит."
	message_param = "урчит на %t."
	sound = 'mod_celadon/_storge_sounds/sound/emotes/vulpkanin/purr.ogg'
	// species_type_whitelist_typecache = list(/datum/species/vulpkanin)
	emote_type = EMOTE_VISIBLE | EMOTE_AUDIBLE
	vary = TRUE
	cooldown = 10 SECONDS
	volume = 50
	muzzled_noises = list("слабо")

/datum/emote/living/carbon/human/meow
	key = "meow"
	key_third_person = "meow"
	message = "мяукает."
	message_param = "мяукает на %t."
	sound = 'mod_celadon/_storge_sounds/sound/emotes/tajaran/meow_tajaran.ogg'
	// species_type_whitelist_typecache = list(/datum/species/tajaran)
	emote_type = EMOTE_VISIBLE | EMOTE_MOUTH | EMOTE_AUDIBLE
	vary = TRUE
	cooldown = 10 SECONDS
	volume = 50
	muzzled_noises = list("слабо")

/datum/emote/living/carbon/human/mrow
	key = "mrow"
	key_third_person = "mrow"
	message = "раздражённо мяукает."
	message_param = "раздражённо мяукает на %t."
	sound = 'mod_celadon/_storge_sounds/sound/emotes/tajaran/annoyed_meow_tajaran.ogg'
	// species_type_whitelist_typecache = list(/datum/species/tajaran)
	emote_type = EMOTE_VISIBLE | EMOTE_MOUTH | EMOTE_AUDIBLE
	vary = TRUE
	cooldown = 10 SECONDS
	volume = 70
	muzzled_noises = list("слабо")

/datum/emote/living/carbon/human/tajara/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE

	if (!istajara(user))
		return FALSE

	return TRUE

/datum/emote/living/carbon/human/spin
	key = "spin"
	key_third_person = "spines"
	message = "Кружится."
	emote_type = EMOTE_VISIBLE

/datum/emote/spin
	message = "кружится."

/datum/emote/living/carbon/moan
	key = "moan"
	key_third_person = "moans"
	message = "стонет!"
	message_mime = "кажется стонет"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/moan/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE

	if (isipc(user) || islanius(user))
		return FALSE

	return TRUE

/datum/emote/living/carbon/moan/get_sound(mob/living/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user

	if(H.gender == FEMALE)
		return pick(H.dna.species.female_moan_sound)
	else
		return pick(H.dna.species.male_moan_sound)

	// return ..()

/datum/emote/living/carbon/human/fart
	key = "fart"
	key_third_person = "farts"
	message = "пёрнул."
	message_param = "пёрнул по направлению %t."
	sound = 'mod_celadon/_storge_sounds/sound/emotes/fart.ogg'
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/fart/run_emote(mob/user, params, type_override, intentional)
	var/farted_on_something = FALSE
	for(var/atom/A in get_turf(user))
		farted_on_something = A.fart_act(user) || farted_on_something
	if(!farted_on_something)
		return ..()

/atom/proc/fart_act(mob/living/M)
	return FALSE

/datum/emote/living/shudder
	key = "shudder"
	key_third_person = "shudders"
	message = "содрагается."
	emote_type = EMOTE_VISIBLE
	// unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/bshake
	key = "bshake"
	key_third_person = "bshakes"
	message = "трясётся."
	// unintentional_stat_allowed = UNCONSCIOUS

/datum/emote/living/carbon/human/snap
	key = "snap"
	key_third_person = "snaps"
	message = "щёлкает пальцами."
	message_param = "snaps their fingers at %t."
	sound = 'mod_celadon/_storge_sounds/sound/emotes/fingersnap.ogg'
	emote_type = EMOTE_AUDIBLE

// /datum/emote/living/carbon/human/snap/run_emote(mob/user, params, type_override, intentional)

// 	var/mob/living/carbon/human/H = user
// 	var/obj/item/organ/external/LH = H.get_organ("l_hand")
// 	var/obj/item/organ/external/RH = H.get_organ("r_hand")
// 	var/left_hand_good = FALSE
// 	var/right_hand_good = FALSE
// 	if(LH && !(LH.status & ORGAN_SPLINTED) && !(LH.status & ORGAN_BROKEN))
// 		left_hand_good = TRUE
// 	if(RH && !(RH.status & ORGAN_SPLINTED) && !(RH.status & ORGAN_BROKEN))
// 		right_hand_good = TRUE

// 	if(!left_hand_good && !right_hand_good)
// 		to_chat(user, "You need at least one hand in good working order to snap your fingers.")
// 		return TRUE

// 	if(prob(5))
// 		user.visible_message("<span class='danger'><b>[user]</b> snaps [user.p_their()] fingers right off!</span>")
// 		playsound(user.loc, 'sound/effects/snap.ogg', 50, 1)
// 		return TRUE
// 	return ..()

// /datum/emote/living/carbon/human/cry/get_sound(mob/living/user)
// 	if(!ishuman(user))
// 		return
// 	var/mob/living/carbon/human/H = user

// 	if(H.gender == FEMALE)
// 		return pick(H.dna.species.female_cry_sound)
// 	else
// 		return pick(H.dna.species.male_cry_sound)

// /datum/emote/living/carbon/human/tajara/purr
// 	key = "purr"
// 	key_third_person = "purrs"
// 	message = "мурчит"
// 	emote_type = EMOTE_AUDIBLE
// 	vary = TRUE

// /datum/emote/living/carbon/human/tajara/purr/get_sound(mob/living/user)
// 	return 'mod_celadon/_storge_sounds/sound/purr.ogg'

// /datum/emote/living/carbon/human/tajara/purrl
// 	key = "purrl"
// 	key_third_person = "purrls"
// 	message = "мурчит"
// 	emote_type = EMOTE_AUDIBLE
// 	vary = TRUE

// /datum/emote/living/carbon/human/tajara/purrl/get_sound(mob/living/user)
// 	return 'mod_celadon/_storge_sounds/sound/purr_long.ogg'


// /datum/emote/living/carbon/human/highfive	// Пиздец там порртировать......
// 	key = "highfive"
// 	key_third_person = "highfives"
// 	hands_use_check = TRUE
// 	cooldown = 5 SECONDS
// 	/// Status effect to apply when this emote is used. Should be a subtype
// 	var/status = STATUS_EFFECT_HIGHFIVE
// 	/// title override, used for the re-use message.
// 	var/action_name

// /datum/emote/living/carbon/human/highfive/can_run_emote(mob/user, status_check, intentional)
// 	. = ..()
// 	// var/mob/living/carbon/user_carbon = user
// 	// if(user_carbon.hands_use_check())
// 	// 	return FALSE

// /datum/emote/living/carbon/human/highfive/proc/set_status(mob/living/carbon/user)
// 	return user.apply_status_effect(status)

// /datum/emote/living/carbon/human/highfive/run_emote(mob/user, params, type_override, intentional)
// 	var/mob/living/carbon/user_carbon = user
// 	if(user_carbon.has_status_effect(status))
// 		user.visible_message("[user.name] shakes [user.p_their()] hand around slightly, impatiently waiting for someone to [!isnull(action_name) ? action_name : key].")
// 		return TRUE
// 	var/datum/result = set_status(user)
// 	if(QDELETED(result))
// 		return TRUE

// 	return ..()

// /datum/emote/living/carbon/human/highfive/dap
// 	key = "dap"
// 	status = STATUS_EFFECT_DAP
// 	key_third_person = "daps"

// /datum/emote/living/carbon/human/highfive/handshake
// 	key = "handshake"
// 	key_third_person = "handshakes"
// 	status = STATUS_EFFECT_HANDSHAKE

// /datum/emote/living/carbon/human/highfive/rps
// 	key = "rps"
// 	param_desc = "r,p,s"
// 	hands_use_check = TRUE
// 	status = STATUS_EFFECT_RPS
// 	action_name = "play rock-paper-scissors with"
// 	target_behavior = EMOTE_TARGET_BHVR_IGNORE
// 	/// If the user used parameters, the move that will be made.
// 	var/move

// /datum/emote/living/carbon/human/highfive/rps/run_emote(mob/user, emote_arg, type_override, intentional)
// 	switch(lowertext(emote_arg))
// 		if("r", "rock")
// 			move = RPS_EMOTE_ROCK
// 		if("p", "paper")
// 			move = RPS_EMOTE_PAPER
// 		if("s", "scissors")
// 			move = RPS_EMOTE_SCISSORS

// 		// if it's an invalid emote param, just fall through and let them select

// 	return ..()

// /datum/emote/living/carbon/human/highfive/rps/set_status(mob/living/carbon/user)
// 	if(!isnull(move))
// 		// if they supplied a valid parameter, use that for the move
// 		return user.apply_status_effect(status, move)
// 	return user.apply_status_effect(status)

// /datum/emote/living/carbon/human/highfive/rps/reset_emote()
// 	..()
// 	move = initial(move)

/datum/language_holder/riol
	understood_languages = list(
		/datum/language/galactic_common = list(LANGUAGE_ATOM),
		/datum/language/canilunzt = list(LANGUAGE_ATOM),
	)
	spoken_languages = list(
		/datum/language/galactic_common = list(LANGUAGE_ATOM),
		/datum/language/canilunzt = list(LANGUAGE_ATOM),
	)

/datum/language/canilunzt
	name = "Canilunzt"
	desc = "Основной разговорный язык риолов."
	speech_verb = "rawls"
	ask_verb = "rawls"
	exclaim_verb = "sniffs"
	key = "7"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 60
	syllables = list("rur","ya","sen","rawr","bar","kuk","tek","kuat","uk","vu","vuh","tah","tch","sjz","auch", \
		"ist","yein","entch","zvich","tut","mipr","vo","bis","as","vor","nik","gro","al","anem","zanth","tzch","noch", \
		"hel","ischt","far","va","baram","yereng","tech","lach","sam","mak","lich","gen","or","ag","ekt","gek","stag","onn", \
		"bin","ket","yarl","volf","eyanech","kresvz","azunayn","ghchv"
	)
	icon = 'mod_celadon/_storge_icons/icons/assets/language.dmi'
	icon_state = "canilunzt"
	default_priority = 90

/datum/language/canilunzt/get_random_name(gender = NEUTER, force_use_syllables = FALSE)
	if(force_use_syllables)
		return ..()
	if(gender != MALE)
		gender = pick(MALE, FEMALE)

	if(gender == MALE)
		return "[pick(GLOB.riol_names_male)]-[pick(GLOB.riol_last_names)]"
	return "[pick(GLOB.riol_names_female)]-[pick(GLOB.riol_last_names)]"

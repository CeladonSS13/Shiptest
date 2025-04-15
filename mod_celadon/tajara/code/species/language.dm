/datum/language_holder/tajara
	understood_languages = list(
		/datum/language/galactic_common = list(LANGUAGE_ATOM),
		/datum/language/siiktajr = list(LANGUAGE_ATOM)
	)
	spoken_languages = list(
		/datum/language/galactic_common = list(LANGUAGE_ATOM),
		/datum/language/siiktajr = list(LANGUAGE_ATOM)
	)

/datum/language/siiktajr
	name = "Siik'tajr"
	desc = "The traditionally employed tongue of Ahdomai, composed of expressive yowls and chirps. Native to the Tajara."
	speech_verb = "mrowls"
	ask_verb = "mrowls"
	exclaim_verb = "yowls"
	key = "j"
	flags = TONGUELESS_SPEECH | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	syllables = list(
		"rr", "rr", "tajr", "kir", "raj", "kii", "mir", "kra", "ahk", "nal", "vah", "khaz", "jri", "ran", "darr",
		"mi", "jri", "dynh", "manq", "rhe", "zar", "rrhaz", "kal", "chur", "eech", "thaa", "dra", "jurl", "mah",
		"sanu", "dra", "ii'r", "ka", "aasi", "far", "wa", "baq", "ara", "qara", "zir", "sam", "mak", "hrar", "nja",
		"rir", "khan", "jun", "dar", "rik", "kah", "hal", "ket", "jurl", "mah", "tul", "cresh", "azu", "ragh"
	)
	default_priority = 90
	icon = 'mod_celadon/_storge_icons/icons/language.dmi'
	icon_state = "siiktajr"

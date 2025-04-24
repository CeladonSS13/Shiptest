/datum/species
	var/scream_verb = "кричит"

	var/list/autohiss_basic_map = null
	var/list/autohiss_extra_map = null
	var/list/autohiss_exempt = null

	var/list/speech_sounds                   // A list of sounds to potentially play when speaking.
	var/list/speech_chance                   // The likelihood of a speech sound playing.

	var/list/suicide_messages = list(
		"пытается откусить себе язык!",
		"выдавливает свои глазницы большими пальцами!",
		"сворачивает себе шею!",
		"задерживает дыхание!")

	var/male_cry_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/male/cry_male_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/cry_male_2.ogg')

	var/female_cry_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/female/cry_female_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/cry_female_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/cry_female_3.ogg')

	var/male_giggle_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/male/giggle_male_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/giggle_male_2.ogg')

	var/female_giggle_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/female/giggle_female_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/giggle_female_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/giggle_female_3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/giggle_female_4.ogg')

	var/male_laugh_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_5.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_6.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_7.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_8.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_9.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_10.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_11.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_12.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/laugh_male_13.ogg')

	var/female_laugh_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_5.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_6.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_7.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_8.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_9.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_10.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_11.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_12.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/laugh_female_13.ogg')

	var/male_sigh_sound = list('mod_celadon/_storge_sounds/sound/emotes/male/sigh_male.ogg')

	var/female_sigh_sound = list('mod_celadon/_storge_sounds/sound/emotes/female/sigh_female.ogg')

	var/male_groan_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_male_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_male_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_male_3.ogg')

	var/female_groan_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_female_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_female_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_female_3.ogg')

	var/male_moan_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m5.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m6.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m7.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/moan_m8.ogg')

	var/female_moan_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_f1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_f2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_f3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_f4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_f5.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_f6.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/moan_f7.ogg')

	var/female_gasp_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/female/gasp_female_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/gasp_female_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/gasp_female_3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/gasp_female_4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/gasp_female_5.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/gasp_female_6.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/gasp_female_7.ogg')

	var/list/death_sounds = list(
		'mod_celadon/_storge_sounds/sound/emotes/voice/deathgasp_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/deathgasp_2.ogg')

	var/list/male_dying_gasp_sounds = list(
		'mod_celadon/_storge_sounds/sound/emotes/voice/male_dying_gasp_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/male_dying_gasp_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/male_dying_gasp_3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/male_dying_gasp_4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/male_dying_gasp_5.ogg')

	var/list/female_dying_gasp_sounds = list(
		'mod_celadon/_storge_sounds/sound/emotes/voice/female_dying_gasp_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/female_dying_gasp_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/female_dying_gasp_3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/female_dying_gasp_4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/voice/female_dying_gasp_5.ogg')

	var/gasp_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/male/gasp_male_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/gasp_male_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/gasp_male_3.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/gasp_male_4.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/gasp_male_5.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/gasp_male_6.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/gasp_male_7.ogg')

	var/male_cough_sounds = list(
		'mod_celadon/_storge_sounds/sound/emotes/male/cough_male_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/cough_male_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/male/cough_male_3.ogg')

	var/female_cough_sounds = list(
		'mod_celadon/_storge_sounds/sound/emotes/female/cough_female_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/cough_female_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/female/cough_female_3.ogg')

	var/male_sneeze_sound = 'mod_celadon/_storge_sounds/sound/emotes/mob_effects/sneeze.ogg'

	var/female_sneeze_sound = 'mod_celadon/_storge_sounds/sound/emotes/female/sneeze_female.ogg'

	var/male_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/voice/male_scream.ogg'

	var/female_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/voice/female_scream.ogg'

/datum/species/ipc
	suicide_messages = list(
		"отключает питание!",
		"разбивает свой монитор!",
		"выкручивает себе шею!",
		"загружает дополнительную оперативную память!",
		"замыкает свои микросхемы!",
		"блокирует свой вентиляционный порт!")

/datum/species/moth
	scream_verb = "жужжит"
	female_giggle_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_chitter.ogg'
	male_giggle_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_chitter.ogg'
	male_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_scream.ogg'
	female_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_scream.ogg'
	male_sneeze_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_sneeze.ogg'
	female_sneeze_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_sneeze.ogg'
	female_laugh_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_laugh.ogg'
	male_laugh_sound = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_laugh.ogg'
	female_cough_sounds = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_cough.ogg'
	male_cough_sounds = 'mod_celadon/_storge_sounds/sound/emotes/moth/moth_cough.ogg'
	suicide_messages = list(
		"откусывает свои усики!",
		"вспарывает себе живот!",
		"отрывает себе крылья!",
		"заддерживает своё дыхание!")

/datum/species/plasmaman
	autohiss_basic_map = list(
			"s" = list("ss", "sss", "ssss"),
			"с" = list("сс", "ссс", "сссс"))

	male_scream_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/plasmaman/scream_plasmaman_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/plasmaman/scream_plasmaman_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/plasmaman/scream_plasmaman_3.ogg')
	female_scream_sound = list(
		'mod_celadon/_storge_sounds/sound/emotes/plasmaman/scream_plasmaman_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/plasmaman/scream_plasmaman_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/plasmaman/scream_plasmaman_3.ogg')
	suicide_messages = list(
		"сворачивает себе шею!",
		"впускает себе немного O2!",
		"осознает экзистенциальную проблему быть рождённым из плазмы!",
		"показывает свою истинную природу, которая оказывается плазмой!")

/datum/species/jelly
	male_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/scream_jelly.ogg'
	female_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/scream_jelly.ogg'
	suicide_messages = list(
		"тает в лужу!",
		"растекается в лужу!",
		"становится растаявшим желе!",
		"вырывает собственное ядро!",
		"становится коричневым, тусклым и растекается в лужу!")

/datum/species/skeleton
	suicide_messages = list(
		"ломает себе кости!",
		"сваливается в кучу!",
		"разваливается!",
		"откручивает себе череп!")

/datum/species/lizard
	autohiss_basic_map = list(
			"s" = list("ss", "sss", "ssss"),
			"с" = list("сс", "ссс", "сссс"))
	autohiss_extra_map = list(
			"x" = list("ks", "kss", "ksss"),
			"ш" = list("шш", "шшш", "шшшш"),
			"ч" = list("щ", "щщ", "щщщ"))
	autohiss_exempt = list("Sinta'unathi")

	speech_sounds = list(
		'mod_celadon/_storge_sounds/sound/emotes/unathi/talk_unathi_1.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/unathi/talk_unathi_2.ogg',
		'mod_celadon/_storge_sounds/sound/emotes/unathi/talk_unathi_3.ogg')

	speech_chance = 20
	male_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/unathi/scream_male.ogg'
	female_scream_sound = 'mod_celadon/_storge_sounds/sound/emotes/unathi/scream_female.ogg'
	male_sneeze_sound = 'mod_celadon/_storge_sounds/sound/emotes/unathi/sneeze_male.ogg'
	female_sneeze_sound = 'mod_celadon/_storge_sounds/sound/emotes/unathi/sneeze_female.ogg'
	death_sounds = 'mod_celadon/_storge_sounds/sound/emotes/unathi/deathsound_unathi.ogg'
	suicide_messages = list(
		"пытается откусить себе язык!",
		"вонзает когти себе в глазницы!",
		"сворачивает себе шею!",
		"задерживает дыхание!")

/datum/species/vox
	autohiss_basic_map = list(
			"ch" = list("ch", "chch", "chich"),
			"k" = list("k", "kk", "kik"),
			"ч" = list("ч", "чч", "чич"),
			"к" = list("к", "кк", "кик"))
	autohiss_exempt = list("Vox-pidgin")

	scream_verb = "скрипит"
	suicide_messages = list(
		"пытается откусить себе язык!",
		"вонзает когти себе в глазницы!",
		"сворачивает себе шею!",
		"задерживает дыхание!",
		"глубоко вдыхает кислород!")

/datum/species/riol
	autohiss_basic_map = list(
			"r" = list("r", "rr", "rrr"),
			"р" = list("р", "рр", "ррр"))
	autohiss_exempt = list("Canilunzt")

	scream_verb = "скулит"
	suicide_messages = list(
		"пытается откусить себе язык!",
		"выдавливает когтями свои глазницы!",
		"сворачивает себе шею!",
		"задерживает дыхание!")

/datum/species/monkey
	scream_verb = "визжит"

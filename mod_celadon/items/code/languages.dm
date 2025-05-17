/datum/language/elysm
	name = "Elysm"
	desc = "The national language of the Republic of Elysium, which is a mixture of Ard al-Elysm Almaveud and newly arrived settlers speaking a variation of Arabic 2378 Sol."
	key = "e"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 40
	syllables = list(
		"ﺏ", "ﺟ", "ﺝ", "ﺲ", "ﻁ",
		"ﺐ", "ﺠ", "ﺩ", "ﺶ", "ﻅ",
		"ﺒ", "ﺞ", "ﺫ", "ﺵ", "ﻁ",
		"ﺑ", "ﺝ", "ﺬ", "ﺸ", "ﻇ",
		"ﺏ", "ﺕ", "ﺮ", "ﺼ", "ﻑ",
		"ﺕ", "ﺗ", "ﺰ", "ﻀ", "ﻖ",
		"ﺖ",  "ﺘ",  "ﺱ",  "ﻄ",  "ﻔ"
	)
	icon = "mod_celadon/_storge_icons/icons/items/obj/language.dmi"
	icon_state = "elysm"
	default_priority = 90

/datum/language/alquadim
	name = "Alquadim-Elysm"
	desc = "The traditional ancient language of the Elysium Republic, originated in Ard al-Elysm Almaveuda, which are representatives of the Arabic language of 2147, isolated for almost 2 centuries."
	key = "ae"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 40
	syllables = list(
		"ﻱ", "ﻙ", "ﺝ", "ﺲ", "ﻁ",
		"ﺐ", "ﺠ", "ﻡ", "ﻚ", "ﻅ",
		"ﺒ", "ﻫ", "ﺫ", "ﻬ", "ﻁ",
		"ﺑ", "ﻦ", "ﺬ", "ﺸ", "ﻇ",
		"ﺏ", "ﺕ", "ﺮ", "ﻐ", "ﻱ",
		"ﺕ", "ﺗ", "ﺰ", "ﻀ", "ﻖ",
		"ﺖ",  "ﺘ",  "ﻑ",  "ﻄ",  "ﻔ"
	)
	icon = "mod_celadon/_storge_icons/icons/items/obj/language.dmi"
	icon_state = "alquadim_elysm"
	default_priority = 90

/datum/language/thayoss
	name = "Thayoss"
	desc = "The national language of the Taios Interstellar Empire, which is a modification of Japanese 2475."
	key = "t"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 40
	syllables = list(
		"ぁ", "ほ", "ま", "ゑ",
		"ざ", "ぷ", "ぽ", "ぼ",
		"ね", "ひ", "ち", "ゐ",
		"か", "ガ", "げ", "ご",
		"ヸ", "キ", "で", "ぅ",
		"ヷ", "ヂ", "エ", "ぐ",
		"セ",  "ゾ",  "じ",  "べ"
	)
	icon = "mod_celadon/_storge_icons/icons/items/obj/language.dmi"
	icon_state = "thayos"
	default_priority = 90

/datum/language/fuyo
	name = "Fuyo"
	desc = "The second language of the Taios Interstellar Empire, which is a modification of Chinese 2475."
	key = "f"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 40
	syllables = list(
		"阿", "热", "哦",
		"贝", "赛", "佩",
		"非", "伊", "艾和",
		"给", "伊可罗肯", "艾斯",
		"得", "卡", "泰",
		"也", "艾了", "吴",
		"用",  "艾姆",  "艾弗"
	)
	icon = "mod_celadon/_storge_icons/icons/items/obj/language.dmi"
	icon_state = "fuyo"
	default_priority = 90

/datum/language/lanius_rattle
	name = "Lanius Rattle"
	desc = "Click-Clack"
	flags = NO_STUTTER
	key = "l"
	syllables = list("click", "clack", "clickity click", " сhecklichick", " tichetich", "snick", "scknt", "sni snoo", "tskt", "ch-ch", "tink", "clank", "snap")
	icon = "mod_celadon/_storge_icons/icons/items/obj/language.dmi"
	icon_state = "lanrattle"

/datum/language_holder/lanius
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/lanius_rattle = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/lanius_rattle = list(LANGUAGE_ATOM))

/datum/language_holder/human
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/solarian_international = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/solarian_international = list(LANGUAGE_ATOM))

/datum/language_holder/jelly
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/slime = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/slime = list(LANGUAGE_ATOM))

/datum/language_holder/lizard
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/kalixcian_common = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/kalixcian_common = list(LANGUAGE_ATOM))

/datum/language_holder/ipc
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/machine = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/machine = list(LANGUAGE_ATOM))

/datum/language_holder/moth
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/moffic = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/moffic = list(LANGUAGE_ATOM))

/datum/language_holder/ethereal
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/kalixcian_common = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/kalixcian_common = list(LANGUAGE_ATOM))

/datum/language_holder/kepori
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/teceti_unified = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/teceti_unified = list(LANGUAGE_ATOM))

/datum/language_holder/vox
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/vox_pidgin = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/vox_pidgin = list(LANGUAGE_ATOM))

/datum/language_holder/spider
	understood_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
								/datum/language/rachnidian = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/galactic_common = list(LANGUAGE_ATOM),
							/datum/language/rachnidian = list(LANGUAGE_ATOM))

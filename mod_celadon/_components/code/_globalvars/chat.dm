GLOBAL_LIST_INIT(ghost_chat_settings_list_desc, list(
	"Разговоры"				= CHAT_GHOSTEARS,
	"Эмоуты"				= CHAT_GHOSTSIGHT,
	"Шепот"					= CHAT_GHOSTWHISPER,
	"Сообщения ПДА"			= CHAT_GHOSTPDA,
	"Радиопереговоры" 		= CHAT_GHOSTRADIO,
	"Смена законов ИИ"		= CHAT_GHOSTLAWS,
	"Зарплата"				= CHAT_BANKCARD
))

GLOBAL_LIST_INIT(ghost_events_settings_list_desc, list(
	"Смерти"				= DISABLE_DEATHRATTLE,
	"Прибывшие"				= DISABLE_ARRIVALRATTLE
))

GLOBAL_LIST_INIT(chat_settings_list_desc, list(
	"OOC" 		  			= CHAT_OOC,
	"LOOC" 		  			= CHAT_LOOC
))

/client/verb/check_bark_define()
	set name = "Check SOUND_BARK"
	set category = "Debug"

	to_chat(src, "SOUND_BARK value: [SOUND_BARK]")
	to_chat(src, "prefs.toggles: [prefs.toggles]")
	to_chat(src, "Has SOUND_BARK: [prefs.toggles & SOUND_BARK]")

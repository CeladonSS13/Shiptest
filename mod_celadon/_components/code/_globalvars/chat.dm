GLOBAL_LIST_INIT(ghost_chat_settings_list_desc, list(
	"Разговоры"				= CHAT_GHOSTEARS,
	"Эмоуты"				= CHAT_GHOSTSIGHT,
	"Шепот"					= CHAT_GHOSTWHISPER,
	"Сообщения ПДА"			= CHAT_GHOSTPDA,
	"Радиопереговоры" 		= CHAT_GHOSTRADIO,
	"Смена законов ИИ"		= CHAT_GHOSTLAWS,
	"Зарплата"				= CHAT_BANKCARD,
	"THE VOICES"			= SOUND_BARK,
))

TOGGLE_CHECKBOX(/datum/verbs/menu/Settings/Sound, toggle_bark)()
	set name = "Hear/Silence Vocal Barks"
	set category = "Preferences"
	set desc = "Hear Vocal Barks"
	usr.client.prefs.toggles ^= SOUND_BARK
	usr.client.prefs.save_preferences()
	to_chat(usr, "You will now [(usr.client.prefs.toggles & SOUND_BARK) ? "hear" : "no longer hear"] vocal barks when other people talk.")
	SSblackbox.record_feedback("nested tally", "preferences_verb", 1, list("Toggle Vocal Barks", "[usr.client.prefs.toggles & SOUND_BARK ? "Enabled" : "Disabled"]"))

/datum/verbs/menu/Settings/Sound/toggle_bark/Get_checked(client/C)
	return C.prefs.toggles & SOUND_BARK

GLOBAL_LIST_INIT(ghost_events_settings_list_desc, list(
	"Смерти"				= DISABLE_DEATHRATTLE,
	"Прибывшие"				= DISABLE_ARRIVALRATTLE
))

GLOBAL_LIST_INIT(chat_settings_list_desc, list(
	"OOC" 		  			= CHAT_OOC,
	"LOOC" 		  			= CHAT_LOOC
))

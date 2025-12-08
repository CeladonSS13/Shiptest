/client/verb/open_sound_settings()
	set name = "Open Sound Settings"
	set category = "Debug"
	new /datum/sound_panel(usr)

/client/verb/check_w_tts_voices_define()
	set name = "Check SOUND THE VOICE"
	set category = "Debug"

	to_chat(src, "SOUND_THE_VOICE value: [SOUND_THE_VOICE]")
	to_chat(src, "prefs.toggles: [prefs.toggles]")
	to_chat(src, "Has SOUND_THE_VOICE: [prefs.toggles & SOUND_THE_VOICE]")

/client/verb/test_enable_w_tts_voices()
    set name = "Enable THE VOICES Sound"
    set category = "Debug"

    prefs.toggles |= SOUND_THE_VOICE
    prefs.save_preferences()
    to_chat(src, "THE VOICES sound enabled! toggles=[prefs.toggles], SOUND_THE_VOICE=[SOUND_THE_VOICE], check=[prefs.toggles & SOUND_THE_VOICE]")

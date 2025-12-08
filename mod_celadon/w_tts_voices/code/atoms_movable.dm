/atom/movable/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_W_TTS_VOICES, PROC_REF(handle_special_w_tts_voices)) //There must be a better way to do this

/atom/movable/Destroy()
	UnregisterSignal(src, COMSIG_MOVABLE_W_TTS_VOICES)
	. = ..()

/atom/movable/proc/handle_special_w_tts_voices(atom/movable/source, list/hearers, distance, volume, pitch)
	SIGNAL_HANDLER

	if(!CONFIG_GET(flag/enable_global_w_tts_voices))
		return //No need to run if there are no voices to begin with

	var/list/soundpaths
	switch(GLOB.w_tts_voices_list[source.vocal_w_tts_voices_id])
		if(/datum/w_tts_voices/gaster)
			soundpaths = list(
				'mod_celadon/_storage_sounds/sound/w_tts_voices/voice/voice_gaster_1.ogg',
				'mod_celadon/_storage_sounds/sound/w_tts_voices/voice/voice_gaster_2.ogg',
				'mod_celadon/_storage_sounds/sound/w_tts_voices/voice/voice_gaster_3.ogg',
				'mod_celadon/_storage_sounds/sound/w_tts_voices/voice/voice_gaster_4.ogg',
				'mod_celadon/_storage_sounds/sound/w_tts_voices/voice/voice_gaster_5.ogg',
				'mod_celadon/_storage_sounds/sound/w_tts_voices/voice/voice_gaster_6.ogg',
				'mod_celadon/_storage_sounds/sound/w_tts_voices/voice/voice_gaster_7.ogg'
			)
		else
			return //No change needed

	source.vocal_w_tts_voices = sound(pick(soundpaths))

/atom/movable/w_tts_voices(list/hearers, distance, volume, pitch)
	if(!CONFIG_GET(flag/enable_global_w_tts_voices))
		return
	. = ..()

/// Sets the vocal w_tts_voices for the atom, using the w_tts_voices's ID
/atom/movable/proc/set_w_tts_voices(id)
	if(!id)
		return FALSE
	var/datum/w_tts_voices/B = GLOB.w_tts_voices_list[id]
	if(!B)
		return FALSE
	vocal_w_tts_voices = sound(initial(B.soundpath))
	vocal_w_tts_voices_id = id
	return vocal_w_tts_voices

/atom/movable/proc/process_yelling(list/already_heard, rendered, atom/movable/speaker, datum/language/message_language, message, list/spans, message_mods, obj/source)
	if(last_yell > (world.time - 10))
		to_chat(src, "<span class='warning'>Your voice doesn't project as far as you try to yell in such quick succession.")		// yeah no, no spamming an expensive floodfill.
		return
	last_yell = world.time
	var/list/overhearing = list()
	var/list/overhearing_text = list()
	overhearing = yelling_wavefill(src, yell_power)
	if(!overhearing.len)
		overhearing_text = "none"
	else
		for(var/mob/M as anything in overhearing)
			overhearing_text += key_name(M)
		overhearing_text = english_list(overhearing_text)
	overhearing -= already_heard
	if(!overhearing.len)
		return
	for(var/_AM in overhearing)
		var/atom/movable/AM = _AM
		AM.Hear(rendered, speaker, message_language, message, null, spans, message_mods, source)

	return overhearing

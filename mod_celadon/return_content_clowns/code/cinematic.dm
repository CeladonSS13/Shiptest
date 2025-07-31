//code/datums/cinematic.dm
/datum/cinematic/clownop
	id = CINEMATIC_NUKE_CLOWNOP
	cleanup_time = 100

/datum/cinematic/clownop/content()
	flick("intro_nuke",screen)
	sleep(35)
	cinematic_sound(sound('sound/items/airhorn.ogg'))
	flick("summary_selfdes",screen) //???
	special()

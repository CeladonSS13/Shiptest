//ITEM
/obj/item/sign/moniq
	name = "Muz-tv"
	desc = "Самые топовые хиты этого сезона."
	icon = 'mod_celadon/moniq/icons/jukebox.dmi'
	righthand_file = 'mod_celadon/moniq/icons/inhands/righthand.dmi'
	lefthand_file = 'mod_celadon/moniq/icons/inhands/lefthand.dmi'
	item_state = "moniq"
	icon_state = "moniq"
	verb_say = "states"
	density = FALSE
	var/active = FALSE
	var/list/rangers = list()
	var/stop = 0
	var/datum/track/selection = null
	/// Volume of the songs played
	var/volume = 70
	pixel_x = -8
	sign_path = /obj/structure/sign/moniq

/obj/item/sign/moniq/Initialize()
	. = ..()
	var/matrix/M = transform
	M.Turn(270)
	transform = M

/obj/item/sign/moniq/Destroy()
	dance_over()
	return ..()


/obj/item/sign/moniq/update_icon_state()
	icon_state = "[initial(icon_state)][active ? "active" : null]"
	return ..()

/obj/item/sign/moniq/ui_status(mob/user)
	if(!allowed(user) && !isobserver(user))
		to_chat(user,span_warning("Error: Access Denied."))
		user.playsound_local(src, 'sound/misc/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	if(!SSjukeboxes.songs.len && !isobserver(user)) //WS Edit Cit #7367
		to_chat(user,span_warning("Error: No music tracks have been authorized for this sector. Petition the local authority to resolve this issue."))
		playsound(src, 'sound/misc/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	return ..()

/obj/item/sign/moniq/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Jukebox", name)
		ui.open()

/obj/item/sign/moniq/ui_data(mob/user)
	var/list/data = list()
	data["active"] = active
	data["songs"] = list()
	for(var/datum/track/S in SSjukeboxes.songs) //WS Edit Cit #7367
		var/list/track_data = list(
			name = S.song_name
		)
		data["songs"] += list(track_data)
	data["track_selected"] = null
	data["track_length"] = null
	data["track_beat"] = null
	if(selection)
		data["track_selected"] = selection.song_name
		data["track_length"] = DisplayTimeText(selection.song_length)
		data["track_beat"] = selection.song_beat
	data["volume"] = volume
	return data

/obj/item/sign/moniq/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle")
			if(QDELETED(src))
				return
			if(!active)
				if(stop > world.time)
					to_chat(usr, span_warning("Error: The device is still resetting from the last activation, it will be ready again in [DisplayTimeText(stop-world.time)]."))
					playsound(src, 'sound/misc/compiler-failure.ogg', 50, TRUE)
					return
				if(!istype(selection)) //WS Edit Cit #7367
					to_chat(usr, span_warning("Error: Severe user incompetence detected."))
					playsound(src, 'sound/misc/compiler-failure.ogg', 50, TRUE)
					return
				if(!activate_music()) //WS Edit Cit #7367
					to_chat(usr, span_warning("Error: Generic hardware failure."))
					playsound(src, 'sound/misc/compiler-failure.ogg', 50, TRUE)
					return
				return TRUE
			else
				stop = 0
				return TRUE
		if("select_track")
			if(active)
				to_chat(usr, span_warning("Error: You cannot change the song until the current one is over."))
				return
			var/list/available = list()
			for(var/datum/track/S in SSjukeboxes.songs) //WS Edit Cit #7367
				available[S.song_name] = S
			var/selected = params["track"]
			if(QDELETED(src) || !selected || !istype(available[selected], /datum/track))
				return
			selection = available[selected]
			return TRUE
		if("set_volume")
			var/new_volume = params["volume"]
			if(new_volume  == "reset")
				volume = initial(volume)
				return TRUE
			else if(new_volume == "min")
				volume = 0
				return TRUE
			else if(new_volume == "max")
				volume = 100
				return TRUE
			else if(text2num(new_volume) != null)
				volume = text2num(new_volume)
				return TRUE

/obj/item/sign/moniq/proc/activate_music()
	var/jukeboxslottotake = SSjukeboxes.addjukebox(src, selection, 2) //WS Edit Cit #7367 & #7458
	if(jukeboxslottotake)
		active = TRUE
		update_appearance()
		START_PROCESSING(SSobj, src)
		stop = world.time + selection.song_length
		return TRUE
	else
		return FALSE



/obj/item/sign/moniq/proc/dance_over()
	var/position = SSjukeboxes.findjukeboxindex(src) //WS Edit Cit #10689
	if(!position)
		return
	SSjukeboxes.removejukebox(position)
	STOP_PROCESSING(SSobj, src)
	rangers = list()

/obj/item/sign/moniq/process()
	if(active && world.time >= stop) //WS Edit Cit #7367
		active = FALSE
		dance_over()
		playsound(src,'sound/machines/terminal_off.ogg',50,TRUE)
		update_appearance()
		stop = world.time + 100


///

/obj/structure/sign/moniq
	name = "Muz-tv"
	desc = "Самые топовые хиты этого сезона."
	icon = 'mod_celadon/moniq/icons/jukebox.dmi'
	icon_state = "moniq_wallmount"
	verb_say = "states"
	verb_say = "states"
	density = FALSE
	var/active = FALSE
	var/list/rangers = list()
	var/stop = 0
	var/datum/track/selection = null
	/// Volume of the songs played
	var/volume = 70
	pixel_x = -8


/obj/structure/sign/moniq/Destroy()
	dance_over()
	return ..()


/obj/structure/sign/moniq/update_icon_state()
	icon_state = "[initial(icon_state)][active ? "active" : null]"
	return ..()

/obj/structure/sign/moniq/ui_status(mob/user)
	if(!allowed(user) && !isobserver(user))
		to_chat(user,span_warning("Error: Access Denied."))
		user.playsound_local(src, 'sound/misc/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	if(!SSjukeboxes.songs.len && !isobserver(user)) //WS Edit Cit #7367
		to_chat(user,span_warning("Error: No music tracks have been authorized for this sector. Petition the local authority to resolve this issue."))
		playsound(src, 'sound/misc/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	return ..()

/obj/structure/sign/moniq/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Jukebox", name)
		ui.open()

/obj/structure/sign/moniq/ui_data(mob/user)
	var/list/data = list()
	data["active"] = active
	data["songs"] = list()
	for(var/datum/track/S in SSjukeboxes.songs) //WS Edit Cit #7367
		var/list/track_data = list(
			name = S.song_name
		)
		data["songs"] += list(track_data)
	data["track_selected"] = null
	data["track_length"] = null
	data["track_beat"] = null
	if(selection)
		data["track_selected"] = selection.song_name
		data["track_length"] = DisplayTimeText(selection.song_length)
		data["track_beat"] = selection.song_beat
	data["volume"] = volume
	return data

/obj/structure/sign/moniq/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle")
			if(QDELETED(src))
				return
			if(!active)
				if(stop > world.time)
					to_chat(usr, span_warning("Error: The device is still resetting from the last activation, it will be ready again in [DisplayTimeText(stop-world.time)]."))
					playsound(src, 'sound/misc/compiler-failure.ogg', 50, TRUE)
					return
				if(!istype(selection)) //WS Edit Cit #7367
					to_chat(usr, span_warning("Error: Severe user incompetence detected."))
					playsound(src, 'sound/misc/compiler-failure.ogg', 50, TRUE)
					return
				if(!activate_music()) //WS Edit Cit #7367
					to_chat(usr, span_warning("Error: Generic hardware failure."))
					playsound(src, 'sound/misc/compiler-failure.ogg', 50, TRUE)
					return
				return TRUE
			else
				stop = 0
				return TRUE
		if("select_track")
			if(active)
				to_chat(usr, span_warning("Error: You cannot change the song until the current one is over."))
				return
			var/list/available = list()
			for(var/datum/track/S in SSjukeboxes.songs) //WS Edit Cit #7367
				available[S.song_name] = S
			var/selected = params["track"]
			if(QDELETED(src) || !selected || !istype(available[selected], /datum/track))
				return
			selection = available[selected]
			return TRUE
		if("set_volume")
			var/new_volume = params["volume"]
			if(new_volume  == "reset")
				volume = initial(volume)
				return TRUE
			else if(new_volume == "min")
				volume = 0
				return TRUE
			else if(new_volume == "max")
				volume = 100
				return TRUE
			else if(text2num(new_volume) != null)
				volume = text2num(new_volume)
				return TRUE

/obj/structure/sign/moniq/proc/activate_music()
	var/jukeboxslottotake = SSjukeboxes.addjukebox(src, selection, 2) //WS Edit Cit #7367 & #7458
	if(jukeboxslottotake)
		active = TRUE
		update_appearance()
		START_PROCESSING(SSobj, src)
		stop = world.time + selection.song_length
		return TRUE
	else
		return FALSE



/obj/structure/sign/moniq/proc/dance_over()
	var/position = SSjukeboxes.findjukeboxindex(src) //WS Edit Cit #10689
	if(!position)
		return
	SSjukeboxes.removejukebox(position)
	STOP_PROCESSING(SSobj, src)
	rangers = list()

/obj/structure/sign/moniq/process()
	if(active && world.time >= stop) //WS Edit Cit #7367
		active = FALSE
		dance_over()
		playsound(src,'sound/machines/terminal_off.ogg',50,TRUE)
		update_appearance()
		stop = world.time + 100


/obj/structure/sign/moniq/MouseDrop(over_object, src_location, over_location)
	. = ..()
	if(over_object == usr && Adjacent(usr))
		if(!usr.canUseTopic(src, be_close = TRUE))
			return
		usr.visible_message(span_notice("[usr] grabs and takes \the [src.name]."), span_notice("You grab and take \the [src.name]."))
		var/obj/item/moniq_item = new /obj/item/sign/moniq(loc)
		TransferComponents(moniq_item)
		usr.put_in_hands(moniq_item)
		qdel(src)

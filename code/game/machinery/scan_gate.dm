#define SCANGATE_MINDSHIELD "Mindshield"
#define SCANGATE_NANITES "Nanites"
#define SCANGATE_DISEASE "Disease"
#define SCANGATE_GUNS "Guns"
#define SCANGATE_WANTED "Wanted"
#define SCANGATE_SPECIES "Species"

//god why cant this use the normal species defines
#define SCANGATE_HUMAN "human"
#define SCANGATE_LIZARD "lizard"
#define SCANGATE_FLY "fly"
#define SCANGATE_PLASMAMAN "plasma"
#define SCANGATE_MOTH "moth"
#define SCANGATE_JELLY "jelly"
#define SCANGATE_POD "pod"
#define SCANGATE_ZOMBIE "zombie"
#define SCANGATE_SPIDER "rachnid"
#define SCANGATE_IPC "ipc"
#define SCANGATE_SQUID "squid"
#define SCANGATE_ELZUOSE "elzuose"
#define SCANGATE_KEPORI "kepori"

/obj/machinery/scanner_gate
	name = "scanner gate"
	desc = "A gate able to perform mid-depth scans on any organisms who pass under it."
	icon = 'icons/obj/machines/scangate.dmi'
	icon_state = "scangate"
	use_power = IDLE_POWER_USE
	idle_power_usage = IDLE_DRAW_LOW
	circuit = /obj/item/circuitboard/machine/scanner_gate

	var/scanline_timer
	var/next_beep = 0 //avoids spam
	var/locked = FALSE
	var/list/scangate_modes = list()
	var/disease_threshold = DISEASE_SEVERITY_MINOR
	var/nanite_cloud = 1
	var/list/detect_species = list(SCANGATE_HUMAN)
	var/reverse = FALSE //If true, signals if the scan returns false

/obj/machinery/scanner_gate/Initialize()
	. = ..()
	set_scanline("passive")
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/machinery/scanner_gate/examine(mob/user)
	. = ..()
	if(locked)
		. += span_notice("The control panel is ID-locked. Swipe a valid ID to unlock it.")
	else
		. += span_notice("The control panel is unlocked. Swipe an ID to lock it.")

/obj/machinery/scanner_gate/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER

	INVOKE_ASYNC(src, PROC_REF(auto_scan), AM)

/obj/machinery/scanner_gate/proc/auto_scan(atom/movable/AM)
	if(!(machine_stat & (BROKEN|NOPOWER)) && isliving(AM))
		perform_scan(AM)

/obj/machinery/scanner_gate/proc/set_scanline(type, duration)
	cut_overlays()
	deltimer(scanline_timer)
	add_overlay(type)
	if(duration)
		scanline_timer = addtimer(CALLBACK(src, PROC_REF(set_scanline), "passive"), duration, TIMER_STOPPABLE)

/obj/machinery/scanner_gate/attackby(obj/item/W, mob/user, params)
	var/obj/item/card/id/card = W.GetID()
	if(card)
		if(locked)
			if(allowed(user))
				locked = FALSE
				req_access = list()
				to_chat(user, span_notice("You unlock [src]."))
		else if(!(obj_flags & EMAGGED))
			to_chat(user, span_notice("You lock [src] with [W]."))
			var/list/access = W.GetAccess()
			req_access = access
			locked = TRUE
		else
			to_chat(user, span_warning("You try to lock [src] with [W], but nothing happens."))
	else
		return ..()

/obj/machinery/scanner_gate/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	locked = FALSE
	req_access = list()
	obj_flags |= EMAGGED
	to_chat(user, span_notice("You fry the ID checking system."))

/obj/machinery/scanner_gate/proc/perform_scan(mob/living/M)
	if(!length(scangate_modes))
		return

	var/scanline_type
	for(var/scan_mode in list(
		SCANGATE_WANTED,
		SCANGATE_GUNS,
		SCANGATE_MINDSHIELD,
		SCANGATE_DISEASE,
		SCANGATE_SPECIES,
		SCANGATE_NANITES,
	))
		if((scan_mode in scangate_modes) && scan_matches(M, scan_mode))
			scanline_type = scan_mode_scanline(scan_mode)
			break

	var/beep = FALSE
	if(scanline_type)
		beep = TRUE
	if(reverse)
		beep = !beep
	if(beep)
		alarm_beep(scanline_type ? scanline_type : "alarm")
	else
		set_scanline("scanning", 10)

/obj/machinery/scanner_gate/proc/scan_matches(mob/living/M, scan_mode)
	switch(scan_mode)
		if(SCANGATE_WANTED)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				var/perpname = H.get_face_name(H.get_id_name())
				var/datum/data/record/R = find_record("name", perpname, GLOB.data_core.security)
				if(!R || (R.fields["criminal"] == "*Arrest*"))
					return TRUE
		/*
		Из интересного - если нет записей, Wanted срабатывает. Из-за !R
		*/
		if(SCANGATE_MINDSHIELD)
			if(HAS_TRAIT(M, TRAIT_MINDSHIELD))
				return TRUE
		if(SCANGATE_NANITES)
			if(SEND_SIGNAL(M, COMSIG_HAS_NANITES))
				if(nanite_cloud)
					var/datum/component/nanites/nanites = M.GetComponent(/datum/component/nanites)
					if(nanites && nanites.cloud_id == nanite_cloud)
						return TRUE
				else
					return TRUE
		if(SCANGATE_DISEASE)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(get_disease_severity_value(C.check_virus()) >= get_disease_severity_value(disease_threshold))
					return TRUE
		if(SCANGATE_SPECIES)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				for(var/species_id in detect_species)
					var/datum/species/scan_species = /datum/species/human
					switch(species_id)
						if(SCANGATE_LIZARD)
							scan_species = /datum/species/lizard
						if(SCANGATE_FLY)
							scan_species = /datum/species/fly
						if(SCANGATE_PLASMAMAN)
							scan_species = /datum/species/plasmaman
						if(SCANGATE_MOTH)
							scan_species = /datum/species/moth
						if(SCANGATE_JELLY)
							scan_species = /datum/species/jelly
						if(SCANGATE_ZOMBIE)
							scan_species = /datum/species/zombie
						if(SCANGATE_SPIDER)
							scan_species = /datum/species/spider
						if(SCANGATE_IPC)
							scan_species = /datum/species/ipc
						if(SCANGATE_ELZUOSE)
							scan_species = /datum/species/elzuose
						if(SCANGATE_KEPORI)
							scan_species = /datum/species/kepori
						// [CELADON-ADD] - TAJARA, LANIUS
						if(SPECIES_TAJARA)
							scan_species = /datum/species/tajara
						// [CELADON-ADD] - CELADON_RIOL, CELADON_LANIUS
						if(SPECIES_RIOL)
							scan_species = /datum/species/riol
						if(SPECIES_LANIUS)
							scan_species = /datum/species/lanius
						// [/CELADON-ADD]
					if(is_species(H, scan_species))
						return TRUE
					if(species_id == SCANGATE_ZOMBIE && H.getorganslot(ORGAN_SLOT_ZOMBIE))
						return TRUE
		if(SCANGATE_GUNS)
			for(var/I in M.get_contents())
				if(istype(I, /obj/item/gun))
					return TRUE
	return FALSE

/obj/machinery/scanner_gate/proc/scan_mode_scanline(scan_mode)
	switch(scan_mode)
		if(SCANGATE_WANTED)
			return "wanted"
		if(SCANGATE_GUNS)
			return "weapon"
		if(SCANGATE_MINDSHIELD)
			return "mindshield"
		if(SCANGATE_DISEASE)
			return "disease"
		if(SCANGATE_SPECIES)
			return "species"
		if(SCANGATE_NANITES)
			return "nanite"

/obj/machinery/scanner_gate/proc/alarm_beep(scanline_type)
	if(next_beep <= world.time)
		next_beep = world.time + 20
		playsound(src, 'sound/machines/scanbuzz.ogg', 100, FALSE)
	var/mutable_appearance/alarm_display = mutable_appearance(icon, "alarm_light")
	flick_overlay_view(alarm_display, 2 SECONDS)
	set_scanline(scanline_type, 2 SECONDS)

/obj/machinery/scanner_gate/can_interact(mob/user)
	if(locked)
		return FALSE
	return ..()

/obj/machinery/scanner_gate/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ScannerGate", name)
		ui.open()

/obj/machinery/scanner_gate/ui_data()
	var/list/data = list()
	data["locked"] = locked
	data["scan_modes"] = scangate_modes
	data["reverse"] = reverse
	data["nanite_cloud"] = nanite_cloud
	data["disease_threshold"] = disease_threshold
	data["target_species"] = detect_species
	return data

/obj/machinery/scanner_gate/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle_scan_mode")
			var/new_mode = params["scan_mode"]
			if(new_mode in list(
				SCANGATE_WANTED,
				SCANGATE_GUNS,
				SCANGATE_MINDSHIELD,
				SCANGATE_DISEASE,
				SCANGATE_SPECIES,
				SCANGATE_NANITES,
			))
				if(new_mode in scangate_modes)
					scangate_modes -= new_mode
				else
					scangate_modes += new_mode
				. = TRUE
		if("toggle_reverse")
			reverse = !reverse
			. = TRUE
		if("toggle_lock")
			if(allowed(usr))
				locked = !locked
			. = TRUE
		if("set_disease_threshold")
			var/new_threshold = params["new_threshold"]
			disease_threshold = new_threshold
			. = TRUE
		if("set_nanite_cloud")
			var/new_cloud = text2num(params["new_cloud"])
			nanite_cloud = clamp(round(new_cloud, 1), 1, 100)
			. = TRUE
		//Some species are not scannable, like abductors (too unknown), androids (too artificial) or skeletons (too magic)
		if("set_target_species")
			var/new_species = params["new_species"]
			if(new_species in list(
				SCANGATE_HUMAN,
				SCANGATE_LIZARD,
				SCANGATE_FLY,
				SCANGATE_PLASMAMAN,
				SCANGATE_MOTH,
				SCANGATE_JELLY,
				SCANGATE_ZOMBIE,
				SCANGATE_SPIDER,
				SCANGATE_IPC,
				SCANGATE_ELZUOSE,
				SCANGATE_KEPORI,
				SPECIES_TAJARA,
				SPECIES_RIOL,
				SPECIES_LANIUS,
			))
				if(new_species in detect_species)
					detect_species -= new_species
				else
					detect_species += new_species
				. = TRUE

#undef SCANGATE_MINDSHIELD
#undef SCANGATE_NANITES
#undef SCANGATE_DISEASE
#undef SCANGATE_GUNS
#undef SCANGATE_WANTED
#undef SCANGATE_SPECIES

#undef SCANGATE_HUMAN
#undef SCANGATE_LIZARD
#undef SCANGATE_FLY
#undef SCANGATE_PLASMAMAN
#undef SCANGATE_MOTH
#undef SCANGATE_JELLY
#undef SCANGATE_POD
#undef SCANGATE_ZOMBIE
#undef SCANGATE_SPIDER
#undef SCANGATE_IPC
#undef SCANGATE_SQUID
#undef SCANGATE_ELZUOSE
#undef SCANGATE_KEPORI

/*
Fancy Timer

Component that handles deleting atoms through timer
*/

/datum/component/fancy_deleting_timer
	/// How many times did we failed deleting the parent when timer ended.
	var/times_we_failed_deleting = 0
	var/deleting_attempts = 5 // FALSE to never delete the timer
	var/ignore_client_in_sight = FALSE
	/// What will we do to the living atom. "del"; "gib"; "dust"
	var/death_action = "del"
	/// If our atom isliving we can forbid the timer from ticking right away. With that we can place right from spawn, not upon death
	var/tick_if_alive = FALSE

	/// If TRUE works as whitelist; checks for THESE turfs to be deleted on. If FALSE works as blacklist; will NOT be deleted on these turfs upon check
	var/turf_whitelist = FALSE
	var/list/turf/turfs = list()

	/// Atom to spawn upon deletion of parent
	var/atom/effect
	/// Where we will spawn our effect. Handles: "loc"; "turf"
	var/effect_place

	/// Standart time of start_the_timer() w/o specifying time
	var/standart_time = 300 SECONDS

	var/atom/A

/datum/component/fancy_deleting_timer/Initialize(_standart_time, _tick_if_alive, _death_action="del", _turf_whitelist=TRUE, _turfs, _effect=null, _effect_place="turf", _deleting_attempts=5,)
	A = parent
	if(!istype(A))
		CRASH("Fancy_deleting_timer initialized not on atom. Notify coders.")
		// return COMPONENT_INCOMPATIBLE - [VSC Error]

	standart_time = _standart_time
	tick_if_alive = _tick_if_alive
	death_action = _death_action
	turf_whitelist = _turf_whitelist
	turfs += _turfs
	effect = _effect
	effect_place = _effect_place
	deleting_attempts = _deleting_attempts

	if(!tick_if_alive)
		RegisterSignal(A, COMSIG_LIVING_REVIVE, PROC_REF(stop_the_timer)) // Average simple mob should not revive, just in case.
		RegisterSignal(A, COMSIG_MOB_DEATH, PROC_REF(start_the_timer))
		return

	start_the_timer()

//_________________HELPER PROCS______________________

/// Handles the timer start. Not in initialize in cases when you want to add a timer but dont want to start it right away.
/datum/component/fancy_deleting_timer/proc/start_the_timer(atom/thing, N)
	SIGNAL_HANDLER
	N = N > 0 ? N : standart_time
	addtimer(CALLBACK(src, PROC_REF(batteries_out)), N, TIMER_STOPPABLE|TIMER_DELETE_ME)

/datum/component/fancy_deleting_timer/proc/stop_the_timer()
	SIGNAL_HANDLER
	QDEL_LAZYLIST(active_timers)

/// Delete the whole component
/datum/component/fancy_deleting_timer/proc/delete_the_timer()
	UnregisterSignal(A, list(COMSIG_LIVING_REVIVE,COMSIG_MOB_DEATH))
	Destroy(0,1)

/// Final proc
/datum/component/fancy_deleting_timer/proc/batteries_out()
	if(handle_list() && no_clients_in_sight())
		spawn_effect()
		switch(death_action)
			if("gib")
				var/mob/living/M = A
				M.gib()
			if("dust")
				var/mob/living/M = A
				M.dust(drop_items = 1) // unequipping everything
			if("del")
				qdel(A)
	else if(deleting_attempts && (times_we_failed_deleting >= deleting_attempts))
		delete_the_timer()
		var/M = A || span_warning("UNIDENTIFIED ATOM")
		log_admin("Fancy_deleting_timer in '[M]' in '[get_area_name(A)]' called to deletion [times_we_failed_deleting] times, but did not succeded. Fancy_deleting_timer is removed. [ADMIN_JMP(A)]")
	else
		addtimer(CALLBACK(src, PROC_REF(batteries_out)), 1 MINUTES, TIMER_STOPPABLE|TIMER_LOOP|TIMER_DELETE_ME)
		times_we_failed_deleting++

//___________________________________________________

/datum/component/fancy_deleting_timer/proc/spawn_effect()
	if(effect)
		switch(effect_place)
			if("loc")
				effect_place = A.loc
			else	// "turf"
				effect_place = get_turf(A)
		new effect(effect_place)

/datum/component/fancy_deleting_timer/proc/handle_list()
	if(turfs)
		if(turf_whitelist)	// whitelist. If the turf IS NOT in the list we return false
			if(!is_type_in_list(get_turf(A), turfs))
				return FALSE
		else				// blacklist. If the turf IS in the list we return false
			if(is_type_in_list(get_turf(A), turfs))
				return FALSE
	return TRUE

/datum/component/fancy_deleting_timer/proc/no_clients_in_sight()
	if(!ignore_client_in_sight)
		for(var/mob/living/L in view(A))
			if(L.client && L.stat != DEAD)
				return FALSE
	return TRUE

//_________________	vv href	______________________

#define VV_HK_START_TIMER	"start_the_timer"
#define VV_HK_STOP_TIMER	"stop_the_timer"
#define VV_HK_DELETE_TIMER	"delete_the_timer"

/datum/component/fancy_deleting_timer/vv_get_dropdown()
	. = ..()
	VV_DROPDOWN_OPTION("", "--- Deletion Timer component ---")
	VV_DROPDOWN_OPTION(VV_HK_START_TIMER, "Start the timer")
	VV_DROPDOWN_OPTION(VV_HK_STOP_TIMER, "Stop the timer")
	VV_DROPDOWN_OPTION(VV_HK_DELETE_TIMER, "Delete the timer")

/datum/component/fancy_deleting_timer/vv_do_topic(list/href_list)
	. = ..()
	if(href_list[VV_HK_START_TIMER])
		var/temp = input(usr, "Set the timer to... (in seconds)", "Set timer") as num|null
		if(isnull(temp))
			return FALSE
		start_the_timer(0, temp SECONDS)
		to_chat(usr, span_warning("The timer on [A] is set for [temp] seconds."))
	if(href_list[VV_HK_STOP_TIMER])
		stop_the_timer()
		to_chat(usr, span_warning("Timer on [A] is stopped."))
	if(href_list[VV_HK_DELETE_TIMER])
		delete_the_timer()
		to_chat(usr, span_warning("Timer component on [A] is deleted."))

//___________________________________________________


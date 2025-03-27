/*
Fancy Timer

Component that handles fancy deleting with timer
Can contain an atom which will spawn upon deletion.
Intended use with atoms only

*/

/datum/component/fancy_deleting_timer

	/// How many times did we failed deleting the parent when timer ended
	var/times_we_failed_deleting = 0
	var/deleting_attempts = 5 // FALSE to never delete the timer
	var/ignore_client_in_sight = FALSE

	/// If TRUE works as whitelist; checks for THESE turfs to be deleted on. If FALSE works as blacklist; will NOT be deleted on these turfs upon check
	var/turf_whitelist = FALSE
	var/list/turf/T = list()

	/// Atom to spawn upon deletion of parent
	var/atom/effect
	/// Where we will spawn our effect. Handles: "loc"; "turf"
	var/effect_place

	var/atom/A

//_________________HELPER PROCS______________________
/// Handles the timer start. Not in initialize in cases when you want to add a timer but dont want to start it right away.
/datum/component/fancy_deleting_timer/proc/start_the_timer(N)
	if(!parent)
		to_chat(usr, span_boldwarning("The component is missing a parent var. Canceling timer."))
		return FALSE
	if(!A)
		A = parent
	if(active_timers)
		LAZYNULL(active_timers)
	addtimer(CALLBACK(src, PROC_REF(batteries_out)), N SECONDS)

/datum/component/fancy_deleting_timer/proc/stop_the_timer()
	LAZYNULL(active_timers)
	return

/datum/component/fancy_deleting_timer/proc/delete_the_timer()
	Destroy(0,1)

/datum/component/fancy_deleting_timer/proc/configure_timer(host = parent, whitelist=TRUE, del_attempts=5, list_turfs, switch_to=null, switch_to_place="turf")
	parent = host
	turf_whitelist = whitelist
	deleting_attempts = del_attempts
	T += list_turfs
	effect = switch_to
	effect_place = switch_to_place

/mob/living/proc/add_and_start_deletion_timer(time=300, del_attempts=5, list_turfs=list(), whitelist=FALSE, switch_to=null, switch_to_place="turf")
	if(!src.client && !is_type_in_typecache(src, GLOB.ignore_to_delete)) // cuz we dont want to delete players
		var/datum/component/fancy_deleting_timer/fdt = src.AddComponent(/datum/component/fancy_deleting_timer)
		fdt.configure_timer(src, whitelist, del_attempts, list_turfs, switch_to, switch_to_place)
		fdt.start_the_timer(time)
		return TRUE
	return FALSE
//___________________________________________________

/datum/component/fancy_deleting_timer/proc/spawn_effect()
	if(effect)
		switch(effect_place)
			if("loc")
				effect_place = A.loc
//			if("turf")
//				effect_place = get_turf(parent)
			else
				effect_place = get_turf(parent)
		new effect(effect_place)

/datum/component/fancy_deleting_timer/proc/handle_list()
	if(T)
		if(turf_whitelist)	// whitelist
			if(!is_type_in_list(get_turf(parent), T))
				return FALSE
		else				// blacklist
			if(is_type_in_list(get_turf(parent), T))
				return FALSE
	return TRUE

/datum/component/fancy_deleting_timer/proc/batteries_out()
	if(handle_list() && clients_in_sight())
		spawn_effect()
		qdel(parent)
	else if(deleting_attempts && (times_we_failed_deleting >= deleting_attempts))
		delete_the_timer()
		var/M = A || span_warning("UNIDENTIFIED ATOM")
		log_admin("Deletion Timer in '[M]' in '[get_area_name(A)]' called to deletion [times_we_failed_deleting] times, but did not succeded. Deletion timer is removed. [ADMIN_JMP(A)]")
	else
		addtimer(CALLBACK(src, PROC_REF(batteries_out)), 1 MINUTES)
		times_we_failed_deleting++

/datum/component/fancy_deleting_timer/proc/clients_in_sight()
	if(!ignore_client_in_sight)
		for(var/mob/living/L in view(parent))
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
		start_the_timer(temp)
		to_chat(usr, span_warning("The timer on [parent] is set for [temp] seconds."))
	if(href_list[VV_HK_STOP_TIMER])
		stop_the_timer()
		to_chat(usr, span_warning("Timer on [parent] is stopped."))
	if(href_list[VV_HK_DELETE_TIMER])
		delete_the_timer()
		to_chat(usr, span_warning("Timer component on [parent] is deleted."))

//___________________________________________________

GLOBAL_LIST_INIT(ignore_to_delete, typecacheof(list(
	/mob/living/simple_animal/hostile/asteroid/elite,
	/mob/living/simple_animal/hostile/megafauna,
	/mob/living/silicon,
	)))

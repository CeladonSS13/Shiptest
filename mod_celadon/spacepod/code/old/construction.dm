#define state_next "next"
#define state_prev "prev"

/datum/component/construction
	var/atom/holder

/datum/component/construction/proc/set_desc(index as num)
	var/list/step = steps[index]
	holder.desc = step["desc"]
	return

/datum/component/construction/reversible2
	var/base_icon = "durand"

	New(atom)
		..()
		index = 1
		return

	// proc/update_index(diff as num, mob/user as mob)
	// 	index-=diff
	// 	if(index==steps.len+1)
	// 		spawn_result(user)
	// 	else
	// 		set_desc(index)
	// 	return

	proc/update_icon()
		holder.icon_state="[base_icon]_[index]"

	is_right_key(mob/user as mob,atom/used_atom) // returns index step
		var/list/state = steps[index]
		if(state_next in state)
			var/list/step = state[state_next]
			if(istype(used_atom, step["key"]))
				//if(L["consume"] && !try_consume(used_atom,L["consume"]))
				//	return 0
				return FORWARD //to the first step -> forward
		else if(state_prev in state)
			var/list/step = state[state_prev]
			if(istype(used_atom, step["key"]))
				//if(L["consume"] && !try_consume(used_atom,L["consume"]))
				//	return 0
				return BACKWARD //to the first step -> forward
		return 0

	check_step(atom/used_atom, mob/user as mob)
		var/diff = is_right_key(user,used_atom)
		if(diff)
			if(custom_action(index, diff, used_atom, user))
				update_index(diff,user)
				update_icon()
				return 1
		return 0

	proc/fixText(text,user)
		text = replacetext(text,"{USER}","[user]")
		text = replacetext(text,"{HOLDER}","[holder]")
		return text

	custom_action(index, diff, used_atom, var/mob/user)
		if(!..(index,used_atom,user))
			return 0

		var/list/step = steps[index]
		var/list/state = step[diff==FORWARD ? state_next : state_prev]
		user.visible_message(fixText(state["vis_msg"],user),fixText(state["self_msg"],user))

		if("delete" in state)
			qdel(used_atom)
		else if("spawn" in state)
			var/spawntype=state["spawn"]
			var/atom/A = new spawntype(holder.loc)
			if("amount" in state)
				if(istype(A,/obj/item/stack/cable_coil))
					var/obj/item/stack/cable_coil/C=A
					C.amount=state["amount"]
				if(istype(A,/obj/item/stack))
					var/obj/item/stack/S=A
					S.amount=state["amount"]

		return 1
	// action(used_atom, user = usr)
	// 	return check_step(used_atom,user)

/obj/item/circuitboard/mecha/pod
	name = "circuit board (Space Pod Mainboard)"
	icon_state = "mainboard"

/obj/structure/spacepod_frame
	density = 1
	opacity = 0

	anchored = 1
	layer = 3.9

	icon = 'mod_celadon/_storge_icons/icons/64x64/pod_construction.dmi'
	icon_state = "pod_1"

	var/datum/component/construction/reversible2/construct

/obj/structure/spacepod_frame/New()
	..()
	bound_width = 64
	bound_height = 64

	construct = new /datum/component/construction/reversible2/pod(src)

	dir = EAST

/obj/structure/spacepod_frame/attackby(obj/item/W as obj, mob/user as mob, params)
	if(construct.index == 1 && istype(W, /obj/item/wirecutters))
		visible_message(user, "[user] cuts the struts on \the [src]", "You cut the struts on \the [src]")
		//var/obj/item/pod_parts/pod_frame/F = new /obj/item/pod_parts/pod_frame()
		switch(dir)
			if(NORTH)
				new /obj/item/pod_parts/pod_frame/aft_port{dir = 1}(get_turf(src))
				new /obj/item/pod_parts/pod_frame/aft_starboard{dir = 1}(get_step(src, EAST))
				new /obj/item/pod_parts/pod_frame/fore_port{dir = 1}(get_step(src, NORTH))
				new /obj/item/pod_parts/pod_frame/fore_starboard{dir = 1}(get_step(get_step(src, EAST), NORTH))
			if(SOUTH)
				new /obj/item/pod_parts/pod_frame/fore_starboard{dir = 2}(get_turf(src))
				new /obj/item/pod_parts/pod_frame/fore_port{dir = 2}(get_step(src, EAST))
				new /obj/item/pod_parts/pod_frame/aft_starboard{dir = 2}(get_step(src, NORTH))
				new /obj/item/pod_parts/pod_frame/aft_port{dir = 2}(get_step(get_step(src, EAST), NORTH))
			if(EAST)
				new /obj/item/pod_parts/pod_frame/aft_starboard{dir = 4}(get_turf(src))
				new /obj/item/pod_parts/pod_frame/fore_starboard{dir = 4}(get_step(src, EAST))
				new /obj/item/pod_parts/pod_frame/aft_port{dir = 4}(get_step(src, NORTH))
				new /obj/item/pod_parts/pod_frame/fore_port{dir = 4}(get_step(get_step(src, EAST), NORTH))
			if(WEST)
				new /obj/item/pod_parts/pod_frame/fore_port{dir = 8}(get_turf(src))
				new /obj/item/pod_parts/pod_frame/aft_port{dir = 8}(get_step(src, EAST))
				new /obj/item/pod_parts/pod_frame/fore_starboard{dir = 8}(get_step(src, NORTH))
				new /obj/item/pod_parts/pod_frame/aft_starboard{dir = 8}(get_step(get_step(src, EAST), NORTH))
		qdel(src)
		return

	if(!construct || !construct.action(W, user))
		..()
	return

/obj/structure/spacepod_frame/attack_hand()
	return



/////////////////////////////////
// CONSTRUCTION STEPS
/////////////////////////////////
/datum/component/construction/reversible2/pod
	result = /obj/spacepod
	base_icon = "pod"
	//taskpath = /datum/job_objective/make_pod
	steps = list(
				// 1. Initial state
				list(
					"desc" = "An empty pod frame.",
					state_next = list(
						"key"      = /obj/item/stack/cable_coil,
						"vis_msg"  = "{USER} wires the {HOLDER}.",
						"self_msg" = "You wire the {HOLDER}."
					)
				),
				// 2. Crudely Wired
				list(
					"desc" = "A crudely-wired pod frame.",
					state_prev = list(
						"key"      = /obj/item/wirecutters,
						"vis_msg"  = "{USER} cuts out the {HOLDER}'s wiring.",
						"self_msg" = "You remove the {HOLDER}'s wiring."
					),
					state_next = list(
						"key"      = /obj/item/screwdriver,
						"vis_msg"  = "{USER} adjusts the wiring.",
						"self_msg" = "You adjust the {HOLDER}'s wiring."
					)
				),
				// 3. Cleanly wired
				list(
					"desc" = "A wired pod frame.",
					state_prev = list(
						"key"      = /obj/item/screwdriver,
						"vis_msg"  = "{USER} unclips {HOLDER}'s wiring harnesses.",
						"self_msg" = "You unclip {HOLDER}'s wiring harnesses."
					),
					state_next = list(
						"key"      = /obj/item/circuitboard/mecha/pod,
						"vis_msg"  = "{USER} inserts the mainboard into the {HOLDER}.",
						"self_msg" = "You insert the mainboard into the {HOLDER}.",
						"delete"   = 1
					)
				),
				// 4. Circuit added
				list(
					"desc" = "A wired pod frame with a loose mainboard.",
					state_prev = list(
						"key"      = /obj/item/crowbar,
						"vis_msg"  = "{USER} pries out the mainboard.",
						"self_msg" = "You pry out the mainboard.",

						"spawn"    = /obj/item/circuitboard/mecha/pod,
						"amount"   = 1
					),
					state_next = list(
						"key"      = /obj/item/screwdriver,
						"vis_msg"  = "{USER} secures the mainboard.",
						"self_msg" = "You secure the mainboard."
					)
				),
				// 5. Circuit secured
				list(
					"desc" = "A wired pod frame with a secured mainboard.",
					state_prev = list(
						"key"      = /obj/item/screwdriver,
						"vis_msg"  = "{USER} unsecures the mainboard.",
						"self_msg" = "You unscrew the mainboard from the {HOLDER}."
					),
					state_next = list(
						"key"      = /obj/item/pod_parts/core,
						,
						"vis_msg"  = "{USER} inserts the core into the {HOLDER}.",
						"self_msg" = "You carefully insert the core into the {HOLDER}.",
						"delete"   = 1
					)
				),
				// 6. Core inserted
				list(
					"desc" = "A naked space pod with a loose core.",
					state_prev = list(
						"key"      = /obj/item/crowbar,
						"vis_msg"  = "{USER} delicately removes the core from the {HOLDER} with a crowbar.",
						"self_msg" = "You delicately remove the core from the {HOLDER} with a crowbar.",

						"spawn"    = /obj/item/pod_parts/core,
						"amount"   = 1
					),
					state_next = list(
						"key"      = /obj/item/wrench,
						"vis_msg"  = "{USER} secures the core's bolts.",
						"self_msg" = "You secure the core's bolts."
					)
				),
				// 7. Core secured
				list(
					"desc" = "A naked space pod with an exposed core. How lewd.",
					state_prev = list(
						"key"      = /obj/item/wrench,
						"vis_msg"  = "{USER} unsecures the {HOLDER}'s core.",
						"self_msg" = "You unsecure the {HOLDER}'s core."
					),
					state_next = list(
						"key"      = /obj/item/stack/sheet/metal,
						"amount"   = 5,
						"vis_msg"  = "{USER} frabricates a pressure bulkhead for the {HOLDER}.",
						"self_msg" = "You frabricate a pressure bulkhead for the {HOLDER}."
					)
				),
				// 8. Bulkhead added
				list(
					"desc" = "A space pod with loose bulkhead panelling exposed.",
					state_prev = list(
						"key"      = /obj/item/crowbar,
						"vis_msg"  = "{USER} pops the {HOLDER}'s bulkhead panelling loose.",
						"self_msg" = "You pop the {HOLDER}'s bulkhead panelling loose.",

						"spawn"    = /obj/item/stack/sheet/metal,
						"amount"   = 5,
					),
					state_next = list(
						"key"      = /obj/item/wrench,
						"vis_msg"  = "{USER} secures the {HOLDER}'s bulkhead panelling.",
						"self_msg" = "You secure the {HOLDER}'s bulkhead panelling."
					)
				),
				// 9. Bulkhead secured with bolts
				list(
					"desc" = "A space pod with unwelded bulkhead panelling exposed.",
					state_prev = list(
						"key"      = /obj/item/wrench,
						"vis_msg"  = "{USER} unbolts the {HOLDER}'s bulkhead panelling.",
						"self_msg" = "You unbolt the {HOLDER}'s bulkhead panelling."
					),
					state_next = list(
						"key"      = /obj/item/weldingtool,
						"vis_msg"  = "{USER} seals the {HOLDER}'s bulkhead panelling with a weld.",
						"self_msg" = "You seal the {HOLDER}'s bulkhead panelling with a weld."
					)
				)
				// EOF
			)

	spawn_result(mob/user as mob)
		..()
		var/obj/spacepod/M = new result(drop_location())

		SSblackbox.record_feedback("tally", "spacepod_created", 1, M.name)
		return

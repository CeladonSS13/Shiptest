/obj/item/robot_suit/attackby(obj/item/W, mob/user, params)

	if(istype(W, /obj/item/stack/sheet/metal))
		var/obj/item/stack/sheet/metal/M = W
		if(!l_arm && !r_arm && !l_leg && !r_leg && !chest && !head)
			if (M.use(1))
				var/obj/item/bot_assembly/ed209/B = new
				B.forceMove(drop_location())
				to_chat(user, span_notice("You arm the robot frame."))
				var/holding_this = user.get_inactive_held_item()==src
				qdel(src)
				if (holding_this)
					user.put_in_inactive_hand(B)
			else
				to_chat(user, span_warning("You need one sheet of metal to start building ED-209!"))
				return
	else if(istype(W, /obj/item/bodypart/leg/left/robot))
		if(l_leg)
			return
		if(!user.transferItemToLoc(W, src))
			return
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		l_leg = W
		update_appearance()

	else if(istype(W, /obj/item/bodypart/leg/right/robot))
		if(src.r_leg)
			return
		if(!user.transferItemToLoc(W, src))
			return
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		r_leg = W
		update_appearance()

	else if(istype(W, /obj/item/bodypart/l_arm/robot))
		if(l_arm)
			return
		if(!user.transferItemToLoc(W, src))
			return
		W.icon_state = initial(W.icon_state)
		W.cut_overlays()
		l_arm = W
		update_appearance()

	else if(istype(W, /obj/item/bodypart/r_arm/robot))
		if(r_arm)
			return
		if(!user.transferItemToLoc(W, src))
			return
		W.icon_state = initial(W.icon_state)//in case it is a dismembered robotic limb
		W.cut_overlays()
		r_arm = W
		update_appearance()

	else if(istype(W, /obj/item/bodypart/chest/robot))
		var/obj/item/bodypart/chest/robot/CH = W
		if(chest)
			return
		if(CH.wired && CH.cell)
			if(!user.transferItemToLoc(CH, src))
				return
			CH.icon_state = initial(CH.icon_state) //in case it is a dismembered robotic limb
			CH.cut_overlays()
			chest = CH
			update_appearance()
		else if(!CH.wired)
			to_chat(user, span_warning("You need to attach wires to it first!"))
		else
			to_chat(user, span_warning("You need to attach a cell to it first!"))

	else if(istype(W, /obj/item/bodypart/head/robot))
		var/obj/item/bodypart/head/robot/HD = W
		for(var/X in HD.contents)
			if(istype(X, /obj/item/organ))
				to_chat(user, span_warning("There are organs inside [HD]!"))
				return
		if(head)
			return
		if(HD.flash2 && HD.flash1)
			if(!user.transferItemToLoc(HD, src))
				return
			HD.icon_state = initial(HD.icon_state)//in case it is a dismembered robotic limb
			HD.cut_overlays()
			head = HD
			update_appearance()
		else
			to_chat(user, span_warning("You need to attach a flash to it first!"))

	else if (W.tool_behaviour == TOOL_MULTITOOL)
		if(check_completion())
			ui_interact(user)
		else
			to_chat(user, span_warning("The endoskeleton must be assembled before debugging can begin!"))

	else if(istype(W, /obj/item/mmi))
		var/obj/item/mmi/M = W
		if(check_completion())
			if(!chest.cell)
				to_chat(user, span_warning("The endoskeleton still needs a power cell!"))
				return
			if(!isturf(loc))
				to_chat(user, span_warning("You can't put [M] in, the frame has to be standing on the ground to be perfectly precise!"))
				return
			if(!M.brain_check(user))
				return

			var/mob/living/brain/B = M.brainmob
			if(is_banned_from(B.ckey, "Cyborg") || QDELETED(src) || QDELETED(B) || QDELETED(user) || QDELETED(M) || !Adjacent(user))
				if(!QDELETED(M))
					to_chat(user, span_warning("This [M.name] does not seem to fit!"))
				return
			if(!user.temporarilyRemoveItemFromInventory(W))
				return

			var/mob/living/silicon/robot/O = new /mob/living/silicon/robot/nocell(get_turf(loc))
			if(!O)
				return
			if(M.laws && M.laws.id != DEFAULT_AI_LAWID)
				aisync = 0
				lawsync = 0
				O.laws = M.laws
				M.laws.associate(O)

			O.invisibility = 0
			//Transfer debug settings to new mob
			O.custom_name = created_name
			O.locked = panel_locked
			if(!aisync)
				lawsync = FALSE
				O.connected_ai = null
			else
				O.notify_ai(NEW_BORG)
				if(forced_ai)
					O.set_connected_ai(forced_ai)
			if(!lawsync)
				O.lawupdate = 0
				if(M.laws.id == DEFAULT_AI_LAWID)
					O.make_laws()

			// SSticker.mode.remove_antag_for_borging(B.mind)
			O.job = "Cyborg"

			O.cell = chest.cell
			chest.cell.forceMove(O)
			chest.cell = null
			W.forceMove(O)//Should fix cybros run time erroring when blown up. It got deleted before, along with the frame.
			if(O.mmi) //we delete the mmi created by robot/New()
				qdel(O.mmi)
			O.mmi = W //and give the real mmi to the borg.

			O.updatename(B.client)

			B.mind.transfer_to(O)

			if(O.mind && O.mind.special_role)
				O.mind.store_memory("As a cyborg, you must obey your silicon laws and master AI above all else. Your objectives will consider you to be dead.")
				to_chat(O, span_userdanger("You have been robotized!"))
				to_chat(O, span_danger("You must obey your silicon laws and master AI above all else. Your objectives will consider you to be dead."))

			SSblackbox.record_feedback("amount", "cyborg_birth", 1)
			forceMove(O)
			O.robot_suit = src

			log_game("[key_name(user)] has put the MMI/posibrain of [key_name(M.brainmob)] into a cyborg shell at [AREACOORD(src)]")

			if(!locomotion)
				O.set_lockcharge(TRUE)
				to_chat(O, span_warning("Error: Servo motors unresponsive."))

		else
			to_chat(user, span_warning("The MMI must go in after everything else!"))

	else if(istype(W, /obj/item/borg/upgrade/ai))
		var/obj/item/borg/upgrade/ai/M = W
		if(!chest.cell)
			to_chat(user, span_warning("The endoskeleton still needs a power cell!"))
			return
		if(check_completion())
			if(!isturf(loc))
				to_chat(user, span_warning("You cannot install[M], the frame has to be standing on the ground to be perfectly precise!"))
				return
			if(!user.temporarilyRemoveItemFromInventory(M))
				to_chat(user, span_warning("[M] is stuck to your hand!"))
				return
			qdel(M)
			var/mob/living/silicon/robot/O = new /mob/living/silicon/robot/shell(get_turf(src))

			if(!aisync)
				lawsync = FALSE
				O.set_connected_ai(null)
			else
				if(forced_ai)
					O.set_connected_ai(forced_ai)
				O.notify_ai(AI_SHELL)
			if(!lawsync)
				O.lawupdate = FALSE
				O.make_laws()

			O.cell = chest.cell
			chest.cell.forceMove(O)
			chest.cell = null
			O.locked = panel_locked
			O.job = "Cyborg"
			forceMove(O)
			O.robot_suit = src
			if(!locomotion)
				O.set_lockcharge(TRUE)

	else if(istype(W, /obj/item/pen))
		to_chat(user, span_warning("You need to use a multitool to name [src]!"))
	else
		return ..()

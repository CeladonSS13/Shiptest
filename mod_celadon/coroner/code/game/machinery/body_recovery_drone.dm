/obj/effect/body_recovery_drone
	name = "body recovery drone"
	desc = "An automated drone that collects deceased individuals from remote locations."
	icon = 'icons/obj/device.dmi'
	icon_state = "flightpack_boost"
	anchored = TRUE

	var/recovery_timer = 60 SECONDS
	var/target_area_type = /area/outpost/medical/morgue/storage

/obj/effect/body_recovery_drone/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/effect/body_recovery_drone/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/effect/body_recovery_drone/process()
	check_for_bodies()

/obj/effect/body_recovery_drone/proc/check_for_bodies()
	for(var/mob/living/carbon/human/H in world)
		if(H.stat != DEAD)
			continue

		// Skip if body is currently occupied by a player
		if(H.ckey)
			continue

		// Only recover bodies that had a player at some point
		if(!H.mind || !H.mind.key)
			continue

		// Skip if already processed by drone
		if(H.GetComponent(/datum/component/processed_body))
			continue

		// Skip if body is already in morgue or body storage
		var/area/body_area = get_area(H)
		if(istype(body_area, /area/outpost/medical/morgue) || istype(body_area, /area/medical/morgue) || findtext(body_area.name, "morgue") || findtext(body_area.name, "Body Storage"))
			continue

		// Check if player has been dead for required time
		if(world.time - H.timeofdeath < recovery_timer)
			continue

		// Check if player is alone (no other players nearby)
		var/alone = TRUE
		for(var/mob/living/carbon/human/other in range(20, H))
			if(other != H && other.stat != DEAD && (other.ckey || other.mind?.key))
				alone = FALSE
				break

		if(alone)
			recover_body(H)
			return // Stop after collecting one body

/obj/effect/body_recovery_drone/proc/recover_body(mob/living/carbon/human/body)
	visible_message("<span class='notice'>A recovery drone materializes and collects [body].</span>")

	// Find target morgue area
	var/area/target_area
	for(var/area/A in world)
		if(istype(A, target_area_type))
			target_area = A
			break

	if(target_area)
		// Find a suitable turf in the morgue
		var/turf/target_turf
		for(var/turf/T in target_area)
			if(!T.density)
				target_turf = T
				break

		if(target_turf)
			body.forceMove(target_turf)

			// Award credits to coroner console
			for(var/obj/machinery/computer/coroner_console/console in world)
				console.add_credits(1000)
				body.AddComponent(/datum/component/processed_body)
				
				// Send to news network
				var/message = "Тело [body.real_name] доставлено в морг службой восстановления. Начислено 1000 кредитов."
				if(GLOB.news_network)
					GLOB.news_network.SubmitArticle(message, "Некролог", "Служба восстановления тел", 1)

				// Notify admins with sound
				for(var/client/C in GLOB.admins)
					if(C.prefs.toggles & SOUND_ADMINHELP)
						SEND_SOUND(C, sound('sound/effects/adminhelp.ogg'))
				to_chat(GLOB.admins, span_adminnotice("Body recovery drone delivered [body.real_name] ([body.mind.key]) to morgue from [get_area_name(body)]."))
				break
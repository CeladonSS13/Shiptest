// Enhanced morgue tray with monitoring
/obj/structure/bodycontainer/morgue/monitored
	name = "monitored morgue tray"
	desc = "A morgue tray equipped with life sign monitoring systems."
	var/monitoring_active = TRUE
	var/last_check_time = 0
	var/check_interval = 30 SECONDS

/obj/structure/bodycontainer/morgue/monitored/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/bodycontainer/morgue/monitored/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/bodycontainer/morgue/monitored/process()
	if(!monitoring_active)
		return
	
	if(world.time < last_check_time + check_interval)
		return
	
	last_check_time = world.time
	check_occupant_status()

/obj/structure/bodycontainer/morgue/monitored/proc/check_occupant_status()
	if(!contents.len)
		return
	
	for(var/mob/living/occupant in contents)
		if(occupant.stat != DEAD)
			alert_revival(occupant)
			break

/obj/structure/bodycontainer/morgue/monitored/proc/alert_revival(mob/living/occupant)
	// Change visual indicator
	icon_state = "morgue1"
	
	// Alert nearby coroners
	for(var/mob/living/carbon/human/H in range(20, src))
		if(H.mind?.assigned_role == "Coroner")
			to_chat(H, "<span class='boldnotice'>ALERT: Life signs detected in [src] - [occupant] may have revived!</span>")
			playsound(H, 'sound/machines/ping.ogg', 50, TRUE)
	
	// Global announcement
	priority_announce("Life signs detected in morgue storage. Coroner attention required.", "Medical Alert")

/obj/structure/bodycontainer/morgue/monitored/update_icon()
	..()
	var/mob/living/occupant = locate(/mob/living) in contents
	if(occupant && occupant.stat != DEAD)
		icon_state = "morgue1"
		set_light(2, 2, "#ff0000") // Red light for revival
	else
		set_light(0)
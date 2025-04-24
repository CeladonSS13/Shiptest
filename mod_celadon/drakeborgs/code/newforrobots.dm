/mob/living/silicon/robot
	var/sitting = 0
	var/bellyup = 0
	var/has_reststyle = TRUE // Borgs
	var/drakerest = FALSE // Drake borgs

/obj/item/robot_module
	var/hasrest = FALSE //For the new borgs
	var/drakerest = FALSE

/mob/living/silicon/robot/verb/rest_style()
	set name = "Switch Rest Style"
	set category = "MMI"
	set desc = "Select your resting pose."
	sitting = 0
	bellyup = 0

	if(!has_reststyle)
		to_chat(src, span_warning("Your module does not support it!"))
		return

	var/choice = alert(src, "Select resting pose", "", "Resting", "Sitting", "Belly up")
	switch(choice)
		if("Resting")
			update_icons()
			return 0
		if("Sitting")
			sitting = 1
		if("Belly up")
			bellyup = 1
	update_icons()


/mob/living/silicon/robot/update_resting()
	if(resting)
		ADD_TRAIT(src, TRAIT_IMMOBILIZED, RESTING_TRAIT)
	else
		REMOVE_TRAIT(src, TRAIT_IMMOBILIZED, RESTING_TRAIT)
		set_lying_angle(0)
		set_body_position(0)
	return ..()

/mob/living/silicon/robot/update_icons()
	. = ..()
	if(client && stat != DEAD && (module.hasrest == TRUE))
		if(body_position == LYING_DOWN)
			if(sitting)
				icon_state = "[module.cyborg_base_icon]-sit"
			if(bellyup)
				icon_state = "[module.cyborg_base_icon]-bellyup"
			else if(!sitting && !bellyup)
				icon_state = "[module.cyborg_base_icon]-rest"
			cut_overlays()
		else
			icon_state = "[module.cyborg_base_icon]"
	if(stat == DEAD && module.hasrest == TRUE)
		icon_state = "[module.cyborg_base_icon]-wreck"

/mob/living/silicon/robot/update_icons()
	. = ..()
	if(client && stat != DEAD && (module.drakerest == TRUE))
		if(body_position == LYING_DOWN)
			if(sitting)
				icon_state = "[module.cyborg_base_icon]-sit"
				pixel_x = -16
				base_pixel_x = -16
			if(bellyup)
				icon_state = "[module.cyborg_base_icon]-bellyup"
				pixel_x = -16
				base_pixel_x = -16
			else if(!sitting && !bellyup)
				icon_state = "[module.cyborg_base_icon]-rest"
				pixel_x = -16
				base_pixel_x = -16
			cut_overlays()
		else
			icon_state = "[module.cyborg_base_icon]"
			pixel_x = -16
			base_pixel_x = -16
	if(stat == DEAD && module.drakerest == TRUE)
		icon_state = "[module.cyborg_base_icon]-wreck"
		pixel_x = -16
		base_pixel_x = -16

/mob/living/silicon/robot/set_resting()
	. = ..()
	update_icons()

/mob/living/silicon/robot/get_up()
	. = ..()
	update_icons()

/mob/living/silicon/robot/on_standing_up()
	. = ..()
	update_icons()

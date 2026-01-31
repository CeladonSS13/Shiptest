/obj/item/mod/module/flashlight_inteq
	name = "InteQ MOD flashlight module"
	desc = "A single, yet powerful flashlight installed on the right side of the helmet."
	icon_state = "inteq_flashlight"
	module_type = MODULE_TOGGLE
	complexity = 1
	active_power_cost = DEFAULT_CHARGE_DRAIN * 0.3
	incompatible_modules = list(/obj/item/mod/module/flashlight)
	cooldown_time = 0.5 SECONDS
	overlay_state_inactive = "inteq_module_light"
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_color = COLOR_WHITE
	light_range = 5
	light_power = 1
	light_on = FALSE
	var/base_power = DEFAULT_CHARGE_DRAIN * 0.1

/obj/item/mod/module/flashlight_inteq/on_activation()
	. = ..()
	if(!.)
		return
	set_light_flags(light_flags | LIGHT_ATTACHED)
	set_light_on(active)
	active_power_cost = base_power * light_range

/obj/item/mod/module/flashlight_inteq/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	if(!.)
		return
	set_light_flags(light_flags & ~LIGHT_ATTACHED)
	set_light_on(active)

/obj/item/mod/module/flashlight_inteq/on_process(delta_time)
	active_power_cost = base_power * light_range
	return ..()

/obj/item/mod/module/flashlight_inteq/generate_worn_overlay(mutable_appearance/standing)
	. = ..()
	if(!active)
		return
	var/mutable_appearance/light_icon = mutable_appearance(overlay_icon_file, "inteq_module_light_on", layer = standing + 0.2)
	light_icon.appearance_flags = RESET_COLOR
	light_icon.color = light_color
	. += light_icon

/obj/item/mod/module/unstable_warp
	name = "Slipstream warp MOD module"
	desc = "The Slipstream program is a unique innovation. The module itself is a miniaturized near-lightspeed drive capable of transporting the user through bluespace with acceptable accuracy.\n\
	The technology is temperamental, at best: nothing smaller than an armored human being can survive and the stress of exposed blink travel,\n\
	and the experience can be traumatic to the user."
	module_type = MODULE_ACTIVE
	complexity = 4
	active_power_cost = DEFAULT_CHARGE_DRAIN * 2
	incompatible_modules = list(/obj/item/mod/module/unstable_warp)
	cooldown_time = 3 SECONDS
	overlay_state_inactive = "inteq_module_light"
	var/turf/old_loc
	use_power_cost = 1000

/obj/item/mod/module/unstable_warp/proc/returnal()
	if(old_loc)
		mod.wearer.forceMove(old_loc)
		to_chat(mod.wearer,span_alert("...What?"))
		return TRUE
	else
		to_chat(mod.wearer,span_userdanger("WHY AM I NOT COMING BACK? WHERE AM I? I NEED GOD'S HELP, PLEASE!"))
		log_admin("Something broke and [mod.wearer] got stuck after using unstable warp module.")
	return FALSE

/obj/item/mod/module/unstable_warp/on_use()
	if (!..())
		return
	var/list/rolls = list(rand(0,4),rand(0,4),rand(0,4))
	if (rolls[1] == rolls[2] && rolls[1] == rolls[3] && rolls[2] == rolls[3])
		var/list/anomalies = list(locate(85,15,1),locate(32,136,1),locate(175,186,1),locate(170,175,1),locate(170,159,1),locate(23,173,1))
		var/turf/T = pick(anomalies)
		var/mob/living/user = mod.wearer
		old_loc = get_turf(user)
		if(T && prob(90))
			var/atom/movable/AM = user.pulling
			if(AM)
				AM.forceMove(T)
			user.forceMove(T)
			if(AM)
				user.start_pulling(AM)
			to_chat(user, span_notice("I blink and find myself in... What is this place?"))
			addtimer(CALLBACK(src,PROC_REF(returnal)),10 SECONDS)
			return
		else
			to_chat(user,span_danger("I feel incredibly good, I didn't warp this time."))
			return
	var/sum = rolls[1]+rolls[2]+rolls[3]
	if(mod.wearer)
		do_teleport(mod.wearer,get_ranged_target_turf(mod.wearer, mod.wearer.dir, sum))
		mod.wearer.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1, 150)
	return

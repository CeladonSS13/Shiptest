/obj/structure/bed/roller/future
	name = "roller bed"
	icon = 'mod_celadon/_storge_icons/icons/obj/rollerbed.dmi'
	icon_state = "down"
	anchored = FALSE
	resistance_flags = NONE
	swap_lying_with_dir = FALSE
	foldabletype = /obj/item/roller/future

/obj/structure/bed/roller/future/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/roller/future/robo))
		var/obj/item/roller/future/robo/R = W
		if(R.loaded)
			to_chat(user, span_warning("You already have a roller bed docked!"))
			return

		if(has_buckled_mobs())
			if(buckled_mobs.len > 1)
				unbuckle_all_mobs()
				user.visible_message(span_notice("[user] unbuckles all creatures from [src]."))
			else
				user_unbuckle_mob(buckled_mobs[1],user)
		else
			R.loaded = src
			forceMove(R)
			user.visible_message(span_notice("[user] collects [src]."), span_notice("You collect [src]."))
		return 1
	else
		return ..()

/obj/structure/bed/roller/future/MouseDrop(over_object, src_location, over_location)
	. = ..()
	if(over_object == usr && Adjacent(usr))
		if(!ishuman(usr) || !usr.canUseTopic(src, BE_CLOSE))
			return 0
		if(has_buckled_mobs())
			return 0
		usr.visible_message(span_notice("[usr] collapses \the [src.name]."), span_notice("You collapse \the [src.name]."))
		var/obj/structure/bed/roller/future/B = new foldabletype(get_turf(src))
		usr.put_in_hands(B)
		qdel(src)

/obj/structure/bed/roller/future/post_buckle_mob(mob/living/M)
	density = TRUE
	icon_state = "up"
	M.pixel_y = M.base_pixel_y

/obj/structure/bed/roller/future/Moved()
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 100, TRUE)


/obj/structure/bed/roller/future/post_unbuckle_mob(mob/living/M)
	density = FALSE
	icon_state = "down"
	M.pixel_x = M.base_pixel_y + M.get_standard_pixel_x_offset(M.body_position == LYING_DOWN)
	M.pixel_y = M.base_pixel_y + M.get_standard_pixel_y_offset(M.body_position == LYING_DOWN)


/obj/item/roller/future
	name = "roller bed"
	desc = "A collapsed roller bed that can be carried around."
	icon = 'mod_celadon/_storge_icons/icons/obj/rollerbed.dmi'
	icon_state = "folded"
	w_class = WEIGHT_CLASS_NORMAL // No more excuses, stop getting blood everywhere

/obj/item/roller/future/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/roller/future/robo))
		var/obj/item/roller/future/robo/R = I
		if(R.loaded)
			to_chat(user, span_warning("[R] already has a roller bed loaded!"))
			return
		user.visible_message(span_notice("[user] loads [src]."), span_notice("You load [src] into [R]."))
		R.loaded = new/obj/structure/bed/roller/future(R)
		qdel(src) //"Load"
		return
	else
		return ..()

/obj/item/roller/future/attack_self(mob/user)
	deploy_roller(user, user.loc)

/obj/item/roller/future/afterattack(obj/target, mob/user , proximity)
	. = ..()
	if(!proximity)
		return
	if(isopenturf(target))
		deploy_roller(user, target)

/obj/item/roller/future/deploy_roller(mob/user, atom/location)
	var/obj/structure/bed/roller/future/R = new /obj/structure/bed/roller/future(location)
	R.add_fingerprint(user)
	qdel(src)

/obj/item/roller/future/robo //ROLLER ROBO DA!
	name = "roller bed dock"
	desc = "A collapsed roller bed that can be ejected for emergency use. Must be collected or replaced after use."
	var/obj/structure/bed/roller/future/loaded = null

/obj/item/roller/future/robo/Initialize()
	. = ..()
	loaded = new(src)

/obj/item/roller/future/robo/examine(mob/user)
	. = ..()
	. += "The dock is [loaded ? "loaded" : "empty"]."

/obj/item/roller/future/robo/deploy_roller(mob/user, atom/location)
	if(loaded)
		loaded.forceMove(location)
		user.visible_message(span_notice("[user] deploys [loaded]."), span_notice("You deploy [loaded]."))
		loaded = null
	else
		to_chat(user, span_warning("The dock is empty!"))

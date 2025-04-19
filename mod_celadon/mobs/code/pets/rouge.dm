/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge
	name = "Руж"
	desc = "Уникальная трёхголовая змея Офицера Телекоммуникаций синдиката. Выращена в лаборатории. У каждой головы свой характер!"
	icon = 'mod_celadon/_storge_icons/icons/mobs/rouge.dmi'
	mob_size = MOB_SIZE_SMALL
	blood_volume = BLOOD_VOLUME_NORMAL
	// can_collar = TRUE
	gender = FEMALE
	icon_state = "rouge"
	icon_living = "rouge"
	icon_dead = "rouge_dead"
	// icon_resting = "rouge_rest"
	speak_chance = 5
	speak = list("Шшш", "Тсс!", "Тц тц тц!", "ШШшшШШшшШ!")
	speak_emote = list("hisses")
	emote_hear = list("Зевает", "Шипит", "Дурачится", "Толкается")
	emote_see = list("Высовывает язык", "Кружится", "Трясёт хвостом")
	// tts_seed = "Ladyvashj"
	health = 20
	maxHealth = 20
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	melee_damage_lower = 5
	melee_damage_upper = 6
	var/rest = FALSE
	var/obj/item/inventory_head
	faction = list("neutral", "syndicate")
	// gold_core_spawnable = NO_SPAWN
	// unique_pet = TRUE
	// can_hide = 1
	var/icon_resting = ""
	var/collar_type //if the mob has collar sprites, define them.

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/verb/chasetail()
	set name = "Chase your tail"
	set desc = "d'awwww."
	set category = "Animal"
	visible_message("[src] [pick("dances around", "chases [p_their()] tail")].", "[pick("You dance around", "You chase your tail")].")
	spin(20, 1)

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/attack_hand(mob/living/carbon/human/M)
	. = ..()
	switch(M.a_intent)
		if(INTENT_HELP)
			shh(1, M)
		if(INTENT_HARM)
			shh(-1, M)

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/proc/shh(change, mob/M)
	if(!M || stat)
		return
	if(change > 0)
		new /obj/effect/temp_visual/heart(loc)
		custom_emote(EMOTE_AUDIBLE, "шип%(ит,ят)% счастливо!")
	else
		custom_emote(EMOTE_AUDIBLE, "шип%(ит,ят)% гневно!")

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/Initialize(mapload)
	. = ..()
	regenerate_icons()

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/Destroy()
	QDEL_NULL(inventory_head)
	return ..()

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/handle_atom_del(atom/A)
	if(A == inventory_head)
		inventory_head = null
		regenerate_icons()
	return ..()

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/Life(seconds, times_fired)
	. = ..()
	regenerate_icons()

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/death(gibbed)
	..(gibbed)
	regenerate_icons()

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/getarmor(def_zone, type)
	var/armorval = inventory_head?.armor.getRating(type)
	if(!def_zone)
		armorval *= 0.5
	else if(def_zone != BODY_ZONE_HEAD)
		armorval = 0
	return armorval

/mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/proc/update_snek_fluff() //имя, описание, эмоуты
	// First, change back to defaults
	name = real_name
	desc = initial(desc)
	// BYOND/DM doesn't support the use of initial on lists.
	speak = list("Шшш", "Тсс!", "Тц тц тц!", "ШШшшШШшшШ!")
	speak_emote = list("hisses")
	emote_hear = list("Зевает", "Шипит", "Дурачится", "Толкается")
	emote_see = list("Высовывает язык", "Кружится", "Трясёт хвостом")

// /mob/living/simple_animal		// Когда-нибудь кто-то сможет полностью адаптировать Руж с её всеми механиками. А пока стабильно работает
// 	var/icon_resting = ""
// 	var/collar_type //if the mob has collar sprites, define them.

// /mob/living/proc/StartResting(updating = 1)
// 	var/val_change = !resting
// 	resting = TRUE

// 	if(updating && val_change)
// 		update_canmove()

// /mob/living/proc/StopResting(updating = 1)
// 	var/val_change = !!resting
// 	resting = FALSE

// 	if(updating && val_change)
// 		update_canmove()

// /**
//  * Drops item in left hand.
//  */
// /mob/proc/drop_l_hand(force = FALSE, silent = FALSE)
// 	return drop_item_ground(l_hand, force, silent = silent)


// /**
//  * Drops item in right hand.
//  */
// /mob/proc/drop_r_hand(force = FALSE, silent = FALSE)
// 	return drop_item_ground(r_hand, force, silent = silent)

// /**
//  * Used to drop an item (if it exists) to the ground.
//  * Returns `TRUE` if item is successfully dropped.
//  * Returns `FALSE` if item can not be dropped due to flag NODROP or if item slot is obscured.
//  * If item can be dropped, it will be forceMove()'d to the ground and the turf's Entered() will be called.
//  *
//  * Arguments:
//  * * 'force' overrides flag NODROP and clothing obscuration.
//  * * 'invdrop' prevents stuff in belt/id/pockets/PDA slots from dropping if item was in jumpsuit slot. Only set to `FALSE` if it's going to be immediately replaced.
//  * * 'silent' set to `TRUE` if you want to disable warning messages.
//  * * 'ignore_pixel_shift' set to `TRUE` if you want to prevent item's visual position randomization.
// */
// /mob/proc/drop_item_ground(obj/item/I, force = FALSE, invdrop = TRUE, silent = FALSE, ignore_pixel_shift = FALSE)

// 	. = do_unEquip(I, force, drop_location(), FALSE, invdrop, silent)

// 	if(!. || !I) //ensure the item exists and that it was dropped properly.
// 		return

// 	var/shift_max = world.icon_size / 2
// 	var/shift_limit_x = initial(pixel_x) + shift_max
// 	var/shift_limit_y = initial(pixel_y) + shift_max
// 	var/shift_x
// 	var/shift_y

// 	if(ignore_pixel_shift || (I.flags & NO_PIXEL_RANDOM_DROP))
// 		shift_x = clamp(pixel_x, -shift_limit_x, shift_limit_x)
// 		shift_y = clamp(pixel_y, -shift_limit_y, shift_limit_y)
// 	else
// 		shift_x = clamp(pixel_x + rand(-6, 6), -shift_limit_x, shift_limit_x)
// 		shift_y = clamp(pixel_y + rand(-6, 6), -shift_limit_y, shift_limit_y)

// 	I.pixel_x = shift_x
// 	I.pixel_y = shift_y
// 	I.do_drop_animation(src)

// /mob/living/update_canmove(delay_action_updates = 0)
// 	var/fall_over = !can_stand()
// 	var/buckle_lying = !(buckled && !buckled.buckle_lying)
// 	if(fall_over || resting || IsStunned())
// 		drop_r_hand()
// 		drop_l_hand()
// 	else
// 		lying = 0
// 		canmove = TRUE
// 	if(buckled)
// 		lying = 90 * buckle_lying
// 	else if((fall_over || resting) && !lying)
// 		fall(fall_over)

// 	canmove = !(fall_over || resting || IsStunned() || IsFrozen() || buckled || IsImmobilized())
// 	density = !lying
// 	if(lying)
// 		if(layer == initial(layer))
// 			layer = LYING_MOB_LAYER //so mob lying always appear behind standing mobs
// 	else
// 		if(layer == LYING_MOB_LAYER)
// 			layer = initial(layer)

// 	update_transform()
// 	if(!delay_action_updates)
// 		update_action_buttons_icon()
// 	return canmove

// /mob/living/simple_animal/StartResting(updating = 1)
// 	..()
// 	if(icon_resting && stat != DEAD)
// 		icon_state = icon_resting
// 		if(collar_type)
// 			collar_type = "[initial(collar_type)]_rest"
// 			regenerate_icons()

// /mob/living/simple_animal/StopResting(updating = 1)
// 	..()
// 	if(icon_resting && stat != DEAD)
// 		icon_state = icon_living
// 		if(collar_type)
// 			collar_type = "[initial(collar_type)]"
// 			regenerate_icons()



// /mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/StartResting(updating = 1)
// 	// ..()
// 	if(icon_resting && stat != DEAD)
// 		icon_state = icon_resting
// 		rest = TRUE
// 		if(collar_type)
// 			collar_type = "[initial(collar_type)]_rest"
// 			regenerate_icons()
// 		if(inventory_head)
// 			regenerate_icons()

// /mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/StopResting(updating = 1)
// 	// ..()
// 	if(icon_resting && stat != DEAD)
// 		icon_state = icon_living
// 		rest = FALSE
// 		if(collar_type)
// 			collar_type = "[initial(collar_type)]"
// 			regenerate_icons()
// 		if(inventory_head)
// 			regenerate_icons()

// /mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/show_inv(mob/user)
// 	if(user.incapacitated() || !Adjacent(user))
// 		return
// 	user.set_machine(src)

// 	var/dat = 	{"<meta charset="UTF-8"><div align='center'><b>Inventory of [name]</b></div><p>"}
// 	dat += "<br><B>Head:</B> <A href='?src=[UID()];[inventory_head ? "remove_inv=head'>[inventory_head]" : "add_inv=head'>Nothing"]</A>"
// 	// dat += "<br><B>Collar:</B> <A href='?src=[UID()];[pcollar ? "remove_inv=collar'>[pcollar]" : "add_inv=collar'>Nothing"]</A>"

// 	var/datum/browser/popup = new(user, "mob[UID()]", "[src]", 440, 250)
// 	popup.set_content(dat)
// 	popup.open()

// /mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/Topic(href, href_list)
// 	// if(!(iscarbon(usr) || usr.incapacitated() || !Adjacent(usr))
// 	// 	// usr << browse(null, "window=mob[UID()]")
// 	// 	usr.unset_machine()
// 	// 	return

// 	//Removing from inventory
// 	if(href_list["remove_inv"])
// 		var/remove_from = href_list["remove_inv"]
// 		switch(remove_from)
// 			if("head")
// 				if(inventory_head)
// 					if(inventory_head.flags & NODROP)
// 						to_chat(usr, span_warning("\The [inventory_head] is stuck too hard to [src] for you to remove!"))
// 						return
// 					drop_item_ground(inventory_head)
// 					usr.put_in_hands(inventory_head, ignore_anim = FALSE)
// 					inventory_head = null
// 					update_snek_fluff()
// 					regenerate_icons()
// 				else
// 					to_chat(usr, span_danger("There is nothing to remove from its [remove_from]."))
// 					return
// 			if("collar")
// 				if(pcollar)
// 					var/the_collar = pcollar
// 					drop_item_ground(pcollar)
// 					usr.put_in_hands(the_collar, ignore_anim = FALSE)
// 					pcollar = null
// 					update_snek_fluff()
// 					regenerate_icons()

// 		show_inv(usr)

// 	//Adding things to inventory
// 	else if(href_list["add_inv"])
// 		var/add_to = href_list["add_inv"]

// 		switch(add_to)
// 			if("collar")
// 				add_collar(usr.get_active_hand(), usr)
// 				update_snek_fluff()

// 			if("head")
// 				place_on_head(usr.get_active_hand(),usr)

// 		show_inv(usr)
// 	else
// 		return ..()

// /mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/proc/place_on_head(obj/item/item_to_add, mob/user)

// 	if(istype(item_to_add, /obj/item/grenade/plastic/c4)) // last thing she ever wears, I guess
// 		item_to_add.afterattack(src,user,1)
// 		return

// 	if(inventory_head)
// 		if(user)
// 			to_chat(user, span_warning("You can't put more than one hat on [src]!"))
// 		return
// 	if(!item_to_add)
// 		user.visible_message(span_notice("[user] pets [src]."), span_notice("You rest your hand on [src]'s head for a moment."))
// 		if(flags_2 & HOLOGRAM_2)
// 			return
// 		return

// 	if(user && !user.drop_item_ground(item_to_add))
// 		to_chat(user, span_warning("\The [item_to_add] is stuck to your hand, you cannot put it on [src]'s head!"))
// 		return 0

// 	var/valid = FALSE
// 	if(ispath(item_to_add.snake_fashion, /datum/snake_fashion/head))
// 		valid = TRUE

// 	if(valid)
// 		if(health <= 0)
// 			to_chat(user, span_notice("Безжизненный взгляд в глазах [real_name] никак не меняется, когда вы надеваете [item_to_add] на неё."))
// 		else if(user)
// 			user.visible_message(span_notice("[user] надевает [item_to_add] на центральную голову [real_name]. [src] смотрит на [user] и довольно шипит."),
// 				span_notice("Вы надеваете [item_to_add] на голову [real_name]. [src] озадачено смотрит на вас, пока другие головы смотрят на центральную с завистью."),
// 				span_italics("Вы слышите дружелюбное шипение."))
// 		item_to_add.forceMove(src)
// 		inventory_head = item_to_add
// 		update_snek_fluff()
// 		regenerate_icons()
// 	else
// 		to_chat(user, span_warning("Вы надеваете [item_to_add] на голову [src], но она скидывает [item_to_add] с себя!"))
// 		item_to_add.forceMove(drop_location())
// 		if(prob(25))
// 			step_rand(item_to_add)
// 		for(var/i in list(1,2,4,8,4,8,4,dir))
// 			setDir(i)
// 			sleep(1)

// 	return valid

///Этот код скопирован с кода для корги и обнуляет показатели которые ему даёт риг. Если когда нибудь змейке дадут риг, раскомментируете///
/*
	set_light(0)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	mutations.Remove(BREATHLESS)
	minbodytemp = initial(minbodytemp)
*/
// 	if(inventory_head?.snake_fashion)
// 		var/datum/snake_fashion/SF = new inventory_head.snake_fashion(src)
// 		SF.apply(src)

// /mob/living/simple_animal/hostile/retaliate/poison/snake/rouge/regenerate_icons() // оверлей
// 	..()
// 	if(inventory_head)
// 		var/image/head_icon
// 		var/datum/snake_fashion/SF = new inventory_head.snake_fashion(src)

// 		if(!SF.obj_icon_state)
// 			SF.obj_icon_state = inventory_head.icon_state
// 			if(src.rest || stat == DEAD)
// 				SF.obj_icon_state += "_rest"
// 		if(!SF.obj_alpha)
// 			SF.obj_alpha = inventory_head.alpha
// 		if(!SF.obj_color)
// 			SF.obj_color = inventory_head.color

// 		if(stat || src.rest) //без сознания или отдыхает
// 			head_icon = SF.get_overlay()
// 			if(stat)
// 				head_icon.pixel_y = -2
// 				head_icon.pixel_x = -2
// 		else
// 			head_icon = SF.get_overlay()

// 		add_overlay(head_icon)

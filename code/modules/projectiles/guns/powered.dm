/obj/item/gun/ballistic/automatic/powered
	default_ammo_type = /obj/item/ammo_box/magazine/gauss
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/gauss,
	)
	var/default_cell_type = /obj/item/stock_parts/cell/gun
	var/list/allowed_cell_types = list(
		/obj/item/stock_parts/cell/gun,
		/obj/item/stock_parts/cell/gun/upgraded,
		/obj/item/stock_parts/cell/gun/empty,
		/obj/item/stock_parts/cell/gun/upgraded/empty,
	)
	charge_sections = 3

/obj/item/gun/ballistic/automatic/powered/Initialize()
	. = ..()
	if(default_cell_type)
		cell = new default_cell_type(src)
	update_appearance()

/obj/item/gun/ballistic/automatic/powered/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("[src]'s cell is [round(cell.charge / cell.maxcharge, 0.1) * 100]% full.")
	else
		. += span_notice("[src] doesn't seem to have a cell!")

/obj/item/gun/ballistic/automatic/powered/can_shoot()
	if(QDELETED(cell))
		return FALSE

	var/obj/item/ammo_casing/caseless/gauss/shot = chambered
	if(!shot)
		return FALSE
	if(cell.charge < shot.energy_cost * burst_size)
		return FALSE
	return ..()

/obj/item/gun/ballistic/automatic/powered/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	var/obj/item/ammo_casing/caseless/gauss/shot = chambered
	if(shot?.energy_cost)
		cell.use(shot.energy_cost)
	return ..()

/obj/item/gun/ballistic/automatic/powered/get_cell()
	return cell

//the things below were taken from energy gun code. blame whoever coded this, not me
/obj/item/gun/ballistic/automatic/powered/attackby(obj/item/A, mob/user, params)
	if(..())
		return FALSE
	if (!internal_cell && (A.type in allowed_cell_types))
		var/obj/item/stock_parts/cell/gun/C = A
		if (!cell)
			insert_cell(user, C)
		// [CELADON-ADD] - CELADON_QOL - Позволяет удобно заменить батарею другой батареей.
		else
			if (tac_reloads)
				if(do_after(user, 3.5 SECONDS, src, hidden = TRUE))
					eject_cell(user, C)
		// [/CELADON-ADD]

/obj/item/gun/ballistic/automatic/powered/proc/insert_cell(mob/user, obj/item/stock_parts/cell/gun/C)
	if(user.transferItemToLoc(C, src))
		cell = C
		to_chat(user, span_notice("You load the [C] into \the [src]."))
		playsound(src, load_sound, load_sound_volume, load_sound_vary)
		update_appearance()
		return TRUE
	else
		to_chat(user, span_warning("You cannot seem to get \the [src] out of your hands!"))
		return FALSE

/obj/item/gun/ballistic/automatic/powered/proc/eject_cell(mob/user, obj/item/stock_parts/cell/gun/tac_load = null)
	playsound(src, load_sound, load_sound_volume, load_sound_vary)
	cell.forceMove(drop_location())
	var/obj/item/stock_parts/cell/gun/old_cell = cell
	cell = null
	user.put_in_hands(old_cell)
	old_cell.update_appearance()
	to_chat(user, span_notice("You pull the cell out of \the [src]."))
	update_appearance()
	// [CELADON-ADD] - CELADON_QOL - Замена батереи рукой занимает 3.5 секунды, отвёрткой 1.5 секунды и чем лучше отвёртка - тем быстрее достанется батарея.
	if(user)
		if(tac_load && tac_reloads)
			if(insert_cell(user, tac_load))
				to_chat(user, span_notice("You perform a tactical reload on \the [src]."))
			else
				to_chat(user, span_warning("You dropped the old cell, but the new one doesn't fit. How embarassing."))
		else
			to_chat(user, span_warning("Your reload was interupted!"))
			return
	// [/CELADON-ADD]

/obj/item/gun/ballistic/automatic/powered/screwdriver_act(mob/living/user, obj/item/I)
	if(cell && !internal_cell)
		to_chat(user, span_notice("You begin unscrewing and pulling out the cell..."))
		if(I.use_tool(src, user, 1.5 SECONDS, volume=100)) // [CELADON-EDIT] "unscrewing_time" заменено на "1.5 SECONDS".
			to_chat(user, span_notice("You remove the power cell."))
			eject_cell(user)
	return ..()

/obj/item/gun/ballistic/automatic/powered/update_overlays()
	. = ..()
	if(!automatic_charge_overlays)
		return
	var/overlay_icon_state = "[icon_state]_charge"
	var/charge_ratio = get_charge_ratio()
	if(cell)
		. += "[icon_state]_cell"
	if(charge_ratio == 0)
		. += "[icon_state]_cellempty"
	else
		if(!shaded_charge)
			var/mutable_appearance/charge_overlay = mutable_appearance(icon, overlay_icon_state)
			for(var/i in 1 to charge_ratio)
				charge_overlay.pixel_x = ammo_x_offset * (i - 1)
				charge_overlay.pixel_y = ammo_y_offset * (i - 1)
				. += new /mutable_appearance(charge_overlay)
		else
			. += "[icon_state]_charge[charge_ratio]"

/obj/item/gun/ballistic/automatic/powered/proc/get_charge_ratio()
	if(!cell)
		return FALSE
	return CEILING(clamp(cell.charge / cell.maxcharge, 0, 1) * charge_sections, 1)// Sets the ratio to 0 if the gun doesn't have enough charge to fire, or if its power cell is removed.

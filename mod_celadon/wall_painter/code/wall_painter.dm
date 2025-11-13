/obj/item/wall_painter
	name = "wall painter"
	desc = "Продвинутый инструмент для покраски стен с настраиваемыми цветами. Используйте на стенах для нанесения краски или в руке для настройки цвета. Обладает автогенерацией краски."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/wall_painter.dmi'
	icon_state = "wall_painter"
	item_state = "wall_painter"
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=100, /datum/material/glass=50)
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	usesound = 'sound/effects/spray2.ogg'

	var/paint_color = "#FFFFFF"
	var/paint_uses = 50
	var/max_uses = 50
	var/last_regen = 0
	var/regen_delay = 100 // 10 секунд

/obj/item/wall_painter/examine(mob/user)
	. = ..()
	. += span_notice("It has [paint_uses]/[max_uses] uses remaining.")
	. += span_notice("Current color: [paint_color].")

/obj/item/wall_painter/attack_self(mob/user)
	ui_interact(user)

/obj/item/wall_painter/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return

	if(!istype(target, /turf/closed/wall))
		to_chat(user, span_warning("[src] can only be used on walls."))
		return

	if(paint_uses <= 0)
		to_chat(user, span_warning("[src] is out of paint!"))
		return

	var/turf/closed/wall/W = target
	paint_wall(W, user)

/obj/item/wall_painter/proc/paint_wall(turf/closed/wall/target, mob/user)
	if(!target || !user)
		return

	paint_uses--
	playsound(src.loc, usesound, 50, TRUE)

	target.add_atom_colour(paint_color, WASHABLE_COLOUR_PRIORITY)
	to_chat(user, span_notice("You paint [target] with [paint_color]."))

/obj/item/wall_painter/process()
	if(paint_uses < max_uses && world.time > last_regen + regen_delay)
		paint_uses++
		last_regen = world.time

/obj/item/wall_painter/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/wall_painter/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/wall_painter/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "WallPainter", name)
		ui.open()

/obj/item/wall_painter/ui_data(mob/user)
	var/list/data = list()
	data["paint_color"] = paint_color
	data["paint_uses"] = paint_uses
	data["max_uses"] = max_uses
	return data

/obj/item/wall_painter/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("set_color")
			var/new_color = params["color"]
			if(new_color && istext(new_color))
				paint_color = new_color
				. = TRUE
		if("pick_color")
			var/pick_color = input(usr, "Choose paint color", "Color Picker") as color|null
			if(pick_color)
				var/list/rgb = rgb2num(pick_color)
				var/brightness = (rgb[1] + rgb[2] + rgb[3]) / 3
				if(brightness < 50)
					to_chat(usr, span_warning("Color too dark! Choose a brighter color."))
				else
					paint_color = pick_color
					. = TRUE

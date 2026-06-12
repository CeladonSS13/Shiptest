/obj/item/paper/CtrlClick(mob/living/carbon/user)
	. = ..()

	if(!ishuman(usr))
		return

	var/obj/item/I = user.get_active_held_item()
	if(!I)
		return

	if(istype(I, /obj/item/pen))
		var/new_name = input(user, "Введите новое название бумаги:", "Переименовать", src.name) as text|null
		if(!new_name)
			return
		src.name = new_name
		to_chat(user, "Вы переименовали бумагу в \"[new_name]\".")

/obj/item/paper/examine(mob/user)
	. = ..()
	. += span_notice("Ctrl-click [src] to rename the paper.")

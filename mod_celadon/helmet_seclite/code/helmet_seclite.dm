// Инициализация с подключенным слушаньем сигнала
/obj/item/clothing/head/helmet/Initialize()
	. = ..()
	if(attached_light)
		action_light = new(src)
	RegisterSignal(src, COMSIG_CLICK_ALT, PROC_REF(on_storage_alt_click))

// Оверрайд стандартного действия с отвёрткой, чтобы применить выделенные методы drop и remove
/obj/item/clothing/head/helmet/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	if(can_flashlight && attached_light) //if it has a light but can_flashlight is false, the light is permanently attached.
		tool.play_tool_sound(src)
		to_chat(user, span_notice("You unscrew [attached_light] from [src]."))
		drop_attached_light(user)
		remove_attached_light(user)

		return TRUE

// Принимает сигнал клика с альтом
/obj/item/clothing/head/helmet/proc/on_storage_alt_click(datum/source, mob/user)
	SIGNAL_HANDLER

	// Если есть крепление фонарика и он закреплен
	if (can_flashlight && attached_light)
		INVOKE_ASYNC(src, PROC_REF(on_storage_alt_click_async), source, user)
	else return

// Асинхронный метод обработки клика с альтом, поскольку SIGNAL_HANDLER'ы не должны прерываться
/obj/item/clothing/head/helmet/proc/on_storage_alt_click_async(datum/source, mob/user)
	drop_attached_light(user)
	remove_attached_light()
	update_user(user)
	return

// Обновляем пользователя
/obj/item/clothing/head/helmet/proc/update_user(mob/user)
	attached_light.update_brightness(user)
	user.update_inv_head()
	return

// Убираем прикреплённый фонарик
/obj/item/clothing/head/helmet/proc/remove_attached_light(mob/user)
	set_attached_light(null)
	update_helmlight()
	update_appearance()
	update_user(user)
	QDEL_NULL(action_light)
	return

// Вытаскиваем фонарик, либо на пол, либо в руки
/obj/item/clothing/head/helmet/proc/drop_attached_light(mob/user)
	attached_light.forceMove(drop_location())
	if(Adjacent(user) && !issilicon(user))
		user.put_in_hands(attached_light)
	return

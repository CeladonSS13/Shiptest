/obj/item/toy/musicbox
	name = "Музыкальная шкатулка"
	desc = "Надпись на дне: <i>Прекрасной вампирочке от её рычалки. С любовью на долгую память.</i>"
	icon = 'mod_celadon/_storge_icons/icons/obj/musicbox.dmi'
	icon_state = "box_close"
	lefthand_file = 'mod_celadon/_storge_icons/icons/mob/hands/musicbox_hands_left.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/mob/hands/musicbox_hands_right.dmi'
	usesound = 'mod_celadon/_storge_sounds/sound/items/musicbox.ogg'

	COOLDOWN_DECLARE(musicbox_cooldown)

/obj/item/toy/musicbox/Initialize()
	. = ..()

/obj/item/toy/musicbox/attack_self(mob/user)
	. = ..()
	if((!COOLDOWN_FINISHED(src, musicbox_cooldown)))
		return
	COOLDOWN_START(src, musicbox_cooldown, 38 SECONDS)
	// Вероятно дальше есть способ делать это более правильно и более оптимизировано, но кто нас остановит?
	addtimer(CALLBACK(src, .proc/start_playing), 5 SECONDS)
	to_chat(user, span_notice("Вы проворачиваете ключик, что приводит шкатулку в действие."))
	playsound(src.loc, usesound, 50, TRUE)
	addtimer(CALLBACK(src, .proc/finish_playing), 38 SECONDS)

/obj/item/toy/musicbox/proc/start_playing()
	icon_state = "box_open"

/obj/item/toy/musicbox/proc/finish_playing()
	icon_state = "box_static"

/obj/item/toy/musicbox/AltClick(mob/living/carbon/user, obj/item/I)
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(COOLDOWN_TIMELEFT(src, musicbox_cooldown) > 0)
		return
	if(icon_state == "box_close")
		icon_state = "box_static"
	else
		icon_state = "box_close"

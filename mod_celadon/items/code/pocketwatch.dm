var/roundstart_hour = 0
var/round_start_time

//Returns the world time in english
/proc/worldtime2text(time = world.time, timeshift = 1)
	if(!roundstart_hour) roundstart_hour = REALTIMEOFDAY - (TIMEZONE_CST HOURS)
	return timeshift ? time2text(time+roundstart_hour, "hh:mm") : time2text(time, "hh:mm")

/proc/Ceiling(x, y=1)
	return -round(-x / y) * y

/obj/item/pocketwatch
	name = "pocketwatch"
	desc = "A watch that goes in your pocket."
	icon = 'mod_celadon/_storge_icons/icons/items/obj/tajara_items.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/overlay/tajara_items_overlay.dmi'
	icon_state = "pocketwatch"
	var/closed = FALSE

/obj/item/pocketwatch/AltClick(mob/user)
	if(!closed)
		icon_state = "[initial(icon_state)]_closed"
		to_chat(user, "You clasp the [name] shut.")
		playsound(src.loc, 'mod_celadon/_storge_sounds/sound/blade_close.ogg', 50, 1)
	else
		icon_state = "[initial(icon_state)]"
		to_chat(user, "You flip the [name] open.")
		playsound(src.loc, 'mod_celadon/_storge_sounds/sound/blade_open.ogg', 50, 1)
	closed = !closed

/obj/item/pocketwatch/examine(mob/user, distance, is_adjacent)
	. = ..()
	. += span_notice("Alt-click it to quickly open the clock.")
	if (distance <= 1)
		checktime()

/obj/item/pocketwatch/verb/checktime(mob/user)
	set category = "Object"
	set name = "Check Time"
	set src in usr

	if(closed)
		to_chat(usr, "You check your watch, realising it's closed.")
	else
		to_chat(usr, "You check your watch, glancing over at the watch face, reading the time to be '[worldtime2text()]'. Today's date is '[time2text(world.time, "Month DD")]. [GLOB.game_year]'.")

/obj/item/pocketwatch/verb/pointatwatch()
	set category = "Object"
	set name = "Point at watch"
	set src in usr

	if(closed)
		usr.visible_message (span_notice("[usr] taps their foot on the floor, arrogantly pointing at the [src] in their hand with a look of derision in their eyes, not noticing it's closed."), span_notice("You point down at the [src], an arrogant look about your eyes."))
	else
		usr.visible_message (span_notice("[usr] taps their foot on the floor, arrogantly pointing at the [src] in their hand with a look of derision in their eyes."), span_notice("You point down at the [src], an arrogant look about your eyes."))


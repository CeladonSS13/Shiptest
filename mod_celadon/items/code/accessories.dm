//********************
// 		Hand Watch
//********************
/obj/item/clothing/wrists/watch/tajaran
	name = "adhomian male watch"
	desc = "An adhomian wrist watch made for male Tajara. Due to its use in the past wars, wrist watches are becoming more popular in Adhomai."
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	icon_state = "watch_taj-male"
	item_state = "watch_taj-male"
	slot_flags = ITEM_SLOT_LPOCKET | ITEM_SLOT_RPOCKET

/obj/item/clothing/wrists/watch/tajaran/female
	name = "adhomian watch"
	desc = "An adhomian wrist watch made for female Tajara. Due to its use in the past wars, wrist watches are becoming more popular in Adhomai."
	icon_state = "watch_taj-female"
	item_state = "watch_taj-female"

/obj/item/clothing/accessory/tajaran
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	drop_sound = 'mod_celadon/_storge_sounds/sound/drop/accessory.ogg'
	pickup_sound = 'mod_celadon/_storge_sounds/sound/pickup/accessory.ogg'

/obj/item/clothing/accessory/tajaran/charm/raskariim
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_SORTIROVATI.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/tajara_items_overlay_SORTIROVATI.dmi'
	name = "metal amulet"
	desc = "An amulet made of some light metal."
	icon_state = "raskara_amulet"
	item_state = "raskara_amulet"
	above_suit = TRUE
	slot_flags = ITEM_SLOT_LPOCKET | ITEM_SLOT_RPOCKET

/obj/item/pocketwatch/adhomai
	name = "adhomian watch"
	desc = "A watch made in the traditional adhomian style. It can be stored in a pocket."
	icon_state = "adhomai_clock"
	item_state = "adhomai_clock"
	slot_flags = ITEM_SLOT_LPOCKET | ITEM_SLOT_RPOCKET
	var/static/months = list("Menshe-aysaif", "Sil'nryy-aysaif", "Menshe-rhazzimy", "Sil'nryy-rhazzimy")

/obj/item/pocketwatch/adhomai/checktime(mob/user)
	set category = "Object"
	set name = "Check Time"
	set src in usr

	if(closed)
		to_chat(usr, span_warning("You check your watch, realising it's closed."))
	else
		var/adhomian_year = GLOB.game_year + 1158
		var/current_month = text2num(time2text(world.realtime, "MM"))
		var/current_day = text2num(time2text(world.realtime, "DD"))
		var/adhomian_day
		var/adhomian_month = src.months[Ceiling(current_month/3)]
		switch(current_month)
			if(2, 5, 8, 11)
				current_day += 31
			if(6, 9, 12)
				current_day += 61
			if(3)
				current_day += 59 + IsLeapYear(text2num(time2text(world.realtime, "YYYY"))) // we can conveniently use the result of `IsLeapYear` to add 1 when we are in a leap year
		var/real_time = text2num(time2text(world.time + (REALTIMEOFDAY - (TIMEZONE_CST HOURS)), "hh"))
		var/adhomian_time = real_time

		if(ISEVEN(current_day))
			adhomian_time = real_time + 24
		adhomian_day = FLOOR(current_day / 2, 1)
		to_chat(usr, "You check your [src.name], glancing over at the watch face, reading the time to be '[adhomian_time]'. Today's date is the '[adhomian_day]th day of [adhomian_month], [adhomian_year]'.")

// Rings
/obj/item/clothing/gloves/ring/diamond
	name = "diamond ring"
	desc = "An expensive ring, studded with a diamond. Cultures have used these rings in courtship for a millenia."
	icon_state = "ringdiamond"
	item_state = "dring"

/obj/item/clothing/gloves/ring/diamond/attack_self(mob/user)
	to_chat(usr, "The [usr.name] gets down on one knee, presenting \the [src].", span_warning("You get down on one knee, presenting \the [src]."))

/obj/item/clothing/gloves/ring/silver
	name = "silver ring"
	desc = "A tiny silver ring, sized to wrap around a finger."
	icon_state = "ringsilver"
	item_state = "sring"

/// MARK: MAID
/obj/item/clothing/accessory/maidapron
	name = "maid apron"
	desc = "The best part of a maid costume."
	icon_state = "maidapron"
	item_state = "maidapron"
	icon = 'mod_celadon/_storge_icons/icons/items/clothing/accessories/obj.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/clothing/accessories/overlay/onmob.dmi'
	minimize_when_attached = FALSE
	attachment_slot = null

/obj/item/clothing/accessory/maidapron/syndicate
	name = "syndicate maid apron"
	desc = "Practical? No. Tactical? Also no. Cute? Most definitely yes."
	icon_state = "maidapronsynd"
	item_state = "maidapronsynd"

/obj/item/clothing/accessory/maidapron/inteq
	name = "inteq maid apron"
	desc = "A 'tactical' apron to protect you from all sorts of spills, from dough to blood!"
	icon_state = "inteqmaidapron"
	item_state = "inteqmaidapron"

/obj/item/proc/suicide_act(mob/living/user)
	return

/obj/item/clothing/gloves/ring
	icon = 'mod_celadon/_storage_icons/icons/items/misc/ring.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/hands/overlay/hands2.dmi'
	name = "gold ring"
	desc = "A tiny gold ring, sized to wrap around a finger."
	gender = NEUTER
	w_class = WEIGHT_CLASS_TINY
	icon_state = "ringgold"
	item_state = "gring"
	// body_parts_covered = 0
	strip_delay = 4 SECONDS

/obj/item/clothing/gloves/ring/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("\[user] is putting the [src] in [user.p_their()] mouth! It looks like [user] is trying to choke on the [src]!"))
	return OXY


/obj/item/clothing/gloves/ring/diamond
	name = "diamond ring"
	desc = "An expensive ring, studded with a diamond. Cultures have used these rings in courtship for a millenia."
	icon_state = "ringdiamond"
	item_state = "dring"

/obj/item/clothing/gloves/ring/diamond/attack_self(mob/user)
	user.visible_message(span_warning("\The [user] gets down on one knee, presenting \the [src]."),span_warning("You get down on one knee, presenting \the [src]."))

/obj/item/clothing/gloves/ring/silver
	name = "silver ring"
	desc = "A tiny silver ring, sized to wrap around a finger."
	icon_state = "ringsilver"
	item_state = "sring"

/*
 * Ring Box
 */

/obj/item/storage/fancy/ringbox
	name = "ring box"
	desc = "A tiny box covered in soft red felt made for holding rings."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/ring.dmi'
	icon_state = "gold ringbox"
	base_icon_state = "gold ringbox"
	w_class = WEIGHT_CLASS_TINY
	spawn_type = /obj/item/clothing/gloves/ring
	contents_tag = "ring"

/obj/item/storage/fancy/ringbox/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.set_holdable(list(/obj/item/clothing/gloves/ring))

/obj/item/storage/fancy/ringbox/PopulateContents()
	if(spawn_type)
		new spawn_type(src)

/obj/item/storage/fancy/ringbox/update_icon_state()
	if(!is_open)
		icon_state = base_icon_state
		return ..()

	if(!contents.len)
		icon_state = "[base_icon_state]0"
	else
		var/obj/item/clothing/gloves/ring/ring = contents[1]
		if(istype(ring, /obj/item/clothing/gloves/ring/diamond))
			icon_state = "[base_icon_state]1"
		else if(istype(ring, /obj/item/clothing/gloves/ring/silver))
			icon_state = "[base_icon_state]1"
		else
			icon_state = "[base_icon_state]1"
	return ..()

/obj/item/storage/fancy/ringbox/diamond
	icon_state = "diamond ringbox"
	base_icon_state = "diamond ringbox"
	spawn_type = /obj/item/clothing/gloves/ring/diamond

/obj/item/storage/fancy/ringbox/silver
	icon_state = "silver ringbox"
	base_icon_state = "silver ringbox"
	spawn_type = /obj/item/clothing/gloves/ring/silver

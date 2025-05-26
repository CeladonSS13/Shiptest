/obj/item/storage/ashtray
	name = "Пепельница"
	desc = "Дешёвая пепельница."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/ashtray.dmi'
	icon_state = "ashtray_bl"
	var/icon_half  = "ashtray_half_bl"
	var/icon_full  = "ashtray_full_bl"
	var/icon_broken = "ashtray_bork_bl"
	max_integrity = 12
	throwforce = 3

/obj/item/storage/ashtray/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.silent = TRUE
	STR.max_combined_w_class = 6
	STR.max_items = 6
	STR.max_w_class = WEIGHT_CLASS_TINY
	STR.set_holdable(list(/obj/item/clothing/mask/cigarette,
						/obj/item/lighter,
						/obj/item/cigbutt,
						/obj/item/match,
						/obj/item/rollingpaper))

/obj/item/storage/ashtray/Initialize(mapload)
	. = ..()
	pixel_y = rand(-5, 5)
	pixel_x = rand(-6, 6)

/obj/item/storage/ashtray/attackby(obj/item/I, mob/user, params)
	var/is_cig = istype(I, /obj/item/clothing/mask/cigarette)
	if(is_cig || istype(I, /obj/item/cigbutt) || istype(I, /obj/item/match))
		if((SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, I, user)))
			var/obj/item/clothing/mask/cigarette/cig = I
			if(is_cig)
				if(cig.lit)
					visible_message("[user] crushes [cig] in [src], putting it out.")
					var/obj/item/butt = new cig.type_butt(src)
					cig.transfer_fingerprints_to(butt)
					qdel(cig)
				else
					to_chat(user, "You place [cig] in [src] without even smoking it. Why would you do that?")
			else
				visible_message("[user] places [I] in [src].")
		else
			to_chat(user, span_warning("You can't put [I] in [src]. Its already full."))
	add_fingerprint(user)
	update_appearance(UPDATE_DESC|UPDATE_ICON_STATE)


/obj/item/storage/ashtray/update_icon_state()
	. = ..()
	if(length(contents) == 6)
		icon_state = icon_full
	else if(length(contents) >= 3)
		icon_state = icon_half
	else
		icon_state = initial(icon_state)

/obj/item/storage/ashtray/update_desc(updates = ALL)
	. = ..()
	if(length(contents) == 6)
		desc = initial(desc) + " It's stuffed full."
	else if(length(contents) >= 3)
		desc = initial(desc) + " It's half-filled."
	else
		desc = initial(desc)


/obj/item/storage/ashtray/proc/empty_tray()
	for(var/obj/item/I in contents)
		I.forceMove(loc)
	update_appearance(UPDATE_DESC|UPDATE_ICON_STATE)


/obj/item/storage/ashtray/deconstruct()
	var/obj/item/trash/broken_ashtray/shards = new(get_turf(src))
	shards.icon_state = icon_broken
	visible_message(span_warning("Oops, [src] broke into a lot of pieces!"))
	return ..()


/obj/item/storage/ashtray/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(length(contents))
		visible_message(span_warning("[src] slams into [hit_atom] spilling its contents!"))
	empty_tray()
	if(rand(1,20) > max_integrity)
		deconstruct()
	return ..()

/datum/crafting_recipe/ashtray_bronze
	name = "Пепельница из бронзы"
	result = /obj/item/storage/ashtray/bronze
	time = 5
	reqs = list(/obj/item/stack/sheet/metal = 8)
	category = CAT_MISC

/obj/item/storage/ashtray/bronze
	name = "Пепельница из бронзы"
	desc = "Массивная бронзовая пепельница."
	icon_state = "ashtray_br"
	icon_half  = "ashtray_half_br"
	icon_full  = "ashtray_full_br"
	icon_broken = "ashtray_bork_br"
	max_integrity = 16
	throwforce = 10

/datum/crafting_recipe/ashtray_glass
	name = "Пепельница из стекла"
	result = /obj/item/storage/ashtray/glass
	time = 5
	reqs = list(/obj/item/stack/sheet/glass = 6)
	category = CAT_MISC

/obj/item/storage/ashtray/glass
	name = "Пепельница из стекла"
	desc = "Пепельница из стекла. Выглядит хрупко и стильно."
	icon_state = "ashtray_gl"
	icon_half  = "ashtray_half_gl"
	icon_full  = "ashtray_full_gl"
	icon_broken = "ashtray_bork_gl"
	max_integrity = 8
	throwforce = 6


/obj/item/trash/broken_ashtray
	name = "Осколки пепельницы"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/ashtray.dmi'
	icon_state = "ashtray_bork_bl"

/obj/item/trash/broken_ashtray/Initialize(mapload)
	. = ..()
	icon_state = "ashtray_bork_" + pick(list("bl","br","gl"))


/datum/crafting_recipe/ashtray
	name = "Пепельница"
	result = /obj/item/storage/ashtray
	time = 5
	reqs = list(/obj/item/stack/sheet/metal = 3, /obj/item/stack/sheet/glass = 3)
	category = CAT_MISC

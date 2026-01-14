/obj/item/radio/intercom
	name = "shortwave intercom"
	desc = "Talk through this."
	icon = 'icons/obj/radio.dmi'
	icon_state = "intercom"
	anchored = TRUE
	listening = TRUE
	w_class = WEIGHT_CLASS_BULKY
	canhear_range = 2
	dog_fashion = null
	unscrewed = FALSE
	var/mode_token = MODE_TOKEN_INTERCOM
	var/obj/item/wallframe/wallframe = /obj/item/wallframe/intercom
	var/faction = FALSE

MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom, 31)

/obj/item/radio/intercom/unscrewed
	unscrewed = TRUE

/obj/item/radio/intercom/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		setDir(turn(ndir,180))
	var/area/current_area = get_area(src)
	if(!current_area)
		return
	RegisterSignal(current_area, COMSIG_AREA_POWER_CHANGE, PROC_REF(AreaPowerCheck))

/obj/item/radio/intercom/examine(mob/user)
	. = ..()
	. += span_notice("Use [mode_token] when nearby to speak into it.")
	if(!unscrewed)
		. += span_notice("It's <b>screwed</b> and secured to the wall.")
	else
		. += span_notice("It's <i>unscrewed</i> from the wall, and can be <b>detached</b>.")

/obj/item/radio/intercom/wideband/examine_more(mob/user)
	. = ..()
	interact(user)

/obj/item/radio/intercom/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(unscrewed)
			user.visible_message(span_notice("[user] starts tightening [src]'s screws..."), span_notice("You start screwing in [src]..."))
			if(I.use_tool(src, user, volume=50))
				user.visible_message(span_notice("[user] tightens [src]'s screws!"), span_notice("You tighten [src]'s screws."))
				unscrewed = FALSE
		else
			user.visible_message(span_notice("[user] starts loosening [src]'s screws..."), span_notice("You start unscrewing [src]..."))
			if(I.use_tool(src, user, volume=50))
				user.visible_message(span_notice("[user] loosens [src]'s screws!"), span_notice("You unscrew [src], loosening it from the wall."))
				unscrewed = TRUE
		return
	else if(I.tool_behaviour == TOOL_WRENCH)
		if(!unscrewed)
			to_chat(user, span_warning("You need to unscrew [src] from the wall first!"))
			return
		user.visible_message(span_notice("[user] starts unsecuring [src]..."), span_notice("You start unsecuring [src]..."))
		I.play_tool_sound(src)
		if(I.use_tool(src, user, 80))
			user.visible_message(span_notice("[user] unsecures [src]!"), span_notice("You detach [src] from the wall."))
			playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
			new wallframe(get_turf(src))
			qdel(src)
		return
	return ..()

/obj/item/radio/intercom/attack_ai(mob/user)
	interact(user)

/obj/item/radio/intercom/attack_paw(mob/user)
	return attack_hand(user)


/obj/item/radio/intercom/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	interact(user)

/obj/item/radio/intercom/ui_state(mob/user)
	if(issilicon(user)) // for silicons give default_state
		return GLOB.default_state

	return GLOB.physical_state // for other non-dexterous mobs give physical_state



/obj/item/radio/intercom/can_receive(freq, map_zones)
	if(!on)
		return FALSE
	if(wires.is_cut(WIRE_RX))
		return FALSE
	if(!(0 in map_zones))
		var/turf/position = get_turf(src)
		var/datum/map_zone/mapzone = position.get_map_zone()
		if(!position || !(mapzone in map_zones))
			return FALSE
	if(!listening)
		return FALSE

	return TRUE


/obj/item/radio/intercom/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans, list/message_mods = list())
	if(message_mods[RADIO_EXTENSION] == MODE_INTERCOM)
		return  // Avoid hearing the same thing twice
	return ..()

/obj/item/radio/intercom/emp_act(severity)
	. = ..() // Parent call here will set `on` to FALSE.
	update_appearance()

/obj/item/radio/intercom/end_emp_effect(curremp)
	. = ..()
	AreaPowerCheck() // Make sure the area/local APC is powered first before we actually turn back on.

/obj/item/radio/intercom/update_icon()
	. = ..()
	if(faction)
		return
	if(on)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-p"

/**
 * Proc called whenever the intercom's area loses or gains power. Responsible for setting the `on` variable and calling `update_appearance()`.
 *
 * Normally called after the intercom's area recieves the `COMSIG_AREA_POWER_CHANGE` signal, but it can also be called directly.
 * Arguments:
 * * source - the area that just had a power change.
 */
/obj/item/radio/intercom/proc/AreaPowerCheck(datum/source)
	var/area/current_area = get_area(src)
	if(!current_area)
		on = FALSE
	else
		on = current_area.powered(AREA_USAGE_EQUIP) // set "on" to the equipment power status of our area.
	update_appearance()

/obj/item/radio/intercom/add_blood_DNA(list/blood_dna)
	return FALSE

//Created through the autolathe or through deconstructing intercoms. Can be applied to wall to make a new intercom on it!
/obj/item/wallframe/intercom
	name = "intercom frame"
	desc = "A ready-to-go intercom. Just slap it on a wall and screw it in!"
	icon_state = "intercom"
	result_path = /obj/item/radio/intercom/unscrewed
	pixel_shift = 31
	inverse = FALSE
	custom_materials = list(/datum/material/iron = 75, /datum/material/glass = 25)

//table Normal Intercoms

/obj/item/radio/intercom/table
	icon_state = "intercom-table"
	wallframe = /obj/item/wallframe/intercom/table

/obj/item/wallframe/intercom/table
	icon_state = "intercom-table"
	icon = 'icons/obj/radio.dmi'
	result_path = /obj/item/radio/intercom/table
	pixel_shift = 0

//wideband radio
/obj/item/radio/intercom/wideband
	name = "wideband relay"
	desc = "A low-gain reciever capable of sending and recieving wideband subspace messages."
	icon_state = "intercom-wideband"
	canhear_range = 3
	keyslot = new /obj/item/encryptionkey/wideband
	independent = TRUE
	frequency = FREQ_WIDEBAND
	freqlock = TRUE
	freerange = TRUE
	log = TRUE
	mode_token = MODE_TOKEN_WIDEBAND
	wallframe = /obj/item/wallframe/intercom/wideband

/obj/item/radio/intercom/wideband/Initialize(mapload, ndir, building)
	. = ..()
	set_frequency(FREQ_WIDEBAND)
	freqlock = TRUE

/obj/item/radio/intercom/wideband/unscrewed
	unscrewed = TRUE

MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/wideband, 26)

// [CELADON-ADD]
/obj/item/radio/intercom/faction
	name = "internal intercom"
	desc = "A internal intercom. Faction radio included!"
	icon = 'mod_celadon/_storage_icons/icons/machinery/intercoms_maphelp.dmi'
	icon_state = "intercom"
	keyslot = new /obj/item/encryptionkey/wideband
	frequency = FREQ_EMERGENCY
	freqlock = TRUE
	independent = TRUE
	freerange = TRUE
	faction = TRUE
	var/stripe_color = null		/// What color is this machine's stripe? Leave null to not have a stripe.

/obj/item/radio/intercom/faction/Initialize(mapload, ndir, building)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)
	set_frequency(frequency)
	freqlock = TRUE

/obj/item/radio/intercom/faction/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/radio/intercom/faction/update_overlays()
	. = ..()
	if(unscrewed)
		. += "intercom-open"
	if(!stripe_color)
		return

	var/mutable_appearance/stripe = mutable_appearance(icon, "intercom-offline")
	if(on)
		stripe.icon_state = "intercom-active"
		stripe.color = stripe_color
	. += stripe

/obj/item/radio/intercom/faction/syndicate
	keyslot = new /obj/item/encryptionkey/syndicate
	frequency = FREQ_SYNDICATE_SHORT
	stripe_color = "#fd5454"
	icon_state = "intercom-syndicate"

/obj/item/radio/intercom/faction/syndicate/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_SYNDICATE_LONG
	icon_state = "intercom-syndicate-c"

/obj/item/radio/intercom/faction/suns
	keyslot = new /obj/item/encryptionkey/suns
	frequency = FREQ_SUNS_SHORT
	stripe_color = "#b162ff"
	icon_state = "intercom-suns"

/obj/item/radio/intercom/faction/suns/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_SUNS_LONG
	icon_state = "intercom-suns-c"

/obj/item/radio/intercom/faction/inteq
	keyslot = new /obj/item/encryptionkey/inteq
	frequency = FREQ_INTEQ_SHORT
	stripe_color = "#ffb92d"
	icon_state = "intercom-inteq"

/obj/item/radio/intercom/faction/inteq/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_INTEQ_LONG
	icon_state = "intercom-inteq-c"

/obj/item/radio/intercom/faction/elysium
	keyslot = new /obj/item/encryptionkey/elysium
	frequency = FREQ_ELYSIUM_SHORT
	stripe_color = "#29ff29"
	icon_state = "intercom-elysium"

/obj/item/radio/intercom/faction/elysium/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_ELYSIUM_LONG
	icon_state = "intercom-elysium-c"

/obj/item/radio/intercom/faction/nanotrasen
	keyslot = new /obj/item/encryptionkey/nanotrasen
	frequency = FREQ_NANOTRASEN_SHORT
	stripe_color = "#5fafff"
	icon_state = "intercom-nanotrasen"

/obj/item/radio/intercom/faction/nanotrasen/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_NANOTRASEN_LONG
	icon_state = "intercom-nanotrasen-c"

/obj/item/radio/intercom/faction/solfed
	keyslot = new /obj/item/encryptionkey/solgov
	frequency = FREQ_SOLFED_SHORT
	stripe_color = "#4fe2ff"
	icon_state = "intercom-solfed"

/obj/item/radio/intercom/faction/solfed/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_SOLFED_LONG
	icon_state = "intercom-solfed-c"

/obj/item/radio/intercom/faction/ramzi
	keyslot = new /obj/item/encryptionkey/ramzi
	frequency = FREQ_RAMZI_SHORT
	stripe_color = "#ca9d6f"
	icon_state = "intercom-ramzi"

/obj/item/radio/intercom/faction/ramzi/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_RAMZI_LONG
	icon_state = "intercom-ramzi-c"

/obj/item/radio/intercom/faction/pirate
	keyslot = new /obj/item/encryptionkey/pirate
	frequency = FREQ_PIRATE_SHORT
	stripe_color = "#777777"
	icon_state = "intercom-pirate"

/obj/item/radio/intercom/faction/pirate/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_PIRATE_LONG
	icon_state = "intercom-pirate-c"

MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/syndicate, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/suns, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/inteq, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/elysium, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/nanotrasen, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/solfed, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/ramzi, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/pirate, 32)
// [/CELADON-ADD]

/obj/item/radio/intercom/wideband/table
	icon_state = "intercom-wideband-table"
	wallframe = /obj/item/wallframe/intercom/wideband/table

/obj/item/radio/intercom/wideband/recalculateChannels()
	. = ..()
	independent = TRUE

/obj/item/wallframe/intercom/wideband
	name = "wideband relay wall frame"
	desc = "A detached wideband relay. Attach to a wall and screw it in to use."
	icon_state = "intercom-wideband"
	result_path = /obj/item/radio/intercom/wideband/unscrewed
	pixel_shift = 26

/obj/item/wallframe/intercom/wideband/attackby(obj/item/attack_obj, mob/user, params)
	if(istype(attack_obj, /obj/item/screwdriver))
		to_chat(user, span_notice("You begin to move the mounting screws to the frame's table bracket."))
		playsound(src, 'sound/items/screwdriver2.ogg', 30, TRUE)
		if(do_after(user, 2 SECONDS, src))
			var/obj/item/wallframe/intercom/wideband/table/replacement = new (get_turf(src))
			qdel(src)
			to_chat(user, span_notice("You ready the table bracket on [replacement]."))
			playsound(src, 'sound/items/screwdriver2.ogg', 30, TRUE)

/obj/item/wallframe/intercom/wideband/table
	name = "wideband relay table frame"
	desc = "A detached wideband relay. Attach to a table and screw it in to use."
	icon_state = "intercom-wideband"
	icon = 'icons/obj/wallframe.dmi'
	result_path = /obj/item/radio/intercom/wideband/table
	pixel_shift = 0

/obj/item/wallframe/intercom/wideband/table/attackby(obj/item/attack_obj, mob/user, params)
	if(istype(attack_obj, /obj/item/screwdriver))
		to_chat(user, span_notice("You begin to move the mounting screws to the frame's wall bracket."))
		playsound(src, 'sound/items/screwdriver2.ogg', 30, TRUE)
		if(do_after(user, 2 SECONDS, src))
			var/obj/item/wallframe/intercom/wideband/replacement = new (get_turf(src))
			qdel(src)
			to_chat(user, span_notice("You ready the wall bracket on [replacement]."))
			playsound(src, 'sound/items/screwdriver2.ogg', 30, TRUE)

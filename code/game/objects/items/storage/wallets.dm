/obj/item/storage/wallet
	name = "wallet"
	desc = "It can hold a few small and personal things."
	icon = 'mod_celadon/_storage_icons/icons/resprite/wallet.dmi'
	icon_state = "wallet"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_ID
	component_type = /datum/component/storage/concrete	// [CELADON-EDIT] - DONT_ALTCLICK_WALLET

	var/obj/item/card/id/front_id = null
	var/list/combined_access
	var/cached_flat_icon

/obj/item/storage/wallet/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage/concrete)	// [CELADON-EDIT] - DONT_ALTCLICK_WALLET
	STR.max_items = 5	// [CELADON-EDIT] - CELADON_QOL // STR.max_items = 4 // ORIGINAL
	STR.set_holdable(list(
		/obj/item/spacecash/bundle,
		/obj/item/holochip,
		/obj/item/card,
		/obj/item/flashlight/pen,
		/obj/item/seeds,
		/obj/item/toy/crayon,
		/obj/item/coin,
		/obj/item/dice,
		/obj/item/disk,
		/obj/item/lighter,
		/obj/item/key/ship,
		/obj/item/gun/ballistic/derringer,
		/obj/item/lipstick,
		/obj/item/match,
		/obj/item/paper,
		/obj/item/pen,
		/obj/item/photo,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/syringe,
		// /obj/item/screwdriver,	// [CELADON-REMOVE] - CELADON_QOL
		/obj/item/stamp,
		// [CELADON-ADD] - CELADON_QOL - Добавляем ключи и нож для писем, сигареты
		/obj/item/melee/knife/letter_opener,
		/obj/item/key,
		/obj/item/clothing/gloves/ring,
		/obj/item/clothing/gloves/ring/silver,
		/obj/item/clothing/gloves/ring/diamond,
		/obj/item/clothing/mask/cigarette,
		/obj/item/stamp),
		// [/CELADON-ADD]
		list(/obj/item/screwdriver/power))

/obj/item/storage/wallet/Exited(atom/movable/AM)
	. = ..()
	UnregisterSignal(AM, COSMIG_ACCESS_UPDATED)
	refresh_id()

/obj/item/storage/wallet/proc/refresh_id()
	LAZYCLEARLIST(combined_access)
	if(!(front_id in src))
		front_id = null
	for(var/obj/item/card/id/I in contents)
		if(!front_id)
			front_id = I
		LAZYOR(combined_access, I.access)
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.wear_id == src)
			H.sec_hud_set_ID()
	update_appearance()
	update_label()

/obj/item/storage/wallet/Entered(atom/movable/AM)
	. = ..()
	RegisterSignal(AM, COSMIG_ACCESS_UPDATED, PROC_REF(refresh_id))
	refresh_id()

/obj/item/storage/wallet/update_overlays()
	. = ..()
	cached_flat_icon = null
	// [CELADON-ADD] - CELADON_RESPRITE_WALLET
	var/has_cash = FALSE
	var/has_card = FALSE
	var/has_key = FALSE
	var/has_chip = FALSE
	var/max_cash_value = 0
	var/max_chip_value = 0

	for(var/obj/item/I in contents)
		if(istype(I, /obj/item/card/bank))
			has_card = TRUE
		if(istype(I, /obj/item/spacecash))
			has_cash = TRUE
			var/obj/item/spacecash/cash = I
			if(cash.value > max_cash_value)
				max_cash_value = cash.value
		if(istype(I, /obj/item/holochip))
			has_chip = TRUE
			var/obj/item/holochip/chip = I
			if(chip.credits > max_chip_value)
				max_chip_value = chip.credits
		if(istype(I, /obj/item/key/ship))
			has_key = TRUE
	// [/CELADON-ADD]

	if(!front_id)
	// [CELADON-EDIT] - CELADON_RESPRITE_WALLET
	// 	return
	// . += mutable_appearance(front_id.icon, front_id.icon_state)
	// . += front_id.overlays
	// . += mutable_appearance(icon, "wallet_overlay")	// ORIGINAL
		if(has_cash || has_card || has_key || has_chip)
			. += mutable_appearance(icon, get_wallet_overlay_state())
	else
		. += mutable_appearance(front_id.icon, front_id.icon_state)
		. += front_id.overlays
		. += mutable_appearance(icon, get_wallet_overlay_state())

	if(has_cash)
		. += mutable_appearance(icon, get_cash_overlay_state(max_cash_value))
	if(has_chip)
		. += mutable_appearance(icon, get_cashchip_overlay_state(max_chip_value))
	if(has_key)
		. += mutable_appearance(icon, "keys_overlay")
	if(has_card)
		. += mutable_appearance(icon, "cashcard_overlay")
	// [/CELADON-EDIT]

/obj/item/storage/wallet/proc/get_cash_overlay_state(value)
	switch(value)
		if(0 to 999)
			return "cash_overlay_1"
		if(1000 to 2499)
			return "cash_overlay_1000"
		if(2500 to 4999)
			return "cash_overlay_2500"
		if(5000 to INFINITY)
			return "cash_overlay_5000"

/obj/item/storage/wallet/proc/get_cashchip_overlay_state(value)
	switch(value)
		if(0 to 999)
			return "cashchip_overlay_1"
		if(1000 to 2499)
			return "cashchip_overlay_1000"
		if(2500 to 4999)
			return "cashchip_overlay_2500"
		if(5000 to INFINITY)
			return "cashchip_overlay_5000"

/obj/item/storage/wallet/proc/get_cached_flat_icon()
	if(!cached_flat_icon)
		cached_flat_icon = getFlatIcon(src)
	return cached_flat_icon

/obj/item/storage/wallet/get_examine_string(mob/user, thats = FALSE)
	if(front_id)
		return "[icon2html(get_cached_flat_icon(), user)] [thats? "That's ":""][get_examine_name(user)]" //displays all overlays in chat
	return ..()

/obj/item/storage/wallet/proc/update_label()
	if(front_id)
		name = "wallet displaying [front_id]"
	else
		name = "wallet"

/obj/item/storage/wallet/examine()
	. = ..()
	if(front_id)
		. += span_notice("Alt-click to remove the id.")

/obj/item/storage/wallet/GetID()
	return front_id

/obj/item/storage/wallet/RemoveID()
	if(!front_id)
		return
	. = front_id
	front_id.forceMove(get_turf(src))

/obj/item/storage/wallet/InsertID(obj/item/inserting_item)
	var/obj/item/card/inserting_id = inserting_item.RemoveID()
	if(!inserting_id)
		return FALSE
	attackby(inserting_id)
	if(inserting_id in contents)
		return TRUE
	return FALSE

/obj/item/storage/wallet/GetAccess()
	if(LAZYLEN(combined_access))
		return combined_access
	else
		return ..()

/obj/item/storage/wallet/GetBankCard()
	for(var/obj/item/card/I in contents)
		if(istype(I, /obj/item/card/bank))
			return I

/obj/item/storage/wallet/random
	icon_state = "random_wallet"

/obj/item/storage/wallet/random/PopulateContents()
	new /obj/effect/spawner/random/entertainment/wallet_storage(src)
	icon_state = "wallet"

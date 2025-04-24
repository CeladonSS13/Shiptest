/obj/machinery/vending/inteq/space_vendor
	name = "\improper InteQ space equipment vendor"
	desc = "An InteQ equipment vendor."
	product_ads = "Please insert your marine voucher in the bottom slot."
	icon_state = "marine"
	icon_deny = "marine-deny"
	light_mask = "marine-mask"
	circuit = /obj/item/circuitboard/machine/vending/inteq/space_vendor
	req_access = list(ACCESS_INTEQ_SECURITY)
	products = list(
	/obj/item/stock_parts/cell/hyper = 3,
	/obj/item/mod/module/anomaly_locked/antigrav/prebuilt = 3,
	/obj/item/mod/module/tether = 3,
	)
	contraband = list()
	premium = list()


	var/voucher_items = list(
		"MOD suit" = /obj/item/mod/control/pre_equipped/inteq,
		"Rig suit" = /obj/item/clothing/suit/space/hardsuit/syndi/inteq
		)


/obj/machinery/vending/inteq/space_vendor/attackby(obj/item/I, mob/user, params) //WS edit: THERE IS NO GOD. THERE IS ONLY GUNS. REPENT. //shiptest: i should remove this comment, but its funny
	if(istype(I, /obj/item/inteq_space_voucher))
		RedeemVoucher(I, user)
		return
	return..()


/obj/machinery/vending/inteq/space_vendor/proc/RedeemVoucher(obj/item/inteq_space_voucher/voucher, mob/redeemer)
	var/selection = show_radial_menu(redeemer, src, voucher_items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	if(voucher_items[selection])
		var/drop_location = drop_location()
		switch(selection)
			if("MOD suit")
				new /obj/item/mod/control/pre_equipped/inteq(drop_location)
			if("Rig suit")
				new /obj/item/clothing/suit/space/hardsuit/syndi/inteq(drop_location)

	SSblackbox.record_feedback("tally", "inteq_voucher_redeemed", 1, selection)
	qdel(voucher)


/obj/item/circuitboard/machine/vending/inteq/space_vendor
	name = "InteQ space equipment vendor (Machine Board)"
	build_path = /obj/machinery/vending/inteq/space_vendor
	req_components = list(
		/obj/item/stack/sheet/rglass = 1,
		/obj/item/vending_refill/inteq/space_vendor = 1)

/obj/item/vending_refill/inteq/space_vendor
	machine_name = "InteQ space equipment vendor"
	icon_state = "mining-refill"

/obj/item/inteq_space_voucher
	name = "InteQ space equipment voucher"
	desc = "A token used by InteQ operatives, used to receive a rig suit or a MOD suit. Use it on a equipment vendor."
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_voucher"
	w_class = WEIGHT_CLASS_TINY

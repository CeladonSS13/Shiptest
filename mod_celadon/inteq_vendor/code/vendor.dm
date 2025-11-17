/obj/item/gun_voucher/inteq
	name = "inteq weapon voucher"
	desc = "A token used to redeem equipment from your nearest Inteq vendor."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/gun_vaucher.dmi'
	icon_state = "inteq-voucher"

/obj/machinery/vending/security/marine/inteq
	name = "\improper Inteq equipment vendor"
	desc = "An Inteq Risk Management Group equipment vendor."
	product_ads = "Protect corporate interests!;Professional security solutions!;Insert your Inteq voucher below."
	// icon_state = "inteq-marine"
	// icon_deny = "inteq-marine-deny"
	// light_mask = "inteq-marine-mask"
	// icon_vend = "inteq-marine-vend"
	req_access = list(ACCESS_OUTPOST_FACTION_INTEQ)
	products = list(
		/obj/item/restraints/handcuffs = 5,
		/obj/item/assembly/flash/handheld = 5,
		/obj/item/flashlight/seclite = 5,
		/obj/item/stock_parts/cell/gun = 5,
		/obj/item/grenade/stingbang = 3
	)
	voucher_items = list(
		"Tactical Bundle" = /obj/item/storage/box/inteq/tactical,
		"Vanguard Bundle" = /obj/item/storage/box/inteq/vanguard,
		"Specialist Bundle" = /obj/item/storage/box/inteq/specialist
	)
	var/document_value_min = 6000
	var/document_value_max = 12000
	var/document_value = 0

/obj/machinery/vending/security/marine/inteq/Initialize()
	. = ..()
	document_value = rand(document_value_min, document_value_max)

/obj/machinery/vending/security/marine/inteq/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/documents))
		to_chat(user, span_notice("You insert [I] into [src]. The machine dispenses [document_value] credits."))
		var/obj/item/holochip/holochip = new(drop_location(), document_value)
		user.put_in_hands(holochip)
		qdel(I)
		return
	return ..()

// Inteq bundles
/obj/item/storage/box/inteq
	name = "inteq equipment box"
	desc = "A box containing Inteq equipment."
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "box_survival_iq"

/obj/item/storage/box/inteq/tactical
	name = "tactical bundle"
	desc = "A box containing light tactical equipment."

/obj/item/storage/box/inteq/tactical/PopulateContents()
	new /obj/item/clothing/suit/armor/vest/alt(src)
	new /obj/item/storage/guncase/rottweiler(src)

/obj/item/storage/box/inteq/vanguard
	name = "vanguard bundle"
	desc = "A box containing vanguard equipment."

/obj/item/storage/box/inteq/vanguard/PopulateContents()
	new /obj/item/clothing/suit/armor/hos/inteq/honorable(src)
	new /obj/item/gun/ballistic/revolver/horizonx(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357/hp(src)
	new /obj/item/ammo_box/a357/hp(src)
	new /obj/item/grenade/stingbang(src)
	new /obj/item/grenade/stingbang(src)
	new /obj/item/clothing/glasses/hud/security/night(src)

/obj/item/storage/box/inteq/specialist
	name = "specialist bundle"
	desc = "A box containing specialist equipment."

/obj/item/storage/box/inteq/specialist/PopulateContents()
	new /obj/item/melee/duelenergy/saber/yellow(src)
	new /obj/item/reagent_containers/hypospray/combat(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimpack(src)

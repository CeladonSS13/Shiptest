/obj/item/gun_voucher/inteq
	name = "inteq weapon voucher"
	desc = "A token used to redeem equipment from your nearest Inteq vendor."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/gun_vaucher.dmi'
	icon_state = "inteq-voucher"

GLOBAL_LIST_EMPTY(inteq_authorized_officers)
GLOBAL_LIST_EMPTY(inteq_authorized_dna)
GLOBAL_VAR_INIT(inteq_document_password, "")

/obj/machinery/vending/security/marine/inteq
	name = "\improper Inteq equipment vendor"
	desc = "An Inteq Risk Management Group equipment vendor."
	product_ads = "Protect corporate interests!;Professional security solutions!;Insert your Inteq voucher below."
	req_access = list(ACCESS_OUTPOST_FACTION_INTEQ)
	products = null
	voucher_items = list(
		"Tactical Bundle" = /obj/item/storage/box/inteq/tactical,
		"Vanguard Bundle" = /obj/item/storage/box/inteq/vanguard,
		"Specialist Bundle" = /obj/item/storage/box/inteq/specialist
	)
	var/document_value_min = 8500
	var/document_value_max = 12000
	var/document_value = 0
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/vending/security/marine/inteq/Initialize()
	. = ..()
	document_value = rand(document_value_min, document_value_max)

/obj/machinery/vending/security/marine/inteq/ui_interact(mob/user, datum/tgui/ui)
	return

/obj/machinery/vending/security/marine/inteq/emag_act(mob/user)
	to_chat(user, span_warning("[src] has advanced anti-tampering protection!"))
	return FALSE

/obj/machinery/vending/security/marine/inteq/screwdriver_act(mob/living/user, obj/item/I)
	to_chat(user, span_warning("[src] is sealed and cannot be disassembled!"))
	return TRUE

/obj/machinery/vending/security/marine/inteq/wrench_act(mob/living/user, obj/item/I)
	to_chat(user, span_warning("[src] is bolted to the floor and cannot be moved!"))
	return TRUE

/obj/machinery/vending/security/marine/inteq/attack_hand(mob/user)
	to_chat(user, span_notice("[src] only accepts documents and vouchers. Insert them directly."))
	return

/obj/machinery/vending/security/marine/inteq/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/holochip) || istype(I, /obj/item/stack/spacecash))
		to_chat(user, span_warning("[src] does not accept money. Only documents and vouchers."))
		return
	if(istype(I, /obj/item/documents))
		if(!(user.real_name in GLOB.inteq_authorized_officers))
			to_chat(user, span_warning("Access denied. Only authorized Inteq officers can submit documents."))
			return
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(!H.dna || !(H.dna.unique_enzymes in GLOB.inteq_authorized_dna))
				to_chat(user, span_warning("DNA verification failed. Access denied."))
				log_admin("INTEQ VENDOR: [key_name(user)] failed DNA verification at [AREACOORD(src)].")
				return
		var/input_password = stripped_input(user, "Enter document submission password:", "Password Required", "")
		if(!input_password || input_password != GLOB.inteq_document_password)
			to_chat(user, span_warning("Incorrect password. Access denied."))
			return
		to_chat(user, span_notice("You insert [I] into [src]. The machine dispenses [document_value] credits."))
		var/obj/item/holochip/holochip = new(drop_location(), document_value)
		user.put_in_hands(holochip)
		log_admin("INTEQ VENDOR: [key_name(user)] submitted documents using password '[input_password]' and received [document_value] credits at [AREACOORD(src)].")
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
	new /obj/item/clothing/suit/armor/vest/marine/frontier(src)
	new /obj/item/storage/guncase/rottweiler(src)
	new /obj/item/ammo_box/magazine/rottweiler_308_box(src)
	new /obj/item/ammo_box/magazine/rottweiler_308_box(src)

/obj/item/storage/box/inteq/vanguard
	name = "vanguard bundle"
	desc = "A box containing vanguard equipment."

/obj/item/storage/box/inteq/vanguard/PopulateContents()
	new /obj/item/clothing/head/beret/sec/hos/inteq/honorable(src)
	new /obj/item/clothing/suit/armor/hos/inteq/honorable(src)
	new /obj/item/gun/ballistic/revolver/horizonx(src)
	new /obj/item/storage/box/ammo/a357_hp(src)
	new /obj/item/storage/box/ammo/a357_hp(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/grenade/stingbang(src)
	new /obj/item/grenade/stingbang(src)
	new /obj/item/clothing/glasses/hud/security/night(src)

/obj/item/storage/box/inteq/specialist
	name = "specialist bundle"
	desc = "A box containing specialist equipment."

/obj/item/storage/box/inteq/specialist/PopulateContents()
	new /obj/item/melee/duelenergy/saber/yellow(src)
	new /obj/item/reagent_containers/hypospray/combat(src)
	new /obj/item/reagent_containers/hypospray/medipen/combat_drug(src)

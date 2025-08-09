// Coroner PDA
/obj/item/pda/coroner
	name = "coroner PDA"
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-coroner"

// Coroner uniform
/obj/item/clothing/under/rank/medical/coroner
	name = "coroner uniform"
	desc = "A professional uniform for morgue operations."
	icon_state = "coroner"
	item_state = "coroner"

// Coroner labcoat
/obj/item/clothing/suit/toggle/labcoat/coroner
	name = "coroner's coat"
	desc = "A specialized coat for forensic medical work."
	icon_state = "labcoat_coroner"
	item_state = "labcoat_coroner"

// Coroner stamp
/obj/item/stamp/coroner
	name = "coroner's stamp"
	icon_state = "stamp-cmo"
	dye_color = DYE_BLACK

// Paper scanner for copying documents
/obj/item/paper_scanner
	name = "document scanner"
	desc = "A portable scanner for copying and printing documents."
	icon = 'icons/obj/device.dmi'
	icon_state = "scanner"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/paper_scanner/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You activate the scanner. Use it on papers to copy them.</span>")

/obj/item/paper_scanner/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return

	if(istype(target, /obj/item/paper))
		var/obj/item/paper/original = target
		var/obj/item/paper/copy = original.copy(location = get_turf(user))
		copy.name = "[original.name] (Copy)"
		to_chat(user, "<span class='notice'>You scan and print a copy of [original].</span>")
		playsound(src, 'sound/machines/printer.ogg', 50, TRUE)

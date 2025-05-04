//Clown PDA is slippery.
/obj/item/pda/clown
	name = "clown PDA"
	default_cartridge = /obj/item/cartridge/virus/clown
	inserted_item = /obj/item/toy/crayon/rainbow
	icon_state = "pda-clown"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The surface is coated with polytetrafluoroethylene and banana drippings."
	ttone = "honk"
	var/slipvictims = list() //Track slipped people

/obj/item/pda/clown/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/sitcomlaughter, CALLBACK(src, PROC_REF(after_sitcom_laugh)))

/obj/item/pda/clown/proc/AfterSlip(mob/living/carbon/human/M)
	if (istype(M) && (M.real_name != owner))
		slipvictims |= M
		var/obj/item/cartridge/virus/clown/cart = cartridge
		if(istype(cart) && cart.charges < 5)
			cart.charges++

/obj/item/pda/clown/proc/after_sitcom_laugh(mob/victim)
	victim.visible_message("[src] lets out a burst of laughter!")

//Mime PDA sends "silent" messages.
/obj/item/pda/mime
	name = "mime PDA"
	default_cartridge = /obj/item/cartridge/virus/mime
	inserted_item = /obj/item/toy/crayon/mime
	icon_state = "pda-mime"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The hardware has been modified for compliance with the vows of silence."
	allow_emojis = TRUE
	silent = TRUE
	ttone = "silence"

/obj/item/pda/mime/msg_input(mob/living/U = usr)
	if(emped || toff)
		return
	var/emojis = emoji_sanitize(stripped_input(U, "Please enter emojis", name))
	if(!emojis)
		return
	if(!U.canUseTopic(src, BE_CLOSE))
		return
	return emojis

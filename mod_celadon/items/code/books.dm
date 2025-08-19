/obj/item/elysm_manual
	name = "Book of Elysm"
	desc = "The book's cover reads: \"The national language of the Republic of Elysium, which is a mixture of Ard al-Elysm Almaveud and newly arrived settlers speaking a variation of Arabic 2378 Sol\""
	icon = 'mod_celadon/_storge_icons/icons/items/misc/book.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_righthand.dmi'
	icon_state = "elysm_book"

/obj/item/elysm_manual/attack_self(mob/living/user)
	if(!isliving(user))
		return

	if(user.has_language(/datum/language/elysm))
		to_chat(user, span_boldwarning("You start skimming through [src], but you already know Elysm."))
		return

	to_chat(user, span_boldannounce("You start skimming through [src], and suddenly your mind is filled with arabic symbols."))
	user.grant_language(/datum/language/elysm, source = LANGUAGE_MIND)


/obj/item/elysm_manual/attack(mob/living/M, mob/living/user)
	if(!istype(M) || !istype(user))
		return
	if(M == user)
		attack_self(user)
		return

	playsound(loc, "punch", 25, TRUE, -1)

	if(M.stat == DEAD)
		M.visible_message(span_danger("[user] smacks [M]'s lifeless corpse with [src]."), span_userdanger("[user] smacks your lifeless corpse with [src]."), span_hear("You hear smacking."))
	else if(M.has_language(/datum/language/elysm))
		M.visible_message(span_danger("[user] beats [M] over the head with [src]!"), span_userdanger("[user] beats you over the head with [src]!"), span_hear("You hear smacking."))
	else
		M.visible_message(span_notice("[user] teaches [M] by beating [M.p_them()] over the head with [src]!"), span_boldnotice("As [user] hits you with [src], arabic symbols flow through your mind."), span_hear("You hear smacking."))
		M.grant_language(/datum/language/elysm, source = LANGUAGE_MIND)

/obj/item/alquadim_manual
	name = "Book of Alquadim-Elysm"
	desc = "The book's cover reads: \"The traditional ancient language of the Elysium Republic, originated in Ard al-Elysm Almaveuda, which are representatives of the Arabic language of 2147, isolated for almost 2 centuries\""
	icon = 'mod_celadon/_storge_icons/icons/items/misc/book.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_righthand.dmi'
	icon_state = "alquadim_elysm"

/obj/item/alquadim_manual/attack_self(mob/living/user)
	if(!isliving(user))
		return

	if(user.has_language(/datum/language/alquadim))
		to_chat(user, span_boldwarning("You start skimming through [src], but you already know Alquadim-Elysm."))
		return

	to_chat(user, span_boldannounce("You start skimming through [src], and suddenly your mind is filled with arabic symbols."))
	user.grant_language(/datum/language/alquadim, source = LANGUAGE_MIND)


/obj/item/alquadim_manual/attack(mob/living/M, mob/living/user)
	if(!istype(M) || !istype(user))
		return
	if(M == user)
		attack_self(user)
		return

	playsound(loc, "punch", 25, TRUE, -1)

	if(M.stat == DEAD)
		M.visible_message(span_danger("[user] smacks [M]'s lifeless corpse with [src]."), span_userdanger("[user] smacks your lifeless corpse with [src]."), span_hear("You hear smacking."))
	else if(M.has_language(/datum/language/alquadim))
		M.visible_message(span_danger("[user] beats [M] over the head with [src]!"), span_userdanger("[user] beats you over the head with [src]!"), span_hear("You hear smacking."))
	else
		M.visible_message(span_notice("[user] teaches [M] by beating [M.p_them()] over the head with [src]!"), span_boldnotice("As [user] hits you with [src], arabic symbols flow through your mind."), span_hear("You hear smacking."))
		M.grant_language(/datum/language/alquadim, source = LANGUAGE_MIND)

/obj/item/thayos_manual
	name = "Book of Thayoss"
	desc = "The book's cover reads: \"The national language of the Thayos Interstellar Empire, which is a modification of Japanese 2475\""
	icon = 'mod_celadon/_storge_icons/icons/items/misc/book.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_righthand.dmi'
	icon_state = "thayos_book"

/obj/item/thayos_manual/attack_self(mob/living/user)
	if(!isliving(user))
		return

	if(user.has_language(/datum/language/thayoss))
		to_chat(user, span_boldwarning("You start skimming through [src], but you already know Thayoss."))
		return

	to_chat(user, span_boldannounce("You start skimming through [src], and suddenly your mind is filled with japanese symbols."))
	user.grant_language(/datum/language/thayoss, source = LANGUAGE_MIND)


/obj/item/thayos_manual/attack(mob/living/M, mob/living/user)
	if(!istype(M) || !istype(user))
		return
	if(M == user)
		attack_self(user)
		return

	playsound(loc, "punch", 25, TRUE, -1)

	if(M.stat == DEAD)
		M.visible_message(span_danger("[user] smacks [M]'s lifeless corpse with [src]."), span_userdanger("[user] smacks your lifeless corpse with [src]."), span_hear("You hear smacking."))
	else if(M.has_language(/datum/language/thayoss))
		M.visible_message(span_danger("[user] beats [M] over the head with [src]!"), span_userdanger("[user] beats you over the head with [src]!"), span_hear("You hear smacking."))
	else
		M.visible_message(span_notice("[user] teaches [M] by beating [M.p_them()] over the head with [src]!"), span_boldnotice("As [user] hits you with [src], japanese symbols flow through your mind."), span_hear("You hear smacking."))
		M.grant_language(/datum/language/thayoss, source = LANGUAGE_MIND)

/obj/item/fuyo_manual
	name = "Book of Fuyo"
	desc = "The book's cover reads: \"The second language of the Taios Interstellar Empire, which is a modification of Chinese 2475\""
	icon = 'mod_celadon/_storge_icons/icons/items/misc/book.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/books_righthand.dmi'
	icon_state = "fuyo_book"

/obj/item/fuyo_manual/attack_self(mob/living/user)
	if(!isliving(user))
		return

	if(user.has_language(/datum/language/fuyo))
		to_chat(user, span_boldwarning("You start skimming through [src], but you already know Fuyo."))
		return

	to_chat(user, span_boldannounce("You start skimming through [src], and suddenly your mind is filled with chinese symbols."))
	user.grant_language(/datum/language/fuyo, source = LANGUAGE_MIND)


/obj/item/fuyo_manual/attack(mob/living/M, mob/living/user)
	if(!istype(M) || !istype(user))
		return
	if(M == user)
		attack_self(user)
		return

	playsound(loc, "punch", 25, TRUE, -1)

	if(M.stat == DEAD)
		M.visible_message(span_danger("[user] smacks [M]'s lifeless corpse with [src]."), span_userdanger("[user] smacks your lifeless corpse with [src]."), span_hear("You hear smacking."))
	else if(M.has_language(/datum/language/fuyo))
		M.visible_message(span_danger("[user] beats [M] over the head with [src]!"), span_userdanger("[user] beats you over the head with [src]!"), span_hear("You hear smacking."))
	else
		M.visible_message(span_notice("[user] teaches [M] by beating [M.p_them()] over the head with [src]!"), span_boldnotice("As [user] hits you with [src], chinese symbols flow through your mind."), span_hear("You hear smacking."))
		M.grant_language(/datum/language/fuyo, source = LANGUAGE_MIND)

/obj/item/paper/fluff/claymore
	name = "PRODUCT USAGE GUIDE"
	desc = "A dusty memo stamped with the Scarborough Arms logo."
	default_raw_text = "<b>ASSEMBLY:</b><br><br>\
	-Deploy mounting legs and emplace device. Front should be placed in direction of enemy egress, no more then three meters from intended target area.<br><br> \
	-<b>INFORM ALLIES OF PLACEMENT LOCATION.</b><br><br> \
	-Wait for arming sequence to complete.<br><br> \
	-Enjoy hands-free area denial, courtesy of Scarborough Arms.<br><br><br> \
	<b>DISASSEMBLY & STORAGE:</b><br><br>\
	-Insert screwdriver into arming pin access and turn 180 degrees. There will be considerable resistance. <b>DO NOT Step onto or in front of device.</b><br><br> \
	-When pressure releases, reach below device and lift via underside in one clean motion. Mounting legs will automatically retract. <br><br> \
	-The device is now safe to handle. <br><br> \
	-Safely stow device in secure, moisture-free location, away from fire and blunt force. "

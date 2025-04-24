// Miscelanious

/obj/structure/curtain/cloth/elysium
	icon = 'mod_celadon/_storge_icons/icons/structures/fancy.dmi'
	icon_type = "elysium_fancy"
	icon_state = "elysium_fancy-open"

/obj/item/storage/book/bible/koran
	name = "Koran"
	icon_state = "koran"
	item_state = "koran"
	deity_name = "Allah"

// Posters

/obj/item/poster/random_elysium
	name = "random elysium poster"
	poster_type = /obj/structure/sign/poster/elysium/random
	icon_state = "rolled_elysium"

/obj/structure/sign/poster/elysium/random
	name = "random elysium poster"
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_patriots.dmi'
	icon_state = "random_elysium"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/elysium
	random_type = POSTER_SUBTYPES

/obj/structure/sign/poster/elysium/logo // \"Breathable, if it weren't so darn cold.\"
	name = "elysium"
	desc = "Poster of elysium Republic. The most common logo. Nothing noteworthy"
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_patriots.dmi'
	icon_state = "poster-elysium"

/obj/structure/sign/poster/elysium/protest
	name = "DownSolFed"
	desc = "Poster of elysium Republic. \"This poster with its entire appearance screams No deals with traitors! \""
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_patriots.dmi'
	icon_state = "poster-nosf"

/obj/structure/sign/poster/elysium/sonofelysium
	name = "elysium Son"
	desc = "Poster of the elysium Republic depicting a stately man.The inscription reads \"God will direct his punishing hand! For the glory of Elysium!\""
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_patriots.dmi'
	icon_state = "poster-son_elysium"

/* /obj/structure/sign/poster/elysium/ak47 		// Закомментированно до изменения спрайтов (с) RalseiDreemuurr
	name = "No SolFed"
	desc = "Poster of the elysium Republic depicting iconic weapons from a previous era. \"Even a child is ready to protect his home!\""
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_patriots.dmi'
	icon_state = "poster-ak47" */

/obj/structure/sign/elysium
	name = "\improper elysium logo sign"
	sign_change_name = "Rebel Logo - elysium"
	desc = "A sign with the elysium logo on it. Glory to Human race!"
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_patriots.dmi'
	icon_state = "elysium"
	is_editable = TRUE

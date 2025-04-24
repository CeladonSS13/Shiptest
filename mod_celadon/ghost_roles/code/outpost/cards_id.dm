// Bartender

/obj/item/card/id/elysium_Bartender
	name = "\improper Elysium bar access card"
	desc = "An access card sourced from Elysium for bartender."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium"
	uses_overlays = FALSE

/obj/item/card/id/elysium_Bartender/Initialize()
	access = get_service_accesses_outpost()
	. = ..()

// Cook

/obj/item/card/id/elysium_cook
	name = "\improper Elysium kitchen access card"
	desc = "An access card sourced from Elysium for cook."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium"
	uses_overlays = FALSE

/obj/item/card/id/elysium_cook/Initialize()
	access = get_service_accesses_outpost()
	. = ..()

// Maid

/obj/item/card/id/elysium_maid
	name = "\improper Elysium maid access card"
	desc = "An access card sourced from Elysium for maid."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium"
	uses_overlays = FALSE

/obj/item/card/id/elysium_cook/Initialize()
	. = ..()

// Artist

/obj/item/card/id/elysium_artist
	name = "\improper Elysium artist access card"
	desc = "An access card sourced from Elysium for artist."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium"
	uses_overlays = FALSE

/obj/item/card/id/elysium_artist/Initialize()
	access = get_service_accesses_outpost()
	. = ..()

// Wagabond

/obj/item/card/id/elysium_wagabond
	name = "\improper Elysium wagabond access card"
	desc = "An access card sourced from Elysium for wagabond."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium"
	uses_overlays = FALSE

/obj/item/card/id/elysium_wagabond/Initialize()
	. = ..()

// Medic

/obj/item/card/id/elysium_medic
	name = "\improper Elysium Medbay access card"
	desc = "An access card sourced from Elysium for medic."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium"
	uses_overlays = FALSE

/obj/item/card/id/elysium_medic/Initialize()
	access = get_med_accesses_outpost(1)
	. = ..()

/obj/item/card/id/silver/elysium_cmo
	name = "\improper Elysium Medbay access card"
	desc = "An access card sourced from Elysium for CMO."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium_com"
	uses_overlays = FALSE

/obj/item/card/id/silver/elysium_cmo/Initialize()
	access = get_med_accesses_outpost(0)
	. = ..()

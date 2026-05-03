/obj/item/card/id/outpost
	desc = "A Elysium ID."
	icon = 'mod_celadon/_storage_icons/icons/resprite/card.dmi'
	icon_state = "ideusm_civilian"
	assignment = "Civilian of Elysium"
	job_icon = "curator"

// Bartender

/obj/item/card/id/outpost/bartender
	name = "\improper Elysium bar access card"
	desc = "An access card sourced from Elysium for bartender."
	assignment = "Bartender"
	job_icon = "bartender"

/obj/item/card/id/outpost/bartender/Initialize()
	access = get_service_accesses_outpost()
	. = ..()

// Cook

/obj/item/card/id/outpost/cook
	name = "\improper Elysium kitchen access card"
	desc = "An access card sourced from Elysium for cook."
	assignment = "Chif Cook"
	job_icon = "cook"

/obj/item/card/id/outpost/cook/Initialize()
	access = get_service_accesses_outpost()
	. = ..()

// Maid

/obj/item/card/id/outpost/maid
	name = "\improper Elysium maid access card"
	desc = "An access card sourced from Elysium for maid."
	assignment = "Janitor"
	job_icon = "janitor"

/obj/item/card/id/outpost/cook/Initialize()
	. = ..()

// Artist

/obj/item/card/id/outpost/artist
	name = "\improper Elysium artist access card"
	desc = "An access card sourced from Elysium for artist."
	assignment = "Artist"

/obj/item/card/id/outpost/artist/Initialize()
	access = get_service_accesses_outpost()
	. = ..()

// Wagabond

/obj/item/card/id/outpost/wagabond
	name = "\improper Elysium wagabond access card"
	desc = "An access card sourced from Elysium for wagabond."
	assignment = "Wagabond"
	icon_state = "idvagabond"

/obj/item/card/id/outpost/wagabond/Initialize()
	. = ..()

// Medic

/obj/item/card/id/outpost/medic
	name = "\improper Elysium Medbay access card"
	desc = "An access card sourced from Elysium for medic."
	assignment = "Medical Doctor"

/obj/item/card/id/outpost/medic/Initialize()
	access = get_med_accesses_outpost(1)
	. = ..()

/obj/item/card/id/outpost/cmo
	name = "\improper Elysium Medbay access card"
	desc = "An access card sourced from Elysium for CMO."
	icon_state = "ideusm_captain"
	assignment = "CMO"
	job_icon = "chiefmedicalofficer"

/obj/item/card/id/outpost/cmo/Initialize()
	access = get_med_accesses_outpost(0)
	. = ..()

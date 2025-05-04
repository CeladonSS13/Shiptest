/datum/supply_pack/faction
	name = "Crate"
	group = "Faction products"
	hidden = TRUE

// Делаем красиво? Наверное? По крайней мере экономим буквы, чтобы не писать в каждом датуме эти вещи!

/datum/supply_pack/faction/independent
	hidden = FALSE
	faction = /datum/faction/independent
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/faction/syndicate
	hidden = FALSE
	faction = /datum/faction/syndicate
	crate_type = /obj/structure/closet/crate/secure/gear/syndicate

/datum/supply_pack/faction/solfed
	hidden = FALSE
	faction = /datum/faction/solgov
	crate_type = /obj/structure/closet/crate/secure/gear/solfed

/datum/supply_pack/faction/inteq
	hidden = FALSE
	faction = /datum/faction/inteq
	crate_type = /obj/structure/closet/crate/secure/gear/inteq

/datum/supply_pack/faction/nanotrasen
	hidden = FALSE
	faction = /datum/faction/nt
	crate_type = /obj/structure/closet/crate/secure/gear/nanotrasen

// Создаём ещё одну степень защиты от нежелательного доступа в карго

/obj/structure/closet/crate/secure/gear/syndicate
	req_access = list(ACCESS_OUTPOST_FACTION_SYNDICATE)

/obj/structure/closet/crate/secure/gear/solfed
	req_access = list(ACCESS_OUTPOST_FACTION_SOLFED)

/obj/structure/closet/crate/secure/gear/inteq
	req_access = list(ACCESS_OUTPOST_FACTION_INTEQ)

/obj/structure/closet/crate/secure/gear/nanotrasen
	req_access = list(ACCESS_OUTPOST_FACTION_NT)

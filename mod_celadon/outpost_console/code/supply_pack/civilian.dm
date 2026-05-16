/datum/supply_pack/civilian
	category = "Misc - Civilian & Decoration"
	stable_price = TRUE

/datum/supply_pack/civilian/janitank
	cost = 350

/datum/supply_pack/civilian/bigband
	cost = 1250

/datum/supply_pack/civilian/jukebox
	cost = 3500

/datum/supply_pack/civilian/roulette
	cost = 2500

// MARK: Solfed
/datum/supply_pack/civilian/solfed_desk_flag
	name = "Solar Federation Desk Flag"
	desc = "The blue and gold flag of the Sol Government."
	contains = list(/obj/item/desk_flag/solgov)
	cost = 150
	faction = /datum/faction/solgov
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/civilian/solfed_banner
	name = "Solar Federation Banner"
	desc = "Dark blue banner with Solar Federation logo on it.. Makes you love democracy."
	contains = list(/obj/item/banner/solfed/mundane)
	cost = 300
	faction = /datum/faction/solgov
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/civilian/solfed_bedsheet
	name = "\improper Solar Federation Bedsheet"
	desc = "It has the emblem of the Solar Confederation emblazoned upon it!"
	contains = list(/obj/item/bedsheet/solgov)
	cost = 200
	faction = /datum/faction/solgov
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/civilian/solfed_flag
	name = "\improper Folded Solar Federation flag"
	desc = "Dark blue folded flag with Solar Federation logo on it.. Makes you love democracy."
	contains = list(/obj/item/sign/flag/solfed)
	cost = 200
	faction = /datum/faction/solgov
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/civilian/wall_painter
	name = "Artist's kit"
	desc = "Содержит 1 покрасчик стен, 1 покрасчик труб, 1 покрасчик декалей, 1 покрасчик шлюзов, 1 долото."
	cost = 1000
	contains = list(
		/obj/item/wall_painter,
		/obj/item/pipe_painter,
		/obj/item/decal_painter,
		/obj/item/airlock_painter,
		/obj/item/chisel,
	)
	crate_name = "art crate"

/datum/supply_pack/organic/syrup
	category = /datum/supply_pack/civilian::category

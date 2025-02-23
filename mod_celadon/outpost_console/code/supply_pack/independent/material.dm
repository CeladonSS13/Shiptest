/datum/supply_pack/faction/independent/material
	group = "Materials & Sheets"

/*
MARK:		Basic construction materials
*/

/datum/supply_pack/faction/independent/material/glass50
	name = "50 Glass Sheets"
	desc = "Let some nice light in with fifty glass sheets!"
	cost = 350
	contains = list(/obj/item/stack/sheet/glass/fifty)
	crate_name = "glass sheets crate"

/datum/supply_pack/faction/independent/material/metal50
	name = "50 Metal Sheets"
	desc = "Any construction project begins with a good stack of fifty metal sheets!"
	cost = 350
	contains = list(/obj/item/stack/sheet/metal/fifty)
	crate_name = "metal sheets crate"

/datum/supply_pack/faction/independent/material/plasteel20
	name = "20 Plasteel Sheets"
	desc = "Reinforce and repair structural integrity with twenty plasteel sheets!"
	cost = 1000
	contains = list(/obj/item/stack/sheet/plasteel/twenty)
	crate_name = "plasteel sheets crate"

/*
MARK:		Fuel sheets (plasma / uranium)
*/

/datum/supply_pack/faction/independent/material/plasma20
	name = "20 Plasma Sheets"
	desc = "Twenty sheets of solidifed plasma. Keep away from open flame (and clowns with welding tools)."
	cost = 500
	contains = list(/obj/item/stack/sheet/mineral/plasma/twenty)
	crate_name = "plasma sheets crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/material/uranium20
	name = "20 Uranium Sheets"
	desc = "Green rock make thog puke red."
	cost = 750
	contains = list(/obj/item/stack/sheet/mineral/uranium/twenty)
	crate_name = "uranium sheets crate"
	crate_type = /obj/structure/closet/crate/radiation

/*
MARK:		Misc. mineral sheets
*/

/datum/supply_pack/faction/independent/material/sandbags50
	name = "50 Sandbags"
	desc = "It's so sand? Yes, it's sandbags."
	cost = 1000
	contains = list(/obj/item/stack/sheet/mineral/sandbags/fifty)
	crate_name = "sandbags crate"

/datum/supply_pack/faction/independent/material/titanium20
	name = "20 Titanium Sheets"
	desc = "Used for making big boy tanks and tools."
	cost = 500
	contains = list(/obj/item/stack/sheet/mineral/titanium/twenty)
	crate_name = "titanium sheets crate"

/datum/supply_pack/faction/independent/material/gold20
	name = "20 Gold Sheets"
	desc = "Shiny."
	cost = 1000
	contains = list(/obj/item/stack/sheet/mineral/gold/twenty)
	crate_name = "gold sheets crate"

/datum/supply_pack/faction/independent/material/silver20
	name = "20 Silver Sheets"
	desc = "Somewhat less shiny."
	cost = 750
	contains = list(/obj/item/stack/sheet/mineral/silver/twenty)
	crate_name = "silver sheets crate"

/datum/supply_pack/faction/independent/material/diamond
	name = "1 Diamond"
	desc = "Impress your girl with this one!"
	cost = 400
	contains = list(/obj/item/stack/sheet/mineral/diamond)
	crate_name = "diamond sheet crate"


/*
MARK:		Misc. materials
*/

/datum/supply_pack/faction/independent/material/sandstone30
	name = "30 Sandstone Blocks"
	desc = "Neither sandy nor stoney, these thirty blocks will still get the job done."
	cost = 1000
	contains = list(/obj/item/stack/sheet/mineral/sandstone/thirty)
	crate_name = "sandstone blocks crate"

/datum/supply_pack/faction/independent/material/plastic50
	name = "50 Plastic Sheets"
	desc = "Build a limitless amount of toys with fifty plastic sheets!"
	cost = 750
	contains = list(/obj/item/stack/sheet/plastic/fifty)
	crate_name = "plastic sheets crate"

/datum/supply_pack/faction/independent/material/cardboard50
	name = "50 Cardboard Sheets"
	desc = "Arm and armor a cardborg army."
	cost = 250
	contains = list(/obj/item/stack/sheet/cardboard/fifty)
	crate_name = "cardboard sheets crate"

/datum/supply_pack/faction/independent/material/wood50
	name = "50 Wood Planks"
	desc = "Turn cargo's boring metal groundwork into beautiful panelled flooring and much more with fifty wooden planks!"
	cost = 500
	contains = list(/obj/item/stack/sheet/mineral/wood/fifty)
	crate_name = "wood planks crate"

/datum/supply_pack/faction/independent/material/concrete_mix
	name = "Concrete Bag"
	desc = "Feeling lazy? Need a structure and quick? Use F.O.O.D.'s near-instant concrete mix! Just add water."
	cost = 500
	contains = list(/obj/item/reagent_containers/glass/concrete_bag)
	crate_name = "Concrete Mix"

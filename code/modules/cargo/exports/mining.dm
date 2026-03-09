//claims to be mining.dm
// has a bunch of mob-butcher loot
/datum/export/gems
	desc = "Rare gems and crystals draw many eyes, and just as many buyers."
	elasticity_coeff = 0.3
	valid_event_target = FALSE

// [CELADON-EDIT]
// 1% Drop - /asteroid/goliath - (/obj/item/gem/rupee, /obj/item/gem/fdiamond, /obj/item/gem/void, /obj/item/gem/phoron)
/datum/export/gems/rupee
	unit_name = "Ruperium"
	cost = 1000		//cost = 1000
	export_types = list(/obj/item/gem/rupee)

// 1% Drop - /asteroid/goliath - (/obj/item/gem/rupee, /obj/item/gem/fdiamond, /obj/item/gem/void, /obj/item/gem/phoron)
// 5% Drop - /asteroid/ice_demon
/datum/export/gems/diamond
	unit_name = "Frost Diamond"
	cost = 1500		//cost = 3500
	export_types = list(/obj/item/gem/fdiamond)

// 10% Drop - /asteroid/ice_whelp
/datum/export/gems/amber
	unit_name = "Draconic Amber"
	cost = 3000 	//cost = 5500
	export_types = list(/obj/item/gem/amber)

// 1% Drop - /asteroid/goliath - (/obj/item/gem/rupee, /obj/item/gem/fdiamond, /obj/item/gem/void, /obj/item/gem/phoron)
/datum/export/gems/plasma
	unit_name = "Metastable Phoron"
	cost = 4000		//cost = 11000
	export_types = list(/obj/item/gem/phoron)

// 1% Drop - /asteroid/goliath - (/obj/item/gem/rupee, /obj/item/gem/fdiamond, /obj/item/gem/void, /obj/item/gem/phoron)
/datum/export/gems/void
	unit_name = "Null Crystal"
	cost = 5000		//cost = 19000
	export_types = list(/obj/item/gem/void)

// Random elite - /obj/structure/elite_tumor
/datum/export/gems/blood
	unit_name = "Ichorium Crystal"
	cost = 9000
	export_types = list(/obj/item/gem/bloodstone)

// Rare - /asteroid/basilisk/watcher/forgotten, /asteroid/goliath/beast/ancient/crystal
/datum/export/gems/strange_crystal
	unit_name = "Strange crystal"
	cost = 6000		//cost = 4000
	export_types = list(/obj/item/strange_crystal)
// [/CELADON-EDIT]

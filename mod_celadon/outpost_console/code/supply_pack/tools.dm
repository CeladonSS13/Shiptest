/datum/supply_pack/tools
	category = "Engi - Tools & Tanks"

/datum/supply_pack/tools/toolbox
	name = "Tools"

/datum/supply_pack/tools/engigear
	name = "Engineering Gear"

/datum/supply_pack/tools/bodycamera
	name = "Body Camera"

/datum/supply_pack/tools/assbelt
	name = "Assault Belt"
	cost = 500

/datum/supply_pack/tools/chestrig
	name = "Chest Rig"
	cost = 1000

/datum/supply_pack/tools/cellcharger
	name = "Cell Charger"

/datum/supply_pack/tools/rped
	name = "RPED"

/datum/supply_pack/tools/jackhammer
	name = "Jackhammer"

/datum/supply_pack/tools/metalfoam
	name = "Metal Foam Grenades"

/datum/supply_pack/tools/insulated_gloves
	name = "Insulated Gloves"

/datum/supply_pack/tools/jetpack
	name = "Jetpack"

/datum/supply_pack/tools/jetpack/harness
	name = "Jetpack Harness"

/datum/supply_pack/tools/plasmacutter
	name = "Plasmacutter"

/datum/supply_pack/tools/rcl
	name = "Rapid cable layer"
	desc = "Contains a rapid cable layer."
	cost = 600
	contains = list(/obj/item/rcl)
	crate_name = "rapid cable layer crate"

/datum/supply_pack/tools/fueltank
	name = "Fuel Tank"

/datum/supply_pack/tools/watertank
	name = "Water Tank"
	desc = "Contains a tank of dihydrogen monoxide. Sounds dangerous."

/datum/supply_pack/tools/hightank
	name = "Large Water Tank"

/datum/supply_pack/tools/foamtank
	name = "Firefighting Foam Tank"

/datum/supply_pack/tools/radfoamtank
	name = "Radiation Foam Tank"

/datum/supply_pack/tools/blueprints_shuttle
	name = "Shuttle Expansion Disposable Permit"
	desc = "A disposable set of documents used to expand flyable shuttles."
	contains = list(/obj/item/areaeditor/shuttle/disposable)
	cost = 2000
	crate_name = "blueprint crate"

/datum/supply_pack/tools/crucks_box
	name = "C.U.C.K.S box"
	desc = "Contains several deployable barricades. 3 - plasteel, 9 - metal"
	contains = list(/obj/item/storage/barricade)
	cost = 3500
	crate_name = "C.U.C.K.S crate"

/datum/supply_pack/tools/mining
	name = "Basic Mining"

/datum/supply_pack/tools/inducer
	name = "Inducer"
	cost = 1000
	contains = list(/obj/item/inducer/sci)

/datum/supply_pack/tools/inducer/engineering
	name = "Inducer (Engineer)"
	contains = list(/obj/item/inducer)
	faction_locked = TRUE

/datum/supply_pack/tools/inducer/syndicate
	name = "Inducer (Expanded)"
	cost = 1250
	contains = list(/obj/item/inducer/syndicate)
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/tools/borg_module_syndicate_random
	name = "Syndicate unknown borg module"
	desc = "Contains a unknown upgrade borg module of Syndicate."
	cost = 10000
	contains = list(/obj/item/borg/upgrade/transform/syndicate_random)
	crate_name = "syndicate borg module crate"
	faction = /datum/faction/syndicate
	faction_locked = TRUE

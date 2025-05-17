/datum/supply_pack/faction/independent/tools
	group = "Tools & Tanks"
	crate_type = /obj/structure/closet/crate/engineering

/*
		Vehicles
*/

/datum/supply_pack/faction/independent/tools/all_terrain_vehicle
	name = "All Terrain Vehicle"
	desc = "Contains one ATV and a key, for when you want to explore the frontier in style."
	cost = 2000
	contains = list(/obj/vehicle/ridden/atv,
					/obj/item/key)
	crate_name = "ATV crate"
	crate_type = /obj/structure/closet/crate/large

/*
		Actual tools
*/

/datum/supply_pack/faction/independent/tools/toolbox
	name = "Tool Crate"
	desc = "Get some work done. Contains an electrical toolbox, a mechanical toolbox, and a welding helmet."
	contains = list(/obj/item/storage/toolbox/electrical,
					/obj/item/storage/toolbox/mechanical,
					/obj/item/clothing/head/welding)
	cost = 200
	crate_name = "toolbox crate"

/datum/supply_pack/faction/independent/tools/engigear
	name = "Engineering Gear Crate"
	desc = "Contains three toolbelts and 2 sets of meson goggles."
	cost = 750
	contains = list(/obj/item/storage/belt/utility,
					/obj/item/storage/belt/utility,
					/obj/item/storage/belt/utility,
					/obj/item/clothing/glasses/meson/engine,
					/obj/item/clothing/glasses/meson/engine)
	crate_name = "engineering gear crate"

/datum/supply_pack/faction/independent/tools/bodycamera
	name = "Body Camera Crate"
	desc = "Contains two portable cameras, designed to help keep track of a working group at all times."
	cost = 250
	contains = list(/obj/item/bodycamera,
					/obj/item/bodycamera,
					/obj/item/paper/guides/bodycam)
	crate_name = "bodycamera crate"

/datum/supply_pack/faction/independent/tools/assbelt
	name = "Assault Belt"
	desc = "Contains an assault belt, with not one, not two, but six pockets."
	cost = 500
	contains = list(/obj/item/storage/belt/military/assault)
	crate_name = "assault belt crate"

/datum/supply_pack/faction/independent/tools/cellcharger
	name = "Cell Charger Crate"
	desc = "Contains a cell charger, able to charge all sorts of power cells."
	cost = 1000
	contains = list(/obj/machinery/cell_charger)

/datum/supply_pack/faction/independent/tools/rped
	name = "RPED crate"
	desc = "Tired of deconstructing all of your machines just to replace the power cells? This device has you covered. Actual parts not included."
	cost = 750
	contains = list(/obj/item/storage/part_replacer)
	crate_name = "\improper RPED crate"

/datum/supply_pack/faction/independent/tools/jackhammer
	name = "Jackhammer Crate"
	desc = "Contains a jackhammer, ideal for breaking rocks."
	cost = 1750
	contains = list(/obj/item/pickaxe/drill/jackhammer)
	crate_name = "jackhammer crate"

/datum/supply_pack/faction/independent/tools/metalfoam
	name = "Metal Foam Grenade Crate"
	desc = "Seal up those pesky hull breaches with 7 metal foam grenades."
	cost = 1000
	contains = list(/obj/item/storage/box/metalfoam)
	crate_name = "metal foam grenade crate"

/datum/supply_pack/faction/independent/tools/insulated_gloves
	name = "Insulated Gloves Crate"
	desc = "The backbone of modern society. Contains a pair of insulated gloves."
	cost = 750
	contains = list(/obj/item/clothing/gloves/color/yellow)
	crate_name = "insulated gloves crate"

/datum/supply_pack/faction/independent/tools/jetpack
	name = "Jetpack Crate"
	desc = "For when you need to go fast in space."
	cost = 750
	contains = list(/obj/item/tank/jetpack/carbondioxide)
	crate_name = "jetpack crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/faction/independent/tools/jetpack/harness
	name = "Jetpack Harness Crate"
	desc = "A compact jetpack harness for those who don't wish to be weighed down by larger traditional jetpacks."
	cost = 1500
	contains = list(/obj/item/tank/jetpack/oxygen/harness)

/datum/supply_pack/faction/independent/tools/anglegrinder
	name = "Angle Grinder"
	desc = "Contains one angle grinder pack, a tool used for quick structure deconstruction and salvaging"
	cost = 1500
	contains = list(
		/obj/item/gear_pack/anglegrinder,
		/obj/item/radio/headset/alt
		)
	crate_name = "angle grinder crate"

/datum/supply_pack/faction/independent/tools/electric_welder
	name = "Electric Welder"
	desc = "Contains a single electric welder, useful for many applications. No fuel required!"
	cost = 850
	contains = list(/obj/item/weldingtool/electric)
	crate_name = "electric welder crate"

/datum/supply_pack/faction/independent/tools/welding_goggles
	name = "Welding Goggles"
	desc = "Contains a single pair of welding goggles for protecting your eyes."
	cost = 150
	contains = list(/obj/item/clothing/glasses/welding)
	crate_name = "welding goggles crate"

/datum/supply_pack/faction/independent/tools/plasmacutter
	name = "Plasmacutter Crate"
	desc = "Contains a plasmacutter, capable of rapidly breaking down hull."
	cost = 2500
	contains = list(/obj/item/gun/energy/plasmacutter)
	crate_name = "plasmacutter crate"

/*
		Liquid tanks
*/

/datum/supply_pack/faction/independent/tools/fueltank
	name = "Fuel Tank Crate"
	desc = "Contains a welding fuel tank, for when your lust for welding is insatiable. Highly flammable."
	cost = 800
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	crate_name = "fuel tank crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/faction/independent/tools/watertank
	name = "Fresh Water Supply Crate"
	desc = "Contains a tank of dihydrogen monoxide. Sounds dangerous."
	cost = 500
	contains = list(/obj/structure/reagent_dispensers/watertank)
	crate_name = "water tank crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/faction/independent/tools/hightank
	name = "Large Fresh Water Supply Crate"
	desc = "Contains a high-capacity water tank. Useful for botany or other service jobs."
	cost = 1500
	contains = list(/obj/structure/reagent_dispensers/watertank/high)
	crate_name = "high-capacity water tank crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/faction/independent/tools/foamtank
	name = "Firefighting Foam Tank Crate"
	desc = "Contains a tank of firefighting foam. Also known as \"Phorid's Bane\"."
	cost = 1500
	contains = list(/obj/structure/reagent_dispensers/foamtank)
	crate_name = "foam tank crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/faction/independent/tools/radfoamtank
	name = "Radiation Foam Tank Crate"
	desc = "Contains a tank of anti-radiation foam. Pressurized sprayer included!"
	cost = 1500
	contains = list(
		/obj/item/watertank/anti_rad,
		/obj/structure/reagent_dispensers/foamtank/antirad
	)
	crate_name = "foam tank crate"
	crate_type = /obj/structure/closet/crate/large

/**
	MARK: Строительство
 */

/datum/supply_pack/faction/independent/tools/blueprints_shuttle
	name = "Shuttle Expansion Permit"
	desc = "A set of paperwork which is used to expand flyable shuttles."
	contains = list(/obj/item/areaeditor/shuttle)
	cost = 20000
	crate_name = "blueprint crate"

/datum/supply_pack/faction/independent/tools/crucks_box
	name = "C.U.C.K.S box"
	desc = "Contains several deployable barricades. 3 - plasteel, 9 - metal"
	contains = list(/obj/item/storage/barricade)
	cost = 3500
	crate_name = "C.U.C.K.S crate"

/*
	MARK: Инструменты
*/

/datum/supply_pack/faction/independent/tools/mining
	name = "Mining starter kit"
	desc = "Contains two pickaxes, two pocket fire extinguisher, two ore bags, and two manual mining scanners."
	cost = 600
	contains = list(
		/obj/item/pickaxe/mini,
		/obj/item/pickaxe/mini,
		/obj/item/extinguisher/mini,
		/obj/item/extinguisher/mini,
		/obj/item/storage/bag/ore,
		/obj/item/storage/bag/ore,
		/obj/item/mining_scanner,
		/obj/item/mining_scanner)
	crate_type = /obj/structure/closet/crate/wooden
	crate_name = "basic mining crate"

/*
	MARK: Цистерны для жидкостей
*/

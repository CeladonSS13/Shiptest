/datum/supply_pack/faction/independent/tools
	group = "Tools & Tanks"
	crate_type = /obj/structure/closet/crate/engineering


/datum/supply_pack/faction/independent/tools/blueprints_shuttle
	name = "shuttle expansion permit"
	desc = "A set of paperwork which is used to expand flyable shuttles."
	contains = list(/obj/item/areaeditor/shuttle)
	cost = 20000
	crate_name = "blueprint crate"

/datum/supply_pack/faction/independent/tools/crucks_box
	name = "C.U.C.K.S box"
	desc = "Contains several deployable barricades. 3 - plasteel, 9 - metal"
	contains = list(/obj/item/storage/barricade)
	cost = 5000
	crate_name = "C.U.C.K.S crate"

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

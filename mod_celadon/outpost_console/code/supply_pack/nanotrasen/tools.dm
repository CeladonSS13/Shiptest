/datum/supply_pack/faction/nanotrasen/tools
	group = "Tools & Tanks"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/faction/nanotrasen/tools/mining
	name = "Basic Mining Crate"
	desc = "Contains two pickaxes, two ore bags, and two manual mining scanners."
	cost = 500 //cheaper to send your legions to war (mining) (also you can just print all this asides the scanners so what's the point anyway)
	contains = list(
		/obj/item/pickaxe,
		/obj/item/pickaxe/mini,
		/obj/item/storage/bag/ore,
		/obj/item/storage/bag/ore,
		/obj/item/mining_scanner,
		/obj/item/mining_scanner)
	crate_name = "basic mining crate"

/datum/supply_pack/faction/nanotrasen/tools/inducer
	name = "Inducer Crate"
	desc = "An electromagnetic induction charging device, used for both field engineering/recharging and reactivation of Positronics. Not suitable for cooking."
	cost = 750
	contains = list(/obj/item/inducer)
	crate_name = "inducer crate"

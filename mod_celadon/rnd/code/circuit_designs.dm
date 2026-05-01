/datum/design/board/rdconsole/production
	name = "Computer Design (R&D Console for production only)"
	desc = "Allows for the construction of circuit boards used to build an R&D Console for production Only."
	id = "rdconsoleproduction"
	build_path = /obj/item/circuitboard/computer/rdconsole/production
	category = list("Computer Boards")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/techweb_node/base
	id = "base"
	starting_node = TRUE
	display_name = "Basic Research Technology"
	description = "NT default research technologies."
	design_ids = list(
		// Basic Parts
		"basic_matter_bin", "basic_cell", "basic_scanning", "basic_capacitor", "basic_micro_laser", "micro_mani",
		// Cargo Stuff
		"c-reader", "desttagger", "salestagger", "handlabel", "packagewrap",
		// Research Stuff
		"destructive_analyzer", "experimentor", "rdserver", "design_disk", "tech_disk", "mechfab", "rdconsoleproduction",
		// Miscellaneous Stufff
		"paystand", "space_heater", "bucket", "plastic_knife", "plastic_fork", "plastic_spoon", "fax",
		// Security Stuff
		"sec_rshot", "sec_beanbag_slug", "sec_slug", "sec_Islug", "sec_dart", 	"sec_38", "buckshot_shell", "beanbag_slug", "rubber_shot",
		//Handgun Ammo (Security)
		"commanderammo", "ringneckammo", "candorammo", "m9cammo", "c9mm", "c10mm", "c45", "c556mmHITP", "rubbershot9mm", "rubbershot10mm", "rubbershot45", "rubbershot556mmHITP",
		// Construction Materials
		"rglass", "plasteel", "plastitanium", "plasmaglass", "plasmareinforcedglass", "titaniumglass", "plastitaniumglass",
		// You People Are Animals
		"trashbag",
	)
